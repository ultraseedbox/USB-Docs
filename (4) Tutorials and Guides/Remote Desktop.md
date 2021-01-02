::: info
VNC and x2go Access are being phased out on Ultraseedbox's new plans. This page will still be up for clients on legacy plans.
:::

## VNC

In this guide, we'll be teaching you on how to access your seedbox's GUI via VNC. We'll be doing the following steps:

1. Accessing your seedbox's SSH
2. Setting up VNC Daemon
3. Downloading VNC Client
4. Accessing seedbox's GUI via VNC

### Setting up VNC Daemon

* Access your seedbox's SSH
  * For more information on how to connect to your seedbox's SSH, refer to [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")
* Then on your SSH terminal, type the following command where
  * `password` is any password you desire.
      * Make sure this is unique and is not used on your other accounts
  * `resolution` as your preferred resolution
      * It should be width x height (eg 1920x1080)
      * We recommend setting it to 1920x720 for optimal performance.

```sh
vnc-restart {password} {resolution
```

#### Example

```sh
vnc-restart coolpassword 1920x1080
```

* After that, the following output appears. Take note of the `connect to` section. You'll need this to connect on your VNC client.

```sh
usbdocs@lw701:~$ vnc-restart coolpassword 1920x1080
Warning: password truncated to the length of 8.
VNC server started on port: 5914
    connect to:   lw701.ultraseedbox.com:5914    or    46.166.184.34:5914
usbdocs@lw701:~$ 
```

### Downloading a VNC Client

* After that, download a VNC client. We recommend [VNC® Viewer](https://www.realvnc.com/en/connect/download/viewer/ "VNC® Viewer") or [TightVNC Viewer](https://www.tightvnc.com/download.php "TightVNC Viewer"). This guide will be using [VNC® Viewer for Google Chrome](https://www.realvnc.com/en/connect/download/viewer/ "VNC® Viewer").

### Accessing seedbox's GUI via VNC

* Open up your VNC client.
* Then put the address from the `connect to` section in the Address text box and click Connect

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583231883057.png)

* An unencrypted connection warning appears. Press **connect** to continue.
  * You may opt to check `Do not warn me for {address} again` so it doesn't warn you again the next time you connect.
  * If you are worried about this, you may opt to use x2go instead which uses SSH to connect to your virtual desktop.
      * For more information on that, you may visit here: [Accessing the seedbox using x2go](https://docs.usbx.me/books/remote-desktop/page/accessing-the-seedbox-using-x2go "Accessing the seedbox using x2go")

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583231927354.png)

* Enter the VNC password that you've set earlier here.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583232167354.png)

* Then, you'll be greeted by the seedbox's Virtual Desktop
* On the panel window, click Use default config.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583232357315.png)

* Your home folder is located in the Home folder
  * Your desktop may contain other home folders from other users. These are the nodes to which other users are in.
  * Yo**u can only view the folder names inside these home folders but you cannot access these said folders.**
  * **Only your own home folder is accessible by you.**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583232772571.png)

***

## x2go

X2Go is a secure alternative to VNC which uses encryption via the SSH protocol to remotely login and access your seedbox. In this guide, we'll be guiding you on how to do it. We'll be doing the following:

1. Setting up SSH
2. Installing X2Go Client
3. Setting up and connecting to your seedbox

### Setting Up SSH

* In order to use X2Go, you need to set it up first by setting up your SSH password. If you need more information about this, refer to the Changing your SSH Password section in [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")
* Take note of your SSH details in your UCP.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245527192.png)

### Installing X2Go Client

* You can get either X2Go Client or PyHoca-GUI on [https://wiki.x2go.org/doku.php/download:start](https://wiki.x2go.org/doku.php/download:start)
* For this guide, we'll be using X2Go Client

### Setting Up and Connecting to Seedbox's GUI
#### Launching X2Go Client For the First Time

* Run X2Go client. You'll be greeted with 2 windows: The *Session window* and the *Session preferences window*.
  * If you're on Windows, you can allow `sshd` and `pulseaudio` on your firewall.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245320628.png)

#### Setting Up Session Preferences

* On the session preferences window, input the following
  * **Session Name**: Any name you prefer. In this guide, we'll be using USB Docs
  * **Host**: You can use either the hostname or the IP for this field. Here, we're using the IP
  * **Login**: Your seedbox username
  * **SSH Port**: 22
  * **Session Type**: XFCE

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583245685253.png)

* Once that's done, click OK to save your session.

#### Connecting to your Seedbox's GUI

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