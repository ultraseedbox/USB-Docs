**autodl-irssi** is a plugin for irssi. It monitors IRC announce channels, downloads torrent files based your set filters and send it to your torrent client of choice or set it to run a custom program or a script. Included in the app is an easy-to-use interface in ruTorrent to configure your autodl-irssi instance.

For more information about this app, you may visit [this link.](https://autodl-community.github.io/autodl-irssi/)

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

### Trackers

* Click **Trackers**
* You'll be shown a list of the trackers supported by autodl-irssi.
* Select the tracker you wish to add. Follow the instructions that are found in each tracker.
* We recommend setting the delay to 0 unless specified by your tracker.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308056109.png)

### IRC Servers

* Once that's done, go back to autodl-irssi button and select IRC Servers
* Here, you can put the IRC server information of your tracker. Refer to your tracker for details
* Shown below is an example IRC server settings

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308435625.png)

::: info
Some IRC servers require you to register first before logging into their channels and most require you to own only 1 IRC account. If you wish to chat to their IRC channels while your autodl-irssi bot is in their announce channels, you may group your nickname.Shown here is an example command assuming you registered your nickname (we'll use `usbnick` as your "main nick")
`/nick usbdocs|autodl`
`/msg NickServ group usbdocs irc_nickserv_password`
`/nick usbdocs`
:::

### Filters

* Lastly, go to Filters.
* Click New
* Add a name on the Display name
* Here, you can set some basic settings such as
  * Which sites to monitor using Match sites
  * Set the minimum and maximum size of each release
  * Add a delay (specified by tracker)
  * Set the number of releases autodl grabs in Max downloads

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587308952904.png)

#### Filtering Options

autodl-irssi utilizes several filtering options to use here.

1. Using TV/Movie and Music Tabs

You can use TV/Tabs and Music Tabs to filter out releases 

2. Using wildcards

Wildcards are symbols used to replace or represent one or more characters.

3. Regex

A regular expression is a sequence of characters that define a search pattern.

***

## Configuration Overview

Here are the settings that are relevant to you.

### General

* Here, we can set the general settings of autodl-irssi. The options that you can set here 
  * Download duplicate releases if you prefer downloading the same release over multiple trackers
  * Use regex for match/except-releases if you prefer using regex to filter out releases that you want

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587306865292.png)

### Action

* This is where you can set what action autodl-irssi should do after it matches your release.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307124395.png)

### Advanced

* Here, you can set debugging options as well such as Output Level and Advanced Output Sites
* You may also change your download user agent here.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587307209878.png)

***

## Updating autodl-irssi

***

## Backup and Restore

### Backing Up
### Restoring

***

## Setting Up Torrent Clients
### Deluge

This section assumes the following:

* You have a working autodl-irssi setup (filters + IRC server + Tracker passkey/RSS Key input)
* You have Deluge and ruTorrent installed
  * If you're not planning to use rTorrent as your torrent client, you can install ruTorrent without rTorrent. ruTorrent is only used to get access to autodl-irssi configuration UI.

* Login to your UCP, SSH and rutorrent Interface
* On your SSH window, execute `which deluge-console` and take note of the output

```sh
kbguides@lw902:~$ which deluge-console
/home6/kbguides/bin/deluge-console # TAKE NOTE OF THIS OUTPUT. YOU WILL NEED THIS LATER
kbguides@lw902:~$
```

* Go to your ruTorrent interface. Click the **autodl-irssi icon** then click **Preferences**
* Go to action Tab and input the following
  * Choose .torrent action = Run program
  * Command = Output of `which deluge-console`
  * Arguments = `connect 127.0.0.1:<deluge_daemon_port> <username> <password>; "add $(TorrentPathName)" ; quit` where
    * `deluge_daemon_port` = Daemon Port of deluge
    * `username` = your Deluge Username
    * `password` = Your set deluge password
    * Details are in Deluge's Remote Access details in UCP
  * Press **OK** and confirm that your configuration files are loaded by checking the output of autodl-irssi window in ruTorrent

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-3_9-21-3%5B1%5D.png)

