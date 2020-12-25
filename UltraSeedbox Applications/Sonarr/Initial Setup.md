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

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419597706.png)

* Make sure that advanced settings is set to **Shown** and click **Media Management**

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419650980.png)

* Under Episode Naming section check Rename Episodes
  * You can leave the rest of the options as-is. The defaults work well with Plex's naming scheme.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419756894.png)

* Under Importing section make sure that **Use hardlinks instead of copy** is checked
  * Hardlinks effectively creates a file that points directly to your source file in the disk. You can do anything to this file without affecting your source file and vice versa. This is useful when you're seeding from torrents.
    * This is to prevent to have 2 copies of the same movie without affecting your files.
      * If your root folder is located on a mount (eg using a rclone mount), you should set this to **No**.
        * Hardlinks does not work on mounts. Sonarr will resort to copying, which is prone to errors.
          * For this, consider using [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup)

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419843155.png)

* Then on Root Folders, select **Add Root Folder**

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420185797.png)

* This will bring up the File Browser window.
* Select `homexx` folder where `homexx` contains the node where your seedbox is in.
    *   In the screenshot, the node where the seedbox is in `home1`

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420233225.png)

* Once opened, select your seedbox (indicated by your seedbox username)

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420350002.png)

* Then select the media folder and select TV Shows. Click **OK** after.
  * This folder is generated upon receiving your seedbox. This is where you'll be saving your media.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420399482.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581427179448.png)

* Once that's done, click **OK**. You'll see the absolute path of the Root folder.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432213121.png)

* Click **Save changes** to save your changes

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432295172.png)

### Adding indexers

* Now click the Indexers tab (red box)
* Add an indexer by clicking the big plus button (Blue box) and input what is asked on each indexer you wish.
  * Depending on the indexer, it'll ask for your account credentials or a passkey. Refer to your indexer/tracker for more information on what to put.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432442828.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432490163.png)

* Once that's done, click **save changes**.

### Adding Download Clients

* Now, click the Download client tab

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939206720.png)

* To add your preferred client, click the big + button then select your preferred client.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939312684.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939369821.png)

For connection details on each client, you may refer to this guide: [Download Client Connection Details](https://docs.usbx.me/books/sonarr/page/download-client-connection-details)

### Adding Your First Series

* To add a series, click **Series**

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644002305.png)

*   Then click **Add New Series**

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644075866.png)

* This page will be shown. Search and select the series that you wish to grab.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644111951.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644201738.png)

* Once selected, you can change if you want to monitor the series for any new releases, your preferred quality profile, and the series type.
* Once that's done, you can click the green button to add it to your Sonarr.
  * If you want to immediately search for the series in your indexers, check Start search for missing episodes.

![](https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644649509.png)