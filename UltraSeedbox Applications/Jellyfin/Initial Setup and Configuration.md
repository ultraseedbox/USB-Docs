In this guide we will detail the initial configuration of Jellyfin. This assumes that you have the following:


* An UltaSeedbox service of at least Jaguar-Plex or higher
* A source for media to populate your Jellyfin server - see [Sonarr](https://docs.usbx.me/books/sonarr) and [Radarr](https://docs.usbx.me/books/radarr)
* Your media is saved to `~/media`

The initial setup is all performed using setup wizard so the process is relatively intuitive.

***

## Initial Setup
### Jellyfin Initial Setup Wizard

* Once you installed and launch the app, the setup wizard will run. Select your preferred language to start.
  * For the purposes of this guide we will be using the English (United States) option.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-1.PNG"></p>

* Enter a name and select a password for the account
  * This account will be the main account on your Jellyfin server. You will be able to create extra accounts later.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-2.PNG"></p>

* Click the large plus button and create libraries for your media server. In this guide we will be creating a Movies and a TV Shows library.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-3.PNG"></p>

* Choose the Content type. Here, we will be using TV Shows
  * Set a name that you want.
    * It'll default to TV Shows and we will be leaving the default in this guide
* The default folder for TV Shows on your UltraSeedbox server is `homexx/username/media/TV`
* The rest of the settings are optional. You may wish to change some dependent on your personal preferences however they are not necessary and therefore will not be covered in this guide.

* Once this is done, select the Ok button.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-5.PNG"></p>

Click the plus once more to set up your Movies library

* Repeat the same procedure for Movies, Music and any other media folders you wish to add.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-4.PNG"></p>

* Here you can choose your default metadata settings. These are used when you don't set anything in the individual Media Library settings.
  * For this guide we will be using English for the Language and United States for the Country

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-6.PNG"></p>

* Here, you can configure Remote Access.
* Leave the settings on this page to default. It will work automatically with the preconfigured UltraSeedbox reverse proxy.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-7.PNG"></p>

***

### UI Overview

The Jellyfin UI is fairly straightforward - what you will see is dependent on how your libraries are set up and populated however. If you followed the above steps and created a Media and TV Shows library you will see both of these - dependent on how populated your server is you are also likely to see recommended shows and shows to continue watching.

As an admin you will have access to the Admin Dashboard which is the icon with a four rectangles up the top right.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/1.PNG"></p>

***

## Settings Pages Overview
### Main Dashboard

* Here you can see some quick information about your server such as it's name, recent logins, current active devices and even more.
* Along the left are different settings tabs - we will be covering the Settings, Users, Library and Transcoding tabs in this guide.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Dashboard-1.PNG"></p>

### General

* Here you can reconfigure the main display language of Jellyfin.
* A few other settings are available
  * The cache path should be left blank - there is no reason to change this
  * Allowing the server to restart won't actually take effect as the server is dockerised
  * You can also set a login message or custom CSS for the web client

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Dashboard-2.PNG"></p>

### Users

* Here you may create extra users for your Jellyfin server.
* Simply click the '+' button and set a username and password. You also have the option to configure what libraries each user has access to.
* Please keep in mind that the reselling and public sharing of our services is strictly forbidden - the creation of extra users is meant only for family members and friends.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Dashboard-3.PNG"></p>

### Library

* Here, you can change settings for pre-existing libraries such as the ones you may have configured in the Wizard.
* You may also create extra libraries too.
* The Advanced tab allows you to change some settings to personalise the appearance of your libraries. Under the metadata tab you can change the default metadata settings that you would've chosen during the Wizard.

[![Dashboard-4.PNG](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/Dashboard-4.PNG"></p>](https://docs.usbx.me/uploads/images/gallery/2019-11/Dashboard-4.PNG"></p>

### Playback

* This allows you to use hardware transcoding when a client device does not support the file type in question.
  * GPU transcoding is available to Pro NVME plans. 
  * Unlike Plex or Emby, GPU transcoding is free to use.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Dashboard-5.PNG"></p>