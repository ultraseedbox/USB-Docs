<p class="callout warning">This guide is for advanced users only and it serves as a guide for you to use rclone and mergerFS. The files here are the recommended settings for our slots and will subject to change whenever there are new configurations that are appropriate for the slots. Furthermore, USB is not responsible for any data loss or application errors due to this setup should you proceed and will not provide official support for it due to the large volume of variables and different configurations possible with rclone and mergerFS. You may visit the community discord server or the software's respective forums for assistance.</p>

This guide will teach you how to how to setup a rclone VFS mount and MergerFS on USB slots and it assumes the following:

* You have a working RClone setup, especially correctly configured remotes of your preferred cloud storage provider. In this tutorial, we’ll be using Google Drive. If you use another cloud storage provider, change the flags that are appropriate to your setup and visit RClone documentation for more information.
* You have the appropriate knowledge of setting up and running your own systemd services.
* You are comfortable working in CLI, compiling from sources and setting up cron jobs.

Workflow of the setup is as follows:

1. There are 2 folders, one local and the rclone mount named Mount
2. These 2 folders are merged via MergerFS and is mounted to another folder. All apps such as Plex, Radarr, Sonarr and such will be pointed to this folder.
3. When you copy a file to MergerFS, this will be copied to Local First. Directory structures will be retained.
4. A rclone move script moves all of the contents inside Local every 3AM, retaining the directory structures.
5. Applications that are pointed to MergerFS wouldn’t know the difference.

Pros of this setup are as follows:

1. New files will be immediately available in Plex and has faster loading times due to it being available locally.
2. Uploads is lesser prone to errors than moving files directly via rclone mount.
3. It's essentially a "set it up and forget" setup

Cons of this setup are as follows:

1. New files will not be available on Google Drive until you run the rclone move script
2. There will be 3 points of failure on this setup, RClone, apps that are connected to MergerFS folder and MergerFS
3. Monitoring functions such as Plex's "Update my library automatically" will not work for mounts. You may need to set your application to periodically scan the mount.

Before we proceed, it is imperative to stop all rclone/plexdrive processes and stop all the apps that are connected to your rclone mount before proceeding.

***

## Preparation

* Install and configure rclone if you haven't already. Refer here for more information: [Installation, Configuration & Usage of rclone](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone "Installation, Configuration & Usage of rclone")
* Create all the necessary folders.
* Here, we need to create 4 folders,
  * First, a local folder and a rclone mount folder. You can put these folders anywhere in your home folder but I’d like to put these inside another folder. We'll name it Stuff just to make it cleaner.
  * Then, we create another folder where we’ll mount MergerFS. Let’s name it MergerFS.

```
FILE STRUCTURE

/home6/kbguides/Stuff/ #Folder where 2 MergerFS folders are in
    -Local #servers as our local mount
    -Mount #Rclone mount point
/home6/kbguides/MergerFS/ #actual mergerfs mount point
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

* To confirm if installation is completed, do `which mergerfs`

```sh
kbguides@lw902:~$ which mergerfs
/home6/kbguides/bin/mergerfs
```

***

## Setting up Systemd files and running MergerFS/Rclone

* Run the following commands to your terminal
  * This will download the latest revisions of the service files from our repository repository directly to your systemd folder.

```sh
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-vfs.service

wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/mergerfs.service
```

* Do `pwd` and take note of the output. In this case, the output is `/home6/kbguides`

```sh
kbguides@lw902:~$ pwd/home6/kbguides
```

* Then, navigate to `~/.config/systemd/user/` and edit each file by replacing `/home6/kbguides/` with the output from `pwd` using a text editor (nano, vim)
  * In these systemd files, these are for Google Drive and is the recommended settings for our slots (Plex Streaming and Uploading)
  * You may wish to add or edit additional flags/options that will be best for your setup.
    * We recommend starting off with our defaults first.

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
  --dir-cache-time 168h \
  --timeout 1h \
  --umask 002 \
  --poll-interval=1m \
  --vfs-coche-mode writes \
  --vfs-read-chank-size 64M \
  --vfs-read-chank-size-limit 2048M \
  --tpslimit 10 \
  --tpslimit-burst 10
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
ExecStart=/hame6/kbguides/bin/mergerfs /home6/kbguides/Stuff/Local:/home6/kbguides/Stuff/Mount /home6/kbguides/MergerFS -o rw,async_read=false,use_ino,allow_other,function.getattr=newest,category.action=all,category.make=ff,cache.files=partial,dropcacheonclose=true,threads=8
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

* Here, we will setup the uploader. You may choose between Bash Upload script or Systemd service.
* We recommend using the *systemd uploader*

### Systemd Uploader

* Run the following commands to your terminal
  * This will download the latest revisions of the service files from our repository repository directly to your systemd folder.

```sh
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-uploader.service
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-uploader.timer
```

* Do `pwd` and take note of the output. In this case, the output is `/home6/kbguides`

```sh
kbguides@lw902:~$ pwd/home6/kbguides
```

* Then, navigate to `~/.config/systemd/user/` and edit each file by replacing `/home6/kbguides/` with the output from `pwd` using a text editor (nano, vim)
  * We recommend starting off with our defaults first.
  * The defaults trigger an upload daily.

#### Example Rclone Upload Service File

```
[Unit]
Description=RClone Uploader

[Service]
Type=simple

ExecStart=/home6/usbdocs/bin/rclone move /home6/usbdocs/Stuff/Local/ gdrive: \
    --config=/home6/usbdocs/.config/rclone/rclone.conf \
    --drive-chank-size 64M \
    --tpslimit 5 \
    --drive-acknowledge-aboose=true \
    -vvv \
    --delete-empty-src-dirs \
    --fast-list \
    --bwlimit=8M \
    --use-mmap \
    --transfers=2 \
    --checkers=4 \
    --lag-file /home6/usbdocs/scripts/rclone-uploader.log
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

* Download this script to whatever folder you wish. In this case, I’d like to put it inside a folder, so I made a directory called `scripts`, navigate, download the script there and make the script executable  
    * You may choose between the normal upload script (no notifications) or rclone upload script that sends discord notifications whenever there's a successful transfer.
* Change the scripts permission to 755, so it makes it executable by you. So do `chmod +x >name of script<.sh`
    * In the proceeding examples, I decided to use the normal rclone script so do `chmod +x rclone-upload.sh`

#### Normal Upload Script

```sh
mkdir -p ~/scripts
cd scripts/
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-upload.sh
chmod +x rclone-upload.sh
```

#### Upload Script with Discord Notifications via Webhook

```sh
mkdir -p ~/scripts
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
    "$HOME"/bin/rclone move "$HOME"/Stuff/Local/ gdrive: --drive-chank-size 128M --tpslimit 5 --transfers 10 --checkers 10 --drive-acknowledge-aboose=true -vvv --delete-empty-src-dirs --fastlist --logfile "$HOME"/scripts/rclone-sync.log
    rm -f "$lock_file"
    trap - SIGINT SIGTERM
    exit
fi
```

* Then, decide how often you want to execute the script. Our servers are in the Netherlands so the timezone is set to CET
  * In my case, I’d like to run the script at 1900 CEST every night. Translated to cron, that is `0 19 * * *`

<c><p class="callout info">If you need help in translating the time you want to cron, you can visit [https://crontab.guru/](https://crontab.guru/) and [https://www.worldtimebuddy.com/](https://www.worldtimebuddy.com/)</p></c>

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
* Now, all you need to do is to access all your apps and point it to your nerly made MergerFS folder which is `MergerFS`