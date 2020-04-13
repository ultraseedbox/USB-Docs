**SSH key pair authentication** is a recommended method of logging into your seedbox via SSH for added security and convenience in place of our SSH password. You can place the public key on your slot, and then unlock it by connecting to it with a client that has the private key. When the two match up, the system unlocks without the need for a password. The major advantage of this is that it is not prone to brute-force attacks. You can increase security even more by protecting your private key with a passphrase.  
  
In this tutorial, we would be showing you on how to generate your own key pair using several tools, how to transfer your public key to your slot and how to login using key pair authentication.

***
#  OpenSSH

This should work on Linux, MacOS and Windows 10 Users. If you haven't set OpenSSH up, you may refer to [on how to connect to your seedbox via SSH for installation and setup of OpenSSH for Windows 10, Linux and MacOS.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")

## Creating Public and Private Keys

* On your computer, type in `ssh-keygen` and press **ENTER**. This should start generating public and private key pairs.
  * By default it generates a 2048-bit RSA key pair which is sufficient in most cases

```
$ ssh-keygen
Generating public/private rsa key pair.
```

* We also recommend to generating the  following keys which are more secure than the default.
  * To generate a RSA 4096 key: `ssh-keygen -b 4096`
    * Much more secure than 2048 bit is slower when logging into your seedbox
  * To generate a ed25519 key: `ssh-keygen -t ed25519`
    * New algorithm, has smaller key size and faster generation with security comparable to RSA ~3000

* Here, you can press **ENTER** to save the key pair into the `.ssh/` subdirectory in your home directory
  * For Windows, your User Folder is typically in `C:\Users\username\.ssh`
  * For linux it's `/home/username/.ssh`
  * You may also specify an alternate path.

```
$ ssh-keygen -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/your_home/.ssh/id_rsa):
```

* Here you optionally may enter a secure passphrase. You can press **ENTER** to skip putting in a passphrase
  * It is recommended to add in a passphrase
  * A passphrase adds an additional layer of security to prevent unauthorized users from logging in should they have your private key

```
$ ssh-keygen -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/your_home/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

* Then you should see the following output. You now have a public (`id_rsa`) and a private key (`id_rsa.pub`) stored in your Home folder (or on the path you set) that you can use to authenticate when logging into SSH.

```
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

## Importing Your Public Key into your Seedbox

Now, we will import the keys you just generated to your seedbox. There are several methods for this and is described below.

### ssh-copy-id

* This is the easiest and the most recommended but this command only works for Linux.
* For MacOS, you might need to install it. To check, open up a terminal and type `ssh-copy-id`.
* If not found, you can install it using these commands below
  * Install using Homebrew: `brew install ssh-copy-id`
  * Install using Macports: `sudo port install openssh +ssh-copy-id`
  * Install using CURL: `curl -L https:``//raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh`
* Type in `ssh-copy-id [username@lwxxx.usbx.me] or ssh-copy-id username@lwxxx.usbx.me`

```
$ ssh-copy-id kbguides@kbguides.lw902.usbx.me
```

* The following output appears. This is normal. This means that your computer does not recognize your seedbox. This will happen the first time you connect to a new host. Type `yes` and press **ENTER** to continue.

```
$ ssh-copy-id kbguides@lw902.usbx.me
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/xanban/.ssh/id_rsa.pub"
The authenticity of host 'kbguides.lw902.usbx.me (46.182.109.120)' can't be established.
ECDSA key fingerprint is SHA256:9mQKWg1PVPZtzZ6d5nDjcWUb/Flkuq5VHYRrvwTeRTE.
Are you sure you want to continue connecting (yes/no)?
```

* Type in the SSH password you set in UCP

```
$ ssh-copy-id kbguides@kbguides.lw902.usbx.me
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/xanban/.ssh/id_rsa.pub"
The authenticity of host 'kbguides.lw902.usbx.me (46.182.109.120)' can't be established.
ECDSA key fingerprint is SHA256:9mQKWg1PVPZtzZ6d5nDjcWUb/Flkuq5VHYRrvwTeRTE.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
kbguides@kbguides.lw902.usbx.me's password:
```

* Once you entered your password, OpenSSH will connect to the seedbox. It will then copy the contents of your `~/.ssh/id_rsa.pub` key into a file in your seedbox's home directory at `~/.ssh` called `authorized_keys`. Then you should see the following output. At this point, your `id_rsa.pub` key has been uploaded to the seedbox.

