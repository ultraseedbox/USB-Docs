**SABnzbd** is an Open Source Binary Newsreader written in Python. SABnzbd makes Usenet as simple and streamlined as possible by automating everything we can. All you have to do is add an `.nzb`. SABnzbd takes over from there, where it will be automatically downloaded, verified, repaired, extracted and filed away with zero human interaction.

Here are SAB's features:

* Integrates with other tools
  * Sonarr
  * Sickrage
  * Radarr
  * Medusa
* Support for 16 different languages
* Compatible with mobile and desktop devices
* Open source

If you want to know more you can head over [here.](https://sabnzbd.org)

![](https://docs.usbx.me/uploads/images/gallery/2019-09/interface.webp)

***

## Initial Setup

This section explains the configuration of SABnzbd, detailing what options are useful within the USB environment and what you may want to change. 

Most settings pages will be covered, however a few will not be as I do not recommend you change them. The pages I am not covering in this guide are as follows:

* Switches
* Notifications
* Special

If you wish to learn more about these settings please refer to SABnzbd's official documentation.

To use SABnzbd, you may need the following:

* A Usenet service provider, you can find a list of different providers here: [https://www.reddit.com/r/usenet/wiki/providers](https://www.reddit.com/r/usenet/wiki/providers)
* An indexer to obtain `.nzb` files, these are used to tell the server where to find the files

### Initial Setup Wizard

* Upon connecting, you'll be greeted by SABnzbd's setup wizard. 
* Select your preferred language.
  * This guide will be assuming you selected English, however feel free to choose any other language, you will just need to translate the guide.

![](https://docs.usbx.me/uploads/images/gallery/2019-09/1-Wizard.PNG)

* Input your Usenet service provider's server details; Host, Username and Password.
* Tick SSL if you wish to use SSL, keep in mind this comes with a performance overhead and may degrade download speed.
* Enter the port that your provider tells you to use, if you chose SSL you will need to use the SSL port.
* You will be assigned a certain amount of connections, you're usually best off using the maximum amount allowed. 
* Once everything is configured, click Test Server to verify the connection is working correctly.
* After click Next, you will need to close the tab and reconnect by clicking the link in UCP.
  * The address SABnzbd forwards you to after completing the initial setup is incorrect.

![](https://docs.usbx.me/uploads/images/gallery/2019-09/2-Wizard-Server-Setup.PNG)