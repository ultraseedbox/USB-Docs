All Ultraseedbox plans have complimentary VPN service included, which allows you to surf the web securely and anonymously by tunneling your internet traffic through your seedbox. We're using OpenVPN, a mature and secure VPN protocol.

This guide shows you how to get OVPN config files to be used to your OpenVPN clients and setting up OpenVPN clients.

***

## Setting Up Ultraseedbox VPN

* Login to your UCP and go to Access details
* Under OpenVPN access, you'll have 3 buttons which allows you to download 3 OVPN configs.
  * This means that you can connect up to 3 devices to your seedbox's VPN with each device having its own config.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590685274213.png)

* Download a config by clicking one of the 3 buttons. It'll download a zip file as {username}-{config number}.zip.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590685541519.png)

* Opening the zip shows the following contents, as shown below. Extract them to a folder, to be used later.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590685664656.png)

***

## OpenVPN Clients
### Android

This short section will walk you through on how to setup your OpenVPN Client in Android. For this guide, we'll be installing the ovpn profile in OpenVPN Connect which are available on all Android devices.

#### Installing OpenVPN Connect

* Install the app from here: [OpenVPN Connect](https://play.google.com/store/apps/details?id=net.openvpn.openvpn)

#### Syncing OVPN Files

* Once installed, you can either sync your ovpn files to your Android or download it directly from your browser and extract it there. In the screenshots below, the files are downloaded and extracted directly to `Downloads` using Google's Files App.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590932879896.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590932902855.png)

#### Running OpenVPN Connect

* Tap the OpenVPN Connect icon. The first time you launched it, allow it to send notifications and tap **Agree** to the Data Collection Policy.
* Tap the File Tab and accept File Access permission on your app
* Navigate to where you extracted your ovpn files. In this case, it'll be in `Downloads`

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590932958065.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590932974389.png)

* Select the ovpn file displayed and click **Import**. Once the profile is successfully added, tap **Add**

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590932997165.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590933075788.png)

* Once done, Just tap the switch beside the profile you just added to connect to the seedbox VPN. Then allow the app to do a VPN connection request to successfully connect.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590933204087.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590933218985.png)

* You can also confirm that you've successfully connected by visiting [What Is My Ip Address](https://whatismyipaddress.com/). You'll see the server's IP address listed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686968356.png)

### iOS

This short section will walk you through on how to setup your OpenVPN Client in iOS. For this guide, we'll be installing the ovpn profile in OpenVPN Connect which are available on all iOS devices.

#### Installing OpenVPN Connect

* Install the app from here: [OpenVPN Connect](https://apps.apple.com/us/app/openvpn-connect/id590379981)

#### Syncing OVPN Files

* Once installed, sync your ovpn files to you iOS device via iTunes' File Sharing Window

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590776930146.png)

#### Running OpenVPN Connect

* Tap the OpenVPN Connect icon. The first time you launched it, allow it to send notifications and tap Agree to the Data Collection Policy.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590777052326.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590777125091.png)

* Your profile will be shown in the File Tab. Tap **Add** to the screens below.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590777149482.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590777212670.png)

* Then Allow the app to add VPN configurations.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590777352945.png)

* Once done, Just tap the switch beside the profile you just added to connect to the seedbox VPN.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590777473914.png)

* You can also confirm that you've successfully connected by visiting [What Is My Ip Address](https://whatismyipaddress.com/). You'll see the server's IP address listed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686968356.png)

### Linux

This short section will walk you through on how to setup your OpenVPN Client in Linux. This guide will be using OpenVPN on Debian but should be similar on distributions such as Ubuntu, Linux Mint and elementary OS. It's best to refer to your distributions' manuals for specific instructions.

#### Installing OpenVPN Client

* Open up your terminal and run the following command

```sh
sudo apt install openvpn ca-certificates
```

* Navigate to where you saved your file (Assuming that you saved the zip file in ~/Downloads) and unzip it to `/etc/openvpn`

```sh
cd ~/Downloads
sudo unzip {username}-x.zip -d /etc/openvpn/
```

* Then run OpenVPN using the following command

```sh 
sudo openvpn {username}-x.ovpn
```

* It'll show you the logs of the connection. Wait for a few minutes for it to successfully connect. You can also run the above command under `screen` or `tmux`.

* To stop the connection, do **CTRL + C** to stop the OVPN client.

* You can also confirm that you've successfully connected by visiting [What Is My Ip Address](https://whatismyipaddress.com/). You'll see the server's IP address listed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686968356.png)

### MacOS

This short section will walk you through on how to setup your OpenVPN Client in macOS using Tunnelblick.

#### Installing Tunnelblick

* Download and install the stable version of Tunnelblick here: [Tunnelblick Downloads](https://tunnelblick.net/downloads.html)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590687190416.png)

#### Setting Up Tunnelblick

* Once installed, you'll get a welcome screen which asks if you have configuration files or not. Click `I have configuration files`

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590687218601.png)

* Extract your configuration files into a folder. We'll name the folder `ultraseedbox`
* Add an extension of `.tblk` at the end of the folder name, which in this case is `ultraseedbox.tblk`. When you do this the icon for the folder will change to an icon for a Tunnelblick VPN Configuration.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590687577237.png)

* Drag and drop `ultraseedbox.tblk` onto the Tunnelblick icon in the menu bar to install it.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590687661021.png)

* When asked to install configuration for all users, click `Only Me`. After that, you'll get a notification that the config file has been installed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590687675815.png)

#### Running Tunnelblick

* To connect, simply right click the Tunnelblick icon and click `Connect ultraseedbox`. You'll get confirmation that it's successfully connected.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590687801074.png)

* You can also confirm that you've successfully connected by visiting [What Is My Ip Address](https://whatismyipaddress.com/). You'll see the server's IP address listed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686968356.png)

### Windows

This short section will walk you through on how to setup your OpenVPN Client in Windows.

#### Installing OpenVPN GUI

* Download and install the appropriate version of OpenVPN GUI here: [OpenVPN GUI Downloads](https://openvpn.net/community-downloads/)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590596209676.png)

#### Setting Up OpenVPN GUI

* Copy the contents of the config to this folder

`C:\Program Files\OpenVPN\config`

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686342974.png)

#### Running OpenVPN GUI

* Launch OpenVPN GUI. It'll launch an icon in your Taskbar.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686618150.png)

* To connect to your VPN, just right-click the icon and select **Connect**. A window will show containing the logs of the VPN connection.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686702740.png)

* You'll be successfully connected when the icon's screen changed to green.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686823583.png)

* You can also confirm that you've successfully connected by visiting [What Is My Ip Address](https://whatismyipaddress.com/). You'll see the server's IP address listed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686968356.png)