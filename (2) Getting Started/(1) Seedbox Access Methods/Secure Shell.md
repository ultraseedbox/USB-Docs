**SSH**, also known as **Secure Shell**, is a network protocol that gives users a secure way to remotely access your seedbox. With SSH, you can do the following:

* Provides secure access for users to your seedbox
* Can be used for secure file transfers to and from your PC
* Issue remote commands
* Can be used to diagnose and troubleshoot if there are problems with your apps

All of our seedbox plans come with SSH access.

***

## Initial Setup
### Changing your SSH Password

Before logging into your SSH, you should first set your own SSH/FTP password.

* Login to your [User Control Panel](https://cp.ultraseedbox.com) and login with the credentials you set and Press **Connect**

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-13-9%5B1%5D.png)

* Click **Access details** and click **Change password** beside SSH access.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-14-38%5B1%5D.png)

* Set your password to anything you wish. We recommend using a unique password that you do not use in any of your existing accounts and has the following:
  * At least 12 characters
  * An uppercase letter
  * A lowercase letter
  * At least 1 number
  * At least 1 symbol
* When you're done click **Confirm change**

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-19-3%5B1%5D.png)

* A popup saying Password successfully changed should appear on the lower right corner of the page, signifying that the password is set successfully.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-25-0%5B1%5D.png)

### SSH Clients and Connection Details
#### OpenSSH

OpenSSH is an open-source alternative to the proprietary Secure Shell software suite offered by SSH Communications Security and is bundled with some Linux distributions and macOS. It is also an optional feature in Windows 10 since the October 2018 Update (Version 1809).

##### Installing OpenSSH in Windows 10

* To install OpenSSH client, go to Settings then go to **Apps** > **Apps and Features** > **Manage Optional Features**. Then, click **Add a feature**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_7-45-2%5B1%5D.png)

* Then, select **OpenSSH Client** and click Install.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_7-47-33%5B1%5D.png)

* Once installation is completed, return to **Apps** > **Apps and Features** > **Manage Optional Features** and you should see **OpenSSH Client** listed under Optional features.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_7-49-42%5B1%5D.png)

##### Installing OpenSSH in Linux

Some Linux distributions have OpenSSH client installed as part of their bundle. Provided below are the commands to install OpenSSH clients in some of the popular Linux distributions.

```
Ubuntu/Debian: sudo apt install openssh-client

Arch Linux/Manjaro Linux: sudo pacman -Syyu openssh

Fedora: sudo dnf install -y openssh-client;
```

##### Accessing Seedbox’s Terminal via OpenSSH

The following screenshots are from Windows' command prompt but it should be the same on Windows, Linux and macOS.

* Open up a command prompt window, Windows PowerShell window or a terminal window (macOS/Linux) and type in either of the following

```
ssh username@IP_of_seedbox (usbdocs@123.456.789)
ssh username@lwxxx.usbx.me (usbdocs@lw500.usbx.me)
ssh username@username.lwxxx.usbx.me (usbdocs@usbdocs.lw500.usbx.me)
```

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-40-18%5B1%5D.png)

* When you do this the first time, this message appears. This is normal. This means that your computer does not recognize the remote host, which is your seedbox and will happen the first time you connect to a new host.
* Type `yes` and press **ENTER** to continue. You can compare your IP address shown here to the one indicated to your UCP and if it's correct, type `yes`**.**

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-43-11%5B1%5D.png)

* Then, enter the password that you set earlier. Take note that you won't see anything in the password field as you type. This is normal as no visual feedback of passwords given in the terminal is part of the security measures taken by default.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-49-32%5B1%5D.png)

* When you entered the correct password, you'll enter the shell of your seedbox.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-52-0%5B1%5D.png)

#### PuTTY

PuTTY is a free and open-source GUI SSH, Telnet, Rlogin and serial port connection client for Windows. You may also use this to connect to your seedbox.

##### Installation

