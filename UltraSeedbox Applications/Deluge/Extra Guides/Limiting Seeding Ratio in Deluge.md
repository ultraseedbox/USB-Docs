In this guide, we'll be exploring options on how to limit your seeding torrent's ratio. One where you will apply seeding limit to all of your torrents and using one of Deluge's third party plugins called LabelPlus. With LabelPlus, you can label some torrents you chose automatically according to your set filters and more, depending on what you set each label. You can also move and throttle torrents within a label with ease.

This requires the following:

* Deluge installed on your seedbox
* Deluge Thin Client (It does not have WebUI access)
* LabelPlus egg

In this guide, we'll be briefly teach you how to set it up. For LabelPlus, we will also guide you on how to automatically label and set max seeding ratio to some torrents.

***

## Global Seeding Limit

* To apply a certain ratio limit to all of your torrents, simply to your Deluge preferences and click Queue
* Check "Stop seeding when share ratio reaches" and set the number in the box to any ratio you want.
  * In this example, we set it to 2
  * Click apply and then OK

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/deluge-seed.png">
</p>

***

## LabelPlus
### Installation

* Install Deluge Thin Client if you haven't already.
  * For more information about installing Deluge Thin Client, refer to [this link.](https://docs.usbx.me/books/deluge/page/setting-up-deluge-thin-client)
* Grab and install LabelPlus from the link provided
  * For more information on how to install Deluge Plugins, refer to [this link.](https://docs.usbx.me/books/deluge/page/installing-deluge-plugins)

```
LabelPlus: https://github.com/ratanakvlun/deluge-labelplus/releases/download/v0.3.2.2/LabelPlus-0.3.2.2-py2.7.egg
```

* Once connected, go to **Preferences -> Plugin**.
* Click **Install Plugin** and navigate to the file named *LabelPlus-0.3.2.2-py2.7.egg* and click **Open**
  * This will install the plugin on both your PC client and to the Seedbox Client.
  * After it's installed, tick **LabelPlus** and click **OK**. You may have to do that a few times to get it properly installed.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-3-23%5B1%5D.png">
</p>

* Close Preferences. On the left side, click **LabelPlus Tab**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-4-27%5B1%5D.png">
</p>

* Right click the space → **Add Label** and give it a name.
* Click **OK**. You'll see your newly created Label.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-5-11%5B1%5D.png">
</p>

* Right click that new label and select Label Options to set your preferences, as described below.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-7-0%5B1%5D.png">
</p>

### LabelPlus Label Options
#### Downloads

* Here, you can set set the download directory and to move some of your specifically labelled torrents to different locations

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-8-3%5B1%5D.png">
</p>

#### Bandwidth

* Here, you can set your labelled torrents your maximum DL, UL, connections and upload slots.
  * We do not recommend throttling upload speed on any trackers, whether is public or private. Throttling speeds will be detected by the tracker and your download speeds will also be throttled to a crawl or will be IP banned.
  * We recommend seeding them at a certain ratio instead.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-8-34%5B1%5D.png">
</p>

#### Queue

* Here, you can set to seed your set torrents at a certain ratio.
* You may also opt to remove torrents once it reaches your certain ratio.
  * Shown here, I created a label named Publics and set all my public tracker torrents to seed up to 2.0. Once that is reached, it'll be stopped by the plugin automatically.
  * USB TOS allows clients to seed public torrents up to 2.0. This is to adhere fair usage rules and to not drain your allocated bandwidth.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-21-16%5B1%5D.png">
</p>

#### Autolabel

* It can check the following data. And if it matches, it'll assign the torrent to your set Label and it'll trigger whatever you set in the first three tabs of your Label.
  * Name of the torrent
  * Tracker
  * Any files in the torrent
  * Label
* You can also specify different matching modes for each.
  * In the screenshot, I put in some of the known public tracker domains in the Label Publics.
  * When I downloaded a torrent from tracker domains containing the ones I've set, it'll automatically put to Publics label and set to stop seeding until the ratio of 2.0 as set above.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-21-56%5B1%5D.png">
</p>