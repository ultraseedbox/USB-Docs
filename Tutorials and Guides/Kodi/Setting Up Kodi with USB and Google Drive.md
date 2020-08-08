This guide will show you how to set up Kodi as your media center for your media. This will show you the following:

* Mounting your USB seedbox to Kodi as your Media source via FTP
* Setting Google Drive as a source

Take note that Kodi only does direct play. It does not transcode your media.

***

## Prerequisites

* You must download and install Kodi to your devices. Visit the [Kodi Downloads Page](https://kodi.tv/download) to learn more.
  * The setup below is done on a Windows PC using Kodi 18.7.
* You must set up an FTP/SSH password on your slot. You must also know the path to where your media is. Refer to [this link](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/connecting-to-your-seedbox-with-ftp#bkmrk-changing-your-ssh%2Fft) to learn more.
* Mount your Google Drive to your slot. You can refer to [this link](https://docs.usbx.me/books/rclone) to learn more.

## Setting Up Kodi
### FTP

* This part of the guide sets the seedbox as your media source via FTP. In this case, we'll be adding our movies folder.
* Highlight Movies and click on **Enter Files Section**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591551573826.png"></p>

* Click **Add Videos**. The Add video source appears. Click **Browse**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591551639251.png"></p>

* Click **Add network location** and add the following info. Click **OK** to save the remote location.

```
Protocol: FTP Server
Server address: lwxxx.usbx.me
Remote Path: path/to/media/folder|auth=TLS&verifypeer=false
Port: 21
Username: {username}
Password: {set FTP password}
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591556679884.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591556805137.png"></p>

* Select the remote you just created and verify if you have the correct path. Once that's done click **OK**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591556879970.png"></p>

* Then add a name to your added path. In this guide, we'll be using `USB_Movies`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591556929342.png"></p>

* A Set content window comes up. Since the path contains Movies, change **This directory contains** dialogue to Movies.
* Select the information provider that you want. In this case, it's The Movie Database.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591557089707.png"></p>

* Click OK. Kodi will scan your FTP location and add your Movies. This'll go to the Movies section.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591557159020.png"></p>

### Google Drive

* Install the Google Drive Plugin by going to Settings ⇾ Add-ons ⇾ Install from repository

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558410337.png"></p>

* Scroll down then click on video add-ons and click on Google Drive.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558431770.png"></p>

* Finally, click Install. It'll ask for you to install other dependencies, click OK to proceed.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558445816.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558475601.png"></p>

* Go back to the Home screen ⇾ Add-ons and select Google Drive

* Click **Add an account**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558671115.png"></p>

* A window appears with instructions on how to connect your Google Drive account to Kodi. Either scan the QR code or visit the link and enter the code to connect.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558719387.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591558816723.png"></p>

* Next, create a folder somewhere on your device that you can save exported Google Drive `*.strm` files to.
  * In this example, `C:\Users\{username}\strm` is used.

* Reopen your Google Drive add-on and browse through your account

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591559051423.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591559076662.png"></p>

* Right click to the media folders you want to set. Right click it and select `export to .strm files...`
* Set the destination folder to the folder you set, which in this case is `C:\Users\{username}\strm`
* Enable **Update library after export** and **Watch for changes in the Cloud folder** then click OK. Let Kodi scan for all the files in your Google Drive folders.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591561568087.png"></p>

* Go back to **Enter Files Section**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591551573826.png"></p>

* Click **Add Videos**. The Add video source appears. Click **Browse** then browse to where you created your folder, which should have the folders with `.strm` files.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591562454512.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591556805137.png"></p>

* Select the folder you just created and verify if you have the correct path. Once that's done click **OK**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591556879970.png"></p>

* Then add a name to your added path. In this guide, we'll be using `TV`.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591562603998.png"></p>

* A Set content window comes up. Since the path contains TV Shows, change **This directory contains** dialogue to Movies.
* Select the information provider that you want. In this case, it's choose `TVDB`. You can select that from the Get More button.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591562714511.png"></p>

* Click OK. Kodi will scan your Google Drive location and add your TV Shows. This'll go to the TV Shows section.