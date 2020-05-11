In this guide we will detail the initial configuration of Emby. This assumes that you have the following:


* An UltaSeedbox service of at least Jaguar-Plex or higher
* A source for media to populate your Emby server - see [Sonarr](https://docs.usbx.me/books/sonarr) and [Radarr](https://docs.usbx.me/books/radarr)
* Your media is saved to `~/media`

The initial setup is all performed using setup wizard so the process is relatively intuitive.

***

## Initial Setup
### Emby Initial Setup Wizard

* Once you installed and launch the app, the setup wizard will run. Select your preferred language to start.
  * For the purposes of this guide we will be using the English (United States) option.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/cfQWizard-1.PNG)


* Enter a name and select a password for the account
  * This account will be the main account on your Emby server. You will be able to create extra accounts later.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/uurWizard-2.PNG)


* Click the large plus button and create libraries for your media server. In this guide we will be creating a Movies and a TV Shows library.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/JIJWizard-3.PNG)

* Choose the Content type. Here, we will be using TV Shows
  * Set a name that you want.
    * It'll default to TV Shows and we will be leaving the default in this guide

* The default folder for TV Shows on your UltraSeedbox server is `homexx/username/media/TV`
* The rest of the settings are optional. You may wish to change some dependent on your personal preferences however they are not necessary and therefore will not be covered in this guide.

* Once this is done, select the Ok button.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/bp4Wizard-4.PNG)

* Repeat the same procedure for Movies, Music and any other media folders you wish to add.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/cuDWizard-5.PNG)

* Here you can choose your default metadata settings. These are used when you don't set anything in the individual Media Library settings.
  * For this guide we will be using English for the Language and United States for the Country

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/CivWizard-6.PNG)

* Here, you can configure Remote Access.
* Leave the settings on this page to default. It will work automatically with the preconfigured UltraSeedbox reverse proxy.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/5ECWizard-7.PNG)

* Here you will need to read and accept the ToS to use the Emby server. Emby's ToS are seperate from ours and also need to be abide by when using Emby.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-8.PNG)

* Once you accepted the ToS, you'll be shown the finished setup page. Here, you are able to check out some client applications. Click Finish to be taken to the Emby media server.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-9.PNG)

***

## UI Overview

The Emby UI is fairly straightforward - what you will see is dependent on how your libraries are set up and populated however. If you followed the above steps and created a Media and TV Shows library you will see both of these - dependent on how populated your server is you are also likely to see recommended shows and shows to continue watching.

As an admin you will have access to the Admin Dashboard which is the cog icon up the top right.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Main-UI.PNG)

***

## Settings Pages Overview

### Main Dashboard

* Here you can see some quick information about your server such as it's name, recent logins, current active devices and even more.
* Along the left are different settings tabs - we will be covering the Settings, Users, Library and Transcoding tabs in this guide.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Dashboard.PNG)

### Settings

* Here you can reconfigure the main display language of Emby.
* A few other settings are available
  * The cache path should be left blank - there is no reason to change this
  * Allowing the server to restart won't actually take effect as the server is dockerised
  * You can also set a login message or custom CSS for the web client

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Settings.PNG)

### Users

* Here you may create extra users for your Emby server.
* Simply click the '+' button and set a username and password. You also have the option to configure what libraries each user has access to.
* Please keep in mind that the reselling and public sharing of our services is strictly forbidden - the creation of extra users is meant only for family members and friends.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Users.PNG)

#### Library

* Here, you can change settings for pre-existing libraries such as the ones you may have configured in the Wizard.
* You may also create extra libraries too.
* The Advanced tab allows you to change some settings to personalise the appearance of your libraries. Under the metadata tab you can change the default metadata settings that you would've chosen during the Wizard.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Library.PNG)

#### Transcoding

* This allows you to use hardware transcoding when a client device does not support the file type in question.
  *  GPU transcoding is available to Pro NVME plans. 
  * However, with Emby you need an Emby Premiere subscription to take advantage of this. If you have an Emby Premiere subscription be sure that Enable hardware encoding is set to Yes.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Transcoding.PNG)