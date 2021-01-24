In this guide, we'll be setting up Mylar for the first time. This guide assumes
the following:

-   You have a working Torrent Client Setup

-   You have Mylar installed and ready for configuration

-   You have Jackett installed for use with certain Providers

## Initial Setup

## Securing your WebUI.

Upon loading Mylar You will need to navigate to `Config` (Cog Icon) on the right
of the screen to list all the settings required to begin the use of Mylar, Your
first step must be to go to Web interface \> Look for Basic, You will find
Authentication/HTTP Username/HTTP Password \> Select Forms (Login Page) from the
drop down Authentication box \> Fill in desired Username and Password then click
save at the bottom. You will need to restart Mylar from your Control Panel, then
upon starting you will need to login with your new details.

![]( https://i.imgur.com/cKNMLwY.png)

![](https://i.imgur.com/oglOVB4.png)

## Connecting your Download client

we will continue by adding Download Settings. Switch over to the Download
settings tab.

### NZBGet

| NZBget Details (NON SSL) | Value                                                                                                                                                                                                   |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| NZBGet Host              | Servername.usbx.me                                                                                                                                                                                      |
| Port                     | Port taken from Ultraseedbox Control Panel                                                                                                                                                              |
| Username                 | Username taken from Ultraseedbox Control Panel                                                                                                                                                          |
| Password                 | Password you set during install of NZBget                                                                                                                                                               |
| Category                 | You may need to set a new Category in NZBget for this to do so access NZBget WebUI and go to settings \>\> Categories \>\> Scroll to bottom add new \>\> save changes \>\> restart NZBget when prompted |
| Priority                 | This can be left at Default                                                                                                                                                                             |

### Sabnzbd

| Sabnzbd Details (NON SSL)                | Value                                                                                                                            |
|:------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------:|
| Sabnzbd Host                             | Servername.usbx.me                                                                                                               |
| Port                                     | Port taken from Ultraseedbox Control Panel                                                                                       |
| Username                                 | Username taken from Ultraseedbox Control Panel                                                                                   |
| Password                                 | Password you set during install of Sabnzbd                                                                                       |
| Category                                 | You may need to set a new Category in Sabnzbd for this to do so access Sabnzbd WebUI and go to Config (Cog Icon) \>\> Categories |
| Priority                                 | This can be left at Default                                                                                                      |
| Sabnzbd API Key                          | Found in Sabnzbd WebUI and go to Config \>\> General \>\> Scroll down for your API Key                                           |
| Enable Completed Download Handling       | You will want this set to enabled for automatic import and sorting                                                               |
| Are Mylar / SABnzbd on separate machines | This can be left unchecked as Sabnzbd is being run on the same machine as Mylar.                                                 |

![](https://i.imgur.com/rA1AmV6.png)

### Deluge

| Deluge Details (NON SSL)  | Value                                                                                                                                                                                                                        |
|:---------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Minimum \# of seeders     | Set as at least 1                                                                                                                                                                                                            |
| Deluge Host               | Servername.usbx.me                                                                                                                                                                                                           |
| Daemon Port               | Port taken from Ultraseedbox Control Panel                                                                                                                                                                                   |
| Username                  | Username taken from Ultraseedbox Control Panel                                                                                                                                                                               |
| Daemon Password           | Password you set during install of Deluge                                                                                                                                                                                    |
| Label                     | You may need to set a new Label in Deluge for this to do so access Deluge WebUI and go to Preferences plugin's then enable Label plugin this will bring up label in the left hand panel right click this to add a new label. |
| Deluge Download Path/Move | This can be left blank and Deluge will use the default Download Directory                                                                                                                                                    |

### rTorrent

| ruTorrent Details (NON SSL) | Value                                    |
|:-----------------------------:|:------------------------------------------:|
| Minimum \# of seeders       | Set as at least 1                        |
| rTorrent Host               | https://Username.Servername.usbx.me      |
| rTorrent User               | Username taken from Ultraseedbox Control |
| rTorrent Pass               | Password taken from Ultraseedbox Control |
| rTorrent label              | Can be left blank                        |
| rTorrent Directory          | Leave blank                              |
| rTorrent RPC                | /RPC2                                    |

## Adding Your Content Providers

With your Downloaders added we now move on to Search Providers tab in Config.
Enable torrents and then enable Torznab

### Torznab (Jackett Required)

| Torznab Connection Details | Value                                                                                                                                                                                                                        |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Name                       | User Defined Name                                                                                                                                                                                                            |
| Torznab URL                | This is the URL taken from Jackett’s Blue “copy Torznab Feed” button                                                                                                                                                         |
| Torznab API                | Jackett’s API found in the top right hand side of Jackett WebUI                                                                                                                                                              |
| Category                   | Refers to the type of content that will be searched for eBooks, Magazine’s, Comics. The correct numbers for the category will be different depending on provider you can find the numbers under the spanner Icon in Jackett. |
| Enabled                    | Ticked                                                                                                                                                                                                                       |

Be sure to click Save changes after inputting your values as this will keep the
information safe and Click Add Torznab again to spawn another Torznab Provider
for you to fill in.

### Newznab (Newsgroups)

| Newznab Connection Details | Value                                                                           |
|:----------------------------:|:---------------------------------------------------------------------------------:|
| Name                       | User Defined Name                                                               |
| Newznab Host               | This is the URL taken from your providers particular connection information     |
| Newznab API                | This is the API Key taken from your providers particular connection information |
| Newznab UID                | Some Providers will have a userID as an extra login step.                       |
| Enabled                    | Ticked                                                                          |

Be sure to click Save changes after inputting your values as this will keep the
information safe and Click Add Newznab again to spawn another Newznab Provider
for you to fill in.

## Configuring Automatic import and Sorting

The next section is Post-Processing. We will Highlight only the sections that
require editing to help speed up the Setup Process.

### Status

| Status Option                      | Value                                                                                                                                       |
|:------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------:|
| Enable Post Processing             | Ticked and Set to \`Hardlink\` files                                                                                                        |
| Enable Folder Monitor              | Input a path where content might be downloaded to before sorting                                                                            |
| Failed Download Handling           | Enable Both Failed download Handling and Automatic Retry                                                                                    |
| Include other books by new authors | This will include details for other books by new authors found in wishlists or csv files, or when manually importing a book by a new author |

![]( https://i.imgur.com/JnBOxG3.png)
