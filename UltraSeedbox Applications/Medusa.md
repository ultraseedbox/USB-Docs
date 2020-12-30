**Medusa** is an open-sourced fully-automated PVR written in Python. It enables you to download your favorite TV shows, then processes and stores them in your library, all with minimal user intervention. Some of the features are the following:

* Automatic torrent/nzb searching, downloading, and processing at the qualities you want
* Automatic subtitle downloads for your shows.
* Supports Anime and Sports shows
* Sends notifications to your media server/software and/or mobile/social devices
* Can notify Kodi, XBMC, Growl, Trakt, Twitter, and many more when new episodes are available
* Updates Kodi library, poster/banner/fanart downloads, and NFO/TBN generation
* Configurable automatic episode renaming, sorting, and other post-processing

For more information, you can visit [their site](https://pymedusa.com/) or [their GitHub repo](https://github.com/pymedusa/Medusa).

![](https://docs.usbx.me/uploads/images/gallery/2020-07/image-1594110108633.png)

***

## Initial Setup

In this guide, we’ll be setting up Medusa for the first time. This guide assumes that this is your first time installing Medusa and you'll be storing your media locally, saving to `~/media/TV Shows`. 

We will be doing the following:

 1. Add root folder
 2. Connecting your download clients and setting their completed download directories for Medusa Post-Processing
 3. Adding indexers/search providers
 4. Configure Post-Processing
 5. Adding your first series

### Add Root Folder

* Access and login to your Medusa instance using the credentials you set during installation
* Hover your mouse pointer over the  **Settings Gear** then click on **General**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/MyLrLDt.png)

* Scroll down to the end of the first section to where you see **Show root directories** and then click **New**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423424233.png)

* This will bring up the Directory Browser window.
   * Select your`home##` folder where `home##` contains the node where your seedbox is in.
     * In the screenshot, the node where the seedbox is in `home8`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423224233.png)

* Then, select your `username` directory
* Next, select the `media` directory
* Next, chose the `TV Shows` directory
* To select the directory, click **OK** 

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2434624233.png)

* Finally, click on **Set as Default**, and then **Save Changes**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423724233.png)

### Adding Download Clients and Setting Post-Processing Directories

* Hover your mouse pointer over the **Settings Gear** then click on **Search Providers** 

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423723433.png)

For download client setup settings, you may refer below

#### Torrent Clients

* In **Search Settings** to add a Torrent download client click on the **Torrent Search** tab.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-223299233.png)

##### rTorrent
###### Connection Settings

```
Search .torrent files: ENABLED
Send .torrent files to: rtorrent
rTorrent host:port: https://{username}.{servername}.usbx.me/rutorrent/plugins/httprpc/action.php
Http Authentication: Basic
rTorrent Username: {username}
rTorrent Password: As configured in UCP under ruTorrent
Add Label To Torrent: Medusa
Downloaded Files Location: <EMPTY>
```

###### Post-Processing Setup

* Access and login to your ruTorrent instance using the credentials you set during installation
* Go to **Settings** by clicking the **Gear Icon**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-24112433.png)

* Click on the **Autotools** section in the left column 

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-242112433.png)

* Enable the checkbox that says: **Enable "Automove" if torrent's label matches fitler"** and change default entry **/.*/** to **/Medusa/**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-24231133.png)

* Click the directory button next to **Path to finished downloads**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2231311113.png)

* Upon clicking the directory button, it will auto-fill the default download path your ruTorrent is using. This default location is: `/{HOME##}/{USERNAME}/files`
  * Simply add: `/completed` to the end of the path, making the path: `/{HOME##}/{USERNAME}/files/completed`
  * {HOME##} is your home number, in this example it is `home8'
    * {USERNAME} is your slot username, in this example it is `docs`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22234234.png)

:::info
This step is very important if using ruTorrent as your download client. ruTorrent will not append an extension to downloads therefore Medusa's Post-Processor will import incomplete downloads if the Auotools-AutoMove plugin is not used in ruTorrent.
:::

##### Transmission
###### Connection Settings

```
Search .torrent files: ENABLED
Send .torrent files to: Transmission 
Transmission host:port: https://{username}.{servername}.usbx.me
Transmission RPC URL: transmission/rpc
Transmission Username: {username}
Transmission Password: As configured in UCP under Transmission
Downloaded Files Location: EMPTY
```

###### Post Processing Setup

Transmission appends **".part"** to the downloading file extensions until the download is completed and Medusa will ignore these files with **".part"** extensions, so there is no need to configure any further **Post Processing** directory settings for this client

#### Usenet Clients

* In **Search Settings**, to add a Usenet download client click on the **NZB Search** tab.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-222111433.png)

##### NZBGet
###### Connection Settings

```
Search NZBs: ENABLED
Send .nzb files to: NZBGet
Host: {username}.{servername}.usbx.me/nzbget
Connect using HTTPS: ENABLED
Username: {nzbget username}
Password: {nzbget password}
Use NZBget category: Medusa
Use NZBget category (backlog episodes): Medusa
Use NZBget category for anime: Medusa-Anime
Use NZBget category for anime (backlog episodes): Medusa-Anime
```

###### Post-Processing Setup

* Access and login to your NZBget instance using the credentials you have set in the application.
* Go to **Settings** In the top right corner of the menu at the top of the initial login page.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-6644312.png)

* From here click on the **PATHS** link in the menu on left column menu

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-6611312.png)

* Here you will see **MainDir** location default as `/downloads`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-661122.png)

