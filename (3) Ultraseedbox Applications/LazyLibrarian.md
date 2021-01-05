In this guide, we'll be setting up LazyLibrarian for the first time. This guide
assumes the following:

-   You have a working Torrent Client Setup

-   You have LazyLibrarian installed and ready for configuration

-   You have Jackett installed for use with certain Providers

## Initial Setup

## Connecting your Download client

### NZBGet

| NZBget Details (NON SSL) | Value                                                                                                                                                                                                    |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| NZBGet Host              | Servername.usbx.me                                                                                                                                                                                       |
| Port                     | Port taken from Ultraseedbox Control Panel                                                                                                                                                               |
| Username                 | Username taken from Ultraseedbox Control Panel                                                                                                                                                           |
| Password                 | Password you set during install of NZBget                                                                                                                                                                |
| Category                 | You may need to set a new Category in NZBget for this to do so access NZBget WebUI and go to settings \>\> Categories \>\> Scroll to bottom add new \>\> save changes \>\> restart NZBget when prompted  |
| Priority                 | This can be left at Zero                                                                                                                                                                                 |

![]( https://i.imgur.com/Gt7nB0a.png)

### Sabnzbd

![](imageurl)

### Deluge

![](imageurl)

### rTorrent

![](imageurl)

## Adding Your Content Providers

### Torznab (Jackett Required)

| Torznab Connection Details    | Value                                                                                                          |
|:-------------------------------:|:----------------------------------------------------------------------------------------------------------------:|
| Name                          | User Defined Name                                                                                              |
| Checkbox to the right of Name | Be sure to tick this to enable the provider                                                                    |
| Torznab URL                   | This is the URL taken from Jackett’s Blue “copy Torznab Feed” button                                           |
| Torznab API                   | Jackett’s API found in the top right hand side of Jackett WebUI                                                |
| Priority                      | This can be left as Zero                                                                                       |
| Seeders                       | By default this is set to Zero which is fine if you are in no hurry for the content otherwise set this to one. |
| Types                         | Refers to the type of content that will be searched for Audiobooks, eBooks, Magazine’s, Comics,                |

![]( <https://i.imgur.com/0CKpgnM.png>)

![]( <https://i.imgur.com/UxLFwca.png>)

### Newznab (Newsgroups)

## Configuring automatic import and sorting

## Starting your first grab