* Download and install the latest release of PuTTY [here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

##### Setting up PuTTY

* Launch PuTTY and you'll be greeted with this window.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138075458.png)

* Login to your UCP and navigate to your **Access details** Tab

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image2019-5-7_11-14-38.png)

* Put in the hostname or the IP of the seedbox to the Host Name (or IP Address) text box. In the screenshot, I'll be using the IP of the seedbox.
* Make sure that the Port is set to `22` and the Connection Type is **SSH**

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138508563.png)

* In **Connection** -> **Data**, enter the username registered on your slot.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138631720.png)

* This is optional but under Connection, you can set _Seconds between keepalives_ to `60`. This is to prevent you to disconnect from your SSH session whenever you're idle.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138755528.png)

* Now, to save your profile, go to **Session**. Enter any name you want on the _Saved sessions_ text box and click **Save**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138853264.png)

* We will now login to your seedbox. Highlight the Saved session you just made. and click **Open**.
* Another window will open

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138960013.png)

* Enter the password you set. Once logged in, you'll see this message. You're now in your seedbox's terminal prompt.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571139046458.png)

***

## Authentication using SSH Keys

**SSH key pair authentication** is a recommended method of logging into your seedbox via SSH for added security and convenience in place of our SSH password. You can place the public key on your slot, and then unlock it by connecting to it with a client that has the private key. When the two matches up, the system unlocks without the need for a password. The major advantage of this is that this authentication method provides greater cryptographic strength than long passwords, rendering it not prone to brute-force attacks. You can increase security even more by protecting your private key with a passphrase.

In this tutorial, we would be showing you on how to generate your own key pair using several tools, how to transfer your public key to your slot and how to login using key pair authentication.

### OpenSSH

This should work on Linux, macOS and Windows 10 Users. If you haven't set OpenSSH up, you may refer to [on how to connect to your seedbox via SSH for installation and setup of OpenSSH for Windows 10, Linux and MacOS.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")

#### Creating Public and Private Keys

* On your computer, type in `ssh-keygen` and press **ENTER**. This should start generating public and private key pairs.
  * By default it generates a 2048-bit RSA key pair which is sufficient in most cases

```sh
$ ssh-keygen
Generating public/private rsa key pair.
```

* We also recommend to generating the  following keys which are more secure than the default.
  * To generate an RSA 4096 key: `ssh-keygen -b 4096`
    * Much more secure than 2048 bit is slower when logging into your seedbox
  * To generate a ed25519 key: `ssh-keygen -t ed25519`
    * New algorithm, has a smaller key size and faster generation with security comparable to RSA ~3000

* Here, you can press **ENTER** to save the key pair into the `.ssh/` subdirectory in your home directory
  * For Windows, your User Folder is typically in `C:\Users\username\.ssh`
  * For Linux it's `/home/username/.ssh`
  * You may also specify an alternate path.

```sh
$ ssh-keygen -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/your_home/.ssh/id_rsa):
```

* Here you optionally may enter a secure passphrase. You can press **ENTER** to skip putting in a passphrase
  * It is recommended to add in a passphrase
  * A passphrase adds an additional layer of security to prevent unauthorized users from logging in should they have your private key

```sh
$ ssh-keygen -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/your_home/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

* Then you should see the following output. You now have a public (`id_rsa`) and a private key (`id_rsa.pub`) stored in your Home folder (or on the path you set) that you can use to authenticate when logging into SSH.

```sh
$ ssh-keygen -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/your_home/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /your_home/.ssh/id_rsa.
Your public key has been saved in /your_home/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:x23Tr+Ee5TlowA+U9HEquagnog3O09EYHQ346WY xan@randomPC
The key's randomart image is:
+---[RSA 4096]----+
|=.=. . o+..      |
|.B  o  .oo.      |
|o.o  oo  o       |
|.+ . oo ...      |
| .. .  +S+ .     |
|.      =o==      |
|.o.   o.=o.      |
|o... oE.+o       |
| .. .++..o.      |
+----[SHA256]-----+
```

#### Importing Your Public Key into your Seedbox

Now, we will import the keys you just generated to your seedbox. There are several methods for this and is described below.

##### ssh-copy-id

* This is the easiest and the most recommended but this command only works for Linux.
* For macOS, you might need to install it. To check, open up a terminal and type `ssh-copy-id`.
* If not found, you can install it using these commands below
  * Install using Homebrew: `brew install ssh-copy-id`
  * Install using Macports: `sudo port install openssh +ssh-copy-id`
  * Install using CURL: `curl -L https:``//raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh`
