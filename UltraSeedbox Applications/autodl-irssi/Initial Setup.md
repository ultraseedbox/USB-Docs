In this guide, we’ll be setting up autodl-irssi for the first time. For this, you’ll need to install the following via UCP:

* autodl-irssi
* ruTorrent (to access autodl-irssi configuration UI)
  * For novice users, setting autodl-irssi via ruTorrent is recommended.
  * If you’re not going to use rTorrent as your torrent client, you’re safe to just install ruTorrent.
  * You may also edit autodl's config file directly. It's located on `~/.autodl/autodl.cfg`

We'll be giving you an overview of the following:

* Setting up trackers
* Setting up tracker IRC
* autodl-irssi Filters Overview

This varies wildly from your tracker.

<p class="callout warning">It is vital to check with your tracker first before setting autodl-irssi. Incorrectly setting up autodl-irssi would result to undesirable consequences such as downloading unwanted releases, Hit and Run warnings and revoking certain rights on the tracker.</p>

***

# Initial Setup

* After installation of said apps, login to ruTorrent.
* autodl will install 2 things. The first is the **autodl-irssi Tab** which is found on the bottom of the browser window.
  * This allows you to see real-time logging of the irssi daemon.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308288920.png"></p>

* The second component is the autodl-irssi configuration interface. This makes it easy for you to set your autodl-irssi.
* Click on the autodl-irssi button.
* You'll be shown 5 options.
  * Filters
  * IRC Servers
  * Trackers
  * Preferences
  * Help

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307763428.png"></p>

We recommend setting this up as follows

## Trackers

* Click **Trackers**
* You'll be shown a list of the trackers supported by autodl-irssi.
* Select the tracker you wish to add. Follow the instructions that are found in each tracker.
* We recommend setting the delay to 0 unless specified by your tracker.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308056109.png"></p>

## IRC Servers

* Once that's done, go back to autodl-irssi button and select IRC Servers
* Here, you can put the IRC server information of your tracker. Refer to your tracker for details
* Shown below is an example IRC server settings

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308435625.png"></p>

<c><p class="callout info">Some IRC servers require you to register first before logging into their channels and most require you to own only 1 IRC account. If you wish to chat to their IRC channels while your autodl-irssi bot is in their announce channels, you may group your nickname.<br><br>Shown here is an example command assuming you registered your nickname (we'll use usbnick as your "main nick")<br><br>
`/nick usbdocs|autodl`<br>
`/msg NickServ group usbdocs irc_nickserv_password`<br>
`/nick usbdocs`</p></c>

## Filters

* Lastly, go to Filters.
* Click New
* Add a name on the Display name
* Here, you can set some basic settings such as
  * Which sites to monitor using Match sites
  * Set the minimum and maximum size of each release
  * Add a delay (specified by tracker)
  * Set the number of releases autodl grabs in Max downloads

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308952904.png"></p>

### Filtering Options

autodl-irssi utilizes several filtering options to use here.

1. Using TV/Movie and Music Tabs

You can use TV/Tabs and Music Tabs to filter out releases 

2. Using wildcards

Wildcards are symbols used to replace or represent one or more characters.

3. Regex

Regular expressions or regex are special strings for describing 

# Configuration Overview

Here are the settings that are relevant to you.

## General

* Here, we can set the general settings of autodl-irssi. The options that you can set here 
  * Download duplicate releases if you prefer downloading the same release over multiple trackers
  * Use regex for match/except-releases if you prefer using regex to filter out releases that you want

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587306865292.png"></p>

## Action

* This is where you can set what action autodl-irssi should do after it matches your release.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307124395.png"></p>

## Advanced

* Here, you can set debugging options as well such as Output Level and Advanced Output Sites
* You may also change your download user agent here.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307209878.png"></p>

# Updating autodl-irssi
# Backup and Restore
## Backing Up
## Restoring