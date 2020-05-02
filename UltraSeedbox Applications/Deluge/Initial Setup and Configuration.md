This guide will show you the initial setup and the configuration options for Deluge.

***

# Initial Setup

Deluge is already configured and tuned out of the box. Once logged in for the first time, there will be a textbox asking you if you want to change the default password, which is the one you set in UCP. Click **No**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573813864485.png">
</p>

Then, the Connection Manager settings will appear. Just click the host in the box and click **Connect**. After that, ou are now logged into Deluge’s Web UI.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573813975710.png">
</p>

<p class="callout info">We recommend your Deluge password consists of LETTERS and NUMBERS only. This is particularly useful when you're using deluge-console injection for autodl-irssi.</p>

***

# Default File Paths

Default Downloads Folder: `~/Downloads`

Deluge's config folder: `~/.config/deluge`

***

# Settings Overview

* To access Deluge's settings, click the **Preferences** button.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826338240.png">
</p>

* Below are the following important settings that you might be interested at.

## Downloads

* Here, you can set the location of the Deluge's Download folder. It is defaulted to `~/Downloads`
* You can also set a folder to move your completed downloads, get a copy of .torrent files to a separate folder and auto-add .torrents
* You can set allocation and other options. It's best to leave these options as-is unless you know what you're doing.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826028621.png">
</p>

## Network

* Here, you can set option for port assignments, peer byte TOS, and BitTorrent Protocol extras.
* The settings here are configured for the use of private trackers. It's best to leave these options as-is.
* If you're going to use primarily public trackers, check all Network extras and click OK to apply.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826052419.png">
</p>

## Bandwidth

* Here, you may set bandwidth usage that will be applied to all of your seeding torrents.
* Here, you can also set the Maximum Download and Upload speed here
  * We recommend not to set these. Any attempts of throttling upload or download will be detected by your tracker and will be restricting your access to the torrents. It is best to set a ratio limit to your torrents which you may do so by going here: [Setting Max Seed Limit in Deluge using LabelPlus](https://docs.usbx.me/books/deluge/page/setting-max-seed-limit-in-deluge-using-labelplus "Setting Max Seed Limit in Deluge using LabelPlus") and [Deluge's Queue Options](https://docs.usbx.me/books/deluge/page/initial-setup-and-configuration#bkmrk-queue)

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826085303.png">
</p>

## Interface

* Here, you can set some changes to your Deluge WebUI
* You can also change your set Deluge WebUI password here
  * Take note that you're only changing the WebUI password.
  * Remote access/deluge-console password will not be changed. Should you need to change the remote access password, you may have to reinstall Deluge.
* For the rest, it's best to leave these as-is.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826101214.png">
</p>

## Queue

* Here, you can change how many active, active downloading and active seeding.
    * You can set these to `-1` for unlimited Active torrents. Downside of this is that this will hamper performance, especially IO if you have lots of active torrents. 
* You can also set global ratio seeding limits here.
  * If you're using public trackers, USB TOS allows clients to seed public torrents up to 2.0. This is to adhere fair usage rules and to not drain your allocated bandwidth.
  * There are more flexible options to set ratio limits. You may visit this guide to learn more: [Limiting Seeding Ratio in Deluge](https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge "Limiting Seeding Ratio in Deluge")

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826215686.png">
</p>

## Plugins

* Here, you can enable and install plugins.
* For more information on this, refer to this guide: [Installing Deluge Plugins](https://docs.usbx.me/books/deluge/page/installing-deluge-plugins "Installing Deluge Plugins")

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826287076.png">
</p>

## Execute

* Here, you may put in the absolute path of scripts for it to be executed according to your set Torrent event.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826301343.png">
</p>