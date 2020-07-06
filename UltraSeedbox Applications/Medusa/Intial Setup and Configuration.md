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

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/MyLrLDt.png"></p>

* Scroll down to the end of the first section to where you see **Show root directories** and then click **New**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423424233.png"></p>

* This will bring up the Directory Browser window.
   * Select your`home##` folder where `home##` contains the node where your seedbox is in.
     * In the screenshot, the node where the seedbox is in `home8`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423224233.png"></p>

* Then, select your `username` directory
* Next, select the `media` directory
* Next, chose the `TV Shows` directory
* To select the directory, click **OK** 

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2434624233.png"></p>

* Finally, click on **Set as Default**, and then **Save Changes**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423724233.png"></p>

## Adding Download Clients and setting their Post-Processing directories for Medusa

* Hover your mouse pointer over the **Settings Gear** then click on **Search Providers** 

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423723433.png"></p>

For download client setup settings, you may refer to this guide: [Medusa Download Client Connection Details](https://docs.usbx.me/books/medusa/page/download-client-connection-details)

## Add Search Providers/Indexers

* Hover your mouse pointer over the  **Settings Gear Icon** then click on **Search Providers**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/img-2239723433.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2239333433.png"></p>

* From here you will enable the check boxes for the trackers/search providers you wish to use

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232323433.png"></p>

* After you have selected your torrent search providers, click on the **Save Changes** button below the provider list, and then also click the **Save Changes** button in the lower left corner.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/img-2422224233.png"></p>

* If the trackers or nzb providers you have selected requires credentials, you will set these in the **Provider Options** tab.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423723223.png"></p>

* And then click on the **Configure provider** dropdown menu to pick which provider you would like to enter credentials for.
*Refer to your trackers and NZB providers for this information.*

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/img-2423523433.png"></p>

* If the provider allows search features, be sure to enable
  * **Enable daily searches**
  * **Enable 'Manual Search' feature**
  * **Enable backlog searches**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2224243433.png"></p>

* After you have entered your provider credentials and settings, click on the **Save Changes** button below the provider list, and then also click the **Save Changes** button in the lower left corner.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232242433.png"></p>

## Post-Processing Settings

* Hover your mouse pointer over the **Settings Gear** then click on **Post-Processing**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232225433.png"></p>

* Enable **Scheduled Post-Processor**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2423242433.png"></p>

* Click on the directory browser button for **Post-Processing Dir**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2422222433.png"></p>

* Using the blue directory icons, navigate to your {HOME##} then to your slot {USERNAME} then to your `files` directory, then finally to `completed` directory.
  * The screenshot example shows {HOME##} as `home8` and the slot {USERNAME} as `docs`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/img-2232424233.png"></p>

* To save the 'Post-Processing Dir click' **OK** in the directory browser dialog box

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2222225433.png"></p>

<c><p class="callout info">Its important to be be sure only your **COMPLETED** downloads are in this location, otherwise Medusa's Post-Processor may import incomplete media and cause errors. You may refer to the [Medusa Download Client Connection Details](https://docs.usbx.me/books/medusa/page/download-client-connection-details) to set completed directories for your download clients to this location</p></c>

* You will need to set the **Processing Method**:

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232223433.png"></p>

* **Processing Method: HARD LINK**
  * This method is recommended if you are using local storage on your seedbox.
    * Hard Links effectively creates a file that points directly to your source file in the disk. You can do anything to this file without affecting your source file and vice versa. This is useful when you're seeding from torrents.
      * This is to prevent to have 2 copies of the same media without affecting your files.

* **Processing Method: COPY**
  * This method is required if you are using a separate file system mount such as *mergerfs*.
    * Hard Links does not work on mounts, so Copy is recommended in the case that you have a mount.
    * For this, consider using [Rclone VFS and MergerFS Setup](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup)

If your torrent trackers have archives, it would be recommended to enable Medusa's **Unpack** feature:

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232222433.png"></p>

* To save your **Post Processing** settings, click on the **Save Changes** button below the provider list, and then click the **Save Changes** button in the lower left corner.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2239722223.png"></p>

* For the **Post Processing scheduler** to be enabled, you *must* restart Medusa. You can do this easily by hovering your mouse pointer over the **Configuration Tool Icon** and then click on **Restart**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-24221113.png"></p>

## Adding Your First Series

* Hover your mouse pointer over the **Shows Menu Item** and then click on **Add Shows**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22223433.png"></p>

* Click on the **Add New Show** link.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2221433.png"></p>

* Enter the series name and then click **Search**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-2232133.png"></p>

* Choose the series and then click **Next**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-241433.png"></p>

* Select the Parent Folder and then click **Next**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-22313113.png"></p>

* Select your **Quality** choice for the series

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-242233.png"></p>

* Scroll down to the bottom of the page and click **Add Show**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/scaled-1680-/img-222423433.png"></p>