## Initial Setup

rTorrent/ruTorrent is already configured and tuned out of the box. To Install:

* Install it from our Control Panel
  * Install rTorrent first before installing ruTorrent
* For ruTorrent, add in your desired password in the textbox
* Once installed, click Connect under ruTorrent
* Enter your set credentials
    * Your username being your seedbox username and your ruTorrent password

***

## Default File Paths

Default Downloads Folder: `~/files`

Default Watch Folder: `~/watch`

rTorrent's config folder: `~/.config/rtorrent`

***

## Accessing rTorrent CLI Interface

* Should you need to access rTorrent's CLI interface, just type in the following command in SSH:

```sh
screen -r rtorrent
```

* You'll get a similar interface as below. To exit the interface, do CTRL + A + D

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246602380.png"></p>

***

## ruTorrent's Settings Overview

* To access ruTorrent settings, click the **Gear** button.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583326091405.png"></p>

* Then you'll have access to the following settings. Most are configured and tuned by us so you don't need to change anything. Below listed are some of the pane that might be relevant to you.

### Downloads

* Here you can see the bandwidth settings set in rTorrent
  * We recommend not to touch these
* In here you can also find Default directory for downloads. This shows the default downloads folder of rTorrent. You can change this to any other folder within your home folder
  * You may use the tilde (~) or getting your full home path by doing `echo $HOME` on SSH

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583326625258.png"></p>

### BitTorrent

* Here, you can enable additional BitTorrent Features such as DHT and Peer Exchange
  * This is useful if you plan to exclusively use **public** trackers
  * Keep these unchecked if you're using **private** trackers
* Here, you can also find the IP/Hostname to report to tracker
  * When rTorrent/ruTorrent is installed,  it'll pick automatically from a pool of random IP addresses.
  * This is to ensure that there are not much users in the same IP address at any given time
  * Should the tracker in question needed the IP address for whitelisting, you should give the this address and **not the seedbox address**
    * You should not make any changes to this field. Only copy the IP address.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583326262377.png"></p>

### Accounts

* You can put your tracker credentials here to search and download torrents directly from your ruTorrent interface.
* Refer to your tracker for more information.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583328153643.png"></p>

### Unpack

* Here, you can access and enable ruTorrent's unpack feature. 
* This is useful if you want to unpack torrents that are archived.
* For more information, refer to this guide: [Automatically Unpack Archived Torrents with ruTorrent](https://docs.usbx.me/books/rtorrentrutorrent/page/automatically-unpack-archived-torrents-with-rutorrent "Automatically Unpack Archived Torrents with ruTorrent")

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583390313114.png"></p>

### Ratio Groups

* Ratio groups is a feature in ruTorrent where you can trigger certain actions after reaching specified ratio, upload and/or seeding time
* This is useful if you want to stop certain torrents from using too much of your upload bandwidth or stopping public torrents after 2.0 ratio
* For more information, you can visit this guide: [Limiting Seeding Ratio in ruTorrent](https://docs.usbx.me/books/rtorrentrutorrent/page/limiting-seeding-ratio-in-rutorrent "Limiting Seeding Ratio in ruTorrent")

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583390471592.png"></p>