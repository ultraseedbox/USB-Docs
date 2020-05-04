## Media Server
### Plex

```
1. Enter Plex Username and Password then click Load Servers
2. Select your Plex server from you dropdown
3. Change Port to 32400
4. Select Load Libraries and select the libraries you want
```

### Emby/Jellyfin

#### Emby

```
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
SSL: Checked
Emby API Key: {Emby API Key}
Externally Facing Hostname: https://{username}.{servername}.usbx.me/emby
```

#### Jellyfin

```
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
SSL: Checked
Emby API Key: {Jellyfin API Key}
Externally Facing Hostname: https://{username}.{servername}.usbx.me/jellyfin
```
## TV
### Sonarr

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Sonarr API Key}
SSL: Checked
Base URL: /sonarr
```

## Movies
### Radarr

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Radarr API Key}
SSL: Checked
Base URL: /radarr
```

### CouchPotato Non-SSL

```
Enable: Checked
Hostname or IP: {servername}.usbx.me
Port: {CouchPotato WebUI Port}
API Key: {CouchPotato API Key}
SSL: Unchecked
```

### CouchPotato SSL

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {CouchPotato API Key}
SSL: Checked
Base URL: /{username}/couchpotato
```

## Music
### Lidarr Non-SSL

```
Enable: Checked
Hostname or IP: {servername}.usbx.me
Port: {Lidarr Port}
API Key: {Lidarr API Key}
SSL: Unchecked
```

### Lidarr SSL

```
Enable: Checked
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Sonarr API Key}
SSL: Checked
Base URL: /sonarr
```