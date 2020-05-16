In this guide, we'll be setting up extensions that send torrent files from your browser to your remote client for downloading torrents without logging into your torrent client's web interface.

## Installing the Extension

* Install the extension from these links
  * Chromium: [Remote Torrent Adder](https://chrome.google.com/webstore/detail/remote-torrent-adder/oabphaconndgibllomdcjbfdghcmenci?hl=en)
  * Firefox: [Torrent Control](https://addons.mozilla.org/en-US/firefox/addon/torrent-control/)

## Setting Up
### Remote Torrent Adder

* Once installed, right click the extension and click **Options**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589347104757.png"></p>

* Then, a new tab appears with the Remote Torrent Adder setup page. Click Add server to add one. The following connection details are shown below

#### ruTorrent

```
Server name: {any name}
Server type: ruTorrent WebUI
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589347320045.png"></p>

```
Host: {username}.{servername}.usbx.me
Port: 443
SSL: Checked
Username: {username}
Password: Password: As configured in UCP under ruTorrent
Relative Path: /rutorrent
```


<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589349214407.png"></p>

<c><p class="callout info">This will throw an `Server responded with an irregular HTTP code` when adding a torrent. You can safely ignore this error.</p></c>

#### Deluge

```
Server name: {any name}
Server type: Deluge WebUI
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589349288697.png"></p>

```
Host: {username}.{servername}.usbx.me
Port: 443
SSL: Checked
Username: {username}
Password: Password: As configured in UCP under Deluge
Relative Path: /deluge
```
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589349399186.png"></p>

##### Transmission

```
Server name: {any name}
Server type: Transmission WebUI
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589349481283.png"></p>

```
Host: {username}.{servername}.usbx.me/transmission/rpc
Port: 443
SSL: Checked
Username: {username}
Password: Password: As configured in UCP under Transmission
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589350751030.png"></p>

### Torrent Control

* To set Torrent Control up, click the plugin icon. This will take you to its configuration page.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589349705028.png"></p>

* To add a new server, go to Server Configuration
* On the Current server dropdown, select **New Server**

#### ruTorrent

```
Server name: {any name}
Bittorrent Client: ruTorrent
Server address: https://{username}.{servername}.usbx.me/rutorrent
Username: {username}
Password: As configured in UCP under ruTorrent

Click Save after configuring
```
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589350881763.png"></p>

#### Deluge

```
Server name: {any name}
Bittorrent Client: Deluge
Server address: https://{username}.{servername}.usbx.me/deluge
Password: As configured in UCP under Deluge

Click Save after configuring
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589350939412.png"></p>

##### Transmission

```
Server name: {any name}
Bittorrent Client: Transmission
Server address: https://{username}.{servername}.usbx.me/transmission/rpc
Username: {username}
Password: As configured in UCP under Transmission

Click Save after configuring
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589350996836.png"></p>