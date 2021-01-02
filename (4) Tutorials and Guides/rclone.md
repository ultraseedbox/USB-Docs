::: warning
USB support is unable to provide support for rclone, this is due to the large volume of variables and different configurations possible with rclone. The guides found here on the knowledge-base should be able to guide you through using rclone, and any further questions can easily be answered with a quick Google search. You may also be able to find community support for rclone through our community Discord server or the Rclone forums.
:::

In this guide we will be going over the installation of rclone. We'll also cover the basic usages such as setting up a remote, and how to copy files between your seedbox and a remote file host.

## Installation

To begin, make sure you know how to SSH into your slot. All rclone commands are performed via SSH. You can find a guide on SSH [here](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh).

To install rclone run the command below, this command will automatically install rclone to your slot for you.

### rclone stable

```
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Installer%20Scripts/rclone-install-stable.sh | bash
```

### rclone beta

```
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Installer%20Scripts/rclone-install-beta.sh | bash
```

***

## Configuration
### OAuth (Google Drive)

* Navigate to [Google Developer Console](https://console.developers.google.com/) and log into your Google account.
* Click Create on the right-hand side of the screen. On the screen that pops up enter a Project name and then click **Create**.
  * I'd recommend against using rclone in the project name, even just the default will do.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/Create.PNG)

* Click **Enable APIs and Services**, search for Drive and select **Google Drive**.
* Click **Enable** on the window that pops up.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/Enable.PNG)

* Click **Credentials** on the left side of the screen then click **Credentials in APIs & Services**.
* Click **Create credentials**, and select **OAuth client ID**.
  * You may be prompted to configure a consent screen. Click to do this, enter a name and then click **Save**.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/credentials.PNG)

* On the next screen select Desktop App and then select **Create**. The default name is fine and you do not need to change it.
* After you click **Create**, the window to the right will pop up. These are our keys to use in rclone configuration. Copy these or leave the window open for when you need them.

### rclone

Now we need to configure a remote to use with rclone. For this guide we will be configuring Google Drive. This is the most common remote people tend to use as it offers large storage capacities for a reasonable price. Should you wish to use a different cloud host, feel free to modify the steps you take.

* Run the command `rclone config`

```
kbguides@lw914:~$ rclone config
2019/06/15 18:16:33 NOTICE: Config file "/home27/kbguides/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q>
```

* Press `n` and then **Enter**. Type the name you wish to use for your remote and then press **Enter** once more. Here, we'll use `gdrive` as our remote name.
* Scroll through the list of supported remotes and pick the one you wish. For this example we will be using Google Drive, so we will type `12` then press **Enter**.

```
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
...
11 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
12 / Google Drive
   \ "drive"
13 / Hubic
   \ "hubic"
...
```

