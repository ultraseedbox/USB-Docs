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

## Connecting Jackett to various media management tools

Adding your sites to different Media tools is fairly simple process but will
branch out slightly depending on which Media Management tool you personally use.

These steps will be universal no matter which tool you use, This will involve
grabbing the Tornab Feed URL by clicking the blue button shown in these
screenshots

![](https://i.imgur.com/nVn3muP.png)

![](https://i.imgur.com/QlLxYdI.png>)

and your Jackett API which can be found in the top right hand side of Jackett
Web UI

![](https://i.imgur.com/M3jvm7X.png)

## Adding Jackett site’s to Sonarr/Radarr

-   First Load Sonarr/Radarr Web Ui

-   Navigate to Settings > Indexers tab

-   Add an indexer by clicking the big plus button (Blue box) Select Tornab
    Custom
![](https://i.imgur.com/LCfQ4GA.png)

![](https://i.imgur.com/3MkiMbL.png)


-   Here is where you would input the information gathered earlier from Jackett
    Web UI

| Jackett Info | Gathered From Jackett Web UI                                                       |
|:--------------:|:------------------------------------------------------------------------------------:|
| URL          | https://usbdocs.server.usbx.me/jackett/api/v2.0/indexers/sitename/results/torznab/ |
| API          | Use your key from the top right hand side of Jackett web ui                        |


-   Once that's done, click **save changes**.

## Adding Jackett site’s to Medusa

-   First Load Medusa Web Ui

-   Navigate to Settings > Search Providers

    ![](https://i.imgur.com/OgU088H.png)

-   Add an Jackett Provider by clicking Configure Jackett Providers Tab

![](https://i.imgur.com/6vO8VYa.png)

| Jackett Info | Gathered From Jackett Web UI                                                       |
|::--------------:|:------------------------------------------------------------------------------------:|
| URL          | https://usbdocs.server.usbx.me/jackett/api/v2.0/indexers/sitename/results/torznab/ |
| API          | Use your key from the top right hand side of Jackett web ui                        |

-   Here is where you would input the information gathered earlier from Jackett
    Web UI

-    Once that's done, click **Add**.

-   This will now present you with Categories, Highlight all on the left and
    click **Select Categories**.

![](https://i.imgur.com/0bQoiHr.png)

-   Once that's done, click **Save Changes**.

## Adding Jackett site’s to Sickchill

### Sickchill requires the setup of a deluge or rutorrent watch folder in order to function ``/homeX/usbdocs/watch/`` is the default for rutorrent and will be used in this guide to reference watch folders

-   First Load Sickchill Web Ui

-   Navigate to Settings \> Search Settings

    ![]( https://i.imgur.com/hy9yrDi.png)

-   Enable the NZB Search Function from NZB Search Tab, Select black hole and
    input your watch folder path in the field Black hold folder location.

![]( <https://i.imgur.com/9xZUDiH.png>)

-   Navigate to Settings \> Search Providers

-   Click Configure Custom Newznab Providers

| Jackett Info | Gathered From Jackett Web UI                                                       |
|:--------------:|:------------------------------------------------------------------------------------:|
| URL          | https://usbdocs.server.usbx.me/jackett/api/v2.0/indexers/sitename/results/torznab/ |
| API          | Use your key from the top right hand side of Jackett web ui                        |

-   Here is where you would input the information gathered earlier from Jackett
    Web UI

-   Once that's done, click **Add**.

-   This will now present you with Categories, Highlight all on the left and
    click **Select Categories**.

![]( https://i.imgur.com/R9WivH8.png)

-   Once that's done, click **Save Changes**.
