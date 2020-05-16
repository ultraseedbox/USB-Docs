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

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583220886423.png"></p>

* Click install and type your preferred password
  * Make sure this password is unique from your other passwords

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583221042417.png"></p>

* Once it's installed, go ahead and install Pydio.

### Pydio Setup Wizard

* Once installed, connect to your Pydio instance first via this link

```
https://{servername}.usbx.me:{Pydio Port}
```

* You'll see Pydio's Diagnostic Tool. Click **continue to Pydio Installation** to proceed

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589567793924.png"></p>

* You'll be greeted with Pydio's setup wizard. Select your preferred language and click **Start Wizard** to proceed.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589569225822.png"></p>

* Type in your preferred Application title and Welcome message

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613174523.png"></p>

* Then, enter your preferred credentials
  * Make sure the credentials you're going to use here does not share with your current accounts.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613202211.png"></p>

* In the Database, click the dropdown and select **MySQL**
* Then enter the Database Info details on the UCP under Pydio
* Once that's done, click Test DB connection to continue

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613399517.png"></p>

* You can skip the advanced options. Click **Install Pydio** to continue.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613691874.png"></p>

* After a few minutes, the page will reload to the login screen. Enter your set credentials to login.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589613850426.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589614041752.png"></p>

### Setting Up Pydio SSL

* In the main Pydio screen, click the 3 dot icon and select Settings

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589621894749.png"></p>
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589621940962.png"></p>

* On Application Parameters -> Application Core, under Main Options -> Server URL change `http://_:443/` to the link below, replacing {username} and {servername} with yours. Click **Save Changes** after.

`https://{username}.{servername}.usbx.me/pydio`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589622237480.png"></p>

* You may now access your Pydio instance via `https://{username}.{servername}.usbx.me/pydio`