This tutorial assumes the following:

* You have a working autodl-irssi setup (filters + IRC server + Tracker passkey/RSS Key input)
* You have Deluge and ruTorrent installed
  * If you're not planning to use rTorrent as your torrent client, you can install ruTorrent without rTorrent. ruTorrent is only used to get access to autodl-irssi configuration UI.

***

* Login to your UCP, SSH and rutorrent Interface
* On your SSH window, execute `which deluge-console` and take note of the output

```sh
kbguides@lw902:~$ which deluge-console
/home6/kbguides/bin/deluge-console # TAKE NOTE OF THIS OUTPUT. YOU WILL NEED THIS LATER
kbguides@lw902:~$
```

* Go to your ruTorrent interface. Click the **autodl-irssi icon** then click **Preferences**
* Go to action Tab and input the following
  * Choose .torrent action = Run program
  * Command = Output of `which deluge-console`
  * Arguments = `connect 127.0.0.1:<deluge_daemon_port> <username> <password>; "add $(TorrentPathName)" ; quit`
    * Where
      * `deluge_daemon_port` = Daemon Port of deluge
      * `username` = your Deluge Username
      * `password` = Your set deluge password
      * Details are in Deluge's Remote Access details in UCP
    * Press **OK** and confirm that your configuration files are loaded by checking the output of autodl-irssi window in ruTorrent

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-3_9-21-3%5B1%5D.png"></p>

* Go back to your SSH window. Decide where you want to save the script. Here, it is saved to a folder named `scripts` to make easy to organize. Create a folder named scripts with `mkdir scripts`

```sh
kbguides@lw902:~$ mkdir scripts
kbguides@lw902:~$
```

* Navigate to the newly created folder with `cd scripts`

```sh
kbguides@lw902:~$ cd scripts
kbguides@lw902:~/scripts$
```

* Then, download the script to your seedbox using the following command

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Deluge/deluge-reannounce.sh
```

```sh
kbguides@lw902:~/scripts$ wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Deluge/deluge-reannounce.sh
--2019-06-03 10:17:06--  https://raw.githubusercontent.com/no5tyle/UltraSeedbox-Scripts/master/Deluge/deluge-reannounce.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.0.133, 151.101.64.133, 151.101.128.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.0.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 955 [text/plain]
Saving to: ‘deluge-reannounce.sh’
 
deluge-reannounce.sh               100%[=============================================================>]     955  --.-KB/s    in 0s
 
2019-06-03 10:17:07 (17.2 MB/s) - ‘deluge-reannounce.sh’ saved [955/955]
 
kbguides@lw902:~/scripts$
```

* Open up deluge-reannounce.sh using your preferred text editor. In this tutorial, we'll be using nano. So do `nano deluge-reannounce.sh`

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582618070101.png"></p>

* Then, replace the following with the information from Deluge's Remote Access Details in UCP.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-5-15_5-5-37%5B1%5D.png"></p>

* Find this exact line in the config and change the values accordingly

```sh
#!/bin/bash

# This script required the update-tracker.py from https://raw.githubusercontent.com/s0undt3ch/Deluge/master/deluge/ui/console/commands/update-tracker.py

# Change the below output location to any folder owned by your user for which you have write permissions
OUTPUT="/homeXX/user/scripts"

torrentid=$1
torrentname=$2
torrentpath=$3

# Update the ip, port, username and pass below according to your configuration
ip=xyz.xyz.xyz.xyz
port=zzzzz
username=yyyyyyy
password=xxxxxxx
```
* After you edit the necessary information, save it with **CTRL + O** then exit nano with **CTRL + X**

* Then, make the script executable by doing `chmod +x deluge-reannounce.sh`

```sh
kbguides@lw902:~/scripts$ nano deluge-reannounce.sh
kbguides@lw902:~/scripts$ chmod +x deluge-reannounce.sh
kbguides@lw902:~/scripts$
```

* Then, get the absolute path of the script by executing `readlink -f deluge-reannounce.sh` and take note of the output. This is the absolute of your script.

```sh
kbguides@lw902:~/scripts$ readlink -f deluge-reannounce.sh
/home6/kbguides/scripts/deluge-reannounce.sh #TAKE NOTE AND COPY THIS LINE. YOU WILL NEED THIS LATER.
kbguides@lw902:~/scripts$
```

* Login to Deluge's WebUI via UCP or Deluge's Thin Client
* Click **Preferences** → **Plugins** → **Check Execute Plugin**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-3_8-45-36%5B1%5D.png"></p>
<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-3_8-43-42%5B1%5D.png"></p>

* Click the **Execute Category** and Press **Add**
* Input the following
  * Event = Torrent Added
  * Command = The absolute path of the reannounce script
* After that, click **add**. Then Press **OK**.
* Close Deluge then restart your deluge instance via UCP or SSH (`app-deluge restart`)

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589891033979.png"></p>