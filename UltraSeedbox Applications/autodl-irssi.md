## autodl-irssi

autodl-irssi is a plugin for irssi. It monitors IRC announce channels, downloads torrent files based your set filters and send it to your torrent client of choice or set it to run a custom program or a script. Included in the app is an easy-to-use interface in ruTorrent to configure your autodl-irssi instance, For more information about this app, you may visit [this link.](https://autodl-community.github.io/autodl-irssi/)

***

## Initial Setup

You’ll need to install the following via UCP:

* autodl-irssi
* ruTorrent (to access autodl-irssi configuration UI)
  * For novice users, setting autodl-irssi via ruTorrent is recommended.
  * If you’re not going to use rTorrent as your torrent client, you’re safe to just install ruTorrent.
  * You may also edit autodl's config file directly. This is located on `~/.autodl/autodl.cfg`

We'll be giving you an overview of the following:

* Setting up trackers
* Setting up tracker IRC
* Setting up your Torrent Clients
* autodl-irssi Filters Overview

This varies wildly from your tracker.

::: warning
It is vital to check with your tracker first before setting autodl-irssi. Incorrectly setting up autodl-irssi would result to undesirable consequences such as downloading unwanted releases, Hit and Run warnings and revoking certain rights on the tracker.
:::

### Setting Up Trackers

* After installation of said apps, login to ruTorrent.
* autodl will install 2 things. The first is the **autodl-irssi Tab** which is found on the bottom of the browser window.
  * This allows you to see real-time logging of the irssi daemon.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308288920.png)

* The second component is the autodl-irssi configuration interface. This makes it easy for you to set your autodl-irssi.
* Click on the autodl-irssi button.
* You'll be shown 5 options.
  * Filters
  * IRC Servers
  * Trackers
  * Preferences
  * Help

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307763428.png)

We recommend setting this up as follows:

## Trackers

* Click **Trackers**
* You'll be shown a list of the trackers supported by autodl-irssi.
* Select the tracker you wish to add. Follow the instructions that are found in each tracker.
* We recommend setting the delay to 0 unless specified by your tracker.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308056109.png)

## IRC Servers

* Once that's done, go back to autodl-irssi button and select IRC Servers
* Here, you can put the IRC server information of your tracker. Refer to your tracker for details
* Shown below is an example IRC server settings

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308435625.png)

::: info
Some IRC servers require you to register first before logging into their channels and most require you to own only 1 IRC account. If you wish to chat to their IRC channels while your autodl-irssi bot is in their announce channels, you may group your nickname.Shown here is an example command assuming you registered your nickname (we'll use usbnick as your "main nick")
`/nick usbdocs|autodl`
`/msg NickServ group usbdocs irc_nickserv_password`
`/nick usbdocs`
:::

## Filters

* Lastly, go to Filters.
* Click New
* Add a name on the Display name
* Here, you can set some basic settings such as
  * Which sites to monitor using Match sites
  * Set the minimum and maximum size of each release
  * Add a delay (specified by tracker)
  * Set the number of releases autodl grabs in Max downloads

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308952904.png)

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

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587306865292.png)

## Action

* This is where you can set what action autodl-irssi should do after it matches your release.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307124395.png)

## Advanced

* Here, you can set debugging options as well such as Output Level and Advanced Output Sites
* You may also change your download user agent here.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307209878.png)

# Updating autodl-irssi
# Backup and Restore
## Backing Up
## Restoring