* You will be prompted to enter your `client_id`. If you have not generated your keys yet or do not know what it is I recommend using this guide to help you generate them [Configuring Oauth for Google Drive](https://docs.usbx.me/books/rclone/page/configuring-oauth-for-google-drive).
* Once you have followed the steps in the guide, copy your client ID and paste it into the terminal, next press **Enter**. Now copy your client secret, paste it in, and again press **Enter**.

```
Google Application Client Id
Setting your own is recommended.
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.
If you leave this blank, it will use an internal key which is low performance.
Enter a string value. Press Enter for the default ("").
client_id> example12345

Enter a string value. Press Enter for the default ("").
client_secret> example12345
```

* Choose the scope you wish to give to rclone. Full access is safe and is likely the most useful one to you, so in this case we will type `1` then press **Enter**.

```
Scope that rclone should use when requesting access from drive.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Full access all files, excluding Application Data Folder.
   \ "drive"
 2 / Read-only access to file metadata and file contents.
   \ "drive.readonly"
   / Access to files created by rclone only.
 3 | These are visible in the drive website.
   | File authorization is revoked when the user deauthorizes the app.
   \ "drive.file"
   / Allows read and write access to the Application Data folder.
 4 | This is not visible in the drive website.
   \ "drive.appfolder"
   / Allows read-only access to file metadata but
 5 | does not allow any access to read or download file content.
   \ "drive.metadata.readonly"
scope> 1
```

* Unless you know what you are doing, leave the `root folder` blank and press **Enter**. Leave Service Account Credentials JSON file path blank also, again press **Enter**. Then type `n` to choose to not edit advanced config and press **Enter**.

```
ID of the root folder
Leave blank normally.
Fill in to access "Computers" folders. (see docs).
Enter a string value. Press Enter for the default ("").
root_folder_id>
 
Service Account Credentials JSON file path
Leave blank normally.
Needed only if you want use SA instead of interactive login.
Enter a string value. Press **Enter** for the default ("").
service_account_file>
 
Edit advanced config? (y/n)
y) Yes
n) No
y/n> n
```

* Type `n` to choose to not use auto-config and press **Enter**. You will be provided with a URL, copy this URL and paste it into your web browser.
* Choose the Google Drive account you wish to use and click **Allow**, giving rclone permission to use it.
* You will be given a code, copy this and place it into your terminal, then press Enter.
* Finally, type `n` to choose to not configure as a team drive and press **Enter**.

```
Use auto config?
 * Say Y if not sure
 * Say N if you are working on a remote or headless machine
y) Yes
n) No
y/n> n
 
If your browser doesn't open automatically go to the following link: <URL WILL BE HERE>
Log in and authorize rclone for access
Enter verification code> random string
 
Configure this as a team drive?
y) Yes
n) No
y/n> n
```

* You will be shown a confirmation screen. If all is okay, type `y` and then press **Enter** to save your configuration.
* If you notice any issues, you can edit them from here by typing `e`, or delete them using `d`. Finally, press `q` and then **Enter** to quit the rclone config wizard.
    

```
--------------------
[gdrive]
type = drive
client_id = blank
client_secret = blank
scope = drive
token = {"access_token":"blank"}
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d>
```

***

## Usage

rclone is interacted with purely through SSH. Please ensure you are familiar with the Linux terminal and using SSH prior to using rclone.

### General Commands

These commands are useful to remember. They allow you to interact with rclone and move files around between your local and remote storage or even between two remote destinations.

```
config - Execute this command to add, modify or remove remote file hosts.
Usage: rclone config
 
copy - Used to copy files between two locations, remote -> remote, remote -> local, local -> remote
Usage: rclone copy [-P] {origin} {destination}
 
move - Same as copy however does not leave the files at the source
Usage: rclone move [-P] {origin} {destination}
 
sync - Will make the destination directory identical to the origin. If files exist on destination that do not on origin they will be deleted. Be careful with the sync command as it can cause date loss.
Usage: rclone sync [-P] {origin} {destination}
 
When dealing with remote filesystems use:
{remote}:{path}
 
For example, if you wished to copy a file named movie.mkv from your current working directory to a path named Movies in a remote name Drive you'd use this command:
rclone copy movie.mkv Drive:Movies
```

***

## Setting up rclone Mount

Rclone's mount allows you to mount any of your cloud storage accounts as part of your slot's file system using FUSE. In this guide, we will teach you how to run a rclone mount using systemd. Take note that this guide is setup using Google Drive as the cloud storage provider used. Should you use any other cloud storage providers, you may need consult rclone documentation for the appropriate flags for your setup.

There are many ways to mount rclone. You can run the rclone mount using the `screen` utility, create a script for running rclone mount and checking if the command is still alive, using the `--daemon` flag, just to mention a few.

We recommend using systemd for several reasons:

1. Easy to set up and configure
2. Restarts rclone mount automatically when there's a server restart or error
3. You can manually restart the service when there're problems.

### rclone Mount with no mergerfs

If you don't need to upload files to your mount, follow this guide.

Should you need to upload files or you're planning an automated setup involving your cloud storage, we recommend to use [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup) instead.

#### Preparation

* Login to your seedbox's SSH
* Do `pwd` and take note of the output. In this case, the output is `/home6/kbguides`
* Then, create a folder by doing `mkdir >folder name<`
* For this guide, we'll be making a folder named Mount. So we will run `mkdir Mount`

```sh
kbguides@lw902:~$ pwd
/home6/kbguides
kbguides@lw902:~$ mkdir Mount
kbguides@lw902:~$
```

* Next, create a folder named `scripts`. This is where you'll find logs of the rclone mounts should there be any problems.

```sh
kbguides@lw902:~$ mkdir scripts
kbguides@lw902:~$
```

* Confirm your remote name by running `rclone config` and take note of the name you've set. Once that's done, type `q` to quit config.

```sh
$ rclone config
Current remotes:

Name                 Type
====                 ====
gdrive               drive 

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q>
```

#### Downloading Rclone Service File

* Choose and run the following command below
* There are 2 systemd files listed here. You have to choose either one of these files.
  * The first one should work on most remotes supported by rclone.
  * The second one is specific for Google Drive that is optimized for streaming.

##### Rclone Mount for Most Remotes

```sh
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-normal.service && nano ~/.config/systemd/user/rclone-normal.service
```

##### Google Drive Rclone Mount for Media Streaming

```sh
wget -P ~/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-vfs.service && nano ~/.config/systemd/user/rclone-vfs.service
```

#### Editing your service file

* After you run the command, a nano text window appears. In this example service file, we'll be using Google Drive Rclone Mount for Plex Streaming.
* Edit `/homexx/yyyyy` to your output in `pwd` and to your preferred folder, which in this case is `/home6/kbguides/Mount`.
* Replace `remote:` to the remote name you set previously from [the previous guide.](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone)
* You may also add or edit some rclone flags here if you wish
* Then save it by doing CTRL + O, press ENTER then exit nano by doing **CTRL + X**.

::: info
Shown below are example service files. Do not copy and paste anything from the example files as it does not always reflect the contents of the service files from our repository and in this guide. Please read the guide thoroughly before setting it up.
:::

##### Example rclone-normal.service

```
[Unit]
Description=RClone Normal Mount Service
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
KillMode=none
Environment=GOMAXPROCS=2

ExecStart=/home6/kbguides/bin/rclone mount remote: /home6/kbguides/Mount \
  --config /home6/kbguides/.config/rclone/rclone.conf \
  --use-mmap

StandardOutput=file:/home6/kbguides/scripts/rclone_mount.log
ExecStop=/bin/fusermount -uz /home6/kbguides/Mount
Restart=on-failure

[Install]
WantedBy=default.target
```

##### Example rclone-vfs.service

```
[Unit]
Description=RClone VFS Service
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
KillMode=none
Environment=GOMAXPROCS=2

ExecStart=/home6/kbguides/bin/rclone mount remote: /home6/kbguides/Mount \
  --config /home6/kbguides/.config/rclone/rclone.conf \
  --use-mmap \
  --dir-cache-time 1000h \
  --poll-interval=15s \
  --vfs-cache-mode writes \
  --tpslimit 10

StandardOutput=file:/home6/kbguides/scripts/rclone_vfs_mount.log
ExecStop=/bin/fusermount -uz /home6/kbguides/Mount
Restart=on-failure

[Install]
WantedBy=default.target
```

::: warning
Do not attempt to mount your rclone remote directly on your home directory. This will lead to instabilities. Instead, always mount to an empty folder within your home directory.
:::

#### Running Rclone Mount

* Reload systemd Daemon by doing `systemctl --user daemon-reload`. You will do this every time you change something in your system files.
* After that enable and start the service that we added immediately by doing `systemctl --user enable --now rclone-vfs.service`
    * `enable --now` will run the rclone mount service and will keep it alive. It also automatically starts during server restarts and rclone crashes.
* To check if your service is running, do `systemctl --user status rclone-vfs.service`. It should have both loaded and active (running), noting that the rclone mount is executed and running.
* Then, to check if your mount is actually mounted to the folder properly, do `ls Mount`. Your files from your cloud storage account should show up.

```sh
kbguides@lw902:~$ systemctl --user daemon-reload
kbguides@lw902:~$ systemctl --user enable --now rclone-vfs.service
kbguides@lw902:~$ systemctl --user status rclone-vfs.service
● mount.service - RClone Service
   Loaded: loaded (/home6/kbguides/.config/systemd/user/rclone-vfs.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2019-06-30 18:32:24 CEST; 19h ago
 Main PID: 38563 (rclone)
   CGroup: /user.slice/user-xxxx.slice/user@xxxx.service/rclone-vfs.service
           └─38563 /home6/kbguides/bin/rclone mount gdrive: /home17/usb770/Stuff/Mount --allow-other --buffer-size 1M --drive-chunk-size
kbguides@lw902:~$ ls Mount
Linux ISOs  Documents  Legally Acquired Files  Homework  grocery-list.txt
```
* In the event the mount fails to show as running, you will need to manually create a log file with this command `touch /homexx/yyyyy/scripts/rclone_vfs_mount.log` Edit /homexx/yyyyy to your output in `pwd` then run `systemctl --user status rclone-vfs.service` again this should now show the service as running.
* Should you have the need to restart your rclone mount, here are your following commands, following the example above
    * Please make sure that **all apps that are connected to the mount have stopped** before proceeding.

#### Systemd Commands

```
Enabling and starting Rclone mount: systemctl --user enable --now {mount-name}.service
Restart Rclone Mount: systemctl --user restart {mount-name}.service
Stop Rclone Mount: systemctl --user stop {mount-name}.service
Stop and disable Rclone mount: systemctl --user disable --now {mount-name}.service (Remove service file after)
```

***

## rclone Mount with mergerfs

This section will teach you how to setup a rclone VFS mount and MergerFS on USB slots and it assumes the following:

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

### Preparation

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

::: warning
Do not attempt to mount your rclone remote directly on your home directory. This will lead to instabilities. Instead, always mount to an empty folder within your home directory.
:::

### Installing MergerFS

* Run this command to your terminal. This should automatically install MergerFS to your slot.
  * Select 1 or 2 when prompted. We recommend selecting `2` when prompted by the installer.

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Installer%20Scripts/mergerfs-install.sh
bash mergerfs-install.sh
rm mergerfs-install.sh
```

* To confirm if the installation is completed, do `which mergerfs`

```sh
kbguides@lw902:~$ which mergerfs
/home6/kbguides/bin/mergerfs
```

### Setting up systemd files and running MergerFS/Rclone

* Do `pwd` and take note of the output. In this case, the output is `/home6/kbguides`

```sh
kbguides@lw902:~$ pwd
/home6/kbguides
```

* Confirm your remote name by running `rclone config` and take note of the name you've set. Once that's done, type `q` to quit config.

```sh
$ rclone config
Current remotes:

Name                 Type
====                 ====
gdrive               drive 

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q>
```

* Then, run the following commands to your terminal
  * This will download the latest revisions of the service files from our repository directly to your systemd folder.
* After you run the commands, a nano text window appears.
  * Edit `/homexx/yyyyy` to your output in `pwd` and to your preferred folder.
  * Replace `remote:` to the remote name you set previously from [the previous guide.](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone)
  * Then save it by doing CTRL + O, press ENTER then exit nano by doing **CTRL + X**.
  * In these systemd files, these are for Google Drive and is the recommended settings for our slots (Plex Streaming)
  * You may wish to add or edit additional flags/options that will be best for your setup.
    * We recommend starting off with our defaults first.

#### rclone VFS Service

```sh
wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/rclone-vfs.service && nano $HOME/.config/systemd/user/rclone-vfs.service
```

#### mergerfs Service

```sh
wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Service%20Files/mergerfs.service && nano $HOME/.config/systemd/user/mergerfs.service
```

::: info
Shown below are example service files. Do not copy and paste anything from the example files as it does not always reflect the contents of the service files from our repository and in this guide. Please read the guide thoroughly before setting it up.
:::

##### Example Rclone Service File

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
  --config /home6/kbguides/.config/rclone/rclone.conf \
  --use-mmap \
  --dir-cache-time 1000h \
  --poll-interval=15s \
  --vfs-cache-mode writes \
  --tpslimit 10

StandardOutput=file:/home6/kbguides/scripts/rclone_vfs_mount.log
ExecStop=/bin/fusermount -uz /home6/kbguides/Stuff/Mount
Restart=on-failure

[Install]
WantedBy=default.target
```

##### Example MergerFS Service File

```
[Unit]
Description = MergerFS Service
After=rclone-vfs.service
RequiresMountsFor=/home6/kbguides/Stuff/Local
RequiresMountsFor=/home6/kbguides/Stuff/Mount

[Service]
Type=forking
KillMode=none
ExecStart=/home6/kbguides/bin/mergerfs \
    -o use_ino,func.getattr=newest,category.action=all \
    -o category.create=ff,cache.files=auto-full,threads=8 \
    /home6/kbguides/Stuff/Local:/home6/kbguides/Stuff/Mount /home6/kbguides/MergerFS

StandardOutput=file:/home6/kbguides/scripts/mergerfs_mount.log
ExecStop=/bin/fusermount -uz /home6/kbguides/MergerFS
Restart=on-failure

[Install]
WantedBy=default.target
```

* Reload systemd daemon by doing `systemctl --user daemon-reload`
* Enable and start the two systemd services by doing the following
  * `systemctl --user enable --now rclone-vfs && systemctl --user enable --now mergerfs`
* Confirm that everything works by going back to your home folder and do `ls MergerFS`

### Setting Up Rclone Uploader

* Here, we will set up the uploader. The rclone uploader is a script that uploads the contents of your `Local` folder and merge it to your rclone mount.
* You may choose between **Bash Upload script** or **Systemd service**.
* We recommend using the **systemd uploader**

#### Systemd Uploader

* Run the following commands to your terminal
  * This will download the latest revisions of the service files from our repository directly to your systemd folder.
  * After you run the commands, a nano text window appears.
  * Edit `/homexx/yyyyy` to your output in `pwd` and to your preferred folder.
  * Replace `remote:` to the remote name you set previously from [the previous guide.](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone)
  * Then save it by doing CTRL + O, press ENTER then exit nano by doing **CTRL + X**.

```sh
wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-uploader.service && nano $HOME/.config/systemd/user/rclone-uploader.service && wget -P $HOME/.config/systemd/user/ https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-uploader.timer
```

##### Example Rclone Upload Service File

```
[Unit]
Description=RClone Uploader

[Service]
Type=simple

ExecStart=/home6/usbdocs/bin/rclone move /home6/usbdocs/Stuff/Local/ gdrive: \
    --config=/home6/kbguides/.config/rclone/rclone.conf \
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
    --log-file /home6/kbguides/scripts/rclone-uploader.log
Restart=on-failure

[Install]
WantedBy=default.target
```

##### Example Rclone Timer File

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

#### Bash Upload Script

* Download this script to whatever folder you wish. In this case, `scripts` will be the folder where you'll save the script.
  * You may choose between the normal upload script (no notifications) or the rclone upload script that sends discord notifications whenever there's a successful transfer.
* Change the script's permission to 755, so it makes it executable by you. So do `chmod +x >name of script<.sh`
  * In the proceeding examples, I decided to use the normal rclone script so do `chmod +x rclone-upload.sh`

##### Normal Upload Script

```sh
cd scripts/
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-upload.sh
chmod +x rclone-upload.sh
```

##### Upload Script with Discord Notifications via Webhook

```sh
cd scripts/
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Upload%20Scripts/rclone-upload-with-notification.sh
chmod +x rclone-upload-with-notification.sh
```

* Then open the script using your preferred text editor and change the values as needed.
  * Both normal and upload script with discord notifications needs to be setup before using it
  * Replace `remote:` to the remote name you set previously from [the previous guide.](https://docs.usbx.me/books/rclone/page/installation-configuration-usage-of-rclone)

##### Example rclone-upload.sh file

```sh
#!/bin/bash

lock_file="$HOME/scripts/rclone-upload.lock"

trap 'rm -f "$lock_file"; exit 0' SIGINT SIGTERM
if [ -e "$lock_file" ]
then
    echo "Rclone upload script is already running."
    exit
else
    rm "$HOME"/scripts/rclone-upload.log
    touch "$lock_file"
    "$HOME"/bin/rclone move "$HOME"/Stuff/Local/ gdrive: \
        --config="$HOME"/.config/rclone/rclone.conf \
        --drive-chunk-size 64M \
        --tpslimit 5 \
        -vvv \
        --drive-stop-on-upload-limit \
        --delete-empty-src-dirs \
        --fast-list \
        --bwlimit=8M \
        --use-mmap \
        --transfers=2 \
        --checkers=4 \
        --log-file "$HOME"/scripts/rclone-upload.log
    rm -f "$lock_file"
    trap - SIGINT SIGTERM
    exit
fi
```

##### Example rclone-upload-with-notification.sh file

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

::: info
If you need help in translating the time you want to cron, you can visit [Crontab Guru](https://crontab.guru/) and [World Time Buddy](https://www.worldtimebuddy.com/) to help you with setting up the time.
:::

* Do `readlink -f rclone-upload.sh` to get the absolute path

```sh
kbguides@lw902:$ cd ~/scripts
kbguides@lw902:~/scripts$ readlink -f rclone-upload.sh
/home6/kbguides/scripts/rclone-upload.sh
```

* Open up `crontab -e`, set your preferred text editor (in this tutorial, nano) and add the cron expression and the absolute path of the upload script.
* Add `> /dev/null 2>&1` if you don’t want your slot to send messages when the upload script fails.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image2019-6-30_17-39-47.png)

* Save cron by doing CTRL + O and CTRL+ X to exit the editor
* Now, all you need to do is to access all your apps and point it to your newly made MergerFS folder which is `MergerFS`

### Systemd Commands

```
Enabling and starting Rclone mount: systemctl --user enable --now {mount-name}.service
Restart Rclone Mount: systemctl --user restart {mount-name}.service
Stop Rclone Mount: systemctl --user stop {mount-name}.service
Stop and disable Rclone mount: systemctl --user disable --now {mount-name}.service (Remove service file after)
```

***

## App Optimizations

This guide lists optimizations when using `rclone mount` to host your files to your seedbox. This is to lessen the API request hits made by rclone to your cloud streaming service and to not hit your cloud streaming's download quotas.

### Media Centers
#### Plex
##### Settings ⇾ Library

* `Scan my library periodically`: Daily
  * This lessens the API requests sent.
  * You can set this down to 6 hours if necessary.
  * You may also use Sonarr/Radarr's Connect to update your libraries if there are any new episodes/movies uploaded with periodic scanning to daily.
* `Generate video preview thumbnails`: never
* `Generate intro video markers`: never
* `Generate chapter thumbnails`: never
* `Analyze audio tracks for loudness`: never
  * The following settings do a full download of the file and is only used to create intro markers, generate thumbnails and analyze the audio track of each file.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596905991296.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906036724.png)

##### Settings ⇾ Scheduled Tasks

* `Perform extensive media analysis during maintenance`: Unchecked
  * This does a full download and is only used for bandwidth analysis with streaming.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906120578.png)

