This guide will show you how to setup Custom Tautulli Scripts. These scripts extend the functionality of your Plex Media Server and gives you more flexibility

In this guide, we'll be installing 2 scripts, `killstream.py` and `limiterr.py` from [blacktwin's JBOPS repository.](https://github.com/blacktwin/JBOPS). We'll be setting up the following:

* `killstream.py` to disallow transcoding of 4k sources
* `limiterr.py` to limit the amount of plays of a show during night time.

<c><p class="callout info">Take note that the scripts in this guide requires Plex Pass and will only work on Plex Pass users.</p></c>

## Prerequisites

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

## killstream.py
### Downloading The Script

* Download the latest revision of the script below using `wget`

```sh
wget https://github.com/blacktwin/JBOPS/blob/master/killstream/kill_stream.py
```

* After that, change the owner and make it executable by running the following commands

```sh
chown $USER:$USER kill_stream.py
chmod a+x kill_stream.py
```

### Configuring Tautulli Notification Agent

* Open up Tautulli and go to Settings

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155133634.png"></p>

* Then, on Notification Agents click **Add a new notification agent**. Scroll down and select **Script**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590322948287.png"></p>
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323078825.png"></p>

* Then under Script Settings, enter the following information

```
Configuration

Script Folder: [output of `pwd`]
Script file: ./kill_stream.py
Description: [Add anything here.]
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323393737.png"></p>

```
Triggers

Playback Start
Transcode Decision Change
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323476172.png"></p>

```
Conditions

Condition {1}: Video Decision - is - transcode
Condition {2}: Library Name - contains - 4K

Append 4k Library Namea with 4k movies/TV Shows in Plex for the second condition to work.
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323614866.png"></p>

```
Arguments

Playback Start:

--jbop stream --username {username} --sessionId {session_id} --killMessage 'Please do not transcode 4k. Thanks!'
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323763313.png"></p>

```
Arguments

Transcode Decision Change:

--jbop stream --username {username} --sessionId {session_id} --killMessage 'Please do not transcode 4k. Thanks!'
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323861186.png"></p>

* Once that's all done, click **Save**

### Testing The Script

* You can test your script by attempting to play a 4k file and change the quality to 720p or lower. It'll transcode for a while, after which you should get the stream kill message.

## limiterr.py

<c><p class="callout info">This script is dependent on the timezone of Plex instances. Our slots are hosted in The Netherlands, so its timezone is CET/CEST. Adjust the times as necessary. You may use [World Time Buddy](https://www.worldtimebuddy.com/) to check your local timezone in relation to the seedbox's timezone.</p></c>

### Downloading The Script

* Download the latest revision of the script below using `wget`

```sh
wget https://raw.githubusercontent.com/blacktwin/JBOPS/master/killstream/limiterr.py
```

* After that, change the owner and make it executable by running the following commands

```sh
chown $USER:$USER limiterr.py
chmod a+x limiterr.py
```

### Configuring Tautulli Notification Agent

* Open up Tautulli and go to Settings

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590155133634.png"></p>

* Then, on Notification Agents click **Add a new notification agent**. Scroll down and select **Script**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590322948287.png"></p>
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590323078825.png"></p>

* Then under Script Settings, enter the following information

```
Configuration

Script Folder: [output of `pwd`]
Script file: ./limiterr.py
Description: [Add anything here.]
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324580891.png"></p>

```
Triggers

Playback Start
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324679523.png"></p>

```
Conditions

Condition {1}: Current Hour - is - 22 or 23 or 0 or 1

(Value is dependent in relation to your timezone and the seedbox's timezone.)
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324783577.png"></p>

```
Arguments

Playback Start:

--jbop limit --username {username} --sessionId {session_id} --grandparent_rating_key {grandparent_rating_key} --limit plays=3 --delay 60 --killMessage "You sleep bro?"
```

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590324872494.png"></p>

* Once that's all done, click **Save**

### Testing The Script

* You can test your script by watching some shows at the set times. After 3 plays, you should get the stream kill message.