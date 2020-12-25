In this guide, we'll be configuring Nextcloud to share files. We'll be doing the following steps

1.  Enabling External Storage App
2.  Accessing SSH to get your seedbox's home path
3.  Setting up seedbox home as external storage in Nextcloud
4.  Adding files/folders
5.  Sharing files

We'll also guide you on how to sync your files to your device using Nextcloud's Sync Client.

***

## Enabling External Storage App

* Login to your Nextcloud interface. Click the gear icon (1) and click **Apps** (2).

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583224035813.png)

* On the left-side panel, click **Disabled apps**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583224114942.png)

*   Then find **External storage support**. Click **Enable**. It'll be removed from the list after it has been enabled.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583224224872.png)

***

## Getting Your Seedbox's Home Path

* Next, we'll be getting your seedbox's absolute path/home folder location. To do that, you need to login to your seedbox's SSH.
  * For more information on how to connect to your slot's SSH, refer to [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh)
  * Once logged in, type in `echo $HOME`. The output will be your home folder. In this case, the output shown below is `/home1/usbdocs`. Copy that output.

```sh
usbdocs@lw701:~$ echo $HOME
/home1/usbdocs
usbdocs@lw701:~$ 
```

***

## Setting Up Seedbox as External Storage

* Go back to your Nextcloud, click the gear icon and click **Settings**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583227248462.png)

*   On the left-side pane, click **external storages** under Administration

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583227315662.png)

* Create new external storage with the following options:
  * **Folder name**: Can be anything you want. Here, we set it to USB Docs
  * **External Storage**: Local
  * **Authentication**: None
  * **Configuration**: Your home folder location
    * Paste the output of your SSH here
  * **Available for:** Leave blank if you are the only user on your Nextcloud. Otherwise select the users you want to have access to this folder.
  * **Enable sharing:** Check
  * **Read only:** Check if you want your folder to be read-only from Nextcloud. In the screenshot below, read-only is checked.
    * You can leave this unchecked this if you or your users want to add/edit/remove files or add folders

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583227506003.png)

* Once that's done, click the check mark. You've set it correctly when a green check icon shows on the left side.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583227558487.png)

***

## Navigation and Sharing

* Go back to your Nextcloud's Home page by clicking the Nextcloud Icon on the top left corner. You'll see a new entry here to which is your set external storage.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583227830934.png)

* You can do the following actions

### Upload a file

* Click the + on the navigation bar and select the Upload file button.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583228299252.png)

### Create a new folder

* Click the + on the navigation bar and select new folder.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583228336295.png)

### Share a folder or file

* Click the sharing icon next to the item you wish to share

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583228464530.png) 

* Click the + next to Share link (Create a new share link)

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583228572276.png)

* There you can select options such as whether to share the item as read-only, to password protect it, to set an expiration date, etc. Then click Copy to clipboard to copy the generated link

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583228642591.png)

* The item will show up as shared in your files tab and you can add new links, modify them, or remove them at any time.
  * It will also show up under the Shares tab on the left-pane

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583228718629.png)

* You can also share items with other users on your Nextcloud instance, or even other Nextcloud instances with their federated cloud ID.

## Syncing Files using Nextcloud Client

* Download and install Nextcloud Desktop Client [here.](https://nextcloud.com/install/#install-clients). In this example, we'll be using the Windows Client
* Once launched, you'll be greeted by this window. Click **Log in** to proceed

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588265642331.png)

* Enter your Nextcloud URL in the Server Address and click Next
  * You'll see this on your address bar or under Nextcloud in UCP as `https://{username}.{servername}.usbx.me/nextcloud`

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588265820120.png)

* Your browser will launch, showing this page. Click **Log in** and enter your Nextcloud credentials.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588266114779.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588266234915.png)

* Once logged in, click **Grant access** to finish connecting your Nextcloud instance to your Sync client

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588266271924.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588266324474.png)

* Sync client setup continues after you successfully logged in. Here, you can setup your preferred sync options here.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588266527032.png)

* Click connect to finish the setup. The client will start syncing your files.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1588267044747.png)