**Plex Media Server** is a proprietary media player suite that organizes video, audio, and photos from a user's collections and from online services, enabling the user to access and stream the content from the server from any device.

You can learn more about the app in [this link.](https://www.plex.tv/)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1588442792496.png)

***

## Initial Setup

In this section, we will be detailing the initial configuration of your Plex Media Server. This assumes that You have stored your media in `~/media`

### Prerequisites

* A Plex account - you can make one at https://plex.tv
* A Plex supported UltraSeedbox plan
* Plex Pass - This is optional but is required if you want to take advantage of GPU acceleration for Pro NVMe Streaming Plans.

### Initial UCP Configuration

Like all applications Plex Media Server is installed from the UltraSeedbox Control Panel, this application however has one extra step. When you click on Install and are prompted with this screen you will need to visit [https://www.plex.tv/claim/](https://www.plex.tv/claim/)

![](https://docs.usbx.me/uploads/images/gallery/2019-10/Claim-Code.PNG)

If you have not done so already, sign into your Plex account and copy the claim code provided. Paste this into the prompt and then click Install.

Your Plex Media Server is also configured out of the box. Just connect to your Plex Media Server instance by following the link in the UCP - as is normal with all your other applications.

***

## Troubleshooting Information

**How do I update Plex?**

Our Upgrade/Repair Plex image is locked to a version/image we deemed as stable. This is due to some clients reporting issues on the newest Plex releases.

To upgrade to the latest Plex, you can do this via [SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh). You may refer [here](https://docs.usbx.me/books/plex-media-server/page/updating-plex-media-server-via-ssh) to how to upgrade your Plex to the newest version.

**My Plex is down. What are some Troubleshooting Steps to resolve it?**

Usual causes of this are Plex updates, or the server cannot read or write to the library, which is a common occurrence with rclone mounts. In these cases, the RAM usage of Plex would go up, and the system will kill your Plex instance.

It's also worth mentioning that some of Plex’s features, especially logins, Server Claiming API, and Web apps, are hosted by Plex. Please check here for any announcements on their system: [https://status.plex.tv](https://status.plex.tv). 

* First, try to restart Plex and see if it returns after 5 minutes.
* Check if the container is not damaged. Try to use the upgrade/repair option from your UCP action menu under Installed Applications -> Plex and wait for 5 minutes.
* Try to claim your server again, as your server token is expired. Visit https://plex.tv/claim to get your claim code. Then, use the Claim option from your UCP action menu under Installed Applications -> Plex. Paste your code and click claim.
* If it’s still not running, log in to your slot’s SSH and run the following command:

```sh
ps aux | grep [p]lex
```

* If it returns any sort of "D" state or `<defunct>`, something is holding the Plex process.
  * If Plex is Defunct, this is usually caused by a broken rclone mount. To fix that, you may visit this guide [here](https://docs.usbx.me/link/237#bkmrk-ls%3A-cannot-access-%27s) and restart Plex after. After restarting the mounts and Plex, run `ps aux | grep [p]lex`, and if it returns nothing, your Plex is running normally. If not, repeat the guide.
  * If it is still D state, then another 3rd party app is holding the process. Stop any application that is affiliated with your instance of Plex.
  * If `grep` returns normally, is not in a defunct state, but you cannot access Plex, your Plex database may be corrupted, and you may need to view the logs. You can either run the following command on SSH and look for any errors. You can also download your logs via https://app.plex.tv in your Plex settings.

```sh
cat .config/plex/Library/Application\ Support/Plex\ Media\ Server/Logs/Plex\ Media\ Server.log
```

  * Any SLOW QUERY and SQLite errors/warnings are signs of a corrupted database. You may attempt to repair your database, as stated by the guide [here.](https://docs.usbx.me/books/plex-media-server/page/repairing-plex-database)
  * If it doesn’t work, the last resort is to back up your old configuration to confirm that your database is corrupted and see if Plex comes online with a new configuration. Execute the following commands:

```sh
mv ~/.config/plex ~/.config/plex.bak
```

  * Then afterward, reinstall Plex. If it runs, you may need to do a fresh install of Plex.

**Why is Plex producing a transcoder error?**

The Plex Transcoder exited error is a general error for not playing back the media using the video player or transcoder, and you may need to view the logs. You can either run the following command on SSH and look for any errors. You can also download your logs via https://app.plex.tv in your Plex settings.

```sh
cat .config/plex/Library/Application\ Support/Plex\ Media\ Server/Logs/Plex\ Media\ Server.log
```

The most common bug was found recently is that we overlooked that the installer did not mount `/transcode` with `.config/plex/transcode` correctly, which results in the following error in your log:

`ERROR - Error creating directory "/transcode": Permission denied`

This can be resolved by running the following command:

```sh
app-plex upgrade
```

**ERROR - ERROR - An error occurred reading the file: /homeXX/username/SOMEMOUNT/path/to/File.mp4 (5).**

Something is wrong with your mount, and this will need to be troubleshot separately. In this case, it is usually `Error 403: Rate Limit Exceeded`, `rateLimitExceeded`, or a wholly dropped mount endpoint.

Any sort of SQLite/Database errors here will be a problem and could indicate your Plex database is corrupt or in the process of doing so. You may attempt to repair your database, as stated by the guide [here.](https://docs.usbx.me/books/plex-media-server/page/repairing-plex-database)

***

## Extra Guides
### Upgrading Plex Media Server

When you install or update Plex from the UCP or via SSH using `app-plex upgrade`, it'll update to the latest build that we've verified as stable. USB recommends to use the verified PMS build for the best experience. If you want to switch to another build, you may do so via the seedbox's SSH terminal. The following commands are listed below.

::: info
Take note that everytime you run the command, it will overwrite whatever Plex Media Server you're running. Your media and configuration is not affected.
:::

#### Latest PMS Stable Build

```sh
app-plex upgrade --plex-version=public
```

* This defaults to the latest public stable build

#### Latest PMS Plex Pass Build

```sh
app-plex upgrade --plex-version=latest
```

* Running this command allows you to update to the latest Plex beta build
* This requires your account to have a Plex Pass subscription.
  * If you do not have Plex Pass and you run this command, it'll update to the public stable build instead.

#### Upgrading/Downgrading Plex by Specific Version

```sh
app-plex upgrade --plex-version=<version number>
```

* This allows you to specify any version of Plex from v1.15 onward.
* Take note that you have to put in the **full version number** of the build you want to install or the command will fail.
  * You can refer to [Plex's Official Docker Hub Page](https://hub.docker.com/r/plexinc/pms-docker/tags) or [LinuxServer.io's Plex Docker Hub Page](https://hub.docker.com/r/linuxserver/plex/tags) for the version number you want.
* For instance, if you want to install version 1.20.3.3483. After checking for the full version on the Docker Hub page, you will run the following

![](https://docs.usbx.me/uploads/images/gallery/2020-10/image-1603560343971.png)

```sh
app-plex upgrade --plex-version=1.20.3.3483-211702a9f
```

### Repairing Plex Database

*Written by [fringillidaes](https://github.com/fringillidaes)*

This section guides you in recovering your plex database. You may get this error if your library fails to scan or maybe your plex logs contain the following lines, `Jun 11, 2020 03:57:22.781 [0x7f59bce20b80] ERROR - Database corruption:`. 

#### Prerequisites

To repair your database you will also need `sqlite3`. To install sqlite3:

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Language%20Installers/sqlite-installer.sh && bash sqlite-installer.sh
```

#### Download and run repair script

To repair your database automatically, run the following command on your slot.

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/plex-database-repair.sh && bash plex-database-repair.sh
```

### Plex Plug-in Installers

Listed below are scripts that installs some of the popular Plex Plugins into your PMS instance. To use it, just run the commands of the plug-ins that you need on your seedbox's SSH terminal and access your Plex afterward. Some post-installation notes are detailed on each plug-in.

#### Absolute Series Scanner/Hama Bundle

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/hama-ass.sh | bash
```

##### Post Installation

* More info here: [https://github.com/ZeroQI/Hama.bundle](https://github.com/ZeroQI/Hama.bundle)

#### Sub-Zero

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/subzero.sh | bash
```

##### Post Installation

* Access its settings via Plugins and access the Sub-Zero interface via Kitana
* More info here: [https://github.com/pannal/Sub-Zero.bundle](https://github.com/pannal/Sub-Zero.bundle)

#### Webtools

```
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/webtools.sh | bash
```

##### Post Installation

* After running the script do the following:
  * Connect to your Plex server
  * On Plugins section of your Plex server Settings, configure Webtools plugin (click the Gear icon) and do the following
    * Uncheck SSL
    * Set HTTP port to **33433**
    * Save settings
      * If plugin timeouts on Save just proceed to next step
  * Restart Plex from UCP or from SSH with `app-plex restart`
  * Then access the Webtools interface by accessing the Direct URL under Plex in UCP **- 2 on the port**
    * For example, if your plex runs on this port 12625, Webtools web interface will be available on 12623
* More info here: [https://github.com/ukdtom/WebTools.bundle](https://github.com/ukdtom/WebTools.bundle)

#### Extended Personal Media Shows

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/epms.sh | bash
```

##### Post Installation

* More info here: [https://bitbucket.org/mjarends/extendedpersonalmedia-agent.bundle/src/master/README.md](https://bitbucket.org/mjarends/extendedpersonalmedia-agent.bundle/src/master/README.md)

#### Trakt.tv Scrobbler

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/trakt.sh | bash
```

##### Post Installation

* More info here: [https://github.com/trakt/Plex-Trakt-Scrobbler](https://github.com/trakt/Plex-Trakt-Scrobbler)

### Adding Custom Posters

*Written by [debian-d](https://github.com/debian-d)*

This section will show you how to change a movie poster on Plex.

The poster website of choice for this guide will be [ThePosterD](https://theposterdb.com/) but you can use any poster website for this.

This can be done in order to be able to change the poster to reflect a different style, for either a collection or personal choice, or can be done in order to put a poster on one that IMDb does not have.

For example, the movie I will be changing is Star Wars (1977) and changing it to this poster: https://theposterdb.com/poster/39586

* Navigate to your Plex server library, which can be found at the top of the respective category of media under "Library"

![](https://docs.usbx.me/uploads/images/gallery/2020-06/1OgW3Gq[1].png)

![](https://docs.usbx.me/uploads/images/gallery/2020-06/0LwpOaD[1].png)

* Find the piece of media you would like to change or insert the poster for, you will want to hover over it with your mouse and at the bottom right you will see a little pencil icon.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/BAqc10V[1].png)

* You will then click the `Poster` tab, then you can either click and drag the poster in off your desktop, use a URL, or choose an image from your respective file explorer.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/7iBwDDm[1].png)

* You will then wait for it to upload, and then click save changes, it should automatically place the poster on it, but if it does not you will have to scroll down and find the poster if there are multiple.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/IMoO7Ci[1].png)

* You can now see the finished product!

![](https://docs.usbx.me/uploads/images/gallery/2020-06/zD8Hevj[1].png)