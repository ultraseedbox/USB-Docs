In this guide, we'll be installing and setting up Pydio for the first time. We'll be doing the following:

1.  Installing MariaDB and Pydio
2.  Creating an admin account
3.  Pydio's Setup Wizard
4.  Setting up SSL

***

## Initial Setup
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