**Emby** is a proprietary media server written in C# that organize, play, and stream audio and video to a variety of devices. Prior to Emby 3.5.3 release (and subsequently Emby 3.6 which has since been closed-source), Emby's source code was initially an open-source project with subsequent releases being released to their website are marked as proprietary. [Jellyfin](https://docs.usbx.me/books/jellyfin) is the fork of Emby prior of re-license.

For more information about this app, please visit [this link.](https://emby.media/about.html)

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568990319987.png)

## Initial Setup

In this section, we will detail the initial configuration of Emby. This assumes that you have the following:

* An UltaSeedbox service of at least Jaguar-Plex or higher
* A source for media to populate your Emby server - see [Sonarr](https://docs.usbx.me/books/sonarr) and [Radarr](https://docs.usbx.me/books/radarr)
* Your media is saved to `~/media`

The initial setup is all performed using the setup wizard so the process is relatively intuitive.

### Emby Initial Setup Wizard

* Once you installed and launch the app, the setup wizard will run. Select your preferred language to start.
  * For the purposes of this guide we will be using the English (United States) option.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/cfQWizard-1.PNG)

* Enter a name and select a password for the account
  * This account will be the main account on your Emby server. You will be able to create extra accounts later.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/uurWizard-2.PNG)

* Click the large plus button and create libraries for your media server. In this guide we will be creating a Movies and a TV Shows library.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/JIJWizard-3.PNG)

* Choose the Content type. Here, we will be using TV Shows
  * Set a name that you want.
    * It'll default to TV Shows and we will be leaving the default in this guide
* The default folder for TV Shows on your UltraSeedbox server is `homexx/username/media/TV`
* The rest of the settings are optional. You may wish to change some dependent on your personal preferences however they are not necessary and therefore will not be covered in this guide.

* Once this is done, select the Ok button.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/bp4Wizard-4.PNG)

* Repeat the same procedure for Movies, Music and any other media folders you wish to add.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/cuDWizard-5.PNG)

* Here you can choose your default metadata settings. These are used when you don't set anything in the individual Media Library settings.
  * For this guide we will be using English for the Language and United States for the Country

![](https://docs.usbx.me/uploads/images/gallery/2019-11/CivWizard-6.PNG)

* Here, you can configure Remote Access.
* Leave the settings on this page to the default settings. It will work automatically with the preconfigured UltraSeedbox reverse proxy.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/5ECWizard-7.PNG)

* Here you will need to read and accept the ToS to use the Emby server. Emby's ToS are separate from ours and also need to be abide by when using Emby.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-8.PNG)

* Once you accepted the ToS, you'll be shown the finished setup page. Here, you are able to check out some client applications. Click Finish to be taken to the Emby media server.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/Wizard-9.PNG)

## Troubleshooting Information

**Why does Emby connect not work? Which port should I use in my Emby Client?**

Due to our infrastructure, Emby Connect doesn't work because it's looking for Emby instances on their default port (8096). You may have to just manually connect under `manually connect server` or a similar option. Listed below are the client connection details that you will enter.

### All Clients
#### SSL

```
URL: https://username.servername.usbx.me/emby
Port: Leave blank

Username: Your slot's username that you entered during signup
Servername: The lw followed by three digits (e.g. lw123)
```

#### Non-SSL

```
URL: servername.usbx.me
Port: Emby Port Under Applications -> Emby

Username: Your slot's username that you entered during signup
Servername: The lw followed by three digits (e.g. lw123)
```