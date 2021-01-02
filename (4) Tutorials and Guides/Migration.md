In this guide we will be doing a migration of your data from your previous slot to your new slot, and then restoring the configurations and data to your respective applications. 

We will be using SSH most of this guide, if you are unfamiliar with SSH we have a detailed guide located here: [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh)

***

## Prerequisites

* Make sure you have an SSH password set for **both**  slots in your UCP. Login to your [User Control Panel](https://cp.ultraseedbox.com) and login with the credentials you set and Press **Connect**

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-13-9%5B1%5D.png)

* Click **Access details** and click **Change password** beside SSH access.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-14-38%5B1%5D.png)

* Set your password to anything you wish. We recommend using a unique password that you do not use in any of your existing accounts and has the following
  * At least 12 characters
  * An uppercase letter
  * A lowercase letter
  * At least 1 number
  * At least 1 symbol
* When you're done click **Confirm change**

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-19-3%5B1%5D.png)

* A popup saying *Password successfully changed* should appear on the lower right corner of the page, signifying that the password is set successfully.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-25-0%5B1%5D.png)

* If possible, it is recommended to stop your applications on your original slot while doing the transfer. This will help prevent possible changes in data during the transfer, and will likely assist with the actual data migration speeds to run as intended.
* Also, you may want to stop any rclone/mergerfs mounts as a precaution.

***

## Migration of Data to the New slot
### Transfer Preparation

Using `rsync` in SSH, we will be making a 1:1 copy of your original slot to your upgraded slot in a directory named transfer located in your upgraded slot's home folder.  We will use a utility called `screen` for this because the processes run in a `screen` will continue to run even if you close your local SSH terminal. 

* Log into your fresh **UPGRADED** slot's SSH service
* Open a new screen named "transfer" with the following command

```sh
screen -S transfer
```

### rsync Transfer Proper
 
The following is our optimized for transfer rsync command to start your migration. This will make a complete 1:1 copy of the original slot's data to a folder named transfer in the destination slot. 
  
**rsync transfer command *template*:**

```sh
rsync -aHAXxv --numeric-ids --info=progress2 --delete-after --bwlimit=20000 --no-i-r -e "ssh -T -c aes128-ctr -o Compression=no -x" username@lw##.usbx.me:. transfer
```

* The only variables you will need to change here are in `username@lw##.usbx.me`
  * username = your **ORIGINAL** slot's SSH username
  * lw##.usbx.me = your **ORIGINAL** slot's server URL

So for example, if the username was `usb555` and the slot server was `LW850.usbx.me` where the original slot would be transferring my data *from*, then the transfer command would be the following 

**rsync transfer command *example*:**

```sh
rsync -aHAXxv --numeric-ids --info=progress2 --delete-after --bwlimit=20000 --no-i-r -e "ssh -T -c aes128-ctr -o Compression=no -x" usb555@lw850.usbx.me:. transfer
```

After you have copied the `rsync` transfer command with your **ORIGINAL** slot details, you will be prompted for your **ORIGINAL** slot SSH password, after you have entered your password press ENTER to start the migration. 

This initial step of `rsync` "receiving file list ..." may take some time to complete depending on the file/folder count, but rest assured the transfer will proceed to the next step of actually transferring the files

