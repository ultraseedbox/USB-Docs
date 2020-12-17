In this guide, we'll be setting up Radarr. This guide assumes that this is your first time installing Radarr and you'll be storing your media locally, saving it to `~/media`. We'll be doing the following:

1. Enabling Automatic Organization
1. Adding indexers
2. Connecting your download clients
3. Adding your first movie

***

## Initial Setup
### Enabling Automatic Organization

* Access and login to your Radarr instance using the credentials you set during installation
* Go to **Settings**

<p align="center"><img src="https://i.imgur.com/pFvQfOL.png"></p>

* Make sure that advanced settings is set to **Shown**

<p align="center"><img src="https://i.imgur.com/voOT1sb.png"></p>

* In Media Management settings, toggle Rename movies to **Yes**.
  * You can leave the rest of the options as-is. The defaults work well with Plex's naming scheme.

<p align="center"><img src="https://i.imgur.com/Cz0n84d.png"></p>

* Make sure that **Use hardlinks instead of copy** is set to **yes**.
  * Hardlinks effectively creates a file that points directly to your source file in the disk. You can do anything to this file without affecting your source file and vice versa. This is useful when you're seeding from torrents.
    * This is to prevent to have 2 copies of the same movie without affecting your files.
      * If your root folder is located on a mount (eg using a rclone mount), you should set this to **No**.
        * Hardlinks does not work on mounts. Radarr will resort to copying, which is prone to errors.
        * For this, consider using [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup)

<p align="center"><img src="https://i.imgur.com/sArtsO5.png"></p>

* After changing, save it by clicking **Save** in the top left hand corner

<p align="center"><img src="https://i.imgur.com/dsnd5g7.png"></p>


### Adding Indexers

* Go to Indexers

<p align="center"><img src="https://i.imgur.com/yHjc7BU.png"></p>

* Click the Plus button

<p align="center"><img src="https://i.imgur.com/AKIQ5Fr.png"></p>

* Then select the indexers you want to add for your Radarr instance and input what is asked on each indexer you wish
  * Depending on the indexer, it'll ask for your account credentials or a passkey. Refer to your indexer/tracker for more information on what to put.

<p align="center"><img src="https://i.imgur.com/rkVsTCX.png"></p>

* Once that’s done, click **Save**.

### Adding Download Clients

* Now, click the Download client on the left hand side.

<p align="center"><img src="https://i.imgur.com/WL2Iunf.png"></p>

* To add your preferred client, click the big + button then select your preferred client.

For connection details on each client, you may refer to this guide: [Download Client Connection Details](https://docs.usbx.me/books/radarr/page/download-client-connection-details)

### Adding Your First Movie

* Now we'll be adding your first movie. Click Movies then Add New Movie.

<p align="center"><img src="https://i.imgur.com/Y1Lo2bO.png"></p>

* Then type any movie you want to download.
* Once you've found the movie you want, we will set some options. First, click the dropdown box on the Root folder and click add a different path

<p align="center"><img src="https://i.imgur.com/AYy8MGb.png"></p>

* The file browser popup will appear.

* Select `homexx` folder where `homexx` contains the node where your seedbox is in.
  * In the screenshot, the node where the seedbox is in `home1`

<p align="center"><img src="https://i.imgur.com/S40VJqx.png"></p>

* Once opened, select your seedbox (indicated by your seedbox username)

<p align="center"><img src="https://i.imgur.com/hZN1gcR.png"></p>

* Then select the media folder and select Movies. Click OK after.
    * This folder is generated upon receiving your seedbox. This is where you'll be saving your media.

<p align="center"><img src="https://i.imgur.com/XsUZpT6.png"></p>

<p align="center"><img src="https://i.imgur.com/99tWKnb.png"></p>

* Once that's done. Click OK select the path.

<p align="center"><img src="https://i.imgur.com/6zqGfTN.png"></p>

* After selecting the path, you may set the other preferences accordingly
  * Monitor
    * Choose yes if you want Radarr to monitor your indexers for better releases and upgrade them accordingly
  * Min. Availability
    * This sets when Radarr will search your indexers for movies.
    * The general tip here is that if you're in great trackers, you can opt to choose Announced. If you're not sure, choose Physical/Web
  * Profile
    * This sets what quality/resolution Radarr will grab.

<p align="center"><img src="https://i.imgur.com/c9idPSg.png"></p>

* After that is set, you can choose either the green Add Movie button to add your movie withough searching or the checkbox then green button  to start searching your indexers for the movie.