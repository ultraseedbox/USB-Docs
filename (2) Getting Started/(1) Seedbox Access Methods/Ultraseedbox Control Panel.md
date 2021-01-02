**The UltraSeedbox's Control Panel (UCP)** is your one-stop, easy panel to managing your UltraSeedbox slot. Here, you can easily set your slot access credentials, managing and accessing your apps.

This short section will walk you through the UltraSeedbox Control Panel.

***

## Accessing the Control Panel

* You can access the USB control panel by visiting the USB main page. Go to Control Panel in the top right-hand side of the website, This will take you directly to our Control Panel

![](https://i.imgur.com/gzxkxRe.png)

* You may also visit (and bookmark) the link below.

[https://cp.ultraseedbox.com/](https://cp.ultraseedbox.com/)

### Resetting The UCP Password

If you are logging in for the first time after you've purchased your first USB slot or you forgot your password, you may have to reset your password. To do that:

* Go to UCP site
* Click **Lost Password?**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590576199778.png)

* Enter the email that you used when you purchased your seedbox and click **Reset Password**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590576243060.png)

* You will receive an email with a link to reset your password.
* Enter your desired password. Once that's done, you'll be redirected to the login page. Enter your registered email address and your newly set password to continue.

***

## UltraSeedbox Control Panel Tour
### Dashboard

* Here, you can see an overview of all of your active seedboxes under your account.
* Click Connect to see more details about your seedbox

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585226023.png)

### Slot Info

* In here, you may find the following info of your seedbox
  * Seedbox username and the server name
  * Seedbox type
  * Expiration date
    * This is where you can see the day where your seedbox will expire/bandwidth reset.
  * Download/Upload speeds
  * Disk info
  * Upload Bandwidth info

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585278929.png)

* Also in this page you will find 2 buttons for your slot's webserver.
  * The webserver allows you to access your apps via HTTPS.
  * If you get an error such as Error 502: Bad Gateway upon accessing your app, you can try clicking **Restart webserver** first. Wait for the confirmation and try accessing it again.
  * If that does not work, you may also try **Reinstall webserver**. This will reset your webserver to the default settings.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590587891193.png)

### Access Details

* Here you can get connection details of your slot. You have several ways to interact, connect and use your UltraSeedbox slot.
* Here it shows the access details, the ports listed and the password. You can also change the password for each access.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585466490.png)

* For more information on these access details, you mar refer to the following links
  * [Secure Shell (SSH)](https://docs.usbx.me/books/secure-shell-%28ssh%29)
  * [File Trasfer Protocol (FTP)](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29)
  * [Virtual Private Network (VPN)](https://docs.usbx.me/books/virtual-private-network-%28vpn%29)
  * [HTTP Access](https://docs.usbx.me/books/http-access)
  * [HTTP Proxy](https://docs.usbx.me/books/http-proxy)

### Applications

* Here, you can view your installed applications.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585559940.png)

* Each app may have its own details, may it be connection details, access to the web interface or public ports. You may view it by clicking **Show info**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585609987.png)

* You may also interact with the installation of your app by clicking **Actions**. Here, you can restart, upgrade, change passwords and uninstall your app.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585688436.png)

### Installers

* Here, you can install our supported apps easily.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585744840.png)

* For more information on how to install/upgrade/uninstall apps, you may look into [this guide.](https://docs.usbx.me/books/ultraseedbox-control-panel-%28ucp%29/page/managing-your-ultraseedbox-apps)

### Profile

* Here, you can change your password while logged into your UCP. You can also set your nickname.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590595080846.png)

***

## Managing your Ultraseedbox Apps

In this guide, we'll be showing you ways on managing your Ultraseedbox installable apps. This includes installing, uninstalling, upgrading and cleanup of the apps.

### Installing Apps

* To install an app, go to the Installers tab and just find the app that you want on the list.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590585744840.png)

* Once you find the app that you want, click **Install**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590586092241.png)

* A confirmation window appears. For some apps, just click **Install.**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590586186357.png)

