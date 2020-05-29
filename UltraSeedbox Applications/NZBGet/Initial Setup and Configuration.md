Here, we'll be setting up NZBGet for the first time. In this guide we'll be doing the following tasks:

* Login to the NZBGet instance for the first time
* Change ControlUsername and ControlPassword
* Add usenet indexers

***

## Initial Setup
### First Login

* After installation, run the commands below in SSH. This is to ensure that NZBGet is pointed to the correct folders in your slot.

```sh
sed  -i "s|MainDir=/downloads|MainDir=$HOME/.config/nzbget|g" "$HOME"/.apps/nzbget/nzbget.conf
app-nzbget restart
```

* Upon clicking connect, you'll be greeted by this window. Enter the default credentials shown below

```
username: nzbget
password: tegbzn6789
```

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572877223885.png">
</p>

* Once logged in, you'll be greeted with the main interface of NZBget.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572879211864.png">
</p>

### Changing ControlUsername and ControlPassword

* Here, we'll be replacing the default credentials. Go to **Settings** tab.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572879825259.png">
</p>

* Under **Settings -> Security**, there should be two options named **ControlUsername** and **ControlPassword**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572879972433.png">
</p>

* Change both fields to your preferred credentials.
  * Please make sure that the username and password you chose is unique and is not used in any of your accounts
* Scroll down a bit to find **FormAuth** then click **yes**
  * FormAuth allows you to login via login credentials on the webpage instead of basic browser popup. This is particularly useful for password managers as some do not auto fill basic browser popups.
  * This is a recommended step. You may opt to skip this if you prefer the default behavior, which is basic auth.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572885656464.png">
</p>

* Scroll all the way to the bottom of the page and click **Save all changes**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572885797425.png">
</p>

* A confirmation window shows that the configuration has been saved successfully.
* Click **Reload NZBGet** to restart the application and to apply the new configuration.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572885861744.png">
</p>

* Once it's been reloaded, you'll be greeted with this window. Enter your new credentials here and click **Login**

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572885970028.png">
</p>

***

## Adding News Servers

* You can add your news servers in Settings -> News-Servers section.
* Once you've added the necessary information. Click **Save all changes** and **Reload NZBGet** to load the new configuration.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572886463622.png">
</p>

***

## Running NZBGet under SSL

You can access NZBGet under SSL via `https://{username}.{servername}.usbx.me`. No further configuration is needed.