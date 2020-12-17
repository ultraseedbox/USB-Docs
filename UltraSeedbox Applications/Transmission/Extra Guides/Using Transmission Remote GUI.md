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

## Installation

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


## Connecting and Using Transmission Remote GUI

Connecting to your Ultraseedbox Transmission is a relatively simple process.

### Creating a New Connection

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

<p align="center"><img src=https://i.imgur.com/wuY7Azl.png</p>


If you had to backtrack because of SSL Error, you could also go to Manage Connections in the top left corner found here:

<p align="center"><img src=https://i.imgur.com/dPZbXAu.png</p>

If you receive a popup regarding Geo IP, select yes as this will allow you to see the Peers Country’s location.

<p align="center"><img src=https://i.imgur.com/ECQQTJ7.png</p>


### Add your first .torrent file

To add a .torrent file to transmission via the remote first click Torrent in the top left of the small GUI, add a torrent. This will open your file explorer for you to add your .torrent file

<p align="center"><img src=https://i.imgur.com/ELxnXBP.png</p>

### Add your first Magnet Link

Adding a magnet link is the same. However, instead of adding a torrent file, you choose Add torrent link and paste your link in the dialog box.


<p align="center"><img src=https://i.imgur.com/GpEqRjp.png</p>

<p align="center"><img src=https://i.imgur.com/t56YTF1.png</p>