**Pydio** is an open-source file-sharing and synchronization software that runs on the user's own server or in the cloud. It has the following features:

* File sharing between different internal users and across other Pydio instances
* SSL/TLS Encryption
* WebDAV file server
* Creation of dedicated workspaces, for each line of business / project / client, with a dedicated user rights management for each workspace.
* File-sharing with external users (private links, public links, password protection, download limitation, etc.)
* Online viewing and editing of documents with Collabora Office
* Preview and editing of image files
* Integrated audio and video reader

For more information, you may visit [this link.](https://pydio.com/en)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623608085.png)

***

## Initial Setup

In this section, we'll be installing and setting up Pydio for the first time. We'll be doing the following:

1.  Installing MariaDB and Pydio
2.  Creating an admin account
3.  Pydio's Setup Wizard
4.  Setting up SSL

### Prerequisites

* Before installing Pydio, you need to Install MariaDB first.
* Go to the Installers tab on the UCP and search for `mariadb`

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583220886423.png)

* Click install and type your preferred password
  * Make sure this password is unique from your other passwords

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583221042417.png)

* Once it's installed, go ahead and install Pydio.

### Pydio Setup Wizard

* Once installed, connect to your Pydio instance first via this link

```
https://{servername}.usbx.me:{Pydio Port}
```

* You'll see Pydio's Diagnostic Tool. Click **continue to Pydio Installation** to proceed

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589567793924.png)

* You'll be greeted with Pydio's setup wizard. Select your preferred language and click **Start Wizard** to proceed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589569225822.png)

* Type in your preferred Application title and Welcome message

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613174523.png)

* Then, enter your preferred credentials
  * Make sure the credentials you're going to use here does not share with your current accounts.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613202211.png)

* In the Database, click the dropdown and select **MySQL**
* Then enter the Database Info details on the UCP under Pydio
* Once that's done, click Test DB connection to continue

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613399517.png)

* You can skip the advanced options. Click **Install Pydio** to continue.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613691874.png)

* After a few minutes, the page will reload to the login screen. Enter your set credentials to login.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613850426.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589614041752.png)

### Setting Up Pydio SSL

* In the main Pydio screen, click the 3 dot icon and select Settings

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589621894749.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589621940962.png)

* On Application Parameters -> Application Core, under Main Options -> Server URL change `http://_:443/` to the link below, replacing {username} and {servername} with yours. Click **Save Changes** after.

`https://{username}.{servername}.usbx.me/pydio`

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622237480.png)

* You may now access your Pydio instance via `https://{username}.{servername}.usbx.me/pydio`

***

## Extra Guides
### Sharing Files with Pydio

In this section, we'll be configuring Nextcloud to share files. We'll be doing the following steps

1.  Accessing SSH to get your seedbox's home path
2.  Setting up seedbox home as Pydio Workspace
3.  Sharing files/folders

### Getting Your Seedbox's Home Path

* We'll be getting your seedbox's absolute path/home folder location first. To do that, you need to login to your seedbox's SSH.
  * For more information on how to connect to your slot's SSH, refer to [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh)
  * Once logged in, type in `echo $HOME`. The output will be your home folder. In this case, the output shown below is `/home7/usbdocs`. Copy that output.

```sh
usbdocs@lw975:~$ pwd
/home7/usbdocs
usbdocs@lw975:~$
```

### Setting up seedbox home as Pydio Workspace

* Login to your Pydio instance. In the main Pydio screen, click the 3 dot icon and select Settings

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589621894749.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589621940962.png)

* Then on Workspaces & Users -> Workspaces, click **+ Workspace**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622498094.png)

* A small window appears. On the first part, choose Driver.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622578381.png)

* On Choose Storage Driver, choose File System (Standard) on the dropbox.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622662519.png)

* Then on Driver Options. Paste in the output of `pwd` here. After that, click **Next** to continue.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622760967.png)

* Add a Label and a Description. In this example, we named this `My Home`. Once that's done, click **Create**.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622841951.png)

* Once that's done, close the window (1) and go back to Pydio home (2)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622907808.png)

* You should see your created workspace on the sidebar.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623010360.png)

### Sharing Files/Folders

* To share a file/folder on your seedbox, go to the created workspace.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623010360.png)

* Right-click the file that you want to share and select Share.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623161806.png)

* Check **Enable Public Link**. It'll generate you a public link to the file.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623225378.png)

* You may also change the link's Permissions and Secure access here. To Stop sharing the file, click **Stop Sharing** to make the file private again.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623308499.png)