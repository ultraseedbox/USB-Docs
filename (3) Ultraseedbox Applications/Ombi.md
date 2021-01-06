**Ombi** is a self-hosted web application that automatically gives your shared Plex or Emby users the ability to request content by themselves! Ombi can be linked to multiple TV Show and Movie DVR tools to create a seamless end-to-end experience for your users. Some of the features in this app are:

* Lets users request Movies, Music, and TV Shows (whether it being the entire series, an entire season, or even single episodes.)
* Easily manage your requests
* Allows you to set specific users to automatically have requests approved and added to the relevant service
* User management system (supports Plex, Emby and local accounts)
* Allows your users to get custom notifications
* Will show if the request is already on Plex or even if it's already monitored.
* Automatically updates the status of requests when they are available on Plex/Emby
* Slick, responsive and mobile-friendly UI

For more information about this app, you may visit the app's [GitHub repo.](https://github.com/tidusjar/Ombi)

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571304567853.png)

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571304696162.png)

***

## Initial Setup

In this setup, we'll be setting up Ombi for the first time. This assumes the following:

* You've setup a download client and a media library manager
* You have a media server installed

### Setup Login

* Upon installation, once you clicked Connect you'll be greeted by Ombi's Setup Wizard. This will guide you through setting up Ombi. Click Next to continue

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583158784180.png)

*  The next page asks for either the media center of your choice or to skip this step. We recommend skipping this so press Skip

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1588617188871.png)

* Next page will be creating an Admin account. Enter your preferred credentials here.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1588617282425.png)

* Once that's done, enter your set credentials to login.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1588617326283.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1588617502703.png)

### Setting Ombi

* To enter setup, go to Settings

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1588618407086.png)

* Then, here you can add your app details here. Please refer below for connecting apps to your Ombi instance.

### Connection Details
#### Media Server
##### Plex

```
1. Enter Plex Username and Password then click Load Servers
2. Select your Plex server from you dropdown
3. Change Port to 32400
4. Select Load Libraries and select the libraries you want
```

##### Emby/Jellyfin
###### Emby

```
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
SSL: Checked
Emby API Key: {Emby API Key}
Externally Facing Hostname: https://{username}.{servername}.usbx.me/emby
```

###### Jellyfin

```
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
SSL: Checked
Emby API Key: {Jellyfin API Key}
Externally Facing Hostname: https://{username}.{servername}.usbx.me/jellyfin
```
#### TV
##### Sonarr

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Sonarr API Key}
SSL: Checked
Base URL: /sonarr
```

#### Movies
##### Radarr

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Radarr API Key}
SSL: Checked
Base URL: /radarr
```

##### CouchPotato SSL

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {CouchPotato API Key}
SSL: Checked
Base URL: /{username}/couchpotato
```

## Troubleshooting Information

**Why are Ombi’s movie & TV Shows search function not working?**

Recent versions of Ombi, when upgraded, had some issues with their database. To fix this, run the following command on your slot’s shell.

```sh
rm -f “$HOME”/.config/ombi/OmbiExternal.db && app-ombi upgrade
```

**Why are Ombi’s movie & TV shows requests to Radarr and/or Sonarr not working?**

Please check your Ombi connection settings if they’re correct. Please check the guide [here ](https://docs.usbx.me/books/ombi/page/ombi-client-connection-details)and compare it to yours.
