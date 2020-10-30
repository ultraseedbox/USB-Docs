<p class="callout warning">This guide is for advanced users only and it serves as a guide for you to use rclone and mergerFS. The files here are the recommended settings for our slots and will subject to change whenever there are new configurations that are appropriate for the slots. Furthermore, USB is not responsible for any data loss or application errors due to this setup should you proceed and will not provide official support for it due to the large volume of variables and different configurations possible with rclone and mergerFS. You may visit the community discord server or the software's respective forums for assistance.</p>

This guide will teach you how to setup a rclone VFS mount and MergerFS on USB slots and it assumes the following:

* You have a working rclone setup, especially correctly configured remotes of your preferred cloud storage provider. In this tutorial, we’ll be using Google Drive. If you use another cloud storage provider, change the flags that are appropriate to your setup and visit rclone documentation for more information.
* You have the appropriate knowledge of setting up and running your own systemd services.
* You are comfortable working in CLI, compiling from sources and setting up cron jobs.

The workflow of the setup is as follows:

1. There are 2 folders, one local and the rclone mount named Mount
2. These 2 folders are merged via MergerFS and is mounted to another folder. All apps such as Plex, Radarr, Sonarr and such will be pointed to this folder.
3. When you copy a file to MergerFS, this will be copied to Local First. Directory structures will be retained.
4. A rclone move script moves all the contents inside Local every 3AM, retaining the directory structures.
5. Applications that are pointed to MergerFS wouldn’t know the difference.

Pros of this setup are as follows:

1. New files will be immediately available in Plex and has faster loading times due to it being available locally.
2. Uploads is lesser prone to errors than moving files directly via rclone mount.
3. It's essentially a “set it and forget it“ setup

Cons of this setup are as follows:

1. New files will not be available on Google Drive until you run the rclone move script
2. There will be 3 points of failure on this setup, RClone, apps that are connected to the MergerFS folder and MergerFS
3. Monitoring functions such as Plex's “Update my library automatically“ will not work for mounts. You may need to set your application to periodically scan the mount.

Before we proceed, it is imperative to stop all rclone/plexdrive processes and stop all the apps that are connected to your rclone mount before proceeding.

***

## Preparation

* Install and configure rclone if you haven't already. Refer here for more information: [Installation, Configuration & Usage of rclone](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone "Installation, Configuration & Usage of rclone")
* Create all the necessary folders.
  * First, a local folder and a rclone mount folder. You can put these folders anywhere in your home folder but I’d like to put these inside another folder. We'll name it Stuff just to make it cleaner.
  * Then, we create another folder where we’ll mount MergerFS. Let’s name it MergerFS.
  * Lastly, create a scripts folder. This is where you'll find logs for your rclone/mergerfs mounts. This is where you'll store the bash upload script if you choose the bash upload script, which will be explained more later.

```
FILE STRUCTURE

/home6/kbguides/Stuff/ #Folder where 2 MergerFS folders are in
    -Local #servers as our local mount
    -Mount #Rclone mount point
/home6/kbguides/MergerFS/ #actual mergerfs mount point
/home6/kbguides/scripts/ #Where you'll find logs for rclone/mergerfs mounts
```

* Doing this in SSH, the following commands are

```sh
mkdir -p ~/Stuff
mkdir -p ~/Stuff/Local
mkdir -p ~/Stuff/Mount
mkdir -p ~/MergerFS
mkdir -p ~/scripts
```

<p class="callout warning">Do not attempt to mount your rclone remote directly on your home directory. This will lead to instabilities. Instead, always mount to an empty folder within your home directory.</p>

***

## Installing MergerFS

