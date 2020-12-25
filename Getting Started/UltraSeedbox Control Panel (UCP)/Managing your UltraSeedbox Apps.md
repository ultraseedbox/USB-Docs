In this guide, we'll be showing you ways on managing your Ultraseedbox installable apps. This includes installing, uninstalling, upgrading and cleanup of the apps.

*** 

## Installing Apps

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

## Upgrading Apps

* To upgrade your app, go to the app you wish to upgrade.
* Click Actions and click Upgrade and repair

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592033022481.png)

* Once clicked, press **confirm** to perform the upgrade.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592033091578.png)

* Once that's done, you'll get a confirmation that the upgrade is finished. You may now access your apps again.

* For some apps such as Plex, we deploy a static image by default. Any attempts of upgrading to the latest version via the UCP will only reinstall said static image. However, you'll be able to upgrade said apps via SSH. Visit the following guides for more information
  * [Updating Plex Media Server via SSH](https://docs.usbx.me/books/plex-media-server/page/updating-plex-media-server-via-ssh)

## Cleanup Installation

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


## Uninstalling Apps

* To upgrade your app, go to the app you wish to **uninstall**.
* Click **Actions** and click **Uninstall**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592034620033.png)

* Once that's done, you'll get a confirmation that uninstallation is completed.


![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592034656048.png)