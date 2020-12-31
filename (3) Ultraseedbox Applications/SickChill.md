**SickChill** is an automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are available will download and process the files at the qualities you specify.

For more information, you may visit this guide here: [https://sickchill.github.io/](https://sickchill.github.io/)

![](https://sickchill.github.io/images/screenshots/home.jpg)

***

## Initial Setup

In this ection, we’ll be setting up SickChill for the first time. This assumes that this is your first time installing SickChill and you'll be storing your media locally, saving to `~/media`. We'll be doing the following:

1.  Setting a root Folder
2.  Adding indexers
3.  Setting up Search Providers and Downloaders
4.  Enable Organization
5.  Adding your first series

After the Installation of SickChill via the Ultraseedbox Control Panel and opening the Web interface by clicking **Connect**, you will be presented with this page asking for your username and password. This is the password you set when installing SickChill Username can be found in the Control Panel.

![](https://i.imgur.com/2lR6M1N.png)

Your first steps are to address the settings.

![](https://i.imgur.com/52dufFE.png)

### General Configuration
#### Root Directories

![](https://i.imgur.com/V1yDoun.png)

There is only one option here that must be adjusted to work with the Ultraseedbox folder structure. By default, **Show root directories** is set to your `files` folder like this:

![](https://i.imgur.com/dUYcsBo.png)

This needs to be edited to point towards your “media/TV Shows” folder like this:

![](https://i.imgur.com/W90eCwK.png)

![](https://i.imgur.com/DH87vrv.png)

The result should look something like this but will include your username:


![](https://i.imgur.com/dOxW38d.png)

#### Interface

The main setting to bring attention to in this section is your API. This is used to interface SickChill with other applications, and it can be found at the bottom of the page:

![](https://i.imgur.com/j52lRvo.png)

#### Search Settings
##### NZB Search

If you are a user of NZB’s (Usenet), you will need to enable nzb search providers and link your NZB download client (NZBget or SABnzbd)

###### NZBGet Connection Settings

```
Search NZBs: ENABLED
Usenet retention: 500
Send .nzb files to: NZBGet
Host: {username}.{servername}.usbx.me/nzbget
Connect using HTTPS: ENABLED
Username: {nzbget username}
Password: {nzbget password}
Use NZBget Category: tv
Use NZBget category (backlog episodes): tv
Use NZBget category for anime: anime
Use NZBget category for anime (backlog episodes): anime
```

###### SABnzbd Connection Settings

```
Search NZBs: ENABLED
Send .nzb files to: SABnzbd
Host: {username}.{servername}.usbx.me/sabnzbd/
Username: {sabznbd username}
Password: {sabnzbd password}
SABnzbd : {sabnzbd api key}
Use SABnzbd category: tv
Use SABnzbd category (backlog episodes): tv
Use SABnzbd category for anime: anime
Use SABnzbd category for anime (backlog episodes): anime
```

It is important to have the trailing / at the end of your SABnzbd host; otherwise, SickChill will fail to add NZBs successfully to this client.

##### Torrent Search

If you use torrents, you will need to enable Torrent search providers and link your BitTorrent download client (Transmission, Rtorrent, etc.) 

###### rTorrent Connection Settings

```
Search .torrent files: ENABLED
Send .torrent files to: rtorrent
rTorrent host:port: https://{username}.{servername}.usbx.me/rutorrent/plugins/httprpc/action.php
Http Authentication: Basic
rTorrent Username: {username}
rTorrent Password: As configured in UCP under ruTorrent
Add Label To Torrent: tv
Add Label To Anime: anime
Downloaded Files Location: <EMPTY>
```

###### Transmission Connection Settings

```
Search .torrent files: ENABLED
Send .torrent files to: Transmission 
Transmission host:port: https://{username}.{servername}.usbx.me
Transmission RPC URL: transmission/rpc
Transmission Username: {username}
Transmission Password: As configured in UCP under Transmission
Downloaded Files Location: EMPTY
```

#### Search Providers
##### Provider Priorities

This is the page where you would select the providers you are a part of. You also can choose the order at which SIckChill will look at each Provider.

To activate a Provider, you must tick it’s a checkbox. To rearrange the order, just click and drag through the list.

![](https://i.imgur.com/58xGJ0i.png)

Important note: You must click save in the bottom left corner and refresh the page before the options appear in the next tab, “Provider Options.”

##### Provider Options

This is a very important page that must be completed correctly for SickChill to search the providers you have set successfully. Settings will differ from provider to provider; however, I will include a settings explanation for one torrent provider and one NZB indexer.

###### Torrent Provider Configuration

![](https://i.imgur.com/h2odtPw.png)

**Configure provider:** The Dropdown menu selects the provider you want to configure here. 

**Custom URL:** If your provider offers a working proxy, you may be able to specify it here. 

**Username:** Your username at the Providers Site

**Password:** Your password at the Providers Site

**Cookies**: Some providers ask you to include a cookie as a method of authentication. This can be found using Cookie Inspector for Chrome or some other cookie inspection tool.

example: `uid=1234;pass=567845439634987`

**Seed ratio:** Leave this Blank as your download client can handle this. 

**Minimum Seeders:** The number of minimum seeders required on a torrent file before SickChill will download it.

**Freeleech:** Force SickChill to only download Freeleech torrents. Unless your ratio is low on a particular Provider, we recommend keeping this disabled.

**Enable daily searches:** Enable this

**Enable backlog searches:** Enable this

**Season search mode:** Your two options are episode only or season packs only. Choose which is best for you and your Provider preferences.

###### NZB Provider Configuration

![](https://i.imgur.com/NmT8qZW.png)

**Configure provider:** The Dropdown menu selects the provider you want to configure here. 

**Username:** Your username at the Providers Site

**API key:** Your unique API provided by your indexer

**Enable daily searches:** Enable this

**Enable backlog searches:** Enable this

**Season search mode:** Your two options are episode only or season packs only. Choose which is best for you and your Provider preferences.

##### Custom

To make use of Provider’s not preinstalled into SickChill will require Jackett or some other 3rd party intermediary.

**Post Processing**

This is the section where you will be telling SickChill how to handle your completed downloads, Where to put them, Should they be renamed, etc. We will go through the relevant sections below.

![](https://i.imgur.com/byOWGeV.png)

![](https://i.imgur.com/Ccb6lPI.png)

**Enable:** Turn Post Processing ON and OFF

**Post-Processing Dir:** This is the Directory your download client will place the completed TV files before SickChill Processes them. Depending on your download client, this could be either

`~/Downloads` or `~/files`

**Processing Method:** This will dictate what SickChill does with the file one Processed your options are

* Copy: Create a copy
* Move: Move the file from the completed folder to the root folder.
* Hardlink: This works a bit like the copy command. However, both files would be renamed, unlike softlink. Hardlinking differs from copying because if you change something about file A, it also changes file B, unlike a copy.
* Softlink: This works a bit like a Windows shortcut placing a ghost copy of the file so that it can be in two places simultaneously, both your download folder and your completed TV folder in ~/media. This allows you to seed the file still but has Sickrage process it.

If you are running torrents, hardlink is likely your best option as it will allow you to seed without taking up extra disk space.

**Auto Post-Processing Frequency:** How often Post Processing will be run

**Sync File Extensions:** This is the list of extensions or filename globs SickChill ignores when Post Processing

**Rename:** Should the files be renamed after downloading? We recommend turning this on and leaving the episode naming settings as default. This will typically allow Plex, Emby, Jellyfin, etc., to match the files to metadata for poster descriptions easily.

**Create missing show directories:** Enable this

**Add shows without directory:** Do not enable not recommended.

**Move associated files:** Move files associated with the download, e.g., SRT subtitle files.

**Delete nonassociated:** Delete any files not relevant to the media, e.g., NFO files

***

## Adding your First Show

![](https://i.imgur.com/ovmbS9j.png)

Adding a show is quite simple. There are multiple ways to do so, but here we will cover adding a show manually.

After clicking “Add show”, you are presented with these options. 

![](https://i.imgur.com/8jkAyQk.png)

Selecting the first option will move you to the next screen.

![](https://i.imgur.com/aqdIgBX.png)

Here you need to type a show name then select it from the list that appears below.

Finally, you must choose the desired quality, you must decide if you want all previously released episodes, and you must select if you wish all future episodes. Always select Group episodes by season folder as this will make metadata easier for your Media playback software. 

We recommend saving settings as default (using the blue button), so you can skip them in the future. Click Add Show.