* Go back to your SSH window. Decide where you want to save the script. Here, it is saved to a folder named `scripts` to make easy to organize. Create a folder named scripts with `mkdir scripts`

```sh
kbguides@lw902:~$ mkdir scripts
kbguides@lw902:~$
```

* Navigate to the newly created folder with `cd scripts`

```sh
kbguides@lw902:~$ cd scripts
kbguides@lw902:~/scripts$
```

* Then, download the script to your seedbox using the following command

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Deluge/deluge-reannounce.sh
```

```sh
kbguides@lw902:~/scripts$ wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Deluge/deluge-reannounce.sh
--2019-06-03 10:17:06--  https://raw.githubusercontent.com/no5tyle/UltraSeedbox-Scripts/master/Deluge/deluge-reannounce.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.0.133, 151.101.64.133, 151.101.128.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.0.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 955 [text/plain]
Saving to: ‘deluge-reannounce.sh’
 
deluge-reannounce.sh               100%[=============================================================>]     955  --.-KB/s    in 0s
 
2019-06-03 10:17:07 (17.2 MB/s) - ‘deluge-reannounce.sh’ saved [955/955]
 
kbguides@lw902:~/scripts$
```

* Open up `deluge-reannounce.sh` using your preferred text editor. In this tutorial, we'll be using nano. So do `nano deluge-reannounce.sh`

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582618070101.png)

* Then, replace the following with the information from Deluge's Remote Access Details in UCP.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-5-15_5-5-37%5B1%5D.png)

* Find this exact line in the config and change the values accordingly

```sh
#!/bin/bash

# This script required the update-tracker.py from https://raw.githubusercontent.com/s0undt3ch/Deluge/master/deluge/ui/console/commands/update-tracker.py

# Change the below output location to any folder owned by your user for which you have write permissions
OUTPUT="/homeXX/user/scripts"

torrentid=$1
torrentname=$2
torrentpath=$3

# Update the ip, port, username and pass below according to your configuration
ip=xyz.xyz.xyz.xyz
port=zzzzz
username=yyyyyyy
password=xxxxxxx
```
* After you edit the necessary information, save it with **CTRL + O** then exit nano with **CTRL + X**

* Then, make the script executable by doing `chmod +x deluge-reannounce.sh`

```sh
kbguides@lw902:~/scripts$ nano deluge-reannounce.sh
kbguides@lw902:~/scripts$ chmod +x deluge-reannounce.sh
kbguides@lw902:~/scripts$
```

* Then, get the absolute path of the script by executing `readlink -f deluge-reannounce.sh` and take note of the output. This is the absolute of your script.

```sh
kbguides@lw902:~/scripts$ readlink -f deluge-reannounce.sh
/home6/kbguides/scripts/deluge-reannounce.sh #TAKE NOTE AND COPY THIS LINE. YOU WILL NEED THIS LATER.
kbguides@lw902:~/scripts$
```

* Login to Deluge's WebUI via UCP or Deluge's Thin Client
* Click **Preferences** → **Plugins** → **Check Execute Plugin**

![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-3_8-45-36%5B1%5D.png)
![](https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-3_8-43-42%5B1%5D.png)

* Click the **Execute Category** and Press **Add**
* Input the following
  * Event = Torrent Added
  * Command = The absolute path of the reannounce script
* After that, click **add**. Then Press **OK**.
* Close Deluge then restart your deluge instance via UCP or SSH (`app-deluge restart`)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589891033979.png)

***

## Troubleshooting Information

**Why is autodl-irssi not working?**

Check your autodl-irssi tab in ruTorrent and your ruTorrent logs. Below are the following common errors with autodl-irssi.

**Error downloading files. Make sure autodl-irssi is started and configured properly (e.g., password, port number): Error getting files listing: Error: Could not connect: (111) Connection refused**

Two common reasons why you would receive the error stated.

* The first and most common is irssi is just not running for whatever reason, such as a hard crash or a reboot. In most cases restarting autodl-irssi will fix the issue.
* The other reason may be you have reinstalled ruTorrent. This changes the GUI password, so autodl-irssi can no longer connect to ruTorrent. In this case, you will need to back up `~/.autodl/autodl.cfg` and reinstall autodl-irssi.