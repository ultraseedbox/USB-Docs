**SSH**, also known as **Secure Shell**, is a network protocol that gives users a secure way to remotely access your seedbox. With SSH, you can do the following:

* Provides secure access for users to your seedbox
* Can be used for secure file transfers to and from your PC
* Issue remote commands
* Can be used to diagnose and troubleshoot if there are problems with your apps

All of our seedbox plans come with SSH access.

***

## Changing your SSH Password

Before logging into your SSH, you should first set your own SSH/FTP password.

* Login to your [User Control Panel](https://cp.ultraseedbox.com) and login with the credentials you set and Press **Connect**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-13-9%5B1%5D.png">
</p>

* Click **Access details** and click **Change password** beside SSH access.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-14-38%5B1%5D.png">
</p>

* Set your password to anything you wish. We recommend using a unique password that you do not use in any of your existing accounts and has the following:
  * At least 12 characters
  * An uppercase letter
  * A lowercase letter
  * At least 1 number
  * At least 1 symbol
* When you're done click **Confirm change**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-19-3%5B1%5D.png">
</p>

* A popup saying Password successfully changed should appear on the lower right corner of the page, signifying that the password is set successfully.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-25-0%5B1%5D.png">
</p>

***

## SSH Clients and How to Connect

### OpenSSH

OpenSSH is an open-source alternative to the proprietary Secure Shell software suite offered by SSH Communications Security and is bundled with some Linux distributions and macOS. It is also an optional feature in Windows 10 since the October 2018 Update (Version 1809).

#### Installing OpenSSH in Windows 10

* To install OpenSSH client, go to Settings then go to **Apps** > **Apps and Features** > **Manage Optional Features**. Then, click **Add a feature**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_7-45-2%5B1%5D.png">
</p>

* Then, select **OpenSSH Client** and click Install.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_7-47-33%5B1%5D.png">
</p>

* Once installation is completed, return to **Apps** > **Apps and Features** > **Manage Optional Features** and you should see **OpenSSH Client** listed under Optional features.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_7-49-42%5B1%5D.png">
</p>

#### Installing OpenSSH in Linux

Some Linux distributions have OpenSSH client installed as part of their bundle. Provided below are the commands to install OpenSSH clients in some of the popular Linux distributions.

```
Ubuntu/Debian: sudo apt install openssh-client

Arch Linux/Manjaro Linux: sudo pacman -Syyu openssh

Fedora: sudo dnf install -y openssh-client;
```

#### Accessing Seedbox’s Terminal via OpenSSH

The following screenshots are from Windows' command prompt but it should be the same on Windows, Linux and macOS.

* Open up a command prompt window, Windows PowerShell window or a terminal window (macOS/Linux) and type in either of the following

```
ssh username@IP_of_seedbox (usbdocs@123.456.789)
ssh username@lwxxx.usbx.me (usbdocs@lw500.usbx.me)
ssh username@username.lwxxx.usbx.me (usbdocs@usbdocs.lw500.usbx.me)
```

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-40-18%5B1%5D.png">
</p>

* When you do this the first time, this message appears. This is normal. This means that your computer does not recognize the remote host, which is your seedbox and will happen the first time you connect to a new host.
* Type `yes` and press **ENTER** to continue. You can compare your IP address shown here to the one indicated to your UCP and if it's correct, type `yes`**.**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-43-11%5B1%5D.png">
</p>

* Then, enter the password that you set earlier. Take note that you won't see anything in the password field as you type. This is normal as no visual feedback of passwords given in the terminal is part of the security measures taken by default.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-49-32%5B1%5D.png">
</p>

* When you entered the correct password, you'll enter the shell of your seedbox.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-52-0%5B1%5D.png">
</p>

***

### PuTTY

PuTTY is a free and open-source GUI SSH, Telnet, Rlogin and serial port connection client for Windows. You may also use this to connect to your seedbox.

#### Installation

* Download and install the latest release of PuTTY [here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

#### Setting up PuTTY

* Launch PuTTY and you'll be greeted with this window.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138075458.png">
</p>

* Login to your UCP and navigate to your **Access details** Tab

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image2019-5-7_11-14-38.png">
</p>

* Put in the hostname or the IP of the seedbox to the Host Name (or IP Address) text box. In the screenshot, I'll be using the IP of the seedbox.
* Make sure that the Port is set to `22` and the Connection Type is **SSH**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138508563.png">
</p>

* In **Connection** -> **Data**, enter the username registered on your slot.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138631720.png">
</p>

* This is optional but under Connection, you can set _Seconds between keepalives_ to `60`. This is to prevent you to disconnect from your SSH session whenever you're idle.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138755528.png">
</p>

* Now, to save your profile, go to **Session**. Enter any name you want on the _Saved sessions_ text box and click **Save**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138853264.png">
</p>

* We will now login to your seedbox. Highlight the Saved session you just made. and click **Open**.
* Another window will open

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571138960013.png">
</p>

* Enter the password you set. Once logged in, you'll see this message. You're now in your seedbox's terminal prompt.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571139046458.png">
</p>