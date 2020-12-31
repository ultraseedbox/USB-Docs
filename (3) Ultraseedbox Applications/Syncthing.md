**Syncthing** is a free, open-source peer-to-peer file synchronization application that's written in Go. It synchronizes files between two or more computers securely and seamlessly.

For more information on this, please visit [this link.](https://syncthing.net/)

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591019800959.png)

***

## Initial Setup

In this section, we'll be setting up Syncthing for the first time. For this guide, we'll assume you want to setup a folder on your seedbox as your "dropbox", which will be synced automatically to your Windows PC.

### Prerequisites

* Download and install Syncthing on both your seedbox and the devices you prefer. You may refer to [Syncthing Downloads](https://syncthing.net/downloads/) to get which apps to use for your preferred platform. For this guide, we'll be installing [SyncTrazor](https://github.com/canton7/SyncTrayzor) along with Syncthing on the seedbox.
* Login to your seedbox via SSH and create a folder which will be used to sync folders with. For this guide, we'll be creating a folder named `Syncthing`. Also get the full path of the folder by doing `pwd` as shown below.

```sh
usbdocs@lw873:~$ mkdir Syncthing
usbdocs@lw873:~$ ls
bin  Downloads  files  media  openvpn  >Syncthing<  watch  www
usbdocs@lw873:~$ cd Syncthing/
usbdocs@lw873:~/Syncthing$ pwd
/home20/usbdocs/Syncthing
```

::: warning
Do not attempt to mount your rclone remote directly on your home directory. This will lead to instabilities. Instead, always create and use an empty folder within your home directory.
:::

### Setting up Syncthing on Seedbox

* Upon installation and entering the set credentials, the `Allow Anonymous Usage Reporting?` window appears. Read over this and select if you agree with data reporting or not.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591016890789.png)

* Click **Add folder.**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591016950158.png)

* Then enter the following information. Once that's done, click **Save**.

```
General

Folder Label: {Any}
Folder Path: {output of pwd}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591017266359.png)

### Setting up Sharing on the PC

::: info
Shown here is instructions for Windows using SyncTrazor but it should be similar to all other devices that support Syncthing
:::

* Get the seedbox's device ID by going to **Actions -> Show ID**. Copy the generated ID above.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591017803312.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018018955.png)

* Launch SyncTrazor, the `Allow Anonymous Usage Reporting?` window appears. Read over this and select if you agree with data reporting or not.
* Then under `Remote Devices`, click **Add Remote Device**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018219049.png)

* Then enter the following information. Once that's done, click **Save**.

```
General

Device ID: {Paste Seedbox Device ID here}
Device Name: {can be blank}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018425722.png)

```
Sharing

Auto accept: Checked
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018505299.png)

```
Advanced: Device Limits

Incoming Rate Limit (KiB/s): {optional}
Outgoing Rate Limit (KiB/s): {optional}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018652458.png)

* Go back to your Syncthing seedbox, you should see a **New Device** window. Confirm that it is indeed your device by checking the Device names and Device ID's shown and click **Add device**.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018836725.png)


* Then enter the following information. Once that's done, click **Save**.

```
General

Device ID: {SyncTrazor Device ID here}
Device Name: {automatically filled}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591018933795.png)

```
Sharing

Auto accept: Checked
Share Folders with Device: {Check the folder you just created. In this case, Syncbox}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591019017451.png)

```
Advanced: Device Limits

Incoming Rate Limit (KiB/s): {optional}
Outgoing Rate Limit (KiB/s): {optional}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591019088052.png)

* Your synced seedbox folder will show up on SyncTrazor in `%HOMEPATH%`. For this case, it's in `%HOMEPATH%\Syncbox`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591019503399.png)

* To sync files to and from your seedbox, just copy/move files from your seedbox/PC to `Syncbox` and it will automatically sync.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591019713813.png)