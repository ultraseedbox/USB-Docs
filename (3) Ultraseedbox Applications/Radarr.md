**Radarr** is an automatic movie downloader and organizer forked from Sonarr. This application can do the following:

* Downloads movies from NZB and Torrent sources
* Automatic sorting and renaming of downloaded movies
* Can monitor multiple RSS feeds
* Can also be configured to automatically upgrade the quality of your files
* Fully configurable episode renaming
* Full integration with SABnzbd and NZBGet
* Full integration with Kodi, Plex (notification, library update, metadata)
* Automatic failed download handling will try another release if one fails
* Manual search so you can pick any release or to see why a release was not downloaded automatically
* Beautiful UI

For more information of this app, you may visit [this link.](https://radarr.video/) 

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568366984299.png)

***

## Initial Setup

In this section, we'll be setting up Radarr. This guide assumes that this is your first time installing Radarr and you'll be storing your media locally, saving it to `~/media`. We'll be doing the following:

1. Enabling Automatic Organization
1. Adding indexers
2. Connecting your download clients
3. Adding your first movie

### Enabling Automatic Organization

* Access and login to your Radarr instance using the credentials you set during installation
* Go to **Settings**

![](https://i.imgur.com/pFvQfOL.png)

* Make sure that advanced settings is set to **Shown**

![](https://i.imgur.com/voOT1sb.png)

* In Media Management settings, toggle Rename movies to **Yes**.
  * You can leave the rest of the options as-is. The defaults work well with Plex's naming scheme.

![](https://i.imgur.com/Cz0n84d.png)

* Make sure that **Use hardlinks instead of copy** is set to **yes**.
  * Hardlinks effectively creates a file that points directly to your source file in the disk. You can do anything to this file without affecting your source file and vice versa. This is useful when you're seeding from torrents.
    * This is to prevent to have 2 copies of the same movie without affecting your files.
      * If your root folder is located on a mount (eg using a rclone mount), you should set this to **No**.
        * Hardlinks does not work on mounts. Radarr will resort to copying, which is prone to errors.
        * For this, consider using [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup)

![](https://i.imgur.com/sArtsO5.png)

* After changing, save it by clicking **Save** in the top left-hand corner

![](https://i.imgur.com/dsnd5g7.png)

### Adding Indexers

* Go to Indexers

![](https://i.imgur.com/yHjc7BU.png)

* Click the Plus button

![](https://i.imgur.com/AKIQ5Fr.png)

* Then select the indexers you want to add for your Radarr instance and input what is asked on each indexer you wish
  * Depending on the indexer, it'll ask for your account credentials or a passkey. Refer to your indexer/tracker for more information on what to put.

![](https://i.imgur.com/rkVsTCX.png)

* Once that’s done, click **Save**.

### Adding Download Clients

* Now, click the Download client on the left hand side.

![](https://i.imgur.com/WL2Iunf.png)

* To add your preferred client, click the big + button then select your preferred client.

- Be Sure to enable "Show Advanced settings" Using the Cog Icon in the top left hand side to show URL Base Field

#### Torrent Clients

##### Deluge

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Base: /deluge
Password: As configured in UCP under Deluge
Category: tv-sonarr
Add Paused: NO
Use SSL: YES
```

##### rTorrent

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Path: /RPC2
Username: {username}
Password: As configured in UCP under ruTorrent
Category: tv-sonarr
Add Stopped: NO
Use SSL: YES
```

##### Transmission

```
Host: {username}.{servername}.usbx.me
Port: 443
Username: {username}
Password: As configured in UCP under Transmission
Category: tv-sonarr
Add Stopped: NO
Use SSL: YES
```

#### Usenet Clients
##### SABnzbd

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Path: /sabnzbd
API Key: As obtained from SABnzbd
Username: {username}
Password: Configured during SABnzbd setup
Category: tv
Use SSL: YES
```

##### Nzbget

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Path: /nzbget
Username: {nzbget username}
Password: {nzbget password}
Category: tv
Add Paused: NO
Use SSL: YES
```

***

## Adding Your First Movie

* Now we'll be adding your first movie. Click Movies then Add New Movie.

![](https://i.imgur.com/Y1Lo2bO.png)

* Then type any movie you want to download.
* Once you've found the movie you want, we will set some options. First, click the dropdown box on the Root folder and click add a different path

![](https://i.imgur.com/AYy8MGb.png)

* The file browser popup will appear.

* Select `homexx` folder where `homexx` contains the node where your seedbox is in.
  * In the screenshot, the node where the seedbox is in `home1`

![](https://i.imgur.com/S40VJqx.png)

* Once opened, select your seedbox (indicated by your seedbox username)

![](https://i.imgur.com/hZN1gcR.png)

* Then select the media folder and select Movies. Click OK after.
    * This folder is generated upon receiving your seedbox. This is where you'll be saving your media.

![](https://i.imgur.com/XsUZpT6.png)

![](https://i.imgur.com/99tWKnb.png)

* Once that's done. Click OK select the path.

![](https://i.imgur.com/6zqGfTN.png)

* After selecting the path, you may set the other preferences accordingly
  * Monitor
    * Choose yes if you want Radarr to monitor your indexers for better releases and upgrade them accordingly
  * Min. Availability
    * This sets when Radarr will search your indexers for movies.
    * The general tip here is that if you're in great trackers, you can opt to choose Announced. If you're not sure, choose Physical/Web
  * Profile
    * This sets what quality/resolution Radarr will grab.

![](https://i.imgur.com/c9idPSg.png)

* After that is set, you can choose either the green Add Movie button to add your movie without searching or the checkbox then green button  to start searching your indexers for the movie.

***

## Troubleshooting Information

**Why is Radarr down with application error 502? It won't come back!**

If Radarr is reporting 502 and you have followed all the instructions on the error page (restarting, then upgrading if that fails), then something else is going on. All troubleshooting from here requires you to access your [SSH terminal](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh).

* If you use mergerfs in conjunction with Radarr, first ensure your mono instance is not defunct with `ps aux | grep defunct`. If it's defunct, killing your mounts will release the process, and you will be able to restart Sonarr/Radarr. Rclone cloud mounts should not be used directly with any application. MergerFS should be used.
* Have you been into the system settings of Sonarr recently and use a password manager? Your password manager may have auto-filled the port. The ports should not be modified as they are just the internal docker ports, and SSL is handled via nginx. Please check the ports in the applications config.xml with the following command:


```sh
cat .apps/radarr/config.xml | grep Port
```

Radarr port should output the following.

```sh
support@server:~$ cat .apps/radarr/config.xml | grep Port
  <Port>7878</Port>
  <SslPort>9898</SslPort>
```
If they report other values, then use a text editor on config.xml and change to the port displayed above.