* Run this command to your terminal. This should automatically install MergerFS to your slot.

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Installer%20Scripts/mergerfs-install.sh | bash
```

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image2019-6-30_17-16-0.png">
</p>

* To confirm if the installation is completed, do `which mergerfs`

```sh
kbguides@lw902:~$ which mergerfs
/home6/kbguides/bin/mergerfs
```

***

## Setting up systemd files and running MergerFS/Rclone

* Do `pwd` and take note of the output. In this case, the output is `/home6/kbguides`

```sh
kbguides@lw902:~$ pwd
/home6/kbguides
```

* Then, run the following commands to your terminal
  * This will download the latest revisions of the service files from our repository directly to your systemd folder.
* After you run the commands, a nano text window appears.
  * Edit `/homexx/yyyyy` to your output in `pwd` and to your preferred folder (e.g. `/home6/kbguides/Rclone/Mount/Folder/here`).
  * Then save it by doing CTRL + O, press ENTER then exit nano by doing **CTRL + X**.
  * In these systemd files, these are for Google Drive and is the recommended settings for our slots (Plex Streaming)
  * You may wish to add or edit additional flags/options that will be best for your setup.
    * We recommend starting off with our defaults first.

### rclone VFS Service
```sh
wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-vfs.service && nano $HOME/.config/systemd/user/rclone-vfs.service
```

### mergerfs Service
```sh
wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/mergerfs.service && nano $HOME/.config/systemd/user/mergerfs.service
```

<c><p class="callout info">Shown below are example service files. Do not copy and paste anything from the example files as it does not always reflect the contents of the service files from our repository and in this guide. Please read the guide thoroughly before setting it up.</p></c>

### Example Rclone Service File

```
[Unit]
Description=RClone VFS Service
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
KillMode=none
Environment=GOMAXPROCS=2

ExecStart=/home6/kbguides/bin/rclone mount gdrive: /home6/kbguides/Stuff/Mount \
  --allow-other \
  --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36' \
  --config /home6/kbguides/.config/rclone/rclone.conf \
  --use-mmap \
  --dir-cache-time 1h \
  --timeout 1s \
  --umask 002 \
  --bwlimit 5M \
  --poll-interval=1h \
  --vfs-cache-mode writes \
  --vfs-read-chunk-size 8M \
  --vfs-read-chunk-size-limit 32M \
  --tpslimit 1
ExecStop=/bin/fusermount -uz /home6/kbguides/Stuff/Mount
Restart=on-failure

[Install]
WantedBy=default.target
```

### Example MergerFS Service File

```
[Unit]
Description = MergerFS Mount
After=rclone-vfs.service
RequiresMountsFor=/home6/kbguides/Stuff/Local
RequiresMountsFor=/home6/kbguides/Stuff/Mount

[Service]
Type=forking
KillMode=none
ExecStart=/hame6/kbguides/bin/mergerfs /home6/kbguides/Stuff/Local:/home6/kbguides/Stuff/Mount /home6/kbguides/MergerFS -o rw,async_read=false,use_ino,allow_other,func.getattr=newest,category.action=all,category.create=ff,cache.files=partial,dropcacheonclose=true,threads=2
ExecStop=/bin/fusermount -uz /home6/kbguides/MergerFS
Restart=on-failure

[Install]
WantedBy=default.target
```

* Reload systemd daemon by doing `systemctl --user daemon-reload`
* Enable and start the two systemd services by doing the following
  * `systemctl --user enable --now rclone-vfs && systemctl --user enable --now mergerfs`
* Confirm that everything works by going back to your home folder and do `ls MergerFS`

***

## Setting Up Rclone Uploader

* Here, we will set up the uploader. The rclone uploader is a script that uploads the contents of your `Local` folder and merge it to your rclone mount.
* You may choose between **Bash Upload script** or S**ystemd service**.
* We recommend using the **systemd uploader**

### Systemd Uploader

* Run the following commands to your terminal
  * This will download the latest revisions of the service files from our repository directly to your systemd folder.
  * After you run the commands, a nano text window appears.
  * Edit `/homexx/yyyyy` to your output in `pwd` and to your preferred folder (e.g. `/home6/kbguides/Rclone/Mount/Folder/here`).
  * Then save it by doing CTRL + O, press ENTER then exit nano by doing **CTRL + X**.

```sh
wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-uploader.service && nano $HOME/.config/systemd/user/rclone-uploader.service && wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-uploader.timer
```

#### Example Rclone Upload Service File

```
[Unit]
Description=RClone Uploader

[Service]
Type=simple

ExecStart=/home6/usbdocs/bin/rclone move /home6/usbdocs/Stuff/Local/ gdrive: \
    --config=/homexx/yyyyy/.config/rclone/rclone.conf \
    --user-agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
    --drive-chunk-size 8M \
    --tpslimit 1 \
    --drive-acknowledge-abuse=true \
    -vvv \
    --delete-empty-src-dirs \
    --fast-list \
    --bwlimit=2M \
    --use-mmap \
    --transfers=1 \
    --checkers=1 \
    --drive-stop-on-upload-limit \
    --log-file /homexx/yyyyy/scripts/rclone-uploader.log
