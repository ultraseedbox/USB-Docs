In this guide, we'll be setting up Jackett for the first time. We'll go through the following steps:

1. Logging into Jackett Interface
2. Adding Indexers to Jackett

***

## Initial Setup
### Logging in

* Upon entering the interface, you'll be greeted with the login window. Type in your set password to get into the interface.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571401409335.png"></p>

* Once logged in, you'll be greeted with this window.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571401552882.png"></p>

### Adding Indexers to Jackett

* Now, we will add your first indexers. In this guide, I'll be adding Anidex (a public tracker) and HD-Torrents (a private tracker). Click **Add** **Indexer** to start.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571402361004.png"></p>

* We'll first add the public tracker, Anidex. USe the search bar to quickly find the tracker.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571402861007.png"></p>

* Once that's done, click **+.** This'll add it to your list and it's ready to go.
    * Below it are instructions on how to add your new Jackett indexer to your apps.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571402938406.png"></p>

* There are some public trackers that needs more configuration for you to get the results you want. On Anidex, click the **wrench icon,** which will take you to the indexer settings.
* This'll show you tracker-specific settings that might be useful. In this case, Anidex has an entry called **Language ID** with some options below.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571731756265.png"></p>

* Scroll down a bit and you'll see a section called **Capabilities**. This shows categories and description of each category.
    * This is important for adding categories on apps like Sonarr/Radarr.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571731827045.png"></p>

* Once we're done configuring the indexer, click **Okay** to go back to the main screen.
* Now, we'll move on to adding HD-Torrents. Click **Add** **Indexer** and search for it.
* Private trackers needs some configuration. Click the **wrench icon** to go to the settings.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571732457416.png"></p>

* Depending on the private tracker, it'll have different ways to authenticate Jackett to the tracker. Here, we'll just input our tracker credentials and click **Okay**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571732634827.png"></p>

* Once that's done, you can now use Jackett to connect to your favorite applications.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571733144187.png"></p>

***

## Web Interface and Settings Overview

Jackett is pretty straightforward. Here are some of the important buttons and settings that you may need to know.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571733331533.png"></p>

### API Key

* Found on the top of the page, here  you'll get the generated API key to be used when connecting Jackett to other applications

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571733568810.png"></p>

### Configured Indexer Buttons

#### Add Indexer

* This is where you'll add new indexers to Jackett

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571736151221.png"></p>

#### Manual Search

* Here, you can search and download torrents from all of your configured indexers.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571736179893.png"></p>

#### View cached releases

* In this screen, you'll find recent releases from your set indexers that is cached in Jackett. Only 300 releases per indexer are cached.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571736221903.png"></p>

#### Test all

* This is where you'll test all of your indexers. Should there will be indexer failures, it'll show a warning icon beside the indexer and show you the error. This error will also be logged.

### Jackett Configuration

Most of the settings here are preconfigured and you can leave it as it is but there are some that could be useful for you.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571836183523.png"></p>

* View logs - This will give you access to Jackett logs for debugging