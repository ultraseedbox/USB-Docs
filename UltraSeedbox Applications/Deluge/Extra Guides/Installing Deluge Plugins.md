This guide will teach you how to install Deluge plugins. Deluge plugins extend the functionality of what Deluge provides, giving you more ways to automate processes or simplifying tasks. Take note that you need to check what plugin you download. Specifically:

*   If the plugin is written for Deluge v.1.3.15
*   It's written using python 2.7
*   Its extension is `.egg`

Also take note if your plugin can be accessed with the thin client or the web client.

***

## Installing Plugins

* Login to your Deluge's Client
* Download the plugin that you want.
* Go to **Preferences -> Plugin**.
* Click Install Plugin and navigate to your `plugin_name.egg` and click **Open**
  * This'll install the plugin on your PC client and to the Seedbox Client.
  * After it's installed, tick the label name and click OK. You may have to do that a few times to get it properly installed.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-3-23%5B1%5D.png"></p>

***

## Useful Plugins
### Simple-Extractor

* This plugin allows you to extract torrents files in-place after it has been finished downloading
* This is useful for Sonarr/Radarr with indexers that mainly deal with archived releases

```
https://github.com/cvarta/deluge-extractor/releases/download/v.0.4.1/SimpleExtractor-0.4.1-py2.7.egg
```

### YaRSS2

* This plugin allows you to download torrents from RSS feeds of trackers
* This also allows you to filter out the releases that you want using regex
* Take note that you have to set YaRSS2's options in Deluge's Thin Client. For more information, visit this link: [Setting Up Deluge Thin Client](https://docs.usbx.me/books/deluge/page/setting-up-deluge-thin-client)

```
https://bitbucket.org/bendikro/deluge-yarss-plugin/downloads/YaRSS2-1.4.3-py2.7.egg
```

### AutoRemovePlus

* A configurable plugin that allows you to remove torrents with your preferences.
* For an in-depth guide, you may visit this [link.](https://docs.usbx.me/books/deluge/page/automatically-remove-torrents-using-autoremoveplus)

### LabelPlus

* A configurable plugin for Deluge Thin client that allows you to organize torrents by labels
* This is useful if you want to separate public torrents from your privates, with different seeding limits
* An in-depth guide is written [in this link.](https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge#bkmrk-labelplus)