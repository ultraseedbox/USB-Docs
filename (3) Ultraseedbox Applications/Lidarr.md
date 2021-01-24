**Lidarr** is a fork of Sonarr that can download and organize your music library. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available. Some of the major features of this app are:

* Automatically detects new tracks from NZB and Torrent sources
* Can scan your existing library and download any missing tracks
* Can watch for better quality versions of tracks you already have and do an automatic upgrade
* Automatic failed download handling
* Manual search so you can pick any release or to see why a release was not downloaded automatically
* Fully configurable track renaming
* Full integration with SABnzbd and NZBGet
* Full integration with Kodi, Plex (notification, library update, metadata)
* Full support for specials and multi-album releases
* Beautiful UI

For more information for this, you may visit [their site](https://lidarr.audio/) or [Lidarr's GitHub repo](https://github.com/lidarr/Lidarr).

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568640089029.png)

***

## Initial Setup

In this section, we will be going into detail on installing, configuring and using Lidarr. The following are the steps that we will do:

* Enabling automatic organization and adding a root Folder
* Adding indexers
* Connecting your download clients
* Adding your first artist

### Configure a Download Client

* To add a Download Client, go to **Settings -> Download Clients**

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575036493097.png)

* Click the plus icon at the top, and pick your Download client

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575072067589.png)

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

### Add a Root Folder

* First, head to **Settings** and then **Media Management**.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575078193863.png)

* Then click **Add Root Folder**

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575078379040.png)

* Go to `/homexx/{username}/media/Music` then click **Ok**.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575078547141.png)

* It should now show a new Root Folder

### Add an Indexer

* Now click the Indexers tab
* Add an indexer by clicking the big plus button and input what is asked on each indexer you wish.
  * Depending on the indexer, it'll ask for your account credentials or a passkey. Refer to your indexer/tracker for more information on what to put.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575078956452.png)

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575078983564.png)

* Once that's done, click save changes.

### Add an Artist

* To add an artist, go to **Artists -> Add New**
* Then click **Add New Artist**

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575079157527.png)
![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575079253512.png)

* This page will be shown. Simply search the artist and click the correct one.
* Once selected, you can change if you want to monitor the series for any new albums and your preferred quality profile
* Once that's done, you can click the green button to add it to your Lidarr.
* If you want to immediately search and download for the artists in your indexers.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1575079318742.png)
