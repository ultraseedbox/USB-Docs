In this guide we will detail the initial configuration of Jellyfin. This assumes that you have the following:


* An UltaSeedbox service of at least Jaguar-Plex or higher
* A source for media to populate your Jellyfin server - see [Sonarr](https://docs.usbx.me/books/sonarr) and [Radarr](https://docs.usbx.me/books/radarr)
* Your media is saved to `~/media`

The initial setup is all performed using the setup wizard so the process is relatively intuitive.

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
* The default folder for TV Shows on your Ultraseedbox server is `homexx/username/media/TV`
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
* Leave the settings on this page to the default settings. It will work automatically with the preconfigured Ultraseedbox reverse proxy.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-7.PNG"></p>

***

### UI Overview

The Jellyfin UI is fairly straightforward - what you will see is dependent on how your libraries are set up and populated however. If you followed the above steps and created a Media and TV Shows library you will see both of these - dependent on how populated your server is you are also likely to see recommended shows and shows to continue watching.

As an admin you will have access to the Admin Dashboard which is the icon with four rectangles up the top right.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/1.PNG"></p>