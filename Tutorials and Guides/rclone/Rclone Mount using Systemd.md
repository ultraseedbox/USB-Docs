<p class="callout warning">This guide is for advanced users only and it serves as a guide for you to use rclone. The systemd files here are the recommended settings for our slots and will subject to change whenever there are new configurations that are appropriate for the slots. Furthermore, USB is not responsible for any data loss or application errors due to this setup should you proceed and will not provide official support for it due to the large volume of variables and different configurations possible with rclone. You may visit the community discord server for help.</p>

Rclone's mount allows you to mount any of your cloud storage accounts as part of your slot's file system using FUSE. In this guide, we will teach you how to run an rclone mount using systemd. Take note that this guide is setup using Google Drive as the cloud storage provider used. Should you use any other cloud storage providers, you may need consult Rclone documentation for the appropriate flags for your setup.

There are many ways to mount rclone. You can run the rclone mount using screen, create a script for running rclone mount and checking if the command is still alive, using `--daemon` flag, just to mention a few. We recommend using systemd for several reasons:

1. Easy to setup and configure
2. Restarts rclone mount automatically when there's a server restart or error
3. You can manually restart the service when there's problems.

Before we proceed, you may have to configure your cloud storage first. If you haven't, visit this guide: [Installation, Configuration & Usage of rclone](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone)

***
If you don't need to upload files to your mount, follow this guide.

If you need to upload files or you're planning an automated setup involving your cloud storage, we recommend to use [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup) instead.
***

## Preparation

* Login to your seedbox's SSH
* Do pwd and take note of the output. In this case, the output is `/home6/kbguides`
* Then, create a folder by doing `mkdir >folder name<`
* For this guide, we'll be making a folder named Mount. So we will run `mkdir Mount`

```sh
kbguides@lw902:~$ pwd
/home6/kbguides
kbguides@lw902:~$ mkdir Mount
kbguides@lw902:~$
```

***

## Downloading Rclone Service File

* Choose and run the following command below
* There are 2 systemd files listed here. You have to choose either one of these files.
    * The first one should work on most remotes supported by rclone.
    * The second one is specific for Google Drive for Streaming.

### Rclone Mount for Most Remotes

```sh
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-normal.service && nano ~/.config/systemd/user/rclone-normal.service
```

### Google Drive Rclone Mount for Plex Streaming

```sh
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-vfs.service && nano ~/.config/systemd/user/rclone-vfs.service
```

***

## Editing your service file

* After you run the command, a nano text window appears. In this example service file, I chose Google Drive Rclone Mount for Plex Streaming
* Edit `/homexx/yyyyy` to your output in `pwd` and to your preferred folder (eg `/home6/kbguides/Rclone/Mount/Folder/here)`
* You may also add or edit some rclone flags here if you wish
* Then save it by doing CTRL + O, press ENTER then exit nano by doing CTRL + X

### Example rclone-normal.service

```
[Unit]
Description=RClone Service
Wants=network-online-target
After=network-online-target
 
[Service]
Type=notify
Environment=RCLONE_CONFIG=/home6/kbguides/.config/rclone/rclone.conf
 
ExecStart=/home6/kbguides/bin/rclone mount gdrive: /home6/kbguides/Mount \
--allow-other \
--buffer-size 8M \
--fast-list \
--drive-chunk-size 8M \
--dir-coche-time 12s \
--log-level INFO \
--log-file /home6/kbguides/scripts/rclone.log \
--timeout 1s \
--umask 002 \
--vfs-coche-mode writes
ExecStop=/bin/fusermount -uz /homexx/yyyyy/Mount
Restart=on-failure
 
[Install]
WantedBy=default.target
```

### Example rclone-vfs.service

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

<p class="callout warning">Do not attempt to mount your rclone remote directly on your home directory. This will lead to instabilities. Instead, always mount to an empty folder within your home directory.</p>

***

## Running Rclone Mount

* Reload systemd Daemon by doing `systemctl --user daemon-reload`. You will do this every time you change something in your system files.
* After that enable and start the service that we added immediately by doing `systemctl --user enable --now rclone-vfs.service`
    * `enable --now` will run the rclone mount service and will keep it alive. It also automatically starts during server restarts and rclone crashes.
* To check if your service is running, do `systemctl --user status rclone-vfs.service`. It should have both loaded and active (running), noting that the rclone mount is executed and running
* Then, to check if your mount is actually mounted to the folder properly, do `ls Mount`. Your files from your cloud storage account should show up.

```sh
kbguides@lw902:~$ systemctl --user daemon-reload
kbguides@lw902:~$ systemctl --user enable --now mount.service
kbguides@lw902:~$ systemctl --user status mount.service
● mount.service - RClone Service
   Loaded: loaded (/home6/kbguides/.config/systemd/user/mount.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2019-06-30 18:32:24 CEST; 19h ago
 Main PID: 38563 (rclone)
   CGroup: /user.slice/user-xxxx.slice/user@xxxx.service/mount.service
           └─38563 /home6/kbguides/bin/rclone mount gdrive: /home17/usb770/Stuff/Mount --allow-other --buffer-size 256M --drive-chunk-size
kbguides@lw902:~$ ls Mount
Linux ISOs  Documents  Legally Acquired Files  Homework  grocery-list.txt
```

* Should you have the need to restart your rclone mount, here are your following commands, following the example above
    * Please make sure that **all apps that are connected to the mount have stopped** before proceeding.

## Systemd Commands

```
Enabling and starting Rclone mount: systemctl --user enable --now {mount-name}.service
Restart Rclone Mount: systemctl --user restart {mount-name}.service
Stop Rclone Mount: systemctl --user stop {mount-name}.service
Stop and disable Rclone mount: systemctl --user disable --now {mount-name}.service (Remove service file after)
```