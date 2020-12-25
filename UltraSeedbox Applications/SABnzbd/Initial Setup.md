The purpose of this guide is to explain the configuration of SABnzbd, detailing what options are useful within the USB environment and what you may want to change. 

Most settings pages will be covered, however a few will not be as I do not recommend you change them. The pages I am not covering in this guide are as follows:

* Switches
* Notifications
* Special

If you wish to learn more about these settings please refer to SABnzbd's official documentation.

To use SABnzbd, you may need the following:

* A Usenet service provider, you can find a list of different providers here: [https://www.reddit.com/r/usenet/wiki/providers](https://www.reddit.com/r/usenet/wiki/providers)
* An indexer to obtain `.nzb` files, these are used to tell the server where to find the files

***

## Initial Setup
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