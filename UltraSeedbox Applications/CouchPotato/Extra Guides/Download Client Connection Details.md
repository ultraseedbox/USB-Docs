## Torrent Clients

### Deluge

```
Host: {servername}.usbx.me:{Deluge Daemon Port}
Username: {username}
Password: As configured in UCP under Deluge
Directory: {Leave Blank}
Label: {Optional}
```

### rTorrent

```
Host: https://{username}.{servername}.usbx.me/RPC2
Username: {username}
Password: As configured in UCP under ruTorrent
Label: {Optional}
Directory: {Leave Blank}
```

### Transmission

```
Host: https://{username}.{servername}.usbx.me/transmission/rpc:443
Username: {username}
Password: As configured in UCP under Transmission
Directory: {Leave Blank}
```

## Usenet Clients

### SABnzbd

```
Host: https://{username}.{servername}.usbx.me/sabnzbd
API Key: Generated SABnzbd API Key
Category: movies
```

### NZBget

#### Non-SSL

```
Host: {servername}.usbx.me:{NZBGet WebUI Port}
Password: As configured in UCP under NZBGet
Category: Movies
```

#### SSL

```
Host: https://{username}.{servername}.usbx.me/nzbget
Password: As configured in UCP under NZBGet
Category: Movies
```