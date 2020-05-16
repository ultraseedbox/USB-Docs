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
    * This sets the interval for the plugin to check Deluge's loaded torrents
    * For example, to check every 24 hours, set it to `1`. To check every 6 hours, set it to `0.25`
  * Maximum torrents
    * This sets the maximum amount of loaded torrents. Once the number of torrents exceeds the set value, it'll remove the torrents that meets the minimum criteria.
    * For example, setting this to `0` removes every torrent. Setting it to `250` removes every torrent when total loaded torrents is above 250.
  * Minimum HDD Space
    * This sets the minimum HDD space.
    * When disk space goes lower than the value set, it removes the torrents that meets the critera until it reaches the minimum HDD space value set.
    * If set to `-1`, it will disable this option.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589198169952.png"></p>

* The next section concerns the global preferences for AutoRemovePlus to your torrents.
  * For example, you can set AutoRemovePlus to delete all torrents that has at least 2.0 ratio

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589198650314.png"></p>

  * You can also set it to remove that has at least 2.0 ratio or has been seeded for 7 days

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589198800549.png"></p>

* Under exception rules, you can set Global Exceptions.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589255540103.png"></p>

* Under thr Type column, you can select if you want to filter out `Tracker` or `Label` and enter your preferred value on the next column. Shown below are some examples.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589255709936.png"></p>

* For the last three options, you can check both `Remove torrents` and `Remove torrent data`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589260561417.png"></p>

## Specific Remove Rules

* In this tab, you can fine-tune your deletion options.
* You have 5 columns: `Type`, `Name`, `Operator`, `Remove Rule` and `Minimum`. You'll set each rule separately.
* Below are some examples:

1. Delete all torrents under `radarr` label that has a 3.0 ratio and above

<table class="align-center" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 162px;">Type</td>
<td style="width: 162px;">Name</td>
<td style="width: 162px;">Operator</td>
<td style="width: 162px;">Remove Rule</td>
<td style="width: 161px;">Minimum</td>
</tr>
<tr>
<td style="width: 162px;">Label</td>
<td style="width: 162px;">radarr</td>
<td style="width: 162px;">and</td>
<td style="width: 162px;">Ratio</td>
<td style="width: 161px;">3</td>
</tr>
</tbody>
</table>

2. Delete all torrents under `rarbg.to` tracker that has been seeded for at least been seeded for 1 hour (0.0416 days)

<table class="align-center" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 162px;">Type</td>
<td style="width: 162px;">Name</td>
<td style="width: 162px;">Operator</td>
<td style="width: 162px;">Remove Rule</td>
<td style="width: 161px;">Minimum</td>
</tr>
<tr>
<td style="width: 162px;">Tracker</td>
<td style="width: 162px;">rarbg.to</td>
<td style="width: 162px;">and</td>
<td style="width: 162px;">Seed Time</td>
<td style="width: 161px;">0.0416 days</td>
</tr>
</tbody>
</table>