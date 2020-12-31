**Bazarr** is a companion application to Sonarr and Radarr that manages and downloads subtitles. Some of the features of this app are the following:

* Downloads subtitles automatically using your set subtitle sources, languages, etc.
* Automatically scans and upgrade previously downloaded subtitles
* Integration with Sonarr and Radarr

Be aware that Bazarr doesn't scan your seedbox to detect series and movies: It only takes care of the series and movies that are indexed in Sonarr and Radarr.

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568616619506.png)

***

## Initial Setup

In this guide, we’ll be setting up Bazarr for the first time. This guide assumes the following:

* You’ll be setting up your library for the first time and your library is saved locally under `~/media`
* You have both Radarr and Sonarr installed and configured

We’ll be doing the following steps:

1. Setting up subtitle providers
2. Connecting Sonarr and Radarr
3. Setting up username and password

### Setting Up Subtitle Providers

* Upon successful installation, wait for up to 5 minutes for Bazarr to initialize.
* After clicking **Connect** on the UCP, you’ll be shown with Bazarr’s General settings.
* On subtitles options section, Leave all options as-is
  * Plex requires that subtitle files should be at the same location as your movie file for it to be detected
   * You may add the API key or account login for any anti-captcha service you may use on this page, included are **Anti-Captcha or Death by Captcha** If you happen to add one of these options be sure to press Save in the top left-hand corner

![](https://i.imgur.com/dOvoopM.png)

* Then enable the subtitle providers that you wish to use click Providers on the left-hand side tick your required providers and click save to complete the providers' page
  * Some providers require you to add your credentials. Be sure to enter it accordingly
  * There are also some providers that needed an anti-captcha API key.
   
![](https://i.imgur.com/RF67f3d.png)

* Under languages on the left-hand side, click the drop-down box on enabled languages and select your preferred languages for Bazarr to search

![](https://i.imgur.com/Mskn9nw.png)

* Then you can set the defaults for both Series and Movies
  * Here, you can set the default parameters and languages that you wish to search and download.
  * You can leave them as default and set them later or do it now, as shown in the following screenshot

![](https://i.imgur.com/zZpZsiF.png)

* Once that’s done, click **Next**

### Connecting Sonarr and Radarr to Bazarr

* Login to your Sonarr instance and go to **Settings -> General**

![](https://i.imgur.com/MqtNFJh.png)

* Then under Security, copy the API key provided

![](https://i.imgur.com/NHPLgKv.png)

* Go back to Bazarr. Under Settings> Sonarr, enable Use Sonarr and input the following

```
Hostname or IP address: username.lwxxx.usbx.me
Listening port: 443
Base URL: /sonarr
SSL enabled: On
API Key: >paste Sonarr API key here<
Download Only Monitored: Enabled (Recommended)
```

* Once that’s done, Click the **Test** button to validate the settings.
* If it shows a green text indicating that Bazarr is successfully connected to Sonarr.

![](https://i.imgur.com/KiWYQcl.png)

* Repeat the same steps on Radarr, using the following information:

```
Hostname or IP address: username.lwxxx.usbx.me
Listening port: 443
Base URL: /radarr
SSL enabled: On
API Key: >paste Radarr API key here<
Download Only Monitored: Enabled (Recommended)
```

* To get Radarr's API key, select **Settings -> General** and copy the API key Under Security Settings

![](https://i.imgur.com/I0kyZPq.png)

![](https://i.imgur.com/hvI2Hvm.png)

![](https://i.imgur.com/ionYkTe.png)

* Click **Save** to save your changes once testing is passed

![](https://i.imgur.com/1uQaRkQ.png)

### Setting Up Username and Password

* Click **Settings**

![](https://i.imgur.com/SOha9cU.png)

* Then on General settings, under Security settings Click on the **Authentication dropbox** and select either **Basic** (browser popup) or **Forms** (Login Page).
  * We recommend selecting Forms (Login page) since it is non-intrusive and works on password managers

![](https://i.imgur.com/mZ4qcGC.png)

![](https://i.imgur.com/laawLAE.png)

* Then input the credentials that you want
* Once that’s done, click **Save** 
* Wait for a few seconds and refresh. It’ll redirect directly to your login page. Login using your set credentials to proceed.

![](https://i.imgur.com/L8yFG4F.png)

### Downloading Subtitles

* At initial setup, Bazarr will add your existing entries on your Sonarr/Radarr instances search for existing subtitles from their root folders. Both series/movie entries are found in Series and Movies respectively.

![](https://i.imgur.com/1wIkOlm.png)

![](https://i.imgur.com/dHpQDxI.png)

* If there are no entries on either of the two, you can force to refresh by going to System -> Tasks (Red Box) and click the Refresh icon on the following tasks in order.
  * Update Series list from Sonarr
  * Update Movie list from Radarr
  * Update all Episode Subtitles from disk
  * Update all Movie Subtitles from disk
* Depending on the size of your library, this could take a while.

![](https://i.imgur.com/aBLftC0.png)

* If everything is set, you can now download subtitles. You can opt to do the following
  * Let Bazarr download the subtitles by itself. There's an automated task that downloads wanted subtitles daily.
  * Force Bazarr to download wanted subtitles by either
    * Going to Wanted and click **Search All** on Series or Movies

![](https://i.imgur.com/5RMxDhM.png)

![](https://i.imgur.com/4tgbeCy.png)

  * Go to **System -> Tasks** and click the following
    * Update all Episode Subtitles from disk
    * Update all Movie Subtitles from disk

![](https://i.imgur.com/2hFF1rD.png)

* Depending on your library, this will take a while to search and download your subtitles.