Restart=on-failure

[Install]
WantedBy=default.target
```

#### Example Rclone Timer File

```
[Unit]
Description=Run Rclone Upload daily

[Timer]
OnCalendar=daily
RandomizedDelaySec=30m
Persistent=true

[Install]
WantedBy=timers.target
```

* Reload systemd daemon by doing `systemctl --user daemon-reload`
* Enable and start the two systemd services by doing the following
  * `systemctl --user enable --now rclone-uploader.service && systemctl --user enable --now rclone-uploader.timer`
* This will start the service immediately and starts uploading any files that you have on your Local folder.

### Bash Upload Script

* Download this script to whatever folder you wish. In this case, `scripts` will be the folder where you'll save the script.
  * You may choose between the normal upload script (no notifications) or the rclone upload script that sends discord notifications whenever there's a successful transfer.
* Change the script's permission to 755, so it makes it executable by you. So do `chmod +x >name of script<.sh`
  * In the proceeding examples, I decided to use the normal rclone script so do `chmod +x rclone-upload.sh`

#### Normal Upload Script

```sh
cd scripts/
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-upload.sh
chmod +x rclone-upload.sh
```

#### Upload Script with Discord Notifications via Webhook

```sh
cd scripts/
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-upload-with-notification.sh
chmod +x rclone-upload-with-notification.sh
```

* Then open the script using your preferred text editor and change the values as needed.
  * The normal upload script works out of the box without any configuration
  * The upload script with discord notifications needs to be setup before using it

#### Example rclone-upload.sh file

```sh
#!/bin/bash
 
lock_file="$HOME/rclone.lock"
 
trap "rm -f $lock_file; exit 0" SIGINT SIGTERM
if [ -e "$lock_file" ]
then
    echo "$base_name is already running."
    exit
else
    touchme "$lock_file"
    "$HOME"/bin/rclone move "$HOME"/Stuff/Local/ gdrive: --user-agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' --config="$HOME"/.config/rclone/rclone.conf --drive-chunk-size 8M --tpslimit 1 --drive-acknowledge-abuse=true -vvv --drive-stop-on-upload-limit --delete-empty-src-dirs --fast-list --bwlimit=2M --use-mmap --transfers=1 --checkers=1 --log-file "$HOME"/scripts/rclone-upload.log
    rm -f "$lock_file"
    trap - SIGINT SIGTERM
    exit
fi
```

#### Example rclone-upload-with-notification.sh file

```sh
#!/bin/bash

# Rclone upload script with optional Discord notification upon move completion (if something is moved)
#
# Recommended for use via cron
# For example: */10 * * * * /path/to/rclone-upload.sh >/dev/null 2>&1
# -----------------------------------------------------------------------------

SOURCE_DIR="$HOME/Stuff/Local/"
DESTINATION_DIR="gdrive:"

DISCORD_WEBHOOK_URL=""
DISCORD_ICON_OVERRIDE="https://i.imgur.com/MZYwA1I.png"
DISCORD_NAME_OVERRIDE="RCLONE"

LOCK_FILE="$HOME/rclone-upload.lock"
LOG_FILE="$HOME/rclone-upload.log"

# DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING
# -----------------------------------------------------------------------------

trap 'rm -f $LOCK_FILE; exit 0' SIGINT SIGTERM
if [ -e "$LOCK_FILE" ]
then
  echo "$0 is already running."
  exit