* Some apps, like Medusa, asks for a password before installing.
* Once installed, your set password will be shown under Info. It will be hidden.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590586250567.png)

* For some apps, you are required to put in a specific code before installation.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590586293279.png)

### Upgrading Apps

* To upgrade your app, go to the app you wish to upgrade.
* Click Actions and click Upgrade and repair

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592033022481.png)

* Once clicked, press **confirm** to perform the upgrade.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592033091578.png)

* Once that's done, you'll get a confirmation that the upgrade is finished. You may now access your apps again.

* For some apps such as Plex, we deploy a static image by default. Any attempts of upgrading to the latest version via the UCP will only reinstall said static image. However, you'll be able to upgrade said apps via SSH. Visit the following guides for more information
  * [Updating Plex Media Server via SSH](https://docs.usbx.me/books/plex-media-server/page/updating-plex-media-server-via-ssh)

### Cleanup Installation

* In some cases, your installation/upgrade may fail and you'll get an error similar to this

```
/usr/bin/docker: Error response from daemon: Conflict. The container name "/{appname}-{username}" is already in use by container "fdcd401e1000424eb426cdef143cc07c". You have to remove (or rename) that container to be able to reuse that name. See '/usr/bin/docker run --help'.
```

or

```
You will need to uninstall Plex in order to proceed with this installation.
```

* Go to **Installers** and click **Cleanup**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592031962065.png)

* Once clicked, press **confirm** to perform the cleanup.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592032210916.png)

* Once that's done, you'll get a confirmation that the cleanup is done. You may now install or upgrade your apps again.


### Uninstalling Apps

* To upgrade your app, go to the app you wish to **uninstall**.
* Click **Actions** and click **Uninstall**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592034620033.png)

* Once that's done, you'll get a confirmation that uninstallation is completed.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592034656048.png)

***

## Troubleshooting Information

**I just signed up for a slot, and my UCP keeps saying invalid password!**

Our server infrastructure is separate from our account/payment gateways.

* Customer Portal: [https://my.ultraseedbox.com](https://my.ultraseedbox.com) is for your products, invoices, and support.
* User Control Panel (UCP): [https://cp.ultraseedbox.com](https://cp.ultraseedbox.com) is for managing your seedbox.

You will receive an email regarding the successful deployment of your slot. As the email advises, you need to use the password reset form with the email you signed up with at [https://cp.ultraseedbox.com](https://cp.ultraseedbox.com). For more information, you can visit this guide [here](https://docs.usbx.me/link/171#bkmrk-resetting-the-ucp-pa).

**How do I connect to my slot’s shell/SSH?**

To connect to your slot’s shell for executing commands, you must first set your password in your UCP's access details and use an SSH client such as PuTTY to connect to your shell.

For more information, we have a help section for SSH [here](https://docs.usbx.me/books/secure-shell-%28ssh%29).

**How to resolve stuck container errors?**

This issue happens when the container is partially installed. You can use the Clean-Up button next to the Install button of any application you’re trying to install. You may also connect via [SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) to your slot and remove it using the command `app-App_Name uninstall`.

**How to upgrade the applications to their latest release?**

Under the Installed Applications -> Application, you will see the action dropbox. You need to select upgrade/repair on your desired application, and this will pull the latest version.

Take note that while your desired app may have committed to its repo in the last 10 hours, it may be a pre-release. Your application will only pull the latest stable release when it's docker image is committed to the DOCKER repo. The Upgrade button is also not available to some torrent clients.

**Why are my apps showing Error 502: Bad Gateway?**

An error 502: Bad Gateway error signifies that the webserver failed to start or got crashed. You may need to follow the instructions on the error page first and see if it fixes the issue.

If it doesn’t, it might be that you ran out of your allocated disk space, which crashes all of your apps.

Please ensure that you have at least 10GB of free disk space on your slot consistently to avoid this. To manage your data, please log in to your service with our recommended FTP file manager and delete some old/redundant files to free up some space.

Once done, kindly restart your webserver and the apps from your UCP main dashboard at [https://cp.ultraseedbox.com](https://cp.ultraseedbox.com).