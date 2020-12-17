This guide give you an overview of Tautulli's Initial Setup Wizard and the relevant settings that you maybe interested in. This assumes the following:

* You have a fully configured Plex Media Server

***

## Initial Setup
### Setup Wizard

* Upon clicking **connect**, You'll be greeted by Tautulli's Setup Wizard. Click **Next** to continue

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584546853549.png"></p>

* Here, this is where you'll input your Tautulli credentials. Add your preferred username and password. 
  * Make sure your username and password are unique

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584546935873.png"></p>

* This section is where you'll connect your Plex Account to Tautulli. Click **Sign In** with Plex and login using your Plex credentials. You'll get an `Authentication successful `once logged in successfully.
* Click **Next** to proceed

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584547052889.png"></p>

* Then, select the Plex Server that you wish to monitor.
  * If you install Plex Media Server on your seedbox, there would be 2 in the dropbox with the same PMS name. Select the one with the port `32400`. In the screenshot below, this is underlined.
  * Verify that the port is `32400` and both Remote server and Use SSL are unchecked

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584547429753.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584547520457.png"></p>

  * If you have a Plex Media Server outside your seedbox, select that and enter its port.
    * Check Remote server (Important) and Use SSL (when applicable)
* You can leave the options on the last three steps as-is then click **Finish** to load up your settings and get you to Tautulli's Login Page.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590144667345.png"></p>

### Setting Up SSL

* Click the gear icon on the top right side

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155133634.png"></p>

* Click Show advanced to expose Tautulli's advanced settings

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155439065.png"></p>

* Then on the Web interface, add `/tautulli` on HTTP Root and check **Enable HTTP Proxy**. Once that's done, scroll down and click **Save**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155576285.png"></p>

* Click **Restart** and wait for 30 seconds.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155673835.png"></p>

* You can now access Tautulli Web Interface via `https://{username}.{servername}.usbx.me/tautulli`