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

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246602380.png)