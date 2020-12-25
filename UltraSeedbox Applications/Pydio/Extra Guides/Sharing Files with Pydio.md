In this guide, we'll be configuring Nextcloud to share files. We'll be doing the following steps

1.  Accessing SSH to get your seedbox's home path
2.  Setting up seedbox home as Pydio Workspace
3.  Sharing files/folders

***

## Getting Your Seedbox's Home Path

* We'll be getting your seedbox's absolute path/home folder location first. To do that, you need to login to your seedbox's SSH.
  * For more information on how to connect to your slot's SSH, refer to [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh)
  * Once logged in, type in `echo $HOME`. The output will be your home folder. In this case, the output shown below is `/home7/usbdocs`. Copy that output.

```sh
usbdocs@lw975:~$ pwd
/home7/usbdocs
usbdocs@lw975:~$
```

## Setting up seedbox home as Pydio Workspace

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

## Sharing Files/Folders

* To share a file/folder on your seedbox, go to the created workspace.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623010360.png)

* Right-click the file that you want to share and select Share.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623161806.png)

* Check **Enable Public Link**. It'll generate you a public link to the file.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623225378.png)

* You may also change the link's Permissions and Secure access here. To Stop sharing the file, click **Stop Sharing** to make the file private again.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589623308499.png)