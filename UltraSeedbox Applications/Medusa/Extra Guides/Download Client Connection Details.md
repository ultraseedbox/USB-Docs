## Torrent Clients

* In **Search Settings** to add a Torrent download client click on the **Torrent Search** tab.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-223299233.png)

### rTorrent
#### Connection Settings

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

#### Post-Processing Setup

* Access and login to your ruTorrent instance using the credentials you set during installation
* Go to **Settings** by clicking the **Gear Icon**
![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-24112433.png)

* Click on the **Autotools** section in left column 
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

<callout info>This step is very important if using ruTorrent as your download client. ruTorrent will not append an extension to downloads therefore Medusa's Post-Processor will import incomplete downloads if the Auotools-AutoMove plugin is not used in ruTorrent.</callout>

### Transmission
#### Connection Settings

```
Search .torrent files: ENABLED
Send .torrent files to: Transmission 
Transmission host:port: https://{username}.{servername}.usbx.me
Transmission RPC URL: transmission/rpc
Transmission Username: {username}
Transmission Password: As configured in UCP under Transmission
Downloaded Files Location: EMPTY
```

#### Post Processing Setup

Transmission appends **".part"** to the downloading file extensions until the download is completed and Medusa will ignore these files with **".part"** extensions, so there is no need to configure any further **Post Processing** directory settings for this client

## Usenet Clients

* In **Search Settings**, to add a Usenet download client click on the **NZB Search** tab.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-222111433.png)

### NZBGet: Connection Settings

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

### NZBGet: Post Processing Setup
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


### SABnzbd: Connection Settings

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

### SABnzbd: Post Processing Setup

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