![](https://docs.usbx.me/uploads/images/gallery/2020-10/wAOehow[1].png)

After the `receiving file list ...` has finished, you will then see the transfer commencing. This example screenshot points out where you can see your transfer % progress and the estimated time for completion.

![](https://docs.usbx.me/uploads/images/gallery/2020-10/DUO0cHG[1].png)

::: info
It may take some time for the rsync process to move on to larger files to actually see these values.
:::

After the transfer is completed, you will see the text stop scrolling and will resemble the example screenshot below of a completed rsync transfer

![](https://docs.usbx.me/uploads/images/gallery/2020-10/6QuNdeq[1].png)

After confirming your rsync transfer is completed, you can then close out of your terminal screen by entering the command 

```sh
exit
```

#### Some tips on how to use the `screen` utility

* If you were to disconnect from your `screen` (closed your local SSH terminal, or lost internet temporarily for example). You can recall the `screen` back with the command

```sh
screen -rd  transfer
```

***

## Restoration of Migrated Data

In this next section, we will be restoring your data and application configuration files on your **UPGRADED** slot. 

If you have followed the above steps for migrating your **ORIGINAL** slot's data using the `rsync` transfer template command, you should now have your migrated data located in `~/transfer` on your  **UPGRADED** slot.

During this time, you may install your applications to your new slot (but do not set it up, as you will attempt to restore your configuration/data from your old slot). Once you've finished installing your applications, you may proceed to the following sections.

Refer to the Table of Contents on the left-side of this guide to jump to the relevant sections.

### Torrent Clients
#### Prerequisites

First, this restore section assumes that you have **already installed the torrent clients you plan to restore** on your upgraded slot. It is important to note here that these freshly installed torrent clients should have an **empty torrent session with no active torrents**, any current torrents that are in your clients will be removed by following this restore procedure. 

* Next, you will **need** to move your torrent's downloaded data from your migration folder `~/transfer` to your current slot's `~/files`
  * If you have only used the default download location of torrents clients `~/files` then the command in SSH to move your data will be the following

```sh
mv -f ~/transfer/files/* ~/files/
```

* If you have used custom download directory locations, then you will need to move (each) from the root of your `~/transfer` to the root of your new slot home directory
  * An example to move a custom download directory that was being used in the root of the home directory on your original slot called "SpecialDownloadFolder" would be the following

```sh
mv -f ~/transfer/SpecialDownloadFolder ~
```

* It is important to note here that Linux is case-sensitive, including directory names.

***

#### Deluge

After you have moved all torrent's data to its correct locations for Deluge seeding restoration, we can now proceed to modify Deluge session files to match that of your upgraded slot home directory. To do this, first we will be using a few SSH commands to first get the original slot's **home#**, and then another command to update your migrated rTorrent session folder data files. 

* First, you will need to stop your Deluge client with the SSH command 
 
```sh
app-deluge stop
```

* Next, to get your original slot's **home#** from your migrated rTorrent session folder, enter the following SSH command into your terminal

```sh
cat ~/transfer/.config/deluge/state/torrents.state | grep home --color
```

As you can see in the screenshot example, the `home` will be colorized to make it easier to find. The value we need to note here in the example is `home8` and we will refer to this value as ***homeOLD***

![](https://docs.usbx.me/uploads/images/gallery/2020-10/3DD61mO[1].png)

* Now, we will need to get your upgraded slot's **home#**, this can be found with the following SSH command

```sh
pwd
```

In the screenshot example, `home34` is the current home number we will be needing, which we will refer to as ***homeNEW***

![](https://docs.usbx.me/uploads/images/gallery/2020-10/vx5jS3IGl8[1].png)

* Now that we have our **homeOLD** using the `cat` command, and our **homeNEW** using the `pwd` command, we we can perform a "search and replace" using `sed` to replace all occurrences of your old **home#** with your current **home#**

**sed command *TEMPLATE*:**

```sh
sed -i 's/homeOLD/homeNEW/g' ~/transfer/.config/deluge/state/torrents.state
```

* **homeOLD** would be the **home#** you noted from the `cat` command, which is your original slot home
* **homeNEW** would be the **home#** you noted from the `pwd` command, which is your upgraded slot.

**sed command *EXAMPLE*:**

```sh
sed -i 's/home8/home34/g' ~/transfer/.config/deluge/state/torrents.state
```

* Copy the torrents to where they belong with th following SSH command:  
```
cp -a ~/transfer/.config/deluge/state/* ~/.config/deluge/state/
```

* Now that we have our Deluge session data files correctly set to our current home directory, and have moved our Deluge torrent data directories to their correct place, we can restart Deluge with the following SSH command:

```sh
app-deluge restart
```

Be sure to reload your Deluge WebUI to confirm that your migrated torrents are now in the session and running as expected.

***

#### rTorrent

After you have moved all torrent's data to its correct locations for rTorrent seeding restoration, we can now proceed to modify the session data rTorrent to match that of your upgraded slot home directory. To do this, we will be using a few SSH commands to first get the original slot's **home#**, and then another command to update your migrated rTorrent session folder data files. 

* First, you will need to stop your rTorrent client with the SSH command

```sh
app-rtorrent stop
```

* Next, to get your original slot's **home#** from your migrated rTorrent session folder, enter the following SSH command into your terminal

```sh
cat ~/transfer/.config/rtorrent/session/*.rtorrent | grep home --color
```

As you can see in the screenshot example, the `home` will be colorized to make it easier to find. The value we need to note here in the example is `home8` and we will refer to this value as ***homeOLD***

![](https://docs.usbx.me/uploads/images/gallery/2020-10/HLnouG3[1].png)


* Now, we will need to get your upgraded slot's **home#**, this can be found with the following SSH command

```sh
pwd
```

In the screenshot example, `home34` is the current home number we will be needing, which we will refer to as ***homeNEW***

![](https://docs.usbx.me/uploads/images/gallery/2020-10/jS3IGl8[1].png)

* Now that we have our **homeOLD** using the `cat` command, and our **homeNEW** using the `pwd` command,  we we can perform a "search and replace" using `sed` to replace all occurrences of your old **home#** with your current **home#**

**sed command *TEMPLATE*:**

```sh
sed -i 's/homeOLD/homeNEW/g' ~/transfer/.config/rtorrent/session/*.rtorrent
```

* **homeOLD** would be the **home#** you noted from the `cat` command, which is your original slot.
* **homeNEW** would be the **home#** you noted from the `pwd` command, which is your upgraded slot.

**sed command *EXAMPLE*:**

So for example, from the screenshot examples in this section, the `sed` command would be

```sh
sed -i 's/home8/home34/g' ~/transfer/.config/rtorrent/session/*.rtorrent
```

* Copy the torrents to where they belong with th following SSH command:  
```
cp -a ~/transfer/.config/rtorrent/session/* ~/.config/rtorrent/session/
```

* Now that we have our rTorrent session data files correctly set to our current home directory, and have moved our rTorrent torrent data directories to their correct place, we can restart rtorrent with the following SSH command:

```sh
app-rtorrent restart
```

Be sure to reload your ruTorrent WebUI to confirm that your migrated torrents are now in the session and running as expected.

***

#### Transmission

After you have moved all torrent’s data to its correct locations for Transmission seeding restoration, we can now proceed to modify the migrated session data for Transmission to match that of the upgraded slot home directory. To do this, first we will be using a few SSH commands to first get the original slot’s **home#**, and then another command to update your migrated Transmission session folder data files.

* First, you will need to stop your Transmission client with the SSH command

```sh
app-transmission stop
```
    
* Next, to get your original slot’s **home#** from your migrated rTorrent session folder, enter the following SSH command into your terminal

```sh
cat ~/transfer/.config/transmission-daemon/resume/*.resume | grep -a home --color
```

As you can see in the screenshot example, `home` will be colorized to make it easier to find. The value we need to note here in the example is `home8` and we will refer to this value as ***homeOLD***

![](https://docs.usbx.me/uploads/images/gallery/2020-10/Pcs8tXH[1].png)

* Now, we will need to get your upgraded slot's **home#**, this can be found with the following SSH command

```sh
pwd
```

In the screenshot example, `home34` is the current home number we will be needing, which we will refer to as ***homeNEW***.

![](https://docs.usbx.me/uploads/images/gallery/2020-10/SgnjS3IGl8[1].png)

* Now that we have our **homeOLD** using the `cat` command, and our **homeNEW** using the `pwd` command,  we we can perform a "search and replace" using `sed` to replace all occurrences of your old **home#** with your current ****home#****


**sed command *TEMPLATE*:**

```sh
sed -i 's/homeOLD/homeNEW/g' ~/transfer/.config/transmission-daemon/resume/*.resume
```

* **homeOLD** would be the **home#** you noted from the `cat` command, which is your original slot home
* **homeNEW** would be the **home#** you noted from the `pwd` command, which is your upgraded slot.

**sed command *EXAMPLE*:**

* So for example, from the screenshot examples in this section, the `sed` command would be

```sh
sed -i 's/home8/home34/g' ~/transfer/.config/transmission-daemon/resume/*.resume
```

* Copy the torrents to where they belong with th following SSH command:  
```
cp -a ~/transfer/.config/transmission-daemon/resume/* ~/.config/transmission-daemon/resume/
```

Now that we have our Transmission session data files correctly set to our current home directory, and have moved our Deluge torrent data directories to their correct place, we can restart Transmission with the following SSH command:

```sh
app-transmission restart
```

Be sure to reload your Transmission WebUI to confirm that your migrated torrents are now in the session and running as expected. 

***

## Restoration of Applications 

In this next section, we will be restoring your data and application configuration files for docker apps on your **UPGRADED** slot. 

If you have followed the above steps for migrating your **ORIGINAL** slot's data using the `rsync` transfer template command, you should now have your migrated data located in `~/transfer` on your **UPGRADED** slot.

Refer to the Table of Contents on the left-side of this guide to jump to the relevant sections.

### Airsonic
#### Prerequisites

* This restore section assumes that you have **already installed Airsonic** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Airsonic Configuration Data

* Stop Airsonic with the SSH command 

```sh
app-airsonic stop
```

* Rename the fresh Airsonic installation configuration data folder with the SSH command 

```sh
mv ~/.apps/airsonic ~/.apps/airsonic.fresh && mv ~/.config/airsonic ~/.config/airsonic.fresh
```

* Move your migrated Airsonic configuration data to your upgraded slot's Airsonic data location with the SSH command

```sh
mv ~/transfer/.apps/airsonic ~/.apps/airsonic && mv ~/transfer/.config/airsonic ~/.config/airsonic
```

* Run the Airsonic restart SSH command 

```sh
app-airsonic restart
```

You can now access your Airsonic WebUI URL on your upgraded slot with your migrated Airsonic configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/airsonic.fresh ~/.config/airsonic.fresh
```

***

### Bazarr
#### Prerequisites

* This restore section assumes that you have **already installed Bazarr** on your upgraded slot and is a fresh installation.
  * This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Bazarr Configuration Data

* Stop Bazarr with the SSH command

```sh
app-bazarr stop
```

* Rename the fresh Bazarr installation configuration data folder with the SSH command

```sh
mv ~/.apps/bazarr ~/.apps/bazarr.fresh
```

* Move your migrated Bazarr configuration data to your upgraded slot's Bazarr data location with the SSH command

```sh
mv ~/transfer/.apps/bazarr ~/.apps/bazarr
```

* Run the Bazarr repair SSH command

```sh
app-bazarr upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Bazarr, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Bazarr configuration data, even if the password is identical. 

You can now access your Bazarr WebUI URL on your upgraded slot with your migrated Bazarr configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/bazarr.fresh
```

***

### CouchPotato
#### Prerequisites

* This restore section assumes that you have **already installed CouchPotato** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated CouchPotato Configuration Data

* Stop CouchPotato with the SSH command

```sh
app-couchpotato stop
```

* Rename the fresh CouchPotato installation configuration data folder with the SSH command 

```sh
mv ~/.apps/couchpotato ~/.apps/couchpotato.fresh
```

* Move your migrated CouchPotato configuration data to your upgraded slot's CouchPotato data location with the SSH command


```sh
mv ~/transfer/.apps/couchpotato ~/.apps/couchpotato
```

* Run the CouchPotato repair SSH command

```sh
app-couchpotato upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for CouchPotato, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated CouchPotato configuration data, even if the password is identical. 

You can now access your CouchPotato WebUI URL on your upgraded slot with your migrated CouchPotato configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/couchpotato.fresh
```

#### Addition WebUI Required Steps for Restoring CouchPotato

* You will need to update the URL of your USB hosted download clients such as SABnzbd/NZBget/rTorrent/Deluge/Transmission.
* If you use the Jackett application on your USB slot for your indexers in CouchPotato, you will need to update your Jackett indexers URLs to reflect that of your upgraded slot's Jackett.

***

### Jackett
#### Prerequisites

* This restore section assumes that you have **already installed Jackett** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Jackett Configuration Data

* Stop Jacket with the SSH command

```sh
app-jackett stop
```

* Rename the fresh Jackett installation configuration data folder with the SSH command

```sh
mv ~/.apps/jackett ~/.apps/jackett.fresh
```

* Move your migrated Jackett configuration data to your upgraded slot's Jackett data location with the SSH command

```sh
mv ~/transfer/.apps/jackett ~/.apps/jackett
```

* Run the Jackett repair SSH command

```sh
app-jackett upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Jackett, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Jackett configuration data, even if the password is identical. 

You can now access your Jackett WebUI URL on your upgraded slot with your migrated Jackett configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command

```sh
rm -rf ~/.apps/jackett.fresh
```

***

### Jdownloader2
#### Prerequisites

* This restore section assumes that you have **already installed Jdownloader2** on your upgraded slot and is a fresh installation. 
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Jdownloader2 Configuration Data

* Stop Jdownloader2 with the SSH command 

```sh
app-jdownloader2 stop
```

* Rename the fresh Jdownloader2 installation configuration data folder with the SSH command 

```sh
mv ~/.config/jdownloader2 ~/.config/jdownloader2.fresh
```

* Move your migrated Jdownloader2 configuration data to your upgraded slot's Jdownloader2 data location with the SSH command

```sh
mv ~/transfer/.config/jdownloader2 ~/.config/jdownloader2
```

* Restart Jdownloader2 with the SSH command 

```sh
app-jdownloader2 restart
```

You can now access your Jdownloader2 WebUI URL on your upgraded slot with your migrated Jdownloader2 configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.config/jdownloader2.fresh
```

***

### LazyLibrarian
#### Prerequisites

* This restore section assumes that you have **already installed LazyLibrarian** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated LazyLibrarian Configuration Data

* Stop LazyLibrarian with the SSH command 

```sh
app-lazylibrarian stop
```

* Rename the fresh LazyLibrarian installation configuration data folder with the SSH command 

```sh
mv ~/.apps/lazylibrarian ~/.apps/lazylibrarian.fresh && mv ~/.config/lazylibrarian ~/.config/lazylibrarian.fresh
```

* Move your migrated LazyLibrarian configuration data to your upgraded slot's LazyLibrarian data location with the SSH command

```sh
mv ~/transfer/.apps/lazylibrarian ~/.apps/lazylibrarian && mv ~/transfer/.config/lazylibrarian ~/.config/lazylibrarian
```

* Run the LazyLibrarian upgrade SSH command 

```sh
app-lazylibrarian upgrade
```

You can now access your LazyLibrarian WebUI URL on your upgraded slot with your migrated LazyLibrarian configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/lazylibrarian.fresh ~/.config/lazylibrarian.fresh
```

#### Addition WebUI Required Steps for Restoring LazyLibrarian:

* You will need to update your Download Folder in your LazyLibrarian Config settings page located in the General tab.
  * If your LazyLibrarian application was using a custom directory for the eBook Library Folder setting or AudioBook Library Folder setting, you will need to update these paths to reflect their location on your upgraded slot.
    * These settings can be found at **LazyLibrarian >> Config >> Processing tab**

![](https://i.imgur.com/2YBoX1e.png)

***

### Lidarr
#### Prerequisites

* This restore section assumes that you have **already installed Lidarr** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Lidarr Configuration Data

* Stop Lidarr with the SSH command 

```sh
app-lidarr stop
```

* Rename the fresh Lidarr installation configuration data folder with the SSH command
 
```sh
mv ~/.apps/lidarr ~/.apps/lidarr.fresh
```

* Move your migrated Lidarr configuration data to your upgraded slot's Lidarr data location with the SSH command

```sh
mv ~/transfer/.apps/lidarr ~/.apps/lidarr
```

* Run the Lidarr repair SSH command 

```sh
app-lidarr upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Lidarr, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Lidarr configuration data, even if the password is identical. 

You can now access your Lidarr WebUI URL on your upgraded slot with your migrated Lidarr configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/lidarr.fresh
```

#### Addition WebUI Required Steps for Restoring Lidarr


* You will need to update your **Root Folder** settings for your music location(s). You can does this in bulk by navigating to **Library >> Mass Editor**

![](https://i.imgur.com/vME9jEI.png)

* From here you select items in bulk to then select the **Root Folder** drop-down menu. 

![](https://i.imgur.com/bgtGSiK.png)

* You will need to click **Add a Different Path** to show your upgraded slot's directory options to select the correct local directory, or remote mount directory, on your upgraded slot. 

![](https://i.imgur.com/ZzaZ8w7.png)

* After selecting the new **Root Folder** path that pertains to you upgraded slot directory of the media, click the **No, I Will Move the Files Myself** button in the dialog pop-up, and then your changes will be saved.

![](https://i.imgur.com/6V1EWfU.png) 

* You will need to update the URL of your USB hosted download clients such as SABnzbd/NZBget/rTorrent/Deluge/Transmission. 
* If you use the Jackett application on your USB slot for your indexers in Lidarr, you will need to update your Jackett indexers URLs to reflect that of your upgraded slot's Jackett.

***

### Medusa
#### Prerequisites

* This restore section assumes that you have **already installed Medusa** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`
* If you plan to use rclone/mergerfs mounts with your Medusa application, it is recommended to setup your mounts before proceeding with restoring your migrated Medusa configuration data. 

#### Steps to Restore Your Migrated Medusa Configuration Data

* Stop Medusa with the SSH command

```sh
app-medusa stop
```

* Rename the fresh Medusa installation configuration data folder with the SSH command

```sh
mv ~/.apps/medusa ~/.apps/medusa.fresh
```

* Move your migrated Medusa configuration data to your upgraded slot's Medusa data location with the SSH command

```sh
mv ~/transfer/.apps/medusa ~/.apps/medusa
```

* Run the Medusa repair SSH command

```sh
app-medusa upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Medusa, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Medusa configuration data, even if the password is identical. 

You can now access your Medusa WebUI URL on your upgraded slot with your migrated Medusa configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/medusa.fresh
```

#### Addition WebUI Required Steps for Restoring Medusa

* You will need to update your **Show Location** settings for each of your series. You can does this navigating to each series, click the **Edit** button in the top-right corner

![](https://i.imgur.com/jAP0j1H.png)

* Then on the Main Tab you will see **Show Location** to update the series location of the local directory, or remote mount directory, on your upgraded slot. 

![](https://i.imgur.com/tnJR4DP.png)

* Your **Post-Processing** directory will also need to be updated to the location of the local directory, or remote mount directory, on your upgraded slot
* You can set this by click the "Cog" icon for **Settings** and then click **Post-Processing**

![](https://i.imgur.com/7aQ52cK.png)

* From here you will see the **Post-Processing Dir** path you will need to update

![](https://i.imgur.com/Q5vh7r1.png)

***

### Mylar
#### Prerequisites

* This restore section assumes that you have **already installed Mylar** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Mylar Configuration Data

* Stop Mylar with the SSH command 

```sh
app-mylar stop
```

* Rename the fresh Mylar installation configuration data folder with the SSH command 

```sh
mv ~/.apps/mylar ~/.apps/mylar.fresh && mv ~/.config/mylar ~/.config/mylar.fresh
```

* Move your migrated Mylar configuration data to your upgraded slot's Mylar data location with the SSH command

```sh
mv ~/transfer/.apps/mylar ~/.apps/mylar && mv ~/transfer/.config/mylar ~/.config/mylar
```

* Run the Mylar repair SSH command 

```sh
app-mylar upgrade
```

You can now access your Mylar WebUI URL on your upgraded slot with your migrated Mylar configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/mylar.fresh ~/.config/mylar.fresh
```

***

### NZBget
#### Prerequisites

* This restore section assumes that you have **already installed NZBget** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated NZBget Configuration Data

* Stop NZBget with the SSH command

```sh
app-nzbget stop
```

* Rename the fresh NZBget installation configuration data folder with the SSH command

```sh
mv ~/.apps/nzbget ~/.apps/nzbget.fresh
```

* Move your migrated NZBget configuration data to your upgraded slot's NZBget data location with the SSH command

```sh
mv ~/transfer/.apps/nzbget ~/.apps/nzbget
```

* Run the NZBget repair SSH command 

```sh
app-nzbget upgrade
```

You can now access your NZBget WebUI URL on your upgraded slot with your migrated NZBget configuration restored.

To remove the fresh installation configuration data that is no longer needed, run the following SSH command

```sh
rm -rf ~/.apps/nzbget.fresh
```

#### Addition WebUI Required Steps for Restoring NZBget

* If you use NZBget for PVR applications such as Sonarr and Radarr, you will need to update your **MainDir** PATH to reflect the full path of your upgraded slot. You can find this setting at **NZBget >> Settings >> PATHS >> MainDir**
  * NZBget PATH for **MainDir** defaults to the `~/files` directory.
* You can get the full path of your `~/files` by using the following SSH command

```sh
readlink -f ~/files
```

***

### NZBHydra2
#### Prerequisites

* This restore section assumes that you have **already installed NZBHydra2** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated NZBHydra2 Configuration Data

* Stop NZBHydra2 with the SSH command 

```sh
app-nzbhydra2 stop
```

* Rename the fresh NZBHydra2 installation configuration data folder with the SSH command 

```sh
mv ~/.config/nzbhydra2 ~/.config/nzbhydra2.fresh
```

* Move your migrated NZBHydra2 configuration data to your upgraded slot's NZBHydra2 data location with the SSH command

```sh
mv ~/transfer/.config/nzbhydra2 ~/.config/nzbhydra2
```

* Run the NZBHydra2 repair SSH command 

```sh
app-nzbhydra2 upgrade
```

You can now access your NZBHydra2 WebUI URL on your upgraded slot with your migrated NZBHydra2 configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.config/nzbhydra2.fresh
```

***

### Ombi
#### Prerequisites

* This restore section assumes that you have **already installed Ombi** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`
* It's recommended to first install (and restore) the applications you intend on connecting to your Ombi such as Plex, Radarr, Sonarr, etc. 

#### Steps to Restore Your Migrated Ombi Configuration Data

* Stop Ombi with the SSH command

```sh
app-ombi stop
```

* Rename the fresh Ombi installation configuration data folder with the SSH command

```sh
mv ~/.config/ombi ~/.config/ombi.fresh
```

* Move your migrated Ombi configuration data to your upgraded slot's Ombi data location with the SSH command

```sh
mv ~/transfer/.config/ombi ~/.config/ombi
```

* Run the Ombi repair SSH command

```sh
app-ombi upgrade
```

You can now access your Ombi WebUI URL on your upgraded slot with your migrated Ombi configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.config/ombi.fresh
```

#### Addition WebUI Required Steps for Restoring Ombi

* You will need to update your connection details and root folders for your Radarr, Sonarr, Lidarr, and any other PVR applications you previously utilized in your Ombi application.
* You may need to update the connection details for your Plex.

***

### Plex Media Server
#### Prerequisites

* This restore section assumes that you have **already installed Plex** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`
* You should have your media already moved to the location(s) you will be using in your Plex libraries.
* If you plan to use rclone/mergerfs mounts with your Plex, it is recommended to setup your mounts before proceeding with restoring your migrated Plex configuration data. 

#### Steps to Restore Your Migrated Plex Configuration Data

* Stop Plex with the SSH command

```sh
app-plex stop
```

* Rename the fresh Plex installation configuration data folder with the SSH command 

```sh
mv ~/.config/plex ~/.config/plex.fresh
```

* Move your migrated Plex configuration data to your upgraded slot's Plex data location with the SSH command

```sh
mv ~/transfer/.config/plex ~/.config/plex
```

* Run the Plex repair SSH command 

```sh
app-plex upgrade
```

##### Upgrading your Plex Media Server version (Optional)

* If you do not have Plex Pass, and wish to upgraded to the latest `public` build, you will need to run the SSH command

```sh
app-plex upgrade --plex-version=public
```

* If you have Plex Pass, and wish to upgrade to the latest `beta` build, you will need to run the ssh command

```sh
app-plex upgrade --plex-version=latest
```

You can now access your Plex Media Server on your upgraded slot with your migrated Plex configuration data restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.config/plex.fresh
```

#### Addition WebUI Required Steps for Restoring Plex

* You will need to update each of your Plex library paths to reflect the local storage directories, or remote mount directories, on your upgraded slot.
  * Plex has an article located [here](https://support.plex.tv/articles/201154537-move-media-content-to-a-new-location/) on how to update your library paths.

::: info
If you are experiencing any issues with your Plex.tv account not connecting to your slot's Plex Media Server "Securely" then you may need to reclaim your Plex application with the green actions button in your UCP.
:::

***

### pyLoad
#### Prerequisites

* This restore section assumes that you have **already installed pyLoad** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated pyLoad Configuration Data

* Stop pyLoad with the SSH command 

```sh
app-pyload stop
```

* Rename the fresh pyLoad installation configuration data folder with the SSH command 

```sh
mv ~/.apps/pyload ~/.apps/pyload.fresh
```

* Move your migrated pyLoad configuration data to your upgraded slot's pyLoad data location with the SSH command

```sh
mv ~/transfer/.apps/pyload ~/.apps/pyload
```

* Run the pyLoad repair SSH command 

```sh
app-pyload upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for pyLoad, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated pyLoad configuration data, even if the password is identical.

You can now access your pyLoad WebUI URL on your upgraded slot with your migrated pyLoad configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/pyload.fresh
```

#### Addition WebUI Required Steps for Restoring pyLoad

* You will need to update your Download Folder in your pyLoad Config settings page located in the General tab. 

![](https://i.imgur.com/aPq7Gsd.png)

* The pyLoad default download location is `~/Downloads`
* To get the full path of you upgraded slot's `~/Downloads` directory, use the SSH command 

```sh
readlink -f ~/Downloads
```

***

### Radarr
#### Prerequisites

 - This restore section assumes that you have **already installed Radarr** on your upgraded slot and is a fresh installation. 
 -  This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`
 - If you plan to use rclone/mergerfs mounts with your Radarr, it is recommended to setup your mounts before proceeding with restoring your migrated Radarr configuration data. 

#### Steps to Restore Your Migrated Radarr Configuration Data

* Stop Radarr with the SSH command

```sh
app-radarr stop
```

* Rename the fresh Sonarr installation configuration data folder with the SSH command

```sh
mv ~/.apps/radarr ~/.apps/radarr.fresh
```

* Move your migrated Radarr configuration data to your upgraded slot's Radarr data location with the SSH command
```sh
mv ~/transfer/.apps/radarr ~/.apps/radarr
```

* Run the Radarr repair SSH command

```sh
app-radarr upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Radarr, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Radarr configuration data, even if the password is identical. 

You can now access your Radarr WebUI URL on your upgraded slot with your migrated Radarr configuration restored. 

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/radarr.fresh
```

#### Addition WebUI Required Steps for Restoring Radarr

* You will need to update your **Root Folder** settings for your series. You can does this in bulk by navigating to **Movies >> Movie Editor**

![](https://i.imgur.com/Bt8ItHh.png)

* From here you select items in bulk to then select the "Root Folder" drop-down menu.

![](https://i.imgur.com/ysrbymX.png)

* You will need to click **Add a Different Path** to show your upgraded slot's directory options to select the correct local directory, or remote mount directory, on your upgraded slot.
  * After selecting the new **Root Folder** path that pertains to you upgraded slot directory of the media, click the blue **Save**
  * You will see a popup dialog box that says **Done Saving** after the Root Folder changes have been saved. Please wait for this popup dialog bog to confirm the changes have been saved before navigating away from this page.
    * You may need to refresh the page after changes have been confirmed saved with the popup dialog, to reflect the updated Root Folder setting changes you have made.
* You will need to update the URL of your USB hosted download clients such as SABnzbd/NZBget/rTorrent/Deluge/Transmission.
* If you use the Jackett application on your USB slot for your indexers in Sonarr, you will need to update your Jackett indexers URLs to reflect that of your upgraded slot's Jackett.

***

### SABnzbd
#### Prerequisites

* This restore section assumes that you have **already installed SABnzbd** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated SABnzbd Configuration Data

* Stop SABnzbd with the SSH command 

```sh
app-sabnzbd stop
```

* Rename the fresh SABnzbd installation configuration data folder with the SSH command

```sh
mv ~/.apps/sabnzbd ~/.apps/sabnzbd.fresh
```

* Move your migrated SABnzbd configuration data to your upgraded slot's SABnzbd data location with the SSH command

```sh
mv ~/transfer/.apps/sabnzbd ~/.apps/sabnzbd
```

* Run the SABnzbd repair SSH command 

```sh
app-sabnzbd upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for SABnzbd, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated SABnzbd configuration data, even if the password is identical. 

You can now access your SABnzbd WebUI URL on your upgraded slot with your migrated SABnzbd configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command

```sh
rm -rf ~/.apps/sabnzbd.fresh
```

***

### Sonarr
#### Prerequisites

* This restore section assumes that you have **already installed Sonarr** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`
* If you plan to use rclone/mergerfs mounts with your Sonarr, it is recommended to setup your mounts before proceeding with restoring your migrated Sonarr configuration data. 

#### Restoring Your Migrated Sonarr Configuration Data

* Stop Sonarr with the SSH command 

```sh
app-sonarr stop
```

* Rename the fresh Sonarr installation configuration data folder with the SSH command

```sh
mv ~/.apps/sonarr ~/.apps/sonarr.fresh
```

* Move your migrated Sonarr configuration data to your upgraded slot's Sonarr data location with the SSH command

```sh
mv ~/transfer/.apps/sonarr ~/.apps/sonarr
```

* Run the Sonarr repair SSH command

```sh
app-sonarr upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Sonarr, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Sonarr configuration data, even if the password is identical. 

You can now access your Sonarr WebUI URL on your upgraded slot with your migrated Sonarr configuration restored. 

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/sonarr.fresh
```

#### Addition WebUI Required Steps for Restoring Sonarr

* You will need to update your **Root Folder** settings for your series. You can does this in bulk by navigating to **Series >> Mass Editor**

![](https://i.imgur.com/PdfcKEq.png)

* From here you can select items in bulk to then select the "Root Folder" drop-down menu. 

![](https://i.imgur.com/UDjcnp3.png)

* You will need to click "Add New Path" to show your upgraded slot's directory options.

![](https://i.imgur.com/EKys5gN.png)

* After selecting the new "Root Folder" path that pertains to your upgraded slot directory of the media, click the "No I'll Move the Files Myself" option to update the path's of your selected media. 

![](https://i.imgur.com/wQMJMUP.png)

* You will need to update the URL of your USB hosted download clients such as SABnzbd/NZBget/rTorrent/Deluge/Transmission.
  * If you use the Jackett application on your USB slot for your indexers in Sonarr, you will need to update your Jackett indexers URLs to reflect that of your upgraded slot's Jackett. 

***

### SickChill
#### Prerequisites

* This restore section assumes that you have **already installed SickChill** on your upgraded slot and is a fresh installation.
  * This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated SickChill Configuration Data

* Stop Jacket with the SSH command

```sh
app-sickchill stop
```

* Rename the fresh Jackett installation configuration data folder with the SSH command

```sh
mv ~/.apps/sickchill ~/.apps/sickchill.fresh
```

* Move your migrated Jackett configuration data to your upgraded slot's Jackett data location with the SSH command

```sh
mv ~/transfer/.apps/sickchill ~/.apps/sickchill
```

* Run the Jackett repair SSH command

```sh
app-sickchill upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for SickChill, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Jackett configuration data, even if the password is identical. 

You can now access your SickChill WebUI URL on your upgraded slot with your migrated SickChill configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/sickchill.fresh
```

#### Addition WebUI Required Steps for Restoring SickChill

* You will need to update your **Show Location** settings for each of your series
  * You can does this navigating to each series, click the "Edit" button in the top-right corner, and then on the Main Tab you will see **Show Location** to update the series location of the local directory, or  remote mount directory, on your upgraded slot.
* Your **Post Processing** directory will also need to be updated to the location of the local directory, or  remote mount directory, on your upgraded slot
  * You can find your **Post Processing** directory setting at **Settings >> Post Processing >> Post Processing Dir**

***

### Syncthing
#### Prerequisites

* This restore section assumes that you have **already installed Syncthing** on your upgraded slot and it is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Syncthing Configuration Data

* Stop Syncthing with the SSH command

```sh
app-syncthing stop
```

* Rename the fresh Syncthing installation configuration data folder with the SSH command

```sh
mv ~/.apps/syncthing ~/.apps/syncthing.fresh
```

* Move your migrated Syncthing configuration data to your upgraded slot's Syncthing data location with the SSH command

```sh
mv ~/transfer/.apps/syncthing ~/.apps/syncthing
```

* Run the Syncthing repair SSH command 

```sh
app-syncthing upgrade
```

* Navigate to your UCP and click the green "Actions" drop-down menu button for Syncthing, and select **Change Password**
  * You will need to reset your password for the authentication to work properly after restoring your migrated Syncthing configuration data, even if the password is identical. 

You can now access your Syncthing WebUI URL on your upgraded slot with your migrated Syncthing configuration restored.

To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/syncthing.fresh
```

***

### Tautulli
#### Prerequisites

* This restore section assumes that you have **already installed Tautulli** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`
* You should have your Plex application already installed and restored to confirm that your Tautulli application is connected to your Plex as intended. 

#### Steps to Restore Your Migrated Tautulli Configuration Data

* Stop Tautulli with the SSH command 

```sh
app-tautulli stop
```

* Rename the fresh Tautulli installation configuration data folder with the SSH command 

```sh
mv ~/.config/tautulli ~/.config/tautulli.fresh
```

* Move your migrated Tautulli configuration data to your upgraded slot's Tautulli data location with the SSH command

```sh
mv ~/transfer/.config/tautulli ~/.config/tautulli
```

* Run the Tautulli repair SSH command 

```sh
app-tautulli upgrade
```

You can now access your Tautulli WebUI URL on your upgraded slot with your migrated Tautulli configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.config/tautulli.fresh
```

#### Addition WebUI Required Steps for Restoring Tautulli

* Depending on how you initially had your Plex Media Center connected to your Tautulli application, you may need to set your connection settings again in Tautulli for this.

***

### Ubooquity
#### Prerequisites

* This restore section assumes that you have **already installed Ubooquity** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated Ubooquity Configuration Data

* Stop Ubooquity with the SSH command 

```sh
app-ubooquity stop
```

* Rename the fresh Ubooquity installation configuration data folder with the SSH command 

```sh
mv ~/.apps/ubooquity ~/.apps/ubooquity.fresh && mv ~/.config/ubooquity ~/.config/ubooquity.fresh
```

* Move your migrated Ubooquity configuration data to your upgraded slot's Ubooquity data location with the SSH command

```sh
mv ~/transfer/.apps/ubooquity ~/.apps/ubooquity && mv ~/transfer/.config/ubooquity ~/.config/ubooquity && mv ~/transfer/books/* ~/books/ && mv ~/transfer/downloads/* ~/downloads/
```

* Run the Ubooquity upgrade SSH command 

```sh
app-ubooquity upgrade
```

You can now access your Ubooquity WebUI URL on your upgraded slot with your migrated Ubooquity configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/ubooquity.fresh ~/.config/ubooquity.fresh
```

***

### ZNC
#### Prerequisites

* This restore section assumes that you have **already installed ZNC** on your upgraded slot and is a fresh installation.
* This restore step also assumes that you have **already migrated your original slot data** and the migrated data is located in a folder named "transfer" in your home directory: `~/transfer`

#### Steps to Restore Your Migrated ZNC Configuration Data

* Stop ZNC with the SSH command 

```sh
app-znc stop
```

* Rename the fresh ZNC installation configuration data folder with the SSH command 

```sh
mv ~/.apps/znc ~/.apps/znc.fresh && mv ~/.config/znc ~/.config/znc.fresh
```

* Move your migrated ZNC configuration data to your upgraded slot's ZNC data location with the SSH command

```sh
mv ~/transfer/.apps/znc ~/.apps/znc && mv ~/transfer/.config/znc ~/.config/znc
```

* Run the ZNC restart SSH command 

```sh
app-znc restart
```

You can now access your ZNC WebUI URL on your upgraded slot with your migrated ZNC configuration restored.

* To remove the fresh installation configuration data that is no longer needed, run the following SSH command 

```sh
rm -rf ~/.apps/znc.fresh ~/.config/znc.fresh
```