#### Emby/Jellyfin
##### Settings ⇾ Advanced ⇾ Scheduled Tasks

* `Scan Media Library`: Every 24 Hours
  * This lessens the API requests sent.
  * You can set this down to 6 hours if necessary.
  * You may also use Sonarr/Radarr's Connect to update your libraries if there are any new episodes/movies uploaded with periodic scanning to daily.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906513315.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906695674.png)

* `Thumbnail Image Extraction`: none
  * It does the full download of the file and is only used to generate thumbnails. This can be set per-library.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906693494.png)

### Downloaders
#### Sonarr/Radarr
##### Settings ⇾ Media Management ⇾ File Management

* `Analyze video files`: Unchecked
  * It downloads the media file in full to perform media analysis (Extracting video information from the media file)
  * This should be turned off as this happens frequently on library refreshes if left on.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596907268973.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596907298474.png)

***

## Troubleshooting Information

**Can you help me with rclone?**

Rclone is a powerful tool that allows you to create virtual drives or mount points. The following help in this section will assume that you have installed your rclone with the help from our documentation and guidelines.

While it is an excellent tool, it is not very reliable. It should never be used to write data directly to your cloud services with our applications. Use `mergerfs` for that purpose. It is also essential that those who utilize them will know how to troubleshoot them when needed.

