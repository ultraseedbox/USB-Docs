In this guide, we’ll be setting up Bazarr for the first time. This guide assumes the following:

* You’ll be setting up your library for the first time and your library is saved locally under `~/media`
* You have both Radarr and Sonarr installed and configured

We’ll be doing the following steps:

1. Setting up subtitle providers
2. Connecting Sonarr and Radarr
3. Setting up username and password

***

## Initial Setup
### Setting Up Subtitle Providers

* Upon successful installation, wait for up to 5 minutes for Bazarr to initialize.
* After clicking **Connect** on the UCP, you’ll be shown with Bazarr’s first-time setup guide.
* You may leave the first page as-is. Click **Next** to save and move on to the next step
* Here, we will set up subtitle providers.
* On subtitles options section, leave both options as-is
  * Plex requires that subtitle files should be at the same location as your movie file for it to be detected

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583144550353.png">
</p>

* Then enable the subtitle providers that you wish to use
  * Some providers require you to add your credentials. Be sure to enter it accordingly
  * There are also some providers that needed an anti-captcha API key.
    * You may add the API key after the setup has finished under **Settings -> Subtitles -> Anti-Captcha Options**

<p align ="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583144623799.png">
</p>

* Under Subtitle languages, click the drop-down box on enabled languages and select your preferred languages for Bazarr to search

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583144684332.png>
</p>

* Then you can set the defaults for both Series and Movies
  * Here, you can set the default parameters and languages that you wish to search and download.
  * You can leave them as default and set them later or do it now, as shown in the following screenshot

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-04/firefox_2aAn2QiG5i[1].png">
</p>

* Once that’s done, click **Next**

### Connecting Sonarr and Radarr to Bazarr

* Login to your Sonarr instance and go to **Settings -> General**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583146447858.png">
</p>

* Then under Security, copy the API key provided

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583146641628.png">
</p>

* Go back to Bazarr. Under Sonarr, enable Use Sonarr and input the following

```
Hostname or IP address: username.lwxxx.usbx.me
Listening port: 443
Base URL: /sonarr
SSL enabled: On
API Key: >paste Sonarr API key here<
Download Only Monitored: Enabled (Recommended)
```

* Once that’s done, Click the **Test** button to validate the settings.
* If it shows a green text indicating that Bazarr is successfully connected to Sonarr, click **Next** to move to Radarr

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583146810530.png">
</p>

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

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583147755658.png">
</p>

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583147843356.png">
</p>

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583147908422.png">
</p>

* Click **Save** to save your changes once testing is passed

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148067332.png">
</p>

* Then click **Restart** on the red banner to restart the instance to properly apply the changes

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148108636.png">
</p>

### Setting Up Username and Password

* Click **Settings**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148199535.png">
</p>

* Then on General settings, under Security settings Click on the **Authentication dropbox** and select either **Basic** (browser popup) or **Forms** (Login Page).
  * We recommend selecting Forms (Login page) since it is non-intrusive and works on password managers

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148270049.png">
</p>

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148338632.png">
</p>

* Then input the credentials that you want

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148419788.png">
</p>

* Once that’s done, click **Save** and restart the instance when prompted

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148452418.png">
</p>

* Wait for a few minutes. It’ll redirect directly to your login page. Login using your set credentials to proceed.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148543220.png">
</p>

### Downloading Subtitles

* At initial setup, Bazarr will add your existing entries on your Sonarr/Radarr instances search for existing subtitles from their root folders. Both series/movie entries are found in Series and Movies respectively.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148848038.png">
</p>

* If there are no entries on either of the two, you can force to refresh by going to System -> Tasks (Red Box) and click the Refresh icon on the following tasks in order.
  * Update Series list from Sonarr
  * Update Movie list from Radarr
  * Update all Episode Subtitles from disk
  * Update all Movie Subtitles from disk
* Depending on the size of your library, this could take a while.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149148784.png">
</p>

* If everything is set, you can now download subtitles. You can opt to do the following
  * Let Bazarr download the subtitles by itself. There's an automated task that downloads wanted subtitles daily.
  * Force Bazarr to download wanted subtitles by either
    * Going to Wanted and click **Download Wanted Subtitles on Series** and/or Movies

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149680566.png">
</p>

  * Go to **System -> Tasks** and click the following
    * Update all Episode Subtitles from disk
    * Update all Movie Subtitles from disk

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149549373.png">
</p>

* Depending on your library, this will take a while to search and download your subtitles.