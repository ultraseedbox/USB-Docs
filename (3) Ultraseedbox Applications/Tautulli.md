**Tautulli** is a python based web application for monitoring, analytics and notifications for Plex Media Server. It includes the following features:

* Responsive web design viewable on desktop, tablet and mobile web browsers.
* Themed to complement Plex/Web.
* Easy configuration setup (no separate web server required).
* Monitor current Plex Media Server activity.
* Fully customizable notifications for stream activity and recently added media.
* Top statistics on the home page with configurable duration and measurement metric.
* Global watching history with search/filtering & dynamic column sorting.
* Full user list with general information and comparison stats.
* Individual user information including devices IP addresses.
* Complete library statistics and media file information.
* Rich analytics presented using Highcharts graphing.
* Beautiful content information pages.
* Full sync list data on all users syncing items from your library.

For more information, visit [this link.](https://tautulli.com/)

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584546394186.png)

***

## Initial Setup

This section give you an overview of Tautulli's Initial Setup Wizard and the relevant settings that you maybe interested in. This assumes the following:

* You have a fully configured Plex Media Server

### Setup Wizard

* Upon clicking **connect**, You'll be greeted by Tautulli's Setup Wizard. Click **Next** to continue

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584546853549.png)

* Here, this is where you'll input your Tautulli credentials. Add your preferred username and password. 
  * Make sure your username and password are unique

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584546935873.png)

* This section is where you'll connect your Plex Account to Tautulli. Click **Sign In** with Plex and login using your Plex credentials. You'll get an `Authentication successful `once logged in successfully.
* Click **Next** to proceed

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584547052889.png)

* Then, select the Plex Server that you wish to monitor.
  * If you install Plex Media Server on your seedbox, there would be 2 in the dropbox with the same PMS name. Select the one with the port `32400`. In the screenshot below, this is underlined.
  * Verify that the port is `32400` and both Remote server and Use SSL are unchecked

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584547429753.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584547520457.png)

  * If you have a Plex Media Server outside your seedbox, select that and enter its port.
    * Check Remote server (Important) and Use SSL (when applicable)
* You can leave the options on the last three steps as-is then click **Finish** to load up your settings and get you to Tautulli's Login Page.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590144667345.png)

### Setting Up SSL

* Click the gear icon on the top right side

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155133634.png)

* Click Show advanced to expose Tautulli's advanced settings

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155439065.png)

* Then on the Web interface, add `/tautulli` on HTTP Root and check **Enable HTTP Proxy**. Once that's done, scroll down and click **Save**.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155576285.png)

* Click **Restart** and wait for 30 seconds.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155673835.png)

* You can now access Tautulli Web Interface via `https://{username}.{servername}.usbx.me/tautulli`

***

## Extra Guides
### Installing and Configuring Custom Tautulli Scripts

This guide will show you how to setup Custom Tautulli Scripts. These scripts extend the functionality of your Plex Media Server and gives you more flexibility

In this guide, we'll be installing 2 scripts, `killstream.py` and `limiterr.py` from [blacktwin's JBOPS repository.](https://github.com/blacktwin/JBOPS). We'll be setting up the following:

* `killstream.py` to disallow transcoding of 4k sources
* `limiterr.py` to limit the amount of plays of a show during night time.

::: info
Take note that the scripts in this guide requires Plex Pass and will only work on Plex Pass users.
:::

#### Prerequisites

* Login to your seedbox's SSH
* We'll create a folder named `scripts`, so do `mkdir -p scripts` then navigate to your newly created folder with `cd scripts`
* Get the full path of the folder by doing `pwd`. Take note of the output. In this guide, the output is `/home7/usbdocs/scripts`. Yours may vary.

```sh
usbdocs@lw975:~$ mkdir -p scripts
usbdocs@lw975:~$ cd scripts
usbdocs@lw975:~/scripts$ pwd
/home7/usbdocs/scripts
usbdocs@lw975:~/scripts$
```

#### killstream.py
##### Downloading The Script

* Download the latest revision of the script below using `wget`

```sh
wget https://raw.githubusercontent.com/blacktwin/JBOPS/master/killstream/kill_stream.py
```

* After that, change the owner and make it executable by running the following commands

```sh
chown $USER:$USER kill_stream.py
chmod a+x kill_stream.py
```

##### Configuring Tautulli Notification Agent

* Open up Tautulli and go to Settings

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155133634.png)

* Then, on Notification Agents click **Add a new notification agent**. Scroll down and select **Script**.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590322948287.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323078825.png)

* Then under Script Settings, enter the following information

```
Configuration

Script Folder: [output of `pwd`]
Script file: ./kill_stream.py
Description: [Add anything here.]
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323393737.png)

```
Triggers

Playback Start
Transcode Decision Change
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323476172.png)

```
Conditions

Condition {1}: Video Decision - is - transcode
Condition {2}: Library Name - contains - 4K

Append 4k Library Namea with 4k movies/TV Shows in Plex for the second condition to work.
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323614866.png)

```
Arguments

Playback Start:

--jbop stream --username {username} --sessionId {session_id} --killMessage 'Please do not transcode 4k. Thanks!'
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323763313.png)

```
Arguments

Transcode Decision Change:

--jbop stream --username {username} --sessionId {session_id} --killMessage 'Please do not transcode 4k. Thanks!'
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323861186.png)

* Once that's all done, click **Save**

##### Testing The Script

* You can test your script by attempting to play a 4k file and change the quality to 720p or lower. It'll transcode for a while, after which you should get the stream kill message.

#### limiterr.py

::: info
This script is dependent on the timezone of Plex instances. Our slots are hosted in The Netherlands, so its timezone is CET/CEST. Adjust the times as necessary. You may use [World Time Buddy](https://www.worldtimebuddy.com/) to check your local timezone in relation to the seedbox's timezone.
:::

##### Downloading The Script

* Download the latest revision of the script below using `wget`

```sh
wget https://raw.githubusercontent.com/blacktwin/JBOPS/master/killstream/limiterr.py
```

* After that, change the owner and make it executable by running the following commands

```sh
chown $USER:$USER limiterr.py
chmod a+x limiterr.py
```

##### Configuring Tautulli Notification Agent

* Open up Tautulli and go to Settings

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155133634.png)

* Then, on Notification Agents click **Add a new notification agent**. Scroll down and select **Script**.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590322948287.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323078825.png)

* Then under Script Settings, enter the following information

```
Configuration

Script Folder: [output of `pwd`]
Script file: ./limiterr.py
Description: [Add anything here.]
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324580891.png)

```
Triggers

Playback Start
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324679523.png)

```
Conditions

Condition {1}: Current Hour - is - 22 or 23 or 0 or 1

(Value is dependent in relation to your timezone and the seedbox's timezone.)
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324783577.png)

```
Arguments

Playback Start:

--jbop limit --username {username} --sessionId {session_id} --grandparent_rating_key {grandparent_rating_key} --limit plays=3 --delay 60 --killMessage "You sleep bro?"
```

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324872494.png)

* Once that's all done, click **Save**

##### Testing The Script

* You can test your script by watching some shows at the set times. After 3 plays, you should get the stream kill message.