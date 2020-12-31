**rTorrent** is a text-based ncurses BitTorrent client written in C++, based on the libTorrent libraries for Unix, whose author's goal is "a focus on high performance and good code". It is known to be stable and can handle a large number of seeding torrents, making it a solid choice for long-term seeding.

**ruTorrent** is a popular front-end for rTorrent which is used to interact with rTorrent. It was designed to emulate the look and feel of µTorrent WebUI so its appearance is quite similar to the "parent". The name "ruTorrent" is the combination of µTorrent and rtorrent. The original version of ruTorrent was based on an older version of µTorrent Webui but has been completely rewritten as of 3.0.

For more information on rTorrent and ruTorrent, refer to the following links:

* https://github.com/rakshasa/rtorrent
* https://github.com/Novik/ruTorrent

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246602380.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246730258.png)

***

## Initial Setup

rTorrent/ruTorrent is already configured and tuned out of the box. To Install:

* Install it from our Control Panel
  * Install rTorrent first before installing ruTorrent
* For ruTorrent, add in your desired password in the textbox
* Once installed, click Connect under ruTorrent
* Enter your set credentials
    * Your username being your seedbox username and your ruTorrent password

### Accessing rTorrent CLI Interface

* Should you need to access rTorrent's CLI interface, just type in the following command in SSH:

```sh
screen -r rtorrent
```

* You'll get a similar interface as below. To exit the interface, do CTRL + A + D

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583246602380.png)

***

## Default File Paths

Default Downloads Folder: `~/files`

Default Watch Folder: `~/watch`

rTorrent's config folder: `~/.config/rtorrent`

***

## Troubleshooting Information
**Bad response from server: (0 [error,getplugins])**

This error requires your webserver to be reinstalled from your UCP. The reinstall webserver button (Orange button) can be found in your main dashboard next to your traffic quota. You can also do this on your slot’s shell by running the following commands:

```sh
app-nginx uninstall
app-nginx install
```

**No connection to rTorrent. Check if it is running. Check $ scgi_port and $ scgi_host in config.php and scgi_port in rTorrent config file.**

This error means that rTorrent is not running, and it usually needs to be restarted from your UCP or running `app-rtorrent restart` while connected to your shell.
This can happen in a few scenarios:

* Your allotted disk quota is exceeded, so your session cannot write to your directory.
  * You will need to connect to your service via Shell or FTP, remove unneeded data, and restart rTorrent.
* You have a bad torrent in your session.
  * You need to restart rTorrent, quickly connect to your ruTorrent, and stop all torrents. Then, start the torrents one by one. Usually, torrents with random letters or a `.meta` extension in the name are the bad torrents. Once you have found the files, remove it from the client, and try again.