Please do not mount to any of the default directories such as:

* `files`
* `media`
* `bin`
* `.apps`
* `.config`
* `www`
* `/homexx/username/`

This will lead to instabilities within your slot.

Please click [here](https://docs.usbx.me/books/rclone) to go to our Rclone setup guide.

Due to these variables involved, official support for rclone or applications utilizing these applications will not be provided.

**Job for rclone-vfs.service failed because the control process exited with error code. See "systemctl --user status rclone-vfs.service" and "journalctl --user -xe" for details.**

This may be due to the following reasons:
* Check your service file for typos.
  * Make sure `/homexx/yyyyy` is your *actual *home directory.
* Make sure all the paths referenced in the file exist.
  * You need to create the following folders: `Stuff`, `Stuff/Mount`, `Stuff/Local` (if using MergerFS Setup), and `scripts`.
  * We recommend using the default settings as it is specifically tuned to our slots.
* What does `~/bin/rclone version` return in SSH?
  * If the output is `No such file/directory`, this means you have not downloaded rclone.
* Execute `~/bin/rclone listremotes`. Is the remote name the same as the one in the first configuration line? For example, it should return gdrive such as

```
ExecStart=/homexx/yyyyy/bin/rclone mount **gdrive**: /homexx/yyyyy/Stuff/Mount \
```

Following the advice above, you should find the issue, and when you have, do not forget to execute `systemctl --user daemon-reload` before trying to enable it again.

**ls: cannot access 'SomeDirectory': Transport endpoint is not connected**

This means the rclone process/mount is dead but the mount is still fused. If you’re using systemd following our guide, please stop your mount using systemctl:

* Run the following command:

```sh
systemctl --user stop rclone-vfs
```

* If using mergerfs

```sh
systemctl --user stop mergerfs
```

* Then, execute the following command:

```sh
mount | grep $USER
```

* Disconnect the rclone mount with the following command:

```sh
fusermount -zu /path/to/SomeDirectory
```

* Finally, fill all remaining rclone processes by running the following command:

```sh
killall rclone
```

Now follow the process to restart your mount below.

**How do I restart my rclone cloud or mergerfs mount?**

Execute the following in your shell terminal (SSH)

1. Stop all currently running applications that utilize the mount. This applies to Plex, Radarr, Sonarr, etc. (can be done in ucp or ssh using `app-[name] stop`).
2. SSH into your seedbox slot.
3. Run `systemctl --user stop rclone-vfs` and `systemctl --user stop mergerfs` if using mergerfs
4. Run `fusermount -u /path/to/mount` and `fusermount -u /path/to/mergerfs` if using mergerfs
5. Run `systemctl --user start rclone-vfs` and `systemctl --user start mergerfs` if running mergerfs
6. Verify that the mount is working by going into your mount folder and running `ls -la` to verify we are connected. If using mergerfs, check the mergerfs folder too.
7. Start all applications from the UCP or ssh using `app-[name] start`. (replace [name] with app name, app-plex start.)

**I use rclone or a cloud mount, and my xx application is not working or is slow. Why is that?**

As stated, you should not use rclone or cloud mount directly with applications that will attempt to write directly to it. You should use MergerFS for that. Please check our resource for MergerFS [here](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup).