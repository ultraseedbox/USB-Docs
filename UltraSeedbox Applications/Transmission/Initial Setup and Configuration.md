This guide will show you the initial setup and the configuration options for Transmission.

***

## Initial Setup

Deluge is already configured and tuned out of the box. Just install the client, enter your desired password and press Connect to login to your Transmission Web Interface.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589719260048.png"></p>

***

## Default File Paths

Default Downloads Folder: `~/files`

Deluge's config folder: `~/.config/transmission-daemon`

***

## Settings Overview

* To access Transmission's WebUI settings, click the wrench icon on the bottom left corner of the screen.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589960457658.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589960661068.png"></p>

* Listed below are the settings that might be relevant to you.

### Torrents

* Here, you can set the default Downloads folder path.
* You can also set here the global seedling limits such as seeding ratio and stop seeding if idle at a certain time
  * If you're going to public torrents on this tracker, it is advised to check `Stop seeding at ratio:` and set it to 2.
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589960631697.png"></p>

### Speed

* Here, you can set global seeding speed limits.
  * We do not recommend throttling your torrent speeds. Consider limiting the seeding ratio instead.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590040773578.png"></p>

### Peers

* This is where you can set a number of options such as
  * Connections
  * enabling BitTorrent features such as PEX and DHT
  * Enabling blocklists
* If you want to use Transmission on public trackers only, you can leave PEX and DHT enabled. If you're using private trackers only, disable them.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590040819501.png"></p>