else
  touch "$LOCK_FILE"
  
  rclone_move() {
    rclone_command=$(
      "$HOME"/bin/rclone move -vP \
      --config="$HOME"/.config/rclone/rclone.conf \
      --user-agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' \
      --drive-chunk-size 8M \
      --use-mmap \
      --delete-empty-src-dirs \
      --fast-list \
      --log-file="$LOG_FILE" \
      --stats=9999m \
      --tpslimit=1 \
      --transfers=1 \
      --checkers=1 \
      --bwlimit=2M \
      --drive-stop-on-upload-limit \
      "$SOURCE_DIR" "$DESTINATION_DIR" 2>&1
    )
    # "--stats=9999m" mitigates early stats output 
    # "2>&1" ensures error output when running via command line
    echo "$rclone_command"
  }
  rclone_move

  if [ "$DISCORD_WEBHOOK_URL" != "" ]; then
  
    rclone_sani_command="$(echo $rclone_command | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g')" # Remove all escape sequences

    # Notifications assume following rclone ouput: 
    # Transferred: 0 / 0 Bytes, -, 0 Bytes/s, ETA - Errors: 0 Checks: 0 / 0, - Transferred: 0 / 0, - Elapsed time: 0.0s

    transferred_amount=${rclone_sani_command#*Transferred: }
    transferred_amount=${transferred_amount%% /*}
    
    send_notification() {
      output_transferred_main=${rclone_sani_command#*Transferred: }
      output_transferred_main=${output_transferred_main% Errors*}
      output_errors=${rclone_sani_command#*Errors: }
      output_errors=${output_errors% Checks*}
      output_checks=${rclone_sani_command#*Checks: }
      output_checks=${output_checks% Transferred*}
      output_transferred=${rclone_sani_command##*Transferred: }
      output_transferred=${output_transferred% Elapsed*}
      output_elapsed=${rclone_sani_command##*Elapsed time: }
      
      notification_data='{
        "username": "'"$DISCORD_NAME_OVERRIDE"'",
        "avatar_url": "'"$DISCORD_ICON_OVERRIDE"'",
        "content": null,
        "embeds": [
          {
            "title": "Rclone Upload Task: Success!",
            "color": 4094126,
            "fields": [
              {
                "name": "Transferred",
                "value": "'"$output_transferred_main"'"
              },
              {
                "name": "Errors",
                "value": "'"$output_errors"'"
              },
              {
                "name": "Checks",
                "value": "'"$output_checks"'"
              },
              {
                "name": "Transferred",
                "value": "'"$output_transferred"'"
              },
              {
                "name": "Elapsed time",
                "value": "'"$output_elapsed"'"
              }
            ],
            "thumbnail": {
              "url": null
            }
          }
        ]
      }'
      
      /usr/local/bin/curl -H "Content-Type: application/json" -d "$notification_data" $DISCORD_WEBHOOK_URL 
    }
    
    if [ "$transferred_amount" != "0" ]; then
      send_notification
    fi

  fi

  rm -f "$LOCK_FILE"
  trap - SIGINT SIGTERM
  exit
fi
```

* Then, decide how often you want to execute the script. Our servers are in the Netherlands so the timezone is set to CET
  * In my case, I’d like to run the script at 1900 CEST every night. Translated to cron, that is `0 19 * * *`

<c><p class="callout info">If you need help in translating the time you want to cron, you can visit [Crontab Guru](https://crontab.guru/) and [World Time Buddy](https://www.worldtimebuddy.com/) to help you with setting up the time.</p></c>

* Do `readlink -f rclone-upload.sh` to get the absolute path

```sh
kbguides@lw902:$ cd ~/scripts
kbguides@lw902:~/scripts$ readlink -f rclone-upload.sh
/home6/kbguides/scripts/rclone-upload.sh
```

* Open up `crontab -e`, set your preferred text editor (in this tutorial, nano) and add the cron expression and the absolute path of the upload script.
* Add `> /dev/null 2>&1` if you don’t want your slot to send messages when the upload script fails.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image2019-6-30_17-39-47.png">
</p>

* Save cron by doing CTRL + O and CTRL+ X to exit the editor
* Now, all you need to do is to access all your apps and point it to your newly made MergerFS folder which is `MergerFS`

## Systemd Commands

```
Enabling and starting Rclone mount: systemctl --user enable --now {mount-name}.service
Restart Rclone Mount: systemctl --user restart {mount-name}.service
Stop Rclone Mount: systemctl --user stop {mount-name}.service
Stop and disable Rclone mount: systemctl --user disable --now {mount-name}.service (Remove service file after)
```

## App Optimizations

* You may need to tweak some of your apps so it plays well with your MergerFS setup. Refer to the following page for more information on these tweaks.

[rclone Optimizations for Apps](https://docs.usbx.me/books/rclone/page/rclone-optimizations-for-apps)