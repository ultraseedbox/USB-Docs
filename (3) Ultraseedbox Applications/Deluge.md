**Deluge** is a full-featured BitTorrent application written in Python 2. It has a variety of features, including but not limited to:

* Client/server model
* DHT support
* Magnet link support
* Plugin system
* UPnP support
* Full-stream encryption
* Proxy support

When the server daemon is running, users can connect to it via a console client, a GTK-based GUI, or a Web-based UI. A full list of features can be viewed [here.](https://dev.deluge-torrent.org/wiki/About)

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568366621954.png)

***

## Initial Setup

Deluge is already configured and tuned out of the box. Once logged in for the first time, there will be a textbox asking you if you want to change the default password, which is the one you set in UCP. Click **No**.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573813864485.png)

Then, the Connection Manager settings will appear. Just click the host in the box and click **Connect**. After that, ou are now logged into Deluge’s Web UI.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573813975710.png)

::: info
We recommend your Deluge password consists of LETTERS and NUMBERS only. This is particularly useful when you're using deluge-console injection for autodl-irssi.
:::

***

## Default File Paths

Default Downloads Folder: `~/Downloads`

Deluge's config folder: `~/.config/deluge`

***

## Troubleshooting Information

**Why does Deluge keep crashing?**

This is a typical characteristic of Deluge. It usually happens when downloading, where the client will prioritize torrent traffic over the WebUI. Deluge is aggressive and caches the information into the RAM. In turn, the Deluge WebUI loses connection, and the Daemon would appear offline.

It will come back/stabilize some minutes after the download is completed, and no action needs to be taken at that time.

If it's not coming back, a misconfigured plugin may be interfering with Deluge. The usual case with this is ltconfig with high-performance seed preset engaged. This preset most likely crashes Deluge. We recommend using our default tunings first, as it is tuned specifically for our slots.

**Why aren’t my torrents producing any upload? They’re not seeding!**

This usually causes the following:

* After the first couple of hours, Linux distros and freeware content are generally overpopulated. For that, you may have to grab the torrent as it is posted on the website. Tracker forums usually have methods to snatch them automatically via RSS or Autodl-irssi.
* Some tracker forums block the seeding of new torrents after a particular ratio within a day. You may have to refer to your tracker’s rules for this.
* You may have some plugin that blocks your torrents from uploading.
* Your torrents may have some errors. Check the torrent’s status for this.

**Why does the main IP of my slot and torrent clients appear different? Which IP should I report to trackers?**

Our seedbox IPs are pooled to avoid clashing on trackers with a more extensive user database to help peers and seeders.

If you need to submit Deluge’s IP to your trackers, then you should use the IP's that are binding to the torrent clients. You can obtain them by logging into Deluge and go to **Settings -> Network -> Interface**. Copy the IP from that field.

***

## Extra Guides
### Setting Up Deluge Thin Client

Deluge's Thin Client is a great way to manage your Deluge instance from your PC. It also gives you more customization to your Deluge instance and some plug-ins, such as LabelPlus, do require that you need to have the thin client installed for you to access its settings.

This section shows you how to install, configure and to connect your Deluge client to your slot's instance.

#### Installation

* Download and install Deluge from the links below

```
Deluge Client 1.3.15
    Windows - https://ftp.osuosl.org/pub/deluge/windows/deluge-1.3.15-win32-py2.7.exe
    MacOS - http://download.deluge-torrent.org/mac_osx/deluge-1.3.15.1-macosx-x64.dmg
    Linux - Refer to your distribution
```

#### Setting up Deluge Client

* Open up Deluge Client on your PC
  * Click **Preferences -> Interface** and Uncheck Classic Mode
  * Confirm to restart Deluge

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-8-58%5B1%5D.png)

* Once Rebooted, a window named Connection Manager appears. Click **Add**.
* Go back to your UCP, under Applications Tab find remote client access under Deluge and input the values accordingly.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-12-28%5B1%5D.png)

* Once that's done, click add and wait for the Green circle to pop up.
* Once that's popped up, highlight your new details and click **Connect**.

### How to Reset a Forgotten Password for Deluge's Web UI

This section will show you how to reset your Deluge's Web UI password.

::: info
Should you need to change your Deluge's *daemon password*, you may need to reinstall your Deluge instance with your preferred password.
:::

* Open your USB Control Panel and click on the "Access Details" (1) tab. You will find your SSH Access (2) details on this page.
  * If you are unsure of your username & password, see Box (A)

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-13_22-37-47%5B1%5D.png)

