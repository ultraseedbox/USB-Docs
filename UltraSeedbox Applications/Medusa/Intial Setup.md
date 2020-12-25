In this guide, we’ll be setting up Medusa for the first time. This guide assumes that this is your first time installing Medusa and you'll be storing your media locally, saving to `~/media/TV Shows`. 

We will be doing the following:

 1. Add root folder
 2. Connecting your download clients and setting their completed download directories for Medusa Post-Processing
 3. Adding indexers/search providers
 4. Configure Post-Processing
 5. Adding your first series

***

## Add Root Folder

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

## Adding Download Clients and setting their Post-Processing directories for Medusa

* Hover your mouse pointer over the **Settings Gear** then click on **Search Providers** 

![](https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423723433.png)

For download client setup settings, you may refer to this guide: [Medusa Download Client Connection Details](https://docs.usbx.me/books/medusa/page/download-client-connection-details)

## Add Search Providers/Indexers

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

## Post-Processing Settings

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