* **MainDir** needs to the full path of the `files` directory in your home.
  * `/{HOME##}/{USERNAME}/files/`
     * To get the full directory of this folder, you can SSH into your slot and run the command: `readlink -f ~/files/`
     * The output of this command will give you the full path to your home's `files` directory
       *  If you are unsure on how to SSH into your slot, you may refer to this guide: https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh

 
Per the example in the screenshot below, {HOME##} is **home8** and the {username} is **docs**, so the full path for the `files` directory would be: `/home8/docs/files`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-211133.png)


* Scroll down to the bottom of the page to click **Save all changes** in lower left corner

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22233.png)

##### SABnzbd
###### Connection Settings

```
Search NZBs: ENABLED
Send .nzb files to: SABnzbd
Host: {username}.{servername}.usbx.me/sabnzbd/
Username: {sabznbd username}
Password: {sabnzbd password}
SABnzbd : {sabnzbd api key}
Use SABnzbd category: Medusa
Use SABnzbd category (backlog episodes): Medusa
Use SABnzbd category for anime: Medusa-Anime
Use SABnzbd category for anime (backlog episodes): Medusa-Anime
```

***It is important to have the trailing **/** on the end of your SABnzbd host, otherwise  Medusa will fail to add NZBs successfully to this client.* 

###### Post-Processing Setup

* Access and login to your SABbzbd instance using the credentials you have set in the application.
* Go to **Settings** In the top right corner of the menu at the top of the initial login page. 

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-242119933.png)

* Next, click the **Folders** link. 

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22229233.png)

* From here you will see the 2 default directories that need to be changed
    * **Temporary Download Folder**: `/{HOME##}/{USERANME}/Downloads/incomplete`
    * **Completed Download Folder**: `/{HOME##}/{USERANME}/Downloads/complete`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-12433.png)

* These 2 default directories need to be set to:
  * **Temporary Download Folder**: `/{HOME##}/{USERANME}/incomplete`
  * **Completed Download Folder**: `/{HOME##}/{USERANME}/files/completed`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2111113.png)

### Add Search Providers/Indexers

* Hover your mouse pointer over the  **Settings Gear Icon** then click on **Search Providers**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2239723433.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2239333433.png)

* From here you will enable the check boxes for the trackers/search providers you wish to use

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232323433.png)

* After you have selected your torrent search providers, click on the **Save Changes** button below the provider list, and then also click the **Save Changes** button in the lower-left corner.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2422224233.png)

* If the trackers or nzb providers you have selected requires credentials, you will set these in the **Provider Options** tab.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423723223.png)

* And then click on the **Configure provider** dropdown menu to pick which provider you would like to enter credentials for.
*Refer to your trackers and NZB providers for this information.*

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423523433.png)

* If the provider allows search features, be sure to enable
  * **Enable daily searches**
  * **Enable 'Manual Search' feature**
  * **Enable backlog searches**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2224243433.png)

* After you have entered your provider credentials and settings, click on the **Save Changes** button below the provider list, and then also click the **Save Changes** button in the lower-left corner.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232242433.png)

### Post-Processing Settings

* Hover your mouse pointer over the **Settings Gear** then click on **Post-Processing**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232225433.png)

* Enable **Scheduled Post-Processor**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423242433.png)

* Click on the directory browser button for **Post-Processing Dir**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2422222433.png)

* Using the blue directory icons, navigate to your {HOME##} then to your slot {USERNAME} then to your `files` directory, then finally to `completed` directory.
  * The screenshot example shows {HOME##} as `home8` and the slot {USERNAME} as `docs`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2232424233.png)

* To save the 'Post-Processing Dir click' **OK** in the directory browser dialog box

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2222225433.png)

::: info
Its important to be sure only your **COMPLETED** downloads are in this location, otherwise Medusa's Post-Processor may import incomplete media and cause errors. You may refer to the [Medusa Download Client Connection Details](https://docs.usbx.me/books/medusa/page/download-client-connection-details) to set completed directories for your download clients to this location
:::

* You will need to set the **Processing Method**:

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232223433.png)

* **Processing Method: HARD LINK**
  * This method is recommended if you are using local storage on your seedbox.
    * Hard Links effectively creates a file that points directly to your source file in the disk. You can do anything to this file without affecting your source file and vice versa. This is useful when you're seeding from torrents.
      * This is to prevent to have 2 copies of the same media without affecting your files.

* **Processing Method: COPY**
  * This method is required if you are using a separate file system mount such as *mergerfs*.
    * Hard Links does not work on mounts, so Copy is recommended in the case that you have a mount.
    * For this, consider using [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup)

If your torrent trackers have archives, it would be recommended to enable Medusa's **Unpack** feature:

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232222433.png)

* To save your **Post Processing** settings, click on the **Save Changes** button below the provider list, and then click the **Save Changes** button in the lower-left corner.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2239722223.png)

* For the **Post Processing scheduler** to be enabled, you *must* restart Medusa. You can do this easily by hovering your mouse pointer over the **Configuration Tool Icon** and then click on **Restart**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-24221113.png)

***

## Adding Your First Series

* Hover your mouse pointer over the **Shows Menu Item** and then click on **Add Shows**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22223433.png)

* Click on the **Add New Show** link.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2221433.png)

* Enter the series name and then click **Search**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232133.png)

* Choose the series and then click **Next**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-241433.png)

* Select the Parent Folder and then click **Next**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22313113.png)

* Select your **Quality** choice for the series

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-242233.png)

* Scroll down to the bottom of the page and click **Add Show**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-222423433.png)