* Connect to your seedbox's SSH
  * For more information, visit [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH") to learn more.
* Once connected type the following command: `app-deluge stop`

![](https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_22h57_19%5B1%5D.png)

* Now on the empty line type the following command and press **Enter**

`sed -i.bak "/pwd_sha1/d" ~/.config/deluge/web.conf`

* Now on the next empty line type the following command and press **Enter**

`sed -i.bak "/pwd_salt/d" ~/.config/deluge/web.conf`

![](https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_23h03_23%5B1%5D.png)

* Now start your deluge instance by running `app-deluge start` 
* Once started, enter `deluge` as your password.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_23h06_06%5B1%5D.png)

### Installing Deluge Plugins

This section will teach you how to install Deluge plugins. Deluge plugins extend the functionality of what Deluge provides, giving you more ways to automate processes or simplifying tasks. Take note that you need to check what plugin you download. Specifically:

*   If the plugin is written for Deluge v.1.3.15
*   It's written using python 2.7
*   Its extension is `.egg`

Also take note if your plugin can be accessed with the thin client or the web client.

#### Installing Plugins

* Login to your Deluge's Client
* Download the plugin that you want.
* Go to **Preferences -> Plugin**.
* Click Install Plugin and navigate to your `plugin_name.egg` and click **Open**
  * This'll install the plugin on your PC client and to the Seedbox Client.
  * After it's installed, tick the label name and click OK. You may have to do that a few times to get it properly installed.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-3-23%5B1%5D.png)

### Useful Plugins
#### Simple-Extractor

* This plugin allows you to extract torrents files in-place after it has been finished downloading
* This is useful for Sonarr/Radarr with indexers that mainly deal with archived releases

```
https://github.com/cvarta/deluge-extractor/releases/download/v.0.4.1/SimpleExtractor-0.4.1-py2.7.egg
```

#### YaRSS2

* This plugin allows you to download torrents from RSS feeds of trackers
* This also allows you to filter out the releases that you want using regex
* Take note that you have to set YaRSS2's options in Deluge's Thin Client. For more information, visit this link: [Setting Up Deluge Thin Client](https://docs.usbx.me/books/deluge/page/setting-up-deluge-thin-client)

```
https://bitbucket.org/bendikro/deluge-yarss-plugin/downloads/YaRSS2-1.4.3-py2.7.egg
```
### Automatically Remove Torrents Using AutoRemovePlus

In this section, we'll be guiding you on how to install and configure the plugin AutoRemovePlus. This plugin automatically removes torrents based on your specified configurations. It has the following features:

* Choose to remove or pause torrents based on multiple criteria age, seeders, seed time or ratio
* Set specific removal rules depending on tracker or label
* Only remove torrents if under a certain HDD space threshold
* Select if torrents have to fulfill both or either criteria. Delete torrents in order (e.g. delete torrents with the highest ratio first)
* Don't remove torrents if they don't reach a minimum time (in days) or ratio.
* Right-click and select torrents that you don't want automatically removed.
* Remove torrent data option.

#### Installation

* To install, download the plugin from the link below and install the plugin in your Deluge
  * For more information on how to install Deluge plugins, visit this guide [here](https://docs.usbx.me/books/deluge/page/installing-deluge-plugins) for more information

```
https://forum.deluge-torrent.org/download/file.php?id=6306&sid=470233ee354e7045f7efe8a336301dea
```

#### Setting up AutoRemovePlus

* Once installed, go to AutoRemovePlus. You'll see 2 tabs, which are described below

##### General

* Here, you can set your general settings of the plugin. This applies to all of the torrents, current and future torrents. The relevant settings are as follows:
  * Enable
    * Enables the plugin
  * Check Every
    * This sets the interval for the plugin to check Deluge's loaded torrents
    * For example, to check every 24 hours, set it to `1`. To check every 6 hours, set it to `0.25`
  * Maximum torrents
    * This sets the maximum amount of loaded torrents. Once the number of torrents exceeds the set value, it'll remove the torrents that meets the minimum criteria.
    * For example, setting this to `0` removes every torrent. Setting it to `250` removes every torrent when the total loaded torrents is above 250.
  * Minimum HDD Space
    * This sets the minimum HDD space.
    * When disk space goes lower than the value set, it removes the torrents that meets the criteria until it reaches the minimum HDD space value set.
    * If set to `-1`, it will disable this option.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589198169952.png)

* The next section concerns the global preferences for AutoRemovePlus to your torrents.
  * For example, you can set AutoRemovePlus to delete all torrents that has at least a 2.0 ratio

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589198650314.png)

  * You can also set it to remove that has at least 2.0 ratio or has been seeded for 7 days

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589198800549.png)

* Under exception rules, you can set Global Exceptions.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589255540103.png)

* Under the Type column, you can select if you want to filter out `Tracker` or `Label` and enter your preferred value on the next column. Shown below are some examples.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589255709936.png)

* For the last three options, you can check both `Remove torrents` and `Remove torrent data`

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589260561417.png)

