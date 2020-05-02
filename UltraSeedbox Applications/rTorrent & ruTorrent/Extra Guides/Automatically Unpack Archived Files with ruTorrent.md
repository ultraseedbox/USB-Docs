This guide will teach you how to enable auto unpacking of archived files in your seeding torrents. This is useful if you want to use your seedbox to extract your archived files so you can download only the extracted files and leave the archive seeding or you need automatic unpacking for Sonarr, Radarr and Lidarr.

***

* Go to Settings -> Unpack
* Check **Enable autounpacking if torrents label matches filter**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583405851245.png"></p>

* This will enable unpacking on all future torrents. You may also set Unpack to to a directory you want within your home folder or leave it blank to extract it in-place/to your torrent's current directory
    * Leaving it blank is useful for DVR apps such as Sonarr, Radarr and Lidarr.
* If you want to enable unpacking to certain labels, add the following to the textbox beside **Enable autounpacking if torrents label matches filter**

```
/.*(label_1|label_2|label_3).*/i
```

* For example, if you want to enable auto unpacking to all torrents from Sonarr, Radarr and Lidarr

```
/.*(tv-sonarr|radarr|lidarr).*/i
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583406417621.png"></p>