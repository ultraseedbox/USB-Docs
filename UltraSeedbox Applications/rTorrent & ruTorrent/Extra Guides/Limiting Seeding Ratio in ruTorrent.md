This short guide will show you how to limit the seeding ratio in ruTorrent, so you can comply with our restrictions on public tracker seeding.

***

## Ratio Groups

* Start off by opening up your settings in ruTorrent and clicking the **Ratio Groups** option.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583390471592.png)

* Fill out the top group (or any other one if you wish) with the following settings and give it a name
  * In this example, this group stops the torrent from seeding over 2 ratio.

<table class="align-center" style="border-collapse: collapse; width: 57.4074%; height: 59px;" border="1" id="bkmrk-min-%25-max-%25-ul%2Cmb-ti">
<tbody>
<tr style="height: 29px;">
<td class="align-center" style="width: 20%; height: 29px;">Min %</td>
<td class="align-center" style="width: 20%; height: 29px;">Max %</td>
<td class="align-center" style="width: 20%; height: 29px;">UL,MB</td>
<td class="confluenceTd align-center" style="width: 20.3704%; height: 29px;">Time,h</td>
<td class="align-center" style="width: 20%; height: 29px;">Action</td>
</tr>
<tr style="height: 29px;">
<td class="align-center" style="width: 20%; height: 29px;">200</td>
<td class="align-center" style="width: 20%; height: 29px;">200</td>
<td class="align-center" style="width: 20%; height: 29px;">any value</td>
<td class="align-center" style="width: 20.3704%; height: 29px;">-1</td>
<td class="align-center" style="width: 20%; height: 29px;">Stop</td>
</tr>
</tbody>
</table>

* Another here stops all torrents as soon as it finished downloading

<table class="align-center" style="border-collapse: collapse; width: 57.4963%; height: 55px;" border="1" id="bkmrk-min-%25-max-%25-ul%2Cmb-ti-0">
<tbody>
<tr style="height: 29px;">
<td class="align-center" style="width: 20%; height: 29px;">Min %</td>
<td class="align-center" style="width: 20%; height: 29px;">Max %</td>
<td class="align-center" style="width: 20%; height: 29px;">UL,MB</td>
<td class="confluenceTd align-center" style="width: 20.3704%; height: 29px;">Time,h</td>
<td class="align-center" style="width: 20%; height: 29px;">Action</td>
</tr>
<tr>
<td style="width: 20%;">0</td>
<td style="width: 20%;">0</td>
<td style="width: 20%;">0</td>
<td style="width: 20.3704%;">-1</td>
<td style="width: 20%;">Stop</td>
</tr>
</tbody>
</table>

* You can choose any action to the torrent after it has reached that requirement.
  * We recommend **Stop** as the action. This is to stop the torrents from seeding, mark it as completed and for you to download the files to your PC
  * You can also select **Remove** to remove the torrent or **Remove data** to remove the torrent and its associated files.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/rutorrent-seed.png)

* You can also set this to be done by default to all future torrents by using the **Default ratio group** option in the bottom right of the ratio groups screen
* Select the number corresponding to the created ratio group. In this case, select 1 and click **OK**.
* Please note that setting this will restrict every torrent, private or public, in ruTorrent to a 2 ratio.

## ExtRatio Plugin

* You can also use ExtRatio to automatically filter and set future torrents to a certain ratio group or throttle group.

### Installation

* To install ExtRatio, run the following command on your SSH to install this plugin.  
  * For more information about installing plugins, refer to this guide: [Installing ruTorrent Plugins](https://docs.usbx.me/books/rtorrentrutorrent/page/installing-rutorrent-plugins "Installing ruTorrent Plugins")

```sh
cd ~/www/rutorrent/plugins/ && svn checkout https://github.com/Novik/rutorrent/trunk/plugins/extratio && svn checkout https://github.com/Novik/rutorrent/trunk/plugins/throttle && cd ~
```

* Here, we want to set all future public torrents to be set to the created ratio group earlier.
  * Click Add and set a name 
  * On the If box, select **All torrent's trackers are public** from the dropbox
  * Then on Then box, select the public group created.
    * In this case, it's named `Publics`.
  * Confirm the changes by clicking OK.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/unknown.png)

* Should there be public torrents that are not throttled, it may be due to it not being included to ruTorrent's Public Tracker list.
  * You may have to manually add the tracker URL by selecting **One of torrent tracker's URLs contains** from the dropbox then input the public tracker's hostname.
* You can also set the following in the If dropbox, according to your needs
  * Torrent label contains
  * One of torrent tracker's URLs contains
  * All torrent's trackers are public
  * One of torrent tracker's URLs contains
  * One of torrent trackers is private

![](https://docs.usbx.me/uploads/images/gallery/2020-03/unknown-(1).png)