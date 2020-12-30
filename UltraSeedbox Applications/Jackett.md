**Jackett** is a proxy server for torrent trackers and your apps. It acts as the middleman, translating queries from your apps (e.g. Sonarr, CouchPotato, etc.) to be sent and received by your trackers. It allows for getting recent uploads via RSS and performing searches from within your apps, even those without RSS feeds or is not supported by your apps.

For more information on this app, refer to the app's [GitHub page.](https://github.com/Jackett/Jackett)

![](https://raw.githubusercontent.com/DyonR/docker-templates/master/Screenshots/jackettvpn/jackettvpn-mainpage.png)

## Initial Setup

In this section, we'll be setting up Jackett for the first time. We'll go through the following steps:

1. Logging into Jackett Interface
2. Adding Indexers to Jackett

### Logging in

* Upon entering the interface, you'll be greeted with the login window. Type in your set password to get into the interface.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571401409335.png)

* Once logged in, you'll be greeted with this window.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571401552882.png)

### Adding Indexers to Jackett

* Now, we will add your first indexers. In this guide, I'll be adding Anidex (a public tracker) and HD-Torrents (a private tracker). Click **Add** **Indexer** to start.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571402361004.png)

* We'll first add the public tracker, Anidex. USe the search bar to quickly find the tracker.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571402861007.png)

* Once that's done, click **+.** This'll add it to your list and it's ready to go.
    * Below it are instructions on how to add your new Jackett indexer to your apps.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571402938406.png)

* There are some public trackers that needs more configuration for you to get the results you want. On Anidex, click the **wrench icon,** which will take you to the indexer settings.
* This'll show you tracker-specific settings that might be useful. In this case, Anidex has an entry called **Language ID** with some options below.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571731756265.png)

* Scroll down a bit and you'll see a section called **Capabilities**. This shows the categories and descriptions of each category.
    * This is important for adding categories on apps like Sonarr/Radarr.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571731827045.png)

* Once we're done configuring the indexer, click **Okay** to go back to the main screen.
* Now, we'll move on to adding HD-Torrents. Click **Add** **Indexer** and search for it.
* Private trackers needs some configuration. Click the **wrench icon** to go to the settings.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571732457416.png)

* Depending on the private tracker, it'll have different ways to authenticate Jackett to the tracker. Here, we'll just input our tracker credentials and click **Okay**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571732634827.png)

* Once that's done, you can now use Jackett to connect to your favorite applications.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/scaled-1680-/image-1571733144187.png)