The purpose of this guide is to explain the configuration of SABnzbd, detailing what options are useful within the USB environment and what you may want to change. 

Most settings pages will be covered, however a few will not be as I do not recommend you change them. The pages I am not covering in this guide are as follows:

* Switches
* Notifications
* Special

If you wish to learn more about these settings please refer to SABnzbd's official documentation.

To use SABnzbd, you may need the following:

* A Usenet service provider, you can find a list of different providers here: [https://www.reddit.com/r/usenet/wiki/providers](https://www.reddit.com/r/usenet/wiki/providers)
* An indexer to obtain `.nzb` files, these are used to tell the server where to find the files

***

## Initial Setup
### Initial Setup Wizard

* Upon connecting, you'll be greeted by SABnzbd's setup wizard. 
* Select your preferred language.
  * This guide will be assuming you selected English, however feel free to choose any other language, you will just need to translate the guide.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/1-Wizard.PNG"></p>

* Input your usenet service provider's server details; Host, Username and Password.
* Tick SSL if you wish to use SSL, keep in mind this comes with a performance overhead and may degrade download speed.
* Enter the port that your provider tells you to use, if you chose SSL you will need to use the SSL port.
* You will be assigned a certain amount of connections, you're usually best off using the maximum amount allowed. 
* Once everything is configured, click Test Server to verify the connection is working correctly.
* After click Next, you will need to close the tab and reconnect by clicking the link in UCP.
  * The address SABnzbd forwards you to after completing the initial setup is incorrect.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/2-Wizard-Server-Setup.PNG"></p>

## UI and Settings Overview
### UI Overview

* Here is the main screen of SABnzbd. In the center is your queue, you can drag an NZB file into here to initiate a download. If you have files currently queued you can make changes/delete them from here.
* In the top left you are able to pause/resume the entire client, you can also click the dropdown to pause for a certain amount of time.
* In the box in the top right you have your download speed controls, from here you can set a max download speed to prevent other clients such as torrent clients from being starved of bandwidth.
* By default SABnzbd will sort downloads to `$HOME/.sabnzbd/Downloads/complete` where `$HOME` is your seedbox slot full path.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/10-UI.PNG"></p>

### Setting Pages Overview
#### General

* In this page, you will find the `API key` if you are setting up SABnzbd with Sonarr/Radarr or any other automation tool that supports usenet. Keep this key private and if you suspect somebody else is using it click the refresh button to get a new one.
* The rest of the options can be left as-is.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/3-General-Settings.PNG"></p>

#### Folders

* By default SABnzbd will sort downloads to `$HOME/.sabnzbd/Downloads/complete` where `$HOME` is your seedbox slot full path.
  * You can get your seedbox full path by doing `pwd` on SSH.
* You may wish to change `Completed Downloads Folder` to something easier to navigate to, such as `{home}/{user}/Downloads` or `{home}/{user}/Media`.
  * If you're using any automation tools such as Sonarr, Radarr or Medusa, we'd recommend keeping this by default.
* If you wish you can set a watch folder, this enables you to copy .nzb files to this folder and SABnzbd will automatically start downloading them.
* The other settings here can be left as-is.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/Folders.PNG"></p>

#### Servers

* Here, you can modify the server you enabled during the initial config wizard, or add extra servers from the same provider or another provider.
* Reasons you may want to use multiple servers include:
  * *Speed*, sometimes different servers will provide better speeds
  * *Retention*, some providers may have greater retention than others. Using a mix of different providers allows you to use a cheaper unlimited but short retention plan, mixed with a limited but longer retention plan.
  * *Completion*, different providers fall under different copyright law. Using a mix of providers from different regions allows you to have better completion, if a download fails on one provider SABnzbd will try with another one.

* You can also set some retention time here. This allows you to specify the length of retention each provider has to avoid pointlessly trying to complete a download that is out of your provider's retention.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/5-Server-Settings.PNG"></p>

#### Categories

* Here we are able to set up different categories.
* Different categories enable SABnzbd to sort completed downloads to specified locations
  * This is useful for automation tools such as Sonarr/Radarr and also for feeding your downloads directly into Plex.
* When setting up SABnzbd in Sonarr/Radarr you can specify what category the download should be sorted under.
* You can also set indexer categories
  * This allows SABnzbd to match the categories your indexer users to the categories you have set up.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/6-Categories-Settings.PNG"></p>

#### Sorting

* The Sorting section allows for extension of the Categories system. Sorting allows us to specify different folder structures for different categories.
* A useful implementation of this feature would be to sort different TV shows into their own respective folders based on series title/number.
* While SABnzbd's sorting feature is handy and relatively powerful, I would recommend using Sonarr/Radarr's built-in sorting or a tool like Filebot.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/7-Sorting-Settings.PNG"></p>

#### Scheduling

* Scheduling allows you to set times at which SABnzbd can be active.
* This may be useful for if you wish to also use your box to race. As Usenet is quite fast and also involves unpacking your files from RAR archives once downloaded, it can negatively impact the performance of other applications.
* Setting SABnzbd and Autodl-irssi to download at different times may be useful for you in some scenarios.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/8-Scheduling-Settings.PNG"></p>

#### RSS

* Some indexers may support RSS feeds to automatically create a list of desired downloads as they become available.
* You can set up an RSS feed to automatically download within this section.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-09/9-RSS-Settings.PNG"></p>