```
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

* Once everything is done, you can login to your seedbox with just `ssh username@lwxxx.usbx.me` which will go straight to your shell securely. If you set a password for your keys, enter your password.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/CommandPrompt201905081116.gif"></p>

### Manually copying contents of your public key to your seedbox

This is another way is to manually copy the contents of your private key file to your seedbox should ssh-copy-id failed. This method works on Windows, Linux and MacOS users.

* View your public key file `id_rsa.pub` by opening it using your text editor and copy the whole content

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-8_3-6-2%5B1%5D.png">
</p>

* Login to your seedbox using the set password in UCP
* Once logged in, create a directory named `.ssh` with `mkdir -p ~/.ssh`
* Then do `echo public_key_string >> ~/.ssh/authorized_keys` replacing `public_key_string` with the contents of your public key file

```
kbguides@lw902:~$ mkdir -p ~/.ssh
kbguides@lw902:~$ echo ssh-rsa AAAAB3NzaC1ycrandom_characters_here_lol xanban@randomPC >> ~/.ssh/authorized_keys
```

* Then type `chmod -R go= ~/.ssh` to recursively removes all “group” and “other” permissions for the `~/.ssh/` directory.

```
kbguides@lw902:~$ chmod -R go= ~/.ssh
kbguides@lw902:~$
```

* Exit SSH try to login to your seedbox with just `ssh [username@lwxxx.usbx.me` which will go straight to your seedbox's shell.
  * If you set a password for your keys, enter your password.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/CommandPrompt201905081116.gif">
</p>

***

# PuTTYgen

This method works for Windows users only. 

## Creating Key Pairs Using PuTTYgen

*   Open up PuTTYgen. You'll be greeted with this window. 

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-42-17%5B1%5D.png">
</p>

* On the bottom under Parameters section, you can choose which key do you want to generate and how many bits that you generate
* The default is RSA-2048 which is sufficient in most cases.
  * You may also change the parameters to your liking. The following are:
    * RSA 4096
    * Ed25519
* Once that's done, click **Generate**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-42-54%5B1%5D.png">
</p>

* From here, you're going to follow the instructions on the program. Seen here, you only need to move your cursor within the program.
  * This is to create entropy, which is needed by PuTTYgen to generate random numbers needed to generate keys.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/2%5B1%5D.PNG"></p>

* After that, actual generation of key takes place.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/3%5B1%5D.PNG">
</p>
                                                                           
* When finished, you'll see the following information.
  * You may optionally enter your password in the Key Passphrase and Confirm passphrase text boxes
    * It is recommended to add in a passphrase
    * A passphrase adds an additional layer of security to prevent unauthorized users from logging in should they have your private key.
    * If you opt to not add an password so you can login to your slot's SSH without inputting any password, you can leave these blank.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-39-1%5B1%5D.png">
</p>

* Hit Save private key, click yes if you did not put a password and save it to a directory you choose.
  * This will be saved in `.ppk` format

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-59-27%5B1%5D.png">
</p>

* Copy the contents inside the Public key for pasting into OpenSSH `authorized_keys` file

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-40-6%5B1%5D.png">
</p>

## Importing Public Key to your Seedbox

* Login to your seedbox using the set password in UCP
* Once logged in, create a directory named `.ssh` with `mkdir -p ~/.ssh`
* Then do `echo public_key_string >> ~/.ssh/authorized_keys` replacing `public_key_string` with the generated public key file in PuTTYgen.

```
kbguides@lw950:~$ mkdir -p ~/.sshkbguides@lw950:~$ echo ssh-rsa AAAAAAAAlol rsa-key-2012-12-12 >> ~/.ssh/authorized_keys
```

* Then type `chmod -R go= ~/.ssh` to recursively removes all “group” and “other” permissions for the `~/.ssh/` directory.

```
kbguides@lw950:~$ chmod -R go= ~/.ssh
```

## Setting PuTTY to use Key Authentication

* Open PuTTY and load up your session

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_20-0-16%5B1%5D.png">
</p>

* In **Connection → SSH → Auth**, you'll see an option for Private key file for authentication.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_19-55-54%5B1%5D.png">
</p>

* Click **Browse**, navigate to your newly made private key and select it.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_20-1-55%5B1%5D.png">
</p>

* Save your session by selecting your Session name and hit **Save**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-8-8_20-2-56%5B1%5D.png">
</p>

* Now, if setup correctly you can just click Open or double click the session name, enter your password (if you set it) and you can log in to your slot securely.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/3%5B1%5D.gif"></p>