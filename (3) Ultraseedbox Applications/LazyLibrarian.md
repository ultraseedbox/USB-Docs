In this guide, we'll be setting up LazyLibrarian for the first time. This guide
assumes the following:

-   You have a working Torrent Client Setup

-   You have LazyLibrarian installed and ready for configuration

-   You have Jackett installed for use with certain Providers

## Initial Setup

## Securing your WebUI.

Upon loading LazyLibrarian You will need to navigate to `Config` to list all the settings required to begin the use of LazyLibrarian, Your first step must be to go to interface > Access Control > Fill in desired Username and Password then click save. You will need to restart LazyLibrarianfrom your Control Panel, then upon starting you will need to login with your new details.

![](https://i.imgur.com/6KXBn04.png)


## Connecting your Download client

we will continue by adding Downloaders. Switch over to the Downloaders tab.

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
| ruTorrent Details (NON SSL)  | Value  |
|:---:|:---:|
| rTorrent Host  |https://Username.Servername.usbx.me/RPC2    |
| rTorrent User  | Username taken from Ultraseedbox Control  |
| rTorrent Pass  |Password taken from Ultraseedbox Control   |
| rTorrent label  | Can be left blank  |
| rTorrent Directory | Leave blank  |

![](https://i.imgur.com/LMh7P1R.png)

![](https://i.imgur.com/zLypEih.png)

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
|:---:|:---:|
|Missing Book Status  | Recommended to set as wanted as any Missing items you will likely want to fill   |
|New Book Status | Recommended to set as wanted as any new releases from an author you will likely want to fill  |
|New AudioBook Status   | Recommended to set as wanted as any new releases from an author you will likely want to fill  |
|New Authors eBook Status  |  Recommended to set as wanted as any new releases from an author you will likely want to fill |
|New Authors AudioBook Status   |Recommended to set as wanted as any new author added  will likely have a back catalogue  |
|New Found Status   | Recommended to set as wanted as anything new found in a auther catalouge will likely be wanted  |
|New Series Status   | Recommended to set as wanted as you will likely want any thing from a new series  |
|Include other books by new authors   | This will include details for other books by new authors found in wishlists or csv files, or when manually importing a book by a new author  |


![](https://i.imgur.com/NtlGcY7.png)

### Folders
|Folders Option   |Value   |
|:---:|:---:|
|Download Directories  |Should be set as your main download client completed folder for example  `/homeX/usbdocs/files` You can add multiple by separating them with a `,`(comma)  |
|eBook Library Folder |Folder you'd like to store your Ebook formats in after processing   |
|AudioBook Library Folder   | Folder you'd like to store your Audiobook formats in after processing |
|Alternate Import/Export Folder  |Think of this as a Watch Folder LazyLibrarian will watch this folder for any content that matches any wanted content. It should be a different folder to your main download directories   |


![](https://i.imgur.com/fJOUT8d.png)

## Adding your first Author
Your first step in adding a new Series/Author/ISBN Number, is to click Series in the top bar and locate the Search bar in the right hand corner.

![](https://i.imgur.com/aaoLleK.png)

![](https://i.imgur.com/36xNYEq.png)

The next screen will present you with your possible results just click the green button to add the author.


![](https://i.imgur.com/X1YDAq4.png)
