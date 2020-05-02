## Torrent Clients

### Deluge

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Base: deluge
Password: As configured in UCP under Deluge
Category: tv-sonarr
Add Paused: NO
Use SSL: YES
```

### rTorrent

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Path: RPC2
Username: {username}
Password: As configured in UCP under ruTorrent
Category: tv-sonarr
Add Stopped: NO
Use SSL: YES
```

### Transmission

```
Host: {username}.{servername}.usbx.me
Port: 443
Username: {username}
Password: As configured in UCP under Transmission
Category: tv-sonarr
Add Stopped: NO
Use SSL: YES
```

## Usenet Clients

### SABnzbd

```
Host: {username}.{servername}.usbx.me
Port: 443
URL Path: sabnzbd
API Key: As obtained from SABnzbd
Username: {username}
Password: Configured during SABnzbd setup
Category: tv
Use SSL: YES
```

### Nzbget

#### Non-SSL

```
Host: {servername}.usbx.me
Port: WebUI Port from UCP
Username: {nzbget username}
Password: {nzbget password}
Category: tv
Add Paused: NO
Use SSL: NO
```

#### SSL

```
Host: {username}.{servername}.usbx.me
Port: 443
Username: {nzbget username}
Password: {nzbget password}
Category: tv
Add Paused: NO
Use SSL: YES
```