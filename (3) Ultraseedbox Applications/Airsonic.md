**Airsonic** is a free, full-featured, stable, Java-based self-hosted media server that is forked from Subsonic and Libresonic that is open source, and community-driven. Some features of this app are:

* Designed to handle very large music collections
* It works for any audio or video format that can stream over HTTP
* Support for on-the-fly transcoding and streaming of virtually any audio format
* Integrated Podcast Receiver
* Built-in sharing options
* Compatible with Subsonic apps

For more information about this app, you may visit [this link](https://airsonic.github.io/).

***
## Initial Setup

This assumes that your music library is in `~/media/Music`. We'll be doing the following steps:

1. Setting an admin password
2. Adding music folders
3. Add a limited user

### Setting an administrator password

* After installation, click **Connect** under Airsonic
* Airsonic login appears. Login first using the default credentials which are the following:

```
Username: admin
Password: admin
```

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105392504.png)

* Once logged in, you’ll be greeted with the following welcome message. We’ll be doing step 1 which is changing the administrator password.
* Click **Change administrator password**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105526127.png)

* You’ll be taken to the settings under the Users section. Find the **Change password** checkbox.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105660761.png)

* Tick it and change it to your desired password.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105705313.png)

* Once that’s done, click **Save.**

### Setting Media Folders

* Click **Home** to show the welcome message again.
* Click on step 2, which is **Set up media folders**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105762707.png)

* In this step, you need to get the **absolute path** of your media folder.
* To do that, login to your slot’s SSH terminal, navigate to your media folder and print the work directory (`pwd`) of that folder to get its absolute path.
  * Login to your slot’s SSH terminal
    * For more information on how to login to your seedbox's SSH terminal, refer to [this guide.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")
  * Navigate to your media folder.
    * In this example, my Music folder is in `~/media`
    * To list the directories, do `ls`
    * Navigate to the Music folder by typing `cd >folder-name-here<`
      * In this case, I'll do `cd media` and `cd Music`
    * Now, do `pwd` to show and copy the full path of that folder.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584186717418.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584186813933.png)


* On the Media folders section, replace the `/music` with the full path of your music folder. In this case, `/home1/usbdocs/media/Music` is the full path. Scroll down and click **save** when done.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584187026335.png)

* Now, Click **Scan Media folders now** to initialize a full scan of the folder. This will take a while depending on the size of the library.

### Media Folder Structure Recommendations

* We recommend this folder structure for Airsonic to properly detect and organize the library.

```
Music
    Artist 1
        Album 1 (year)
            Artist 1 - Album 1 - Track 1.flac
    Artist 2
        Album 2 (Year)
        Album 3 (Year)
```

* You can automate this setup by utilizing the following apps
  * MusicBrainz Picard
  * [Lidarr](https://docs.usbx.me/books/lidarr "Lidarr")

***

### Adding a Limited User

* Accessing and playing your library using a limited user is recommended than using your admin account because it prevents any unauthorized and/or accidental changes to your Airsonic instance.
* To add a limited user, Go to Settings ⇾ Users

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584187458858.png)

* Under the dropdown menu, select `--New user--`
* Then check the permissions needed.
  * Since this is a limited account, DO NOT tick administrative user
* Check all the media folders you want access with
* At the end of the page, you need to add a username, email (ou can make up any email here) and your set password.
* Once that’s all done, just click **save**. 

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584189737284.png)