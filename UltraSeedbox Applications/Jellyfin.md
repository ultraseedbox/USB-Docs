**Jellyfin** is a Free and Open Source Media System that is forked from Emby's 3.5.2 and ported to the .NET Core framework to enable full cross-platform support. It is slowly becoming one of the great alternatives to closed sourced solutions such as Plex, Emby and Kodi as a way to serve media from our slots to you via multiple apps.

For more information about this app, you may visit [this link.](https://jellyfin.org/)

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571296377294.png)

## Initial Setup

In this section we will detail the initial configuration of Jellyfin. This assumes that you have the following:

* An UltaSeedbox service of at least Jaguar-Plex or higher
* A source for media to populate your Jellyfin server - see [Sonarr](https://docs.usbx.me/books/sonarr) and [Radarr](https://docs.usbx.me/books/radarr)
* Your media is saved to `~/media`

The initial setup is all performed using the setup wizard so the process is relatively intuitive.

### Jellyfin Initial Setup Wizard

* Once you installed and launch the app, the setup wizard will run. Select your preferred language to start.
  * For the purposes of this guide we will be using the English (United States) option.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-1.PNG)

* Enter a name and select a password for the account
  * This account will be the main account on your Jellyfin server. You will be able to create extra accounts later.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-2.PNG)

* Click the large plus button and create libraries for your media server. In this guide we will be creating Movies and a TV Show library.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-3.PNG)

* Choose the Content-type. Here, we will be using TV Shows
  * Set a name that you want.
    * It'll default to TV Shows and we will be leaving the default in this guide
* The default folder for TV Shows on your UltraSeedbox server is `homexx/username/media/TV`
* The rest of the settings are optional. You may wish to change some dependent on your personal preferences however they are not necessary and therefore will not be covered in this guide.

* Once this is done, select the Ok button.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-5.PNG)

Click the plus once more to set up your Movies library

* Repeat the same procedure for Movies, Music and any other media folders you wish to add.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-4.PNG)

* Here you can choose your default metadata settings. These are used when you don't set anything in the individual Media Library settings.
  * For this guide we will be using English for the Language and United States for the Country

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-6.PNG)

* Here, you can configure Remote Access.
* Leave the settings on this page to the default settings. It will work automatically with the preconfigured UltraSeedbox reverse proxy.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-7.PNG)

## Jellyfin Client Connection Details

```
URL: username.servername.usbx.me/jellyfin

Username: Your slot's username that you entered during signup
Servername: The lw followed by three digits (e.g. lw123)
```