##### Specific Remove Rules

* In this tab, you can fine-tune your deletion options.
* You have 5 columns: `Type`, `Name`, `Operator`, `Remove Rule` and `Minimum`. You'll set each rule separately.
* Below are some examples:

1. Delete all torrents under the `radarr` label that has a 3.0 ratio and above

| Type | Name | Operator | Remove Rule | Minimum |
| :---: | :---: | :---: | :---: | :---: |
| Label | radarr | and | Ratio | 3 |

2. Delete all torrents under the `rarbg.to` tracker that has been seeded for at least been seeded for 1 hour (0.0416 days)

| Type | Name | Operator | Remove Rule | Minimum |
| :---: | :---: | :---: | :---: | :---: |
| Tracker | rarbg.to | and | Seed Time | 0.0416 days |

### Limit Seeding in Deluge

In this section, we'll be exploring options on how to limit your seeding torrent ratio. One where you will apply a seeding limit to all of your torrents and using one of Deluge's third-party plugins called `LabelPlus`. With `LabelPlus`, you can label some torrents you chose automatically according to your set filters and more, depending on what you set each label. You can also move and throttle torrents within a label with ease.

This requires the following:

* Deluge installed on your seedbox
* Deluge Thin Client (It does not have WebUI access)
* `LabelPlus` egg

We'll be briefly teach you how to set it up. For `LabelPlus`, we will also guide you on how to automatically label and set max seeding ratio to some torrents.

#### Global Seeding Limit

* To apply a certain ratio limit to all of your torrents, simply to your Deluge preferences and click Queue
* Check "Stop seeding when share ratio reaches" and set the number in the box to any ratio you want.
  * In this example, we set it to 2
  * Click **Apply** and then OK

![](https://docs.usbx.me/uploads/images/gallery/2020-03/deluge-seed.png)

#### LabelPlus
##### Installation

* Install Deluge Thin Client if you haven't already.
  * For more information about installing Deluge Thin Client, refer to [this link.](https://docs.usbx.me/books/deluge/page/setting-up-deluge-thin-client)
* Grab and install `LabelPlus` from the link provided
  * For more information on how to install Deluge Plugins, refer to [this link.](https://docs.usbx.me/books/deluge/page/installing-deluge-plugins)

```
LabelPlus: https://github.com/ratanakvlun/deluge-labelplus/releases/download/v0.3.2.2/LabelPlus-0.3.2.2-py2.7.egg
```

* Once connected, go to **Preferences -> Plugin**.
* Click **Install Plugin** and navigate to the file named *LabelPlus-0.3.2.2-py2.7.egg* and click **Open**
  * This will install the plugin on both your PC client and to the Seedbox Client.
  * After it's installed, tick **LabelPlus** and click **OK**. You may have to do that a few times to get it properly installed.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-3-23%5B1%5D.png)

* Close Preferences. On the left side, click **LabelPlus Tab**.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-4-27%5B1%5D.png)

* Right-click space → **Add Label** and give it a name.
* Click **OK**. You'll see your newly created Label.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-5-11%5B1%5D.png)

* Right-click that new label and select Label Options to set your preferences, as described below.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-7-0%5B1%5D.png)

##### LabelPlus Label Options
###### Downloads

* Here, you can set the download directory and to move some of your specifically labeled torrents to different locations

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-8-3%5B1%5D.png)

###### Bandwidth

* Here, you can set your labeled torrents your maximum DL, UL, connections and upload slots.
  * We do not recommend throttling upload speed on any trackers, whether is public or private. Throttling speeds will be detected by the tracker and your download speeds will also be throttled to a crawl or will be IP banned.
  * We recommend seeding them at a certain ratio instead.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-8-34%5B1%5D.png)

###### Queue

* Here, you can set to seed your set torrents at a certain ratio.
* You may also opt to remove torrents once it reaches your certain ratio.
  * Shown here, I created a label named Publics and set all my public tracker torrents to seed up to 2.0. Once that is reached, it'll be stopped by the plugin automatically.
  * USB TOS allows clients to seed public torrents up to 2.0. This is to adhere fair usage rules and to not drain your allocated bandwidth.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-21-16%5B1%5D.png)

###### Autolabel

* It can check the following data. And if it matches, it'll assign the torrent to your set Label and it'll trigger whatever you set in the first three tabs of your Label.
  * Name of the torrent
  * Tracker
  * Any files in the torrent
  * Label
* You can also specify different matching modes for each.
  * In the screenshot, I put in some of the known public tracker domains in the Label Publics.
  * When I downloaded a torrent from tracker domains containing the ones I've set, it'll automatically put to Publics label and set to stop seeding until the ratio of 2.0 as set above.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-21-56%5B1%5D.png)