* Type in `ssh-copy-id [username@lwxxx.usbx.me] or ssh-copy-id username@lwxxx.usbx.me`

```sh
$ ssh-copy-id kbguides@kbguides.lw902.usbx.me
```

* The following output appears. This is normal. This means that your computer does not recognize your seedbox. This will happen the first time you connect to a new host. Type `yes` and press **ENTER** to continue.

```sh
$ ssh-copy-id kbguides@lw902.usbx.me
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/xanban/.ssh/id_rsa.pub"
The authenticity of host 'kbguides.lw902.usbx.me (46.182.109.120)' can't be established.
ECDSA key fingerprint is SHA256:9mQKWg1PVPZtzZ6d5nDjcWUb/Flkuq5VHYRrvwTeRTE.
Are you sure you want to continue connecting (yes/no)?
```

* Type in the SSH password you set in UCP

```sh
$ ssh-copy-id kbguides@kbguides.lw902.usbx.me
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/xanban/.ssh/id_rsa.pub"
The authenticity of host 'kbguides.lw902.usbx.me (46.182.109.120)' can't be established.
ECDSA key fingerprint is SHA256:9mQKWg1PVPZtzZ6d5nDjcWUb/Flkuq5VHYRrvwTeRTE.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
kbguides@kbguides.lw902.usbx.me's password:
```

* Once you entered your password, OpenSSH will connect to the seedbox. It will then copy the contents of your `~/.ssh/id_rsa.pub` key into a file in your seedbox's home directory at `~/.ssh` called `authorized_keys`. Then you should see the following output. At this point, your `id_rsa.pub` key has been uploaded to the seedbox.

```sh
$ ssh-copy-id kbguides@kbguides.lw902.usbx.me
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/xanban/.ssh/id_rsa.pub"
The authenticity of host 'kbguides.lw902.usbx.me (46.182.109.120)' can't be established.
ECDSA key fingerprint is SHA256:9mQKWg1PVPZtzZ6d5nDjcWUb/Flkuq5VHYRrvwTeRTE.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
kbguides@kbguides.lw902.usbx.me's password:

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'kbguides@kbguides.lw902.usbx.me'" and check to make sure that only the key(s) you wanted were added.
```

* Once everything is done, you can login to your seedbox with just `ssh username@lwxxx.usbx.me` which will go straight to your shell securely. If you set a password for your keys, enter your password.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/CommandPrompt201905081116.gif">
:::

#### Manually copying contents of your public key to your seedbox

This is another way is to manually copy the contents of your private key file to your seedbox should ssh-copy-id failed. This method works on Windows, Linux and macOS users.

* View your public key file `id_rsa.pub` by opening it using your text editor and copy the whole content

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-8_3-6-2%5B1%5D.png)

:::

* Login to your seedbox using the set password in UCP
* Once logged in, create a directory named `.ssh` with `mkdir -p ~/.ssh`
* Then do `echo public_key_string >> ~/.ssh/authorized_keys` replacing `public_key_string` with the contents of your public key file

```sh
kbguides@lw902:~$ mkdir -p ~/.ssh
kbguides@lw902:~$ echo ssh-rsa AAAAB3NzaC1ycrandom_characters_here_lol xanban@randomPC >> ~/.ssh/authorized_keys
```

* Then type `chmod -R go= ~/.ssh` to recursively removes all “group” and “other” permissions for the `~/.ssh/` directory.

