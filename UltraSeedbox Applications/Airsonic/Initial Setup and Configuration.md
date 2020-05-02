In this guide, we'll be setting up Airsonic for the first time. This assumes that your music library is in `~/media/Music`. We'll be doing the following steps:

1. Setting an admin password
1. Adding music folders
2. Add a limited user

***

## Initial Setup
### Setting an administrator password

* After installation, click **Connect** under Airsonic
* The airsonic login appears. Login first using the default credentials which are the following:

```
Username: admin
Password: admin
```

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105392504.png">
</p>

* Once logged in, you’ll be greeted with the welcome message. We’ll be doing step 1 which is changing the administrator password.
* Click **Change administrator password**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105526127.png">
</p>

* You’ll be taken to the settings under Users section. Find the **Change password** checkbox.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105660761.png">
</p>

* Tick it and change it to a your desired password.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105705313.png">
</p>

* Once that’s done, click **Save.**

***

### Setting Media Folders

* Click **Home** to show the welcome message again.
* Click on step 2, which is **Setup media folders**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105762707.png">
</p>

* In this step, you need to get the **absolute path** of your media folder. To do that, login to your slot’s SSH terminal, navigate to your media folder and print the work directory (`pwd`) of that folder to get its absolute path
  * Login to your slot’s SSH terminal
    * For more information on how to login to your seedbox's SSH terminal, refer to [this guide.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")
  * Navigate to your media folder.
    * In this example, my Music folder is in `~/media`
    * To list the directories, do `ls`
    * Navigate to the Music folder by typing `cd >folder-name-here<`
      * In this case, I'll do `cd media` and `cd Music`
    * Now, do `pwd` to show and copy the full path of that folder.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584186717418.png">
</p>
<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584186813933.png">
</p>

* On the Media folders section, replace the `/music` with the full path of your music folder. In this case, `/home1/usbdocs/media/Music` is the full path. Scroll down and click save when done.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584187026335.png">
</p>

* Now, Click Scan Media folders now to initialize a full scan of the folder. This will take a while depending on the size of the library.

#### Media Folder Structure Recommendations

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
* To add a limited user, Go to Settings-> Users

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584187458858.png">
</p>

* Under the dropdown menu, select `--New user--`
* Then check the permissions needed.
* Since this is a limited account, DO NOT tick administrative user
* Check all the media folders you want access with
* At the end of the page, you need to add a username, email (any fake email is accepted here) and your set password.
* Once that’s all done, just click save. 

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584189737284.png">
</p>