In this guide, we'll be installing and setting up Nextcloud for the first time. We'll be doing the following:

1.  Installing MariaDB and Nextcloud
2.  Creating an admin account
3.  Connecting MariaDB to Nextcloud

***

## Initial Setup
### Prerequisites

* Before installing nextcloud, you need to Install MariaDB first.
* Go to the Installers tab on the UCP and search for `mariadb`

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583220886423.png)

* Click install and type your preferred password
    * Make sure this password is unique from your other passwords

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583221042417.png)

* Once it's installed, go ahead and install Nextcloud.

### Creating Your Admin Account

* Once you installed Nextcloud and click Connect, you'll be taken to Nextcloud's initial setup wizard.
* First, create your own admin account by putting your preferred credentials
  * Make sure this password is unique from your other passwords

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583223094507.png)

### Setting Up Storage and Database

* Click the storage and database below the field.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583223242574.png)

* Then, under configure the database, select **MySQL/MariaDB**
* Then enter the details under Database Info on Nextcloud on your UCP.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583223455697.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583223565135.png)

* Once that's done click Finish setup. This may take several minutes.
    * If you get Error 504: Bad Gateway error, simply refresh the page
* Once that's done, you'll be taken to your Nextcloud's Login page. Enter your admin account credentials to proceed.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583223789698.png)