## Torrent Clients
### ruTorrent

```
use rTorrent: Checked
rTorrent Host: https://{username}.{servername}.usbx.me/RPC2
rTorrent User: {username}
rTorrent Password: As configured in UCP under ruTorrent
rTorrent Label: {Blank}
rTorrent Directory: {blank}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589363204741.png)

### Deluge
#### Deluge Daemon

Recommended if both LazyLibrarian and Deluge is in the same machine

```
use Deluge: Checked
Deluge Host: {servername}.usbx.me
Daemon or webUI Port: {Deluge Daemon Port}
Deluge Certificate: {Blank}
Deluge URL Base: {Blank}
Username: {username}
Password: As configured in UCP under Deluge
Deluge Label: {Blank}
Download directory: {Blank}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589376514921.png)

#### Deluge WebUI

Recommended if Deluge is in another machine

```
use Deluge: Checked
Deluge Host: https://{username}.{servername}.usbx.me
Daemon or webUI Port: 443
Deluge Certificate: {Blank}
Deluge URL Base: /deluge
Username: {Blank}
Password: As configured in UCP under Deluge
Deluge Label: {Blank}
Download directory: {Blank}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589376402870.png)

### Transmission

```
use Transmission: Checked
Transmission Host: https://{username}.{servername}.usbx.me
Transmission Port: 443
Username: {username}
Password: As configured in UCP under Transmission
Download directory: {Blank}
Transmission URL Base: {Blank}
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589376210383.png)

## Usenet Client
### NZBGet SSL

```
Use NZBGet: Checked
NZBGet Host: http://{servername}.usbx.me
Port: {NZBGet WebUI Port}
Username: {Username}
Password: {Password}
Category: {Blank}
Priority: 0
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589376011914.png)

### SABnzbd

```
Use Sabnzbd+: Checked
SABnzbd Host: https://{username}.lw975.usbx.me
SABnzbd Port: 443
SABnzbd Username: {username}
SABnzbd Password: As configured in UCP under SABnzbd
SABnzbd API Key: Generated SABnzbd API Key
SABnzbd URL Base: /sabnzbd
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589376149350.png)