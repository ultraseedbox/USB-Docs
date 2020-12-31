::: info
x2go access is being phased out on Ultraseedbox's new plans. This page will still be up for clients on legacy plans.
:::

X2Go is a secure alternative to VNC which uses encryption via the SSH protocol to remotely login and access your seedbox. In this guide, we'll be guiding you on how to do it. We'll be doing the following:

1. Setting up SSH
2. Installing X2Go Client
3. Setting up and connecting to your seedbox

***

## Setting Up SSH

* In order to use X2Go, you need to set it up first by setting up your SSH password. If you need more information about this, refer to the Changing your SSH Password section in [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")
* Take note of your SSH details in your UCP.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245527192.png)

## Installing X2Go Client

* You can get either X2Go Client or PyHoca-GUI on [https://wiki.x2go.org/doku.php/download:start](https://wiki.x2go.org/doku.php/download:start)
* For this guide, we'll be using X2Go Client

## Setting Up and Connecting to Seedbox's GUI
### Launching X2Go Client For the First Time

* Run X2Go client. You'll be greeted with 2 windows: The *Session window* and the *Session preferences window*.
  * If you're on Windows, you can allow `sshd` and `pulseaudio` on your firewall.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245320628.png)

### Setting Up Session Preferences

* On the session preferences window, input the following
  * **Session Name**: Any name you prefer. In this guide, we'll be using USB Docs
  * **Host**: You can use either the hostname or the IP for this field. Here, we're using the IP
  * **Login**: Your seedbox username
  * **SSH Port**: 22
  * **Session Type**: XFCE

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245685253.png)

* Once that's done, click OK to save your session.

### Connecting to your Seedbox's GUI

* Your new session will be added to your Sessions window. Click the new item to login.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245783261.png)

* Enter your set SSH password and click Ok

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245829780.png)

* You'll see this Host key verification failed window. Click yes to proceed.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245883105.png)

* After 30 seconds to a minute (depending on your connection), you'll get this window indicating that you have successfully connected.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245978327.png)

* A new window will pop out, showing the seedbox's desktop.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246044894.png)

* If it's your first time logging in, a panel window appears. Click **Use default config** to proceed.
* Your home folder is located in the Home folder
  * Your desktop may contain other home folders from other users. These are the nodes to which other users are in.
  * **You can only view the folder names inside these home folders but you cannot access these said folders.**
  * **Only your own home folder is accessible by you.**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246192776.png)