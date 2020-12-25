::: info
VNC Access is being phased out on Ultraseedbox's new plans. This page will still be up for clients on legacy plans.
:::

In this guide, we'll be teaching you on how to access your seedbox's GUI via VNC. We'll be doing the following steps:

1. Accessing your seedbox's SSH
2. Setting up VNC Daemon
3. Downloading VNC Client
4. Accessing seedbox's GUI via VNC

***

## Setting up VNC Daemon

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

### Example

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

## Downloading a VNC Client

* After that, download a VNC client. We recommend [VNC® Viewer](https://www.realvnc.com/en/connect/download/viewer/ "VNC® Viewer") or [TightVNC Viewer](https://www.tightvnc.com/download.php "TightVNC Viewer"). This guide will be using [VNC® Viewer for Google Chrome](https://www.realvnc.com/en/connect/download/viewer/ "VNC® Viewer").

## Accessing seedbox's GUI via VNC

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