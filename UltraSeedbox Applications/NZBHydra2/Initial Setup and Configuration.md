This guide will show you how to setup NZBHydra2 for the first time. You'll be doing the following steps

* Setting Up Username and Password
* Add Usenet Indexers
* Getting NZBHydra2 API for use with other programs

***

## Initial Setup
### Setting Up your Username and Password

* Upon connecting, you'll be greeted by this window. Click OK to close the window. 

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591625119631.png"></p>

* Go to **Config -> Authorization**
* Choose the auth type that you want. In this guide, we'll be using **Login form**
* Under **Restrictions**, enable everything.
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591775421009.png"></p>
* Scroll down and click **Add user**. Then add the username and password that you wish. Since this is your first user, it's best to leave **May see admin area** to on.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591625351138.png"></p>
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591625501126.png"></p>

* Once that's done, scroll up and click **Save** and restart when asked.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591625601580.png"></p>

* You may also set more user accounts and restrict certain areas of the instance in this page.

### Add Usenet Indexers

* Go to **Indexers** and click **Add new indexer**
* Then here, you can add your indexers. You may look into the preset configurations specific to your indexers or you may look into adding your own indexer.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591775942988.png"></p>

* Listed below are the fields that might be relevant to you.
  * Name: Name of Indexer
  * Host: The Hostname of the indexer
  * API Key: The API key from your account
  * API hit Limit and Download Limit: Usually NZBHydra2 detects this already but you may add your account's Download and API limit here if you wish.
* You may have to refer to your Usenet indexer for their specific configuration.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591776410072.png"></p>

* Once added, it'll check the connectivity and the capabilities of your indexer.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591776627949.png"></p>

* Once that's done, click **Save.**
* After restarted, you will see the search page with your set indexers.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591109890576.png"></p>

### Getting NZBHydra2 API

* To get your NZBHydra2 API, go to **Config**. Beside the Save button, there's an **API?** button. Click that to show the API details. You may add that to apps such as Sonarr, Radarr and CouchPotato.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591776866257.png"></p>
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591776911480.png"></p>

### Connecting Usenet Downloaders (Optional)

* If you wish to add your Usenet downloaders to download directly from NZBHydra2, go to **Downloading**, scroll down, and click **Add new Downloader**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591777029589.png"></p>

* Select between NZBGet and SABnzbd and enter the following information

#### NZBGet Non-SSL

```
Name: NZBGet
URL: http://{servername}.usbx.me:{nzbget port}
Username: {nzbget username}
Password: {nzbget password}
```

#### NZBGet SSL

```
Name: NZBGet
URL: https://{username}.{servername}.usbx.me/nzbget
Username: {nzbget username}
Password: {nzbget password}
```

#### SABnzbd

```
Name: SABnzbd
URL: https://{username}.{servername}.usbx.me/sabnzbd
API Key: {sabnzbd api key}
```

## Setting Up SSL

* If you wish to access your NZBHydra2 instance, go to **Config -> Main**
* Enter `/nzbhydra2` to the URL base. Once that's done, click **Save** and restart when prompted.
* Once restarted, your instance will ONLY be accessible to the following link

`https://{username}.{servername}.usbx.me/nzbhydra2`

<c><p class="callout warning">Once you've done this, you will not access NZBHydra2 via the HTTP link. You may have to change the NZBHydra2 API URL to the new HTTPS link if you set your API already.</p></c>