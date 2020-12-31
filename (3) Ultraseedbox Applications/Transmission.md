**Transmission** is a BitTorrent client which features a variety of user interfaces written in C/Objective-C. It is:

* Open Source and volunteer-based
* Easy to use
* Lean and low on resources
* Written in Objective C
* Powerful client with several features:
  * Encryption
  * Web interface
  * Peer exchange
  * Magnet link support
  * DHT, µTP, UPnP and NAT-PMP port forwarding
  * Webseed support
  * Watch directories
  * Tracker editing
  * Global and per-torrent speed limits

For more information, you can view the full list of features [here.](https://transmissionbt.com/about/)

![](https://cdn.discordapp.com/attachments/519118436215816192/622656394054860826/transmission-2.png)

***

## Initial Setup

Transmission is already configured and tuned out of the box. Just install the client, enter your desired password and press Connect to login to your Transmission Web Interface.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589719260048.png)

***

## Default File Paths

Default Downloads Folder: `~/files`

Deluge's config folder: `~/.config/transmission-daemon`

***

## Extra Guides
### Limiting Seeding Ratio

In this guide, we'll be exploring options on how to limit your seeding torrent's ratio in Transmission. One where you will apply seeding limit to all of your torrents.

#### Global Seeding Limit

* Access Transmission's Settings
* On Torrents -> Seeding, check **Stop seeding at ratio:** and enter 2. This will stop all torrents from seeding when it hits 2.0 ratio.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590116937278.png)

### Using Transmission Remote GUI

Transmission Remote GUI is a feature-rich cross-platform front-end to control the Transmission daemon via its RPC protocol remotely. It is faster and has more functionality than the built-in Transmission web interface.

Features:

* Native application for Windows, Linux, and macOS
* uTorrent-like interface
* Select files to download
* Choose files priority
* View details about connected peers
* Full information about each torrent
* Per torrent options

You can visit the repository here: [https://github.com/transmission-remote-gui/transgui](https://github.com/transmission-remote-gui/transgui)

#### Installation

Install the program using the links below. Listed are the direct links to the latest version of the program.

```
v5.18.0

Windows 64-bit: https://github.com/transmission-remote-gui/transgui/releases/download/v5.18.0/transgui-5.18.0-setup_64bit.exe
Windows 32-bit: https://github.com/transmission-remote-gui/transgui/releases/download/v5.18.0/transgui-5.18.0-setup.exe
macOS (x86): https://github.com/transmission-remote-gui/transgui/releases/download/v5.18.0/transgui-5.18.0.dmg
```

For Windows, you may have to install an additional program, otherwise upon connection, you will be greeted with the following error message.

`Unable to load OpenSSL library files: ssleay32.dll and libeay32.dll`

[https://support.microsoft.com/en-us/help/4032938/update-for-visual-c-2013-redistributable-package](https://support.microsoft.com/en-us/help/4032938/update-for-visual-c-2013-redistributable-package)


#### Connecting and Using Transmission Remote GUI

Connecting to your Ultraseedbox Transmission is a relatively simple process.

##### Creating a New Connection

Upon your first launch, you should be greeted with a box to input your details, which are as follows:

```
Remote host: username.lwxxx.usbx.me 
Port: 443
Use SSL: Ticked 
Authentication required: Ticked
Always Auto-Connect: Ticked
Username: Found in your Ultraseedbox Control Panel
Password: Found in your Ultraseedbox Control Panel
RPC path: /transmission/rpc
```

![](https://i.imgur.com/wuY7Azl.png)

If you had to backtrack because of SSL Error, you could also go to Manage Connections in the top left corner found here:

![](https://i.imgur.com/dPZbXAu.png)

If you receive a popup regarding Geo IP, select yes as this will allow you to see the Peers Country’s location.

![](https://i.imgur.com/ECQQTJ7.png)

##### Add your first .torrent file

To add a .torrent file to transmission via the remote first click Torrent in the top left of the small GUI, add a torrent. This will open your file explorer for you to add your .torrent file

![](https://i.imgur.com/ELxnXBP.png)

##### Add your first Magnet Link

Adding a magnet link is the same. However, instead of adding a torrent file, you choose Add torrent link and paste your link in the dialog box.


![](https://i.imgur.com/GpEqRjp.png)

![](https://i.imgur.com/t56YTF1.png)