```
kbguides@lw902:~$ chmod -R go= ~/.ssh
kbguides@lw902:~$
```

* Exit SSH try to login to your seedbox with just `ssh [username@lwxxx.usbx.me` which will go straight to your seedbox's shell.
  * If you set a password for your keys, enter your password.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/CommandPrompt201905081116.gif">

:::

***

## PuTTYgen

This method works for Windows users only. 

### Creating Key Pairs Using PuTTYgen

* Open up PuTTYgen. You'll be greeted with this window. 

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-42-17%5B1%5D.png)

* On the bottom under the Parameters section, you can choose which key do you want to generate and how many bits that you generate
* The default is RSA-2048 which is sufficient in most cases.
  * You may also change the parameters to your liking. The following are:
    * RSA 4096
    * Ed25519
* Once that's done, click **Generate**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-42-54%5B1%5D.png)

* From here, you're going to follow the instructions on the program. Seen here, you only need to move your cursor within the program.
  * This is to create entropy, which is needed by PuTTYgen to generate random numbers needed to generate keys.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/2%5B1%5D.PNG)

* After that, the actual generation of the key takes place.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/3%5B1%5D.PNG)

* When finished, you'll see the following information.
  * You may optionally enter your password in the Key Passphrase and Confirm passphrase text boxes
    * It is recommended to add in a passphrase
    * A passphrase adds an additional layer of security to prevent unauthorized users from logging in should they have your private key.
    * If you opt to not add a password so you can login to your slot's SSH without inputting any password, you can leave these blank.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-39-1%5B1%5D.png)

* Hit Save private key, click yes if you did not put a password and save it to a directory you choose.
  * This will be saved in `.ppk` format

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-59-27%5B1%5D.png)

* Copy the contents inside the Public key for pasting into OpenSSH `authorized_keys` file

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-40-6%5B1%5D.png)

#### Importing Public Key to your Seedbox

* Login to your seedbox using the set password in UCP
* Once logged in, create a directory named `.ssh` with `mkdir -p ~/.ssh`
* Then do `echo public_key_string >> ~/.ssh/authorized_keys` replacing `public_key_string` with the generated public key file in PuTTYgen.

```sh
kbguides@lw950:~$ mkdir -p ~/.sshkbguides@lw950:~$ echo ssh-rsa AAAAAAAAlol rsa-key-2012-12-12 >> ~/.ssh/authorized_keys
```

* Then type `chmod -R go= ~/.ssh` to recursively removes all “group” and “other” permissions for the `~/.ssh/` directory.

```sh
kbguides@lw950:~$ chmod -R go= ~/.ssh
```

#### Setting PuTTY to use Key Authentication

* Open PuTTY and load up your session

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_20-0-16%5B1%5D.png)

* In **Connection → SSH → Auth**, you'll see an option for the Private key file for authentication.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-55-54%5B1%5D.png)

* Click **Browse**, navigate to your newly made private key and select it.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_20-1-55%5B1%5D.png)

* Save your session by selecting your Session name and hit **Save**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_20-2-56%5B1%5D.png)

* Now, if setup correctly you can just click Open or double click the session name, enter your password (if you set it) and you can log in to your slot securely.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/3%5B1%5D.gif)

***

## Basic SSH Commands and USB-specific CLI Commands

The terminal is your gateway to the inner workings of your UltraSeedbox slot. It is essentially a remote computer running Linux, and when you SSH into it you are connecting to that computer's terminal.

A terminal is a powerful tool where you can execute written commands to perform many simple or even very complicated tasks. This guide will help you understand a few simple commands to get you started in navigating and making use of the Linux terminal, it can also serve as a cheat sheet later down the track if you need to recall anything you may have forgotten.

### Navigation

In this section we will detail the commands used to move between directories in Linux, we will also cover how to find your location and the structure of your slot.

#### cd

The first thing you are going to want to do in your terminal is navigate between directories. All tasks are performed within different directories, and your current directory affects how a command may run or how you may need to use a command.

