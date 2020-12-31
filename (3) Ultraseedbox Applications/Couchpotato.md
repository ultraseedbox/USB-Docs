**CouchPotato** is an automatic NZB and torrent downloader/media manager that is written in Python. You can set what moves you want to watch. Once a movie is found, it will send it to your set Usenet downloader or torrent downloader and will organize it for you.

For more information about this app, you can visit [this link.](https://couchpota.to/)

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589267749576.png)

***

## Initial Setup

This guide assumes that this is your first time installing Radarr and you'll be storing your media locally, saving it to `~/media`.

A setup wizard will assist you in setting up your CouchPotato.

### CouchPotato Setup Wizard

* After installation and clicking Connect, enter your credentials. After that, CouchPotato's Setup Wizard will start. Just scroll down the page to continue.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589263399129.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589263495913.png)

* In General settings, you may leave most of these settings as-is. You can check `Dark Theme` if you prefer.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589263569946.png)

* For the `What download apps are you using?` section, select the clients that you want to use.

***

### Download Client Connection Details
#### Torrent Clients
##### Deluge

```
Host: {servername}.usbx.me:{Deluge Daemon Port}
Username: {username}
Password: As configured in UCP under Deluge
Directory: {Leave Blank}
Label: {Optional}
```

##### rTorrent

```
Host: https://{username}.{servername}.usbx.me/RPC2
Username: {username}
Password: As configured in UCP under ruTorrent
Label: {Optional}
Directory: {Leave Blank}
```

##### Transmission

```
Host: https://{username}.{servername}.usbx.me/transmission/rpc:443
Username: {username}
Password: As configured in UCP under Transmission
Directory: {Leave Blank}
```

#### Usenet Clients
##### SABnzbd

```
Host: https://{username}.{servername}.usbx.me/sabnzbd
API Key: Generated SABnzbd API Key
Category: movies
```

##### NZBget

```
Host: https://{username}.{servername}.usbx.me/nzbget
Password: As configured in UCP under NZBGet
Category: Movies
```

* For the `Are you registered at any of these sites?` section, select the sites that you want to use. Refer to your site's forums for connection details.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589266505084.png)

* In the `Move & rename the movies after downloading?` section, enable `Rename downloaded movies`. Then, set the following
  * Keep `From:` empty
  * Set `To:` to your `media/Movies` folder.
  * `Unrar`: Checked
  * `Cleanup`: Checked
  * `Delete others`: Checked

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589266785763.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589267535651.png)

* Once that's done and you've installed the extension/grabbed the bookmark, click `I'm ready to start the awesomeness!` to go to the main interface.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589267749576.png)