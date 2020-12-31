**Resilio Sync** (formerly BitTorrent Sync) is a proprietary peer-to-peer file synchronization and sharing tool. It can securely sync files between devices on a local network, or between remote devices over the Internet via a modified version of the BitTorrent protocol. Major features are the following:

*   Traffic between devices is encrypted with AES-128
*   Can sync files to all of your connected devices
*   Selective Sync
*   Per User Folder Permissions
*   Control Bandwidth Usage
*   Available on major platforms

Resilio Sync has some paid features, which has been listed below:

* Free version only has One Synchronization Mode (Synced) and can only sync standard folders.
* Advance folder sync is a Pro feature.
* Free has No local sync ability
  * You cannot sync Folder A to Folder B if both folders are on your Ultraseedbox Slot
* You cannot change permissions once set in the free version you would have to recreate the sync folder from scratch.
* Free cannot perform selective sync everything inside a selected folder will be synced and a filter cannot be applied

For more information on Resilio Pro Please Visit: https://help.resilio.com/hc/en-us/articles/204754419-Sync-FREE-vs-Sync-PRO

For more information on Resilio Sync itself, you can visit https://www.resilio.com/individuals/

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568886011701.png)

::: warning
Resilio Sync is counted towards your upload allocation.
:::

***

## Initial Setup

In this section, we'll be setting up Resilio Sync for the first time. For this guide, we'll assume you want to setup a folder on your seedbox as your "synced folder", which will be synced automatically to your devices.

### Setting Up Resilio Sync on your Ultraseedbox Slot

After Installation of Resilio Sync via the Ultraseedbox Control Panel, Upon first opening the Web interface you will be presented with this page:

![](https://i.imgur.com/4ZmTnQ0.jpg)

You will need to enter the following:

* A **username** of your choosing
  * This does not have to be the same as your Ultraseedbox username
* A **password** of your choosing.


Then, you must select Home Sync as your next option.

This next screen must be considered carefully as it **cannot** be changed later. Choose the name of the sync server, which is used to identify your sync server to your devices.

![](https://i.imgur.com/C10KmN3.jpg)

Upon completion of the previous steps you will be immediately prompted to input the username and password you have set in Step 1.

### Adding your First Folder

Before Syncing any file from your Ultraseedbox to another Device, you must tell Resilio what folders need to be included.

![](https://i.imgur.com/If7NUuZ.jpg)

Here is an example of Syncing my Media folder to another device

![](https://i.imgur.com/Q0oO995.jpg)

### Sharing Options
#### Link

After clicking the media folder then clicking open you are presented with this screen. The following are our recommended options

##### Permissions

* Read Only: The Client Device can read and copy the data but Cannot delete or add to the folder
* Read & Write: The Client Device can read and copy the data CAN delete or add to the folder

![](https://i.imgur.com/GVF5TBv.jpg)

##### Security

* New Peers Must be approved (if sharing to other people)
* Link Expiry and Number of uses applies to the email link or copied link only

![](https://i.imgur.com/9t0Ssjd.jpg)

Setting this means that if you share the link with a friend or publicly anyone trying to sync will need to be manually approved upon the First connection attempt only. This can be changed to all peers by clicking the blue text which will cause every connection regardless of if its been made before to require manual acceptance. If you are planning to use syncing just for personal use I would recommend disabling this checkbox.

#### Folder Keys

![](https://i.imgur.com/egBODjx.jpg)

These are Unique codes which can be used to connect sync clients with the required permissions without the need to use the security options above.

#### QR code

![](https://i.imgur.com/4odR5yO.jpg)

This can be used to connect the folder to your mobile devices.

### Finalizing Setup
#### File Download Location

![](https://i.imgur.com/buAlwjj.jpg)

Go to Preferences -> General. The only option you need to set here is **File download location**. Tt is used if you want to pull data from a client to your Ultraseedbox Server. USB recommends logging into your slot and creating a new clean folder for your downloads and setting it in the above options.

On SSH, do the following commands:

```sh
mkdir ~/resilio
echo ~/resilio
```

Copy the output of that file then Edit the option in Resilio by unticking “Ask where to save each file before downloading” then add the full path of `resilio` to the end of the path 

#### Speed Throttling

![](https://i.imgur.com/ayi6AA8.jpg)

You may also have to set the speed throttling options here. This is used to help keep your bandwidth under control as syncs are highly IO intensive. **Also, Resilio sync is counted to your upload bandwidth.**

We recommend `25MB/s` for both download and upload.

### Connecting Your Resilio Sync Server to your Devices

To connect your Resilio Sync server to your devices, you need to install **Resilio Sync Clients** to your devices. You may visit this page for more info: https://www.resilio.com/platforms/desktop/

The process varies per device but this assumes that you'll be connecting to your Windows PC. We will make use of the Key Or Link you set up. Click the plus button and `click Enter a key or link`

![](https://i.imgur.com/7iqQy0V.jpg)

This will Present the following screen to paste your Key or link into. Paste the link or key to add the folder.

![](https://i.imgur.com/78QX5Cl.jpg)

Clicking **Next** will then open Windows explorer for you to choose the Folder that you want to sync too.

Your Folder will begin syncing as soon as you select your folder.