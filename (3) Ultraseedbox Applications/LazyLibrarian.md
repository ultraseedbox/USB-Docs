In this guide, we'll be setting up LazyLibrarian for the first time. This guide
assumes the following:

-   You have a working Torrent Client Setup

-   You have LazyLibrarian installed and ready for configuration

-   You have Jackett installed for use with certain Providers

## Initial Setup

## Connecting your Download client

Upon loading LazyLibrarian You will need to navigate to `Config` to list all the settings required to begin the use of LazyLibrarian, we will start by adding Downloaders.

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
| Sabnzbd Details (NON SSL) | Value                                                                                                                                                                                                    |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Sabnzbd Host              | Servername.usbx.me                                                                                                                                                                                       |
| Port                     | Port taken from Ultraseedbox Control Panel                                                                                                                                                               |
| Username                 | Username taken from Ultraseedbox Control Panel                                                                                                                                                           |
| Password                 | Password you set during install of Sabnzbd                                                                                                                                                                |
| Category                 | You may need to set a new Category in Sabnzbd for this to do so access Sabnzbd WebUI and go to Config (Cog Icon) \>\> Categories |
| Priority                 | This can be left at Zero                                                                                                                         
Sabnzbd API Key | Found in Sabnzbd WebUI and go to Config >> General >> Scroll down for your API Key
| Sabnzbd URL Base | This can be Left blank as this is a non SSL Connection
|Ext Host/Port | This can be left blank as Sabnzbd is being run on the same machine as LazyLibrarian.

![](https://i.imgur.com/rA1AmV6.png)
![](https://i.imgur.com/RFqXhjg.png)

### Deluge
| Deluge Details (NON SSL) | Value                                                                                                                                                                                                    |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Deluge Host              | Servername.usbx.me                                                                                                                                                                                       |
|Daemon Port                     | Port taken from Ultraseedbox Control Panel                                                                                                                                                               |
| Username                 | Username taken from Ultraseedbox Control Panel                                                                                                                                                           |
| Daemon Password                 | Password you set during install of Deluge                                                                                                                                                                |
| Label                 | You may need to set a new Label in Deluge for this to do so access Deluge WebUI and go to Preferences plugin's then enable Label plugin this will bring up label in the left hand panel right click this to add a new label.  |
| Download Directory                 | This can be left blank and Deluge will use the default Download Directory
Deluge Certificate | This can be Left blank as this is a non SSL Connection
| Deluge URL Base | This can be Left blank as this is a non SSL Connection

![](https://i.imgur.com/iKJpADG.png)
![](https://i.imgur.com/czfhZ2R.png)

### rTorrent

![](imageurl)

## Adding Your Content Providers

With your Downloaders added we now move on to Providers tab in Config

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

![]( <https://i.imgur.com/UxLFwca.png>)

![]( <https://i.imgur.com/0CKpgnM.png>)

Be sure to click Save changes after inputting your values as this will keep the information safe and create a new Torznab Provider for you to fill in.

### Newznab (Newsgroups)
| Newznab Connection Details    | Value                                                                                                          |
|:-------------------------------:|:----------------------------------------------------------------------------------------------------------------:|
| Name                          | User Defined Name                                                                                              |
| Checkbox to the right of Name | Be sure to tick this to enable the provider                                                                    |
| Newznab URL                   | This is the URL taken from your providers particular connection information                                           |
| Newznab API                   | This is the API Key taken from your providers particular connection information                                               |
| Priority                      | This can be left as Zero                                                                                       |
| Types                         | Refers to the type of content that will be searched for Audiobooks, eBooks, Magazine’s, Comics,                |

![]( <https://i.imgur.com/JlBUA0J.png>)

![]( <https://i.imgur.com/z9g0gU0.png>)

Be sure to click Save changes after inputting your values as this will keep the information safe and create a new Newznab Provider for you to fill in.

## Configuring Automatic import and Sorting
The next section is Processing. We will Highlight only the sections that require editing to help speed up the Setup Process.

### Status


|Status Option   |Value   |
|:---|---:|
|Missing Book Status  |   |
|New Book Status |   |
|New AudioBook Status   |   |
|New Authors eBook Status  |   |
|New Authors AudioBook Status   |   |
|New Found Status   |   |
|New Series Status   |   |
|Include other books by new authors   |   |


![](https://i.imgur.com/NtlGcY7.png)

### Folders
|Folders Option   |Value   |
|:---|---:|
|Download Directories  |   |
|eBook Library Folder |   |
|AudioBook Library Folder   |   |
|Alternate Import/Export Folder  |   |


![](https://i.imgur.com/fJOUT8d.png)

## Adding your first Author
![](imageurl)
![](imageurl)
![](imageurl)
![](imageurl)