When you first SSH into your slot, you will be in your personal **home** directory. This is the location of all your files, anything you wish to accomplish must be done within the **home** directory as this is the only folder you have read, write and execute permissions for. If while navigating your terminal you wish to return to your **home** directory, you can do so by typing `cd ~`.

This brings us to the command you will likely find yourself using a large amount of the time; `cd`. This command is used to navigate between different directories in Linux and stands for _change directory_. To use this command you simply type `cd` followed by the directory you wish to navigate to.

In Linux when navigating using the `cd` command, there are multiple ways to tell the operating system where exactly you want to be. If for example you want to move one directory deeper from a directory you are already in you would use `cd [directory]`. If you know the directory structure already and you simply want to go to a path relative to your current location you can use `cd path/to/directory` where each / stands for a directory deeper. Just like `~` refers to the **home** directory `/` refers to the root of the filesystem. If for example you wanted to navigate to a folder called **media** in your **home** directory you would use the command `cd ~/media`.

It is also worth noting that in Linux `.` refers to the current working directory and `..` refers to the directory above. This is useful in if you want to go back one directory you can type `cd ..`, or if you want to go back two you can use `cd ../..` and so on.

#### ls

Knowing how to navigate your directories is all well and good but how do you know where you actually want to go? For this we use the `ls` command. Typing `ls` within any directory in Linux will instantly show you all the folders in said directory. You can also use `ls` to list the directories inside a different directory using `ls path/to/directory`.

#### pwd

The `pwd` command is used to show you the exact location you are currently in, fairly simple really. Running `pwd` will print the full path to your current working directory. Very useful for when you may be lost.

### File and Directory Manipulation

At some point you are going to want to move files/directories around, copy or delete them. Here we will cover the commands involved in achieving this.

#### mv

The `mv` command stands for _move_, you can use it to move a file or directory to another directory. It is as simple as using the command `mv [file or directory you wish to move] [where you wish to move it]`. For example if you wanted to move a directory called **media** to a directory called **files** you'd use the command `mv media files` if however you wish to move all the files from the directory called media into the directory called files you'd use `mv media/* files` this tells the operating system to move all the files (signified by `/*`) located in media.

#### cp

The `cp` command stands for _copy_, it is used in much the same way as `mv` however there are a few little details worth covering. The general syntax is the same as `mv`; if you wish to copy a file in your current directory named **Movie1.mkv** to a sub directory called **media** you'd used the command `cp Movie1.mkv media`. The difference comes when you wish to copy an entire directory. When you want to copy an entire directory you need to tell the `cp` command to copy _recursively._ This is signified with a `-r` after the `cp`. For example if you wished to copy the directory called **media** to **files** similar to the previous example you'd use the command `cp -r media files`. Copying all the files within media to files is pretty much exactly the same; `cp media/* files`. However, if there are any sub-directories within **media** that you also wish to copy, you again need to use the -r flag; `cp -r media/* files`. The -r flag is used whenever you need to copy an _entire directory_.

#### rm

The rm command stands for _remove_, it is used to delete files or directories you no longer wish to use. **It is very important to keep in mind that there is no recycling bin in Linux, any files you delete are permanently lost.** Syntax for rm is much the same as cp if you wish to remove a file named **Movie1.mkv** you'd simply type `rm Movie1.mkv`. If you wish to remove an entire directory, once again you need to use the `-r` flag; `rm -r media` would delete the entire **media** directory. If you wanted to remove all the files inside the **media** directory, you'd use `rm media/*` or `rm -r media/*` if there are directories inside the media.

#### Further Info

For any commands you need to find more information on you can use the command `man [command]`. This displays a manual page for the specified command.

### UltraSeedbox Specific Commands

#### Application Management

When interacting with your seedbox through Secure Shell you may wish to manipulate the applications we offer one-click installers for, to do this you use the `app-[appname]` commands.

