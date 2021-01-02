One of the ways to manage files from your seedbox into your computer is through **HTTP access**. This provides you a quick and secure way to download files to your computer from your seedbox by using your web browser.

It is not meant for you to share files to your friends. For that you need to either use [Userland ProFTPD](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/userland-proftpd), [Nextcloud](https://docs.usbx.me/books/nextcloud) or [Pydio](https://docs.usbx.me/books/pydio).

Take note that HTTP Access counts towards your allocated upload bandwidth.

::: warning
Sharing your files to the public is considered to be abuse by USB TOS and will be subjected to immediate termination.
:::

In this guide, we'll be setting up HTTP access and adding a folder into your HTTP Access page.

***

## Initial Setup
### Setting Up HTTP Access

* Login to your [User Control Panel](https://cp.ultraseedbox.com) and login with the credentials you set and Press **Connect**

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590934220094.png)

* Click **Access details** and click **Change password** beside HTTP access.

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590950126285.png)

* Set your password to anything you wish. We recommend using a unique password that you do not use in any of your existing accounts and has the following:
  * At least 12 characters
  * An uppercase letter
  * A lowercase letter
  * At least 1 number
  * At least 1 symbol
* When you're done click **Confirm change**

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590950218550.png)

* A popup saying Password successfully changed should appear on the lower right corner of the page, signifying that the password is set successfully.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-25-0%5B1%5D.png)

* To login to your seedbox's HTTP access page, go to the URL shown under HTTP access.

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590950327893.png)

* Then a basic auth prompt appears. Enter the credentials entered

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590950438564.png)

* It'll show this page. Here, it shows 2 links. 1 is `files` where ruTorrent/Transmission download folders reside.

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590950544650.png)

* Clicking on this will show the contents of the `files` folder and you can download each item.

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590950791512.png)

* The other link is `rutorrent` which is a direct link to your ruTorrent interface.

### Adding Folders to HTTP Access

* To add a folder to HTTP access, just login to SSH and run the follwing command:

`ln -s ~/{folder-name} ~/www/{folder-name}`

* For example, to set the `Downloads` folder on your HTTP access

```sh
usbdocs@lw873:~$ ls
bin  Downloads  files  media  openvpn  watch  www
usbdocs@lw873:~$ ln -s ~/Downloads/ ~/www/Downloads
usbdocs@lw873:~$
```

* Once that's done, visit your HTTP Access Page to see the `Downloads` folder added to the list.

![](docs.usbx.me/uploads/images/gallery/2020-05/image-1590951359270.png)