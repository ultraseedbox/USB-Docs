This servers as your guide to fully setting up your UltraSeedbox slot as your fully-fledged media box.

This guide assumes the following:

* All of your media will be in your seedbox
* You have access to torrent trackers and usenet providers

Each section provides essential steps that you need to do which are

1. Prerequisites
2. Download Clients
3. Media Library Managers
4. Media Servers
5. Request Agents

In some sections, we provide options as to what software you will use and we also marked some as our recommendations.as to what to use.

***

# Prerequisites

After your slot has been deployed and you've reset your UCP password, you first need to do to this.

## FTP

* [Connecting to your seedbox with FTP](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/connecting-to-your-seedbox-with-ftp)
* [Recommended FTP Clients](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/recommended-ftp-clients)

## SSH

* [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh)
* [Public Key Authentication (Optional but recommended)](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication)
* [Your UltraSeedbox Linux Terminal - Helpful Commands for Learning Linux](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/your-ultraseedbox-linux-terminal---helpful-commands-for-learning-linux)

***

# Download Clients

Download clients are the ones tasked to download files from your sources. Depending on what you have, you may have access to trackers and/or usenet providers.

With this assumption, we recommend choosing 1 torrent downloader and 1 usenet downloader to install.

## Torrent Client

### rTorrent + ruTorrent (Recommended)

* [ruTorrent Initial Setup and Configuration](https://docs.usbx.me/books/rtorrentrutorrent/page/initial-setup-and-configuration)
* [Limiting Seeding Ratio in ruTorrent](https://docs.usbx.me/books/rtorrentrutorrent/page/limiting-seeding-ratio-in-rutorrent)
* [Automatically Unpack Archived Files with ruTorrent](https://docs.usbx.me/books/rtorrentrutorrent/page/automatically-unpack-archived-files-with-rutorrent)

### Deluge

* [Deluge Initial Setup and Configuration](https://docs.usbx.me/books/deluge/page/initial-setup-and-configuration)
* [Limiting Seeding Ratio in Deluge](https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge)


### Transmission

* [Transmission Intiial Setup and Configuration](https://docs.usbx.me/books/transmission/page/initial-setup-and-configuration)
* [Limit Seeding Ratio in Transmission](https://docs.usbx.me/books/transmission/page/limit-seeding-ratio-in-transmission)

## Usenet Downloader

### SABnzbd (Recommended)

* [Initial Setup and Configuration](https://docs.usbx.me/books/sabnzbd/page/initial-setup-and-configuration)

### NZBGet

* [NZBGet Initial Setup and Configuration](https://docs.usbx.me/books/nzbget/page/initial-setup-and-configuration)

***

# Media Library Managers

Media Library Managers are the ones that integrate between your download clients, your media sources and your media players. These are the ones that download, organize your media and integrate with media players. The following are our recommendations.

## Sonarr + Radarr (Recommended)

### Sonarr

* [Sonarr Initial Setup and Configuration](https://docs.usbx.me/books/sonarr/page/initial-setup-and-configuration)
* [Sonarr Download Client Connection Details](https://docs.usbx.me/books/sonarr/page/download-client-connection-details)

### Radarr

* [Radarr Initial Setup and Configuration](https://docs.usbx.me/books/radarr/page/initial-setup-and-configuration)
* [Radarr Download Client Connection Details](https://docs.usbx.me/books/radarr/page/download-client-connection-details)

## Medusa + CouchPotato

### Medusa

### CouchPotato

***

# Media Servers

These are the ones that stream and playback your media using our servers to your home. You may choose either 1 of the following:

## Plex Media Server (Recommended)

* [PMS Initial Setup and Configuration](https://docs.usbx.me/books/plex-media-server/page/initial-setup-and-configuration)
* [Plex Plugin Installers (Optional)](https://docs.usbx.me/books/plex-media-server/page/plex-plugin-installers)

## Emby Media Server

* [Emby Initial Setup and Configuration](https://docs.usbx.me/books/emby/page/initial-setup-and-configuration)
* [Emby Client Connection Settings](https://docs.usbx.me/books/emby/page/emby-client-connection-settings)

## Jellyfin

* [Initial Setup and Configuration](https://docs.usbx.me/books/jellyfin/page/initial-setup-and-configuration)
* [Jellyfin Client Connection Settings](https://docs.usbx.me/books/jellyfin/page/jellyfin-client-connection-settings)

***

# Request Agents

Although not required, these applications integrate between your Media Managers and you by providing friendly user interfaces to request shows/movies instead of you accessing your media manager. It also has eatures that simplfy your media experience. The following apps are recommended:

## Ombi

* [Ombi Initial Setup and Configuration](https://docs.usbx.me/books/ombi/page/initial-setup-and-configuration)

## Requestrr

* [Requestrr Initial Setup and Configuration](https://docs.usbx.me/books/requestrr/page/initial-setup-and-configuration)

## NZB360