##### Installing and Uninstalling Apps

To install an application we can use the command `app-[appname] install`. This can be helpful to gain further knowledge as to why certain installations are failing. When installing an application you will be presented with an output in the SSH prompt showing either true or false.

Likewise, to uninstall an application we can use the command `app-[appname] uninstall`. This is especially useful in the case of an application saying it's installed while not being accessible from the UCP.

##### Stop, Start and Restarting Apps

To change the running state of an application we use `app-[appname] [start|stop|restart]`. These commands will be useful for you throughout the usage of your USB slot for troubleshooting or further customizing your experience.

##### Checking Used Space

To display your folder structure and space taken by individual  files the `ncdu -x` command is included in every Ultraseedbox slot. After a short scan largest items are displayed top and size is in descending order

##### Further Info

For further information regarding specific commands for a particular application run `app-[appname] help`. This will provide all sub-commands available for the said app.

***

## Troubleshooting Information

**How to check the high utilization of the disk I’m in?**

If your apps are slow and your slot is running sluggish, this is the most common cause.

Any sort of file access on the disk creates io load on the HDD, either by you or other users in the node. This is not an issue with the NVME slots due to their breakneck IO speeds.

Typical applications that do this include the following:

* Torrent clients checking torrents.
* A very active torrent, usually a public torrent
* Unpacking files
* Constant rclone operations to and from providers
* Usenet operations (Unpacking, Downloading, Repairing, etc.)

Run this command in your [shell](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) terminal and pay attention to the last column %util.

```sh
iostat -xk 2 $(findmnt -T ~ | awk 'END {print $2}')
```

If this is 100% after a few minutes, then the disk is entirely saturated, affecting performance. We recommend curbing your settings in your installed applications to prevent this.

If you're doing none of the above, you may need to submit a ticket.

**How to clear up disk space or move data from my slot?**

The easiest way to manage any data is by using your favorite S/FTP client. Filezilla is the most popular choice. We recommend using SFTP as your connection of choice due to it being more flexible on which folders to manage. You can also drag and drop with an S/FTP client, which makes it incredibly useful as a whole. The downside of this is that it takes time for the client to process your moves. Our help guide for S/FTP is available [here](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29).

The fastest way, however, is by using [SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh), but this might be intimidating for inexperienced users. For starters, you can use Midnight Commander, which is a graphical user interface file manager in your slot. It can be started by executing `mc` in your shell. You can also read our basic Linux cheat sheet [here.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/your-ultraseedbox-linux-terminal---helpful-commands-for-learning-linux)

**Why am I unable to connect with SSH, and why is there an error “Resource Temporarily Unavailable”?**

In most cases, this is your total `proclimit` being saturated. We implement resource limits in each slot to ensure fair resource usage on all users. Usually, apps like rclone or syncthing are responsible due to hundreds of worker threads spawned by the application, and in most cases, restarting your applications before logging into SSH again should fix the issue. If it does not work, you may need to submit a ticket.

**Some of my files have duplicates in `~/files` or `~/Downloads` directory and `~/media` directory. Are they using double disk space?**

If you’re using Radarr/Sonarr/Sickchill/CouchPotato/Medusa etc., they should not be taking any additional space. By default, these applications create a *hardlink* of the media file to the default root directory of your application from the path that your Torrent client stores your original downloaded files with. A hard link can be described as a single file located at two different paths but pointing at the same block of data on the disk. Think of it as two signposts from other streets that direct you to the same destination. Hardlinks do not take any extra space. You can compare the inode numbers for both files from the Terminal ([SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) Access) with `ls -I` on both files’. The inode number will be the same.

Hardlinks allows your torrent client to continue seeding while having a “link file” on your media folder neatly arranged. If you wish to delete a file completely that has a hardlink, you may need to delete both the files from your Torrent Client and on your media folder.

You can read more about Hard Links here: [https://en.wikipedia.org/wiki/Hardlink](https://en.wikipedia.org/wiki/Hardlink).