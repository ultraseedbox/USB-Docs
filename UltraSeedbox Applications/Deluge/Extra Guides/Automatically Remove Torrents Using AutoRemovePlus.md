In this guide, we'll be guiding you on how to install and configure the plugin AutoRemovePlus. This plugin automatically removes torrents based on your specified configurations. It has the following features:

* Choose to remove or pause torrents based on multiple criteria age, seeders, seed time or ratio
* Set specific removal rules depending on tracker or label
* Only remove torrents if under a certain HDD space threshold
* Select if torrents have to fulfill both or either criteria.
Delete torrents in order (e.g. delete torrents with highest ratio first)
* Don't remove torrents if they don't reach a minimum time (in days) or ratio.
* Right click and select torrents that you don't want automatically removed.
* Remove torrent data option.

***

# Installation

* To install, download the plugin from the link below and install the plugin in your Deluge
  * For more information on how to install Deluge plugins, visit this guide [here](https://docs.usbx.me/books/deluge/page/installing-deluge-plugins) for more information

```
https://forum.deluge-torrent.org/download/file.php?id=6306&sid=470233ee354e7045f7efe8a336301dea
```

# Setting up AutoRemovePlus

* Once installed, go to AutoRemovePlus. You'll see 2 tabs, which are described below

## General

* Here, you can set your general settings of the plugin. This applies to all of the torrents, current and future torrents. The relevant settings are as follows:
  * Enable
    * Enables the plugin
  * Check Every
    * This 
  * Maximum torrents
    * This sets the maximum amount of loaded torrents. Once the number of torrents exceeds the set value, it'll remove the torrents that meets the minimum criteria.
    * For example, setting this to `0` removes every torrent. Setting it to `250` removes every torrent when total loaded torrents is above 250.
  * Minimum HDD Space
    * This sets the minimum HDD space.
    * When disk space goes lower than the value set, it removes the torrents that meets the critera until it reaches the minimum HDD space value set.
    * If set to -1, it will disable this option.
  * 