* Your HDD’s IO is extremely saturated.
  * You will need to check this using `iostat`. Visit this guide [here](https://docs.usbx.me/link/235#bkmrk-how-to-check-the-hig) for more information.

**Error downloading files. Make sure autodl-irssi is started and configured properly (e.g., password, port number): Error getting files listing: Error: Could not connect: (111) Connection refused**

Two common reasons why you would receive the error:

* The first and most common is irssi is just not running for whatever reason, such as a hard crash or a reboot. In most cases restarting autodl-irssi will fix the issue.
* The other reason may be you have reinstalled ruTorrent. This changes the GUI password, so autodl-irssi can no longer connect to ruTorrent. In this case, you will need to back up `~/.autodl/autodl.cfg` and reinstall autodl-irssi.

**Uncaught TypeError: Cannot read property 'rTorrent' of undefined or JS errors in general;**

These errors are usually caused by security and antivirus software or browser extensions such as ad blockers preventing the scripts from ruTorrent from loading. Try disabling these and test ruTorrent in an incognito tab to start. These are almost always client-side.

Clients who use Kaspersky software are most likely to see this error.

**Why does the main IP of my seedbox and torrent clients appear different? Which IP should I report to trackers?**

Our seedbox IPs are pooled to avoid clashing on trackers with a more extensive user database to help peers and seeders. If you need to submit IP's to trackers, then you should use the IP's that are binding to the torrent clients. You can obtain them by the following methods:

```
rTorrent: cat .config/rtorrent/rtorrent.rc | grep bind
ruTorrent: Settings -> Advanced -> Bind (bottom field)
```

**Why aren’t my torrents producing any upload? They’re not seeding!**

This usually causes the following:

* After the first couple of hours, Linux distros and freeware content are generally overpopulated. For that, you may have to grab the torrent as it is posted on the website. Tracker forums usually have methods to snatch them automatically via RSS or Autodl-irssi.
* Some tracker forums block the seeding of new torrents after a particular ratio within a day. You may have to refer to your tracker’s rules for this.
* Your torrents may have some errors. Check the torrent’s status for this.
* rTorrent, by default, has a script that stops common public torrents from seeding after it has been finished downloading.

**Why is Autounpack not working? How to configure it correctly?**

A lot of plugins have compatibility issues after 0.9.6, and this is one of them, unfortunately. You will need to rollback your client to 0.9.6 for this and a few other plugins to work.

You can resolve it using the `repair` option in your UCP under the rTorrent action menu in the installed application tab. This should revert you to 0.9.6 by running `app-rtorrent install -v 0.9.6`. `app-rtorrent repair` will also work in your shell.

***

## Extra Guides
### Installing ruTorrent Plugins

ruTorrent is equipped with most of the plugins any client needs. Should there be a plugin that you need that is not installed, this section will help you learn to install those plugins. To do this, you will need to access the seedbox via SSH. For more information on that, visit this guide to learn more: [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")

#### Installation

* To install any plugin, first navigate to ruTorrent's plugin folder by doing the following command

```sh
cd ~/www/rutorrent/plugins/
```

* Then, visit [this link](https://github.com/Novik/ruTorrent/wiki/Plugins#currently-there-are-the-following-plugins "ruTorrent Plugins") to check the following plugins available.
* To install the plugin, run the following command
    * `plugin_name` is the name of the plugin you wish to install

```sh
svn checkout https://github.com/Novik/ruTorrent/trunk/plugins/plugin_name
```

#### Recommended Plugins

##### throttle

```sh
cd ~/www/rutorrent/plugins/
svn checkout https://github.com/Novik/rutorrent/trunk/plugins/throttle
```

##### ExtRatio

```sh
cd ~/www/rutorrent/plugins/
svn checkout https://github.com/Novik/rutorrent/trunk/plugins/extratio
```

##### ratiocolor

```sh
cd www/rutorrent/plugins/
svn co https://github.com/Gyran/rutorrent-ratiocolor.git/trunk ratiocolor

# To change to colored text only

sed -i "s:changeWhat = \"cell-background\";:changeWhat = \"font\";:g" ~/www/rutorrent/plugins/ratiocolor/init.js

# To change back to default

sed -i "s:changeWhat = \"font\";:changeWhat = \"cell-background\";:g" ~/www/rutorrent/plugins/ratiocolor/init.js
```

There are few plugins that cannot be installed using this such as mediashare, plowshare and others.

If you want any specific plugin to be installed which cannot be installed by this method, please contact support.

### Automatically Unpack Archives with ruTorrent

This section will teach you how to enable auto unpacking of archived files in your seeding torrents. This is useful if you want to use your seedbox to extract your archived files so you can download only the extracted files and leave the archive seeding or you need automatic unpacking for Sonarr, Radarr and Lidarr.

* Go to **Settings -> Unpack**
* Check **Enable autounpacking if torrents label matches filter**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583405851245.png)

* This will enable unpacking on all future torrents. You may also set Unpack to a directory you want within your home folder or leave it blank to extract it in-place/to your torrent's current directory
    * Leaving it blank is useful for DVR apps such as Sonarr, Radarr and Lidarr.
* If you want to enable unpacking to certain labels, add the following to the textbox beside **Enable autounpacking if torrents label matches filter**

```
/.*(label_1|label_2|label_3).*/i
```

* For example, if you want to enable auto unpacking to all torrents from Sonarr, Radarr and Lidarr

```
/.*(tv-sonarr|radarr|lidarr).*/i
```

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583406417621.png)

### Limiting Seeding Ratio with ruTorrent

This section will show you how to limit the seeding ratio in ruTorrent, so you can comply with our restrictions on public tracker seeding.

#### Ratio Groups

* Start off by opening up your settings in ruTorrent and clicking the **Ratio Groups** option.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583390471592.png)

* Fill out the top group (or any other one if you wish) with the following settings and give it a name
  * In this example, this group stops the torrent from seeding over 2 ratio.

| Min % | Max % | UL,MB | TIme,h | Action |
| :--: | :--: | :--: | :--: | :--: |
| 200 | 200 | Any Value | -1 | Stop |

  * Another here stops all torrents as soon as it finished downloading

| Min % | Max % | UL,MB | TIme,h | Action |
| :--: | :--: | :--: | :--: | :--: |
| 0 | 0 | 0 | -1 | Stop |

* You can choose any action to the torrent after it has reached that requirement.
  * We recommend **Stop** as the action. This is to stop the torrents from seeding, mark it as completed and for you to download the files to your PC
  * You can also select **Remove** to remove the torrent or **Remove data** to remove the torrent and its associated files.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/rutorrent-seed.png)

* You can also set this to be done by default to all future torrents by using the **Default ratio group** option in the bottom right of the ratio groups screen
* Select the number corresponding to the created ratio group. In this case, select 1 and click **OK**.
* Please note that setting this will restrict every torrent, private or public, in ruTorrent to a 2 ratio.

#### ExtRatio Plugin

* You can also use ExtRatio to automatically filter and set future torrents to a certain ratio group or throttle group.

##### Installation

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