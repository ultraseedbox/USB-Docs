In this guide, we’ll be setting up Sonarr for the first time. This guide assumes that this is your first time installing Sonarr and you'll be storing your media locally, saving to `~/media`. We'll be doing the following:

1.  Enabling automatic organization and adding a root Folder
2.  Adding indexers
3.  Connecting your download clients
4.  Adding your first series

***

## Initial Setup
### Enabling Automatic Organization and Add Root Folder

* Access and login to your Sonarr instance using the credentials you set during installation
* Go to **Settings**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419597706.png"></p>

* Make sure that advanced settings is set to **Shown** and click **Media Management**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419650980.png"></p>

* Under Episode Naming section check Rename Episodes
  * You can leave the rest of the options as-is. The defaults work well with Plex's naming scheme.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419756894.png"></p>

* Under Importing section make sure that **Use hardlinks instead of copy** is checked
  * Hardlinks effectively creates a file that points directly to your source file in the disk. You can do anything to this file without affecting your source file and vice versa. This is useful when you're seeding from torrents.
    * This is to prevent to have 2 copies of the same movie without affecting your files.
      * If your root folder is located on a mount (eg using a rclone mount), you should set this to **No**.
        * Hardlinks does not work on mounts. Sonarr will resort to copying, which is prone to errors.
          * For this, consider using [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup)

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419843155.png"></p>

* Then on Root Folders, select **Add Root Folder**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420185797.png"></p>

* This will bring up the File Browser window.
* Select `homexx` folder where `homexx` contains the node where your seedbox is in.
    *   In the screenshot, the node where the seedbox is in `home1`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420233225.png"></p>

* Once opened, select your seedbox (indicated by your seedbox username)

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420350002.png"></p>

* Then select the media folder and select TV Shows. Click **OK** after.
  * This folder is generated upon receiving your seedbox. This is where you'll be saving your media.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420399482.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581427179448.png"></p>

* Once that's done, click **OK**. You'll see the absolute path of the Root folder.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432213121.png"></p>

* Click **Save changes** to save your changes

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432295172.png"></p>

### Adding indexers

* Now click the Indexers tab (red box)
* Add an indexer by clicking the big plus button (Blue box) and input what is asked on each indexer you wish.
  * Depending on the indexer, it'll ask for your account credentials or a passkey. Refer to your indexer/tracker for more information on what to put.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432442828.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432490163.png"></p>

* Once that's done, click **save changes**.

### Adding Download Clients

* Now, click the Download client tab

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939206720.png"></p>

* To add your preferred client, click the big + button then select your preferred client.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939312684.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939369821.png"></p>

For connection details on each client, you may refer to this guide: [Download Client Connection Details](https://docs.usbx.me/books/sonarr/page/download-client-connection-details)

### Adding Your First Series

* To add a series, click **Series**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644002305.png"></p>

*   Then click **Add New Series**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644075866.png"></p>

* This page will be shown. Search and select the series that you wish to grab.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644111951.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644201738.png"></p>

* Once selected, you can change if you want to monitor the series for any new releases, your preferred quality profile, and the series type.
* Once that's done, you can click the green button to add it to your Sonarr.
  * If you want to immediately search for the series in your indexers, check Start search for missing episodes.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644649509.png"></p>

***

## Settings Overview
### Media Management

* Here, you can set Sonarr's organization options. The following can be set here:
  * Episode naming scheme
  * Folder options
  * Importing options
  * File Management
  * Permissions
  * Sonarr Root Folders

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582811257219.png"></p>

### Profiles

* Here, you can edit profiles for different resolutions.
* Each profile you can set which resolution you'd like to grab, the cutoff to which you'll set Sonarr to stop grabbing releases of that episode and any custom formats you've wished to grab.
* Here, you can set Language profiles to filter out releases that are in your specified language
  * You can also set Release profiles and Delay profiles
    * Release profiles fine tunes the releases that Sonarr grabs with RegEx.
      * By specifying a number of terms, Sonarr will filter out more releases and continue to watch for releases that better match your preferences.
    * Delay profiles are also helpful if you want to emphasize one protocol (Usenet or Torrent) over the other

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582811819656.png"></p>

### Quality

* Here, this is where you'll control the size limits of each resolution. Anything that's not within the set limits will be rejected from the releases.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583126914027.png"></p>

### Indexers

* This is where Sonarr will grab releases from. You can set your preferred tracker and/or usenet indexers.
* You may also set some options on how frequent you check your torrents, your torrent minimum age and set your restrictions.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127081502.png"></p>

### Download Clients

* This is where you'll set your download clients and how Sonarr handles completed and failed downloads.
* This is also where you can set your Remote Path Mappings.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127171540.png"></p>

### Connect

* Here, you can set integrations to other apps which will trigger actions from Sonarr.
* Most popular apps that you can integrate with are
  * Emby/Jellyfin
  * Execute custom Scripts
  * Slack notifications

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127294239.png"></p>

### Metadata

* This is where you can generate metadata (NFO) files to be used by some applications. It holds information on the media you downloaded such as Show name, Season, Banner/Poster links, Description, etc. which is read and displayed by the application for you.
* All of our supported media center apps can generate its own metadata files so there's no real need to enable one of the options although, it'll speed up library rescanning since it won't need to search and match metadata from online sources.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127333868.png"></p>

### Tags

* Here, it'll list your set tags.
* Tags are used to bind Restrictions and Delay Profiles to specific series

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583128408428.png"></p>

### General

* Here, you can change the general settings of Sonarr.
* Most are set by USB so you can leave them as-is.
* Should there be a need to do so, you can change Log Level.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583128448697.png"></p>

### UI

* Here, you can change UI settings.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583128477118.png"></p>