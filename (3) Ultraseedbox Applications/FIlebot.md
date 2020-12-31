Mirrored from [the GitHub repo](https://github.com/ultraseedbox/UltraSeedbox-Scripts/blob/master/FileBot)

***

## Prerequisites

For the installers and the AMC scripts hosted here to work, you may have to do the following:

* Uninstall FileBot from the UCP
* Purchase a FileBot License and upload it to your slot using FTPS/SFTP

## Installation

### Version 4.9.2 (Recommended)
You can install this version using the instructions below:

1. `wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/FileBot/filebot-492-installer.sh`
2. `chmod +x filebot-492-installer.sh`
3. `./filebot-492installer.sh`
4. `rm filebot-492-installer.sh`
5. `filebot --license /path/to/FileBot_License_P1234567.psm`

### Version 4.9.1
You can install this version using the instructions below:

1. `wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/FileBot/filebot-491-installer.sh`
2. `chmod +x filebot-491-installer.sh`
3. `./filebot-491-installer.sh`
4. `rm filebot-491-installer.sh`
5. `filebot --license /path/to/FileBot_License_P1234567.psm`

:::info
To switch version, uninstall it first. This is to prevent any conflicts.
:::

## AMC/ Torrent Client Post-processing

AMC scripts automatically organizes your latest torrent downloads to your library. Once a torrent finishes downloading, by default the scripts do the following:

* Unpack archives to `~/files/_extracted`
* Auto-detect movie and episode files
* Fetch subtitles and transcode to SubRip/UTF-8
* Creates a symbolic link and organize episodes, movies and music files to `~/media`

You can also edit the scripts to your liking to automate more of your setup. For more information on AMC options, you can visit [this link](https://www.filebot.net/forums/viewtopic.php?t=215) for more information.

### Prerequisites

Before adding the scripts, make sure to do the following:

1. Uninstall FileBot from the UCP if you have it installed.
2. SSH in and create a folder to save your AMC scripts by doing `mkdir -p ~/scripts/amc`
2. Then choose the following script based on the torrent client you used.

### AMC Scripts
#### rtorrent

1. `wget -P ~/scripts/amc https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/FileBot/AMC/rtorrent-amc.sh && chmod +rx ~/scripts/amc/rtorrent-amc.sh`
2. `sed -i '/method.set_key = event.download.finished,filebot/d' ~/.config/rtorrent/rtorrent.rc`
3. `echo 'method.set_key = event.download.finished,filebot,"execute.nothrow=~/scripts/amc/rtorrent-amc.sh,$d.base_path=,$d.name=,$d.custom1="' >> ~/.config/rtorrent/rtorrent.rc`
4. `app-rtorrent restart` to apply the changes

#### Deluge

1. `wget -P ~/scripts/amc https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/FileBot/AMC/deluge-amc.sh && chmod +rx ~/scripts/amc/deluge-amc.sh`
2. `readlink -f ~/scripts/amc/deluge-amc.sh` and copy the output
3. In Deluge, Go to Preferences -> Execute. Set the following:

```
Event: Torrent Complete
Command: paste the output of readlink -f ~/scripts/amc/deluge-amc.sh (eg. /homexx/username/amc/scripts/deluge-amc.sh)
```

4. Press OK and `app-deluge restart`

#### Transmission

1. `app-transmission stop`
2. `wget -P ~/scripts/amc https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/FileBot/AMC/transmission-amc.sh && chmod +rx ~/scripts/amc/transmission-amc.sh`
3. `sed -i 's#^    "script-torrent-done-enabled".*#    "script-torrent-done-enabled": true,#' "$HOME"/.config/transmission-daemon/settings.json`
4. `sed -i 's#^    "script-torrent-done-filename".*#    "script-torrent-done-filename": "'"$HOME"'/scripts/amc/transmission-amc.sh",#' "$HOME"/.config/transmission-daemon/settings.json`
5. `app-transmission restart` to apply the changes

## Uninstallation

### Version 4.9.2

1. `rm -rfv "$HOME"/filebot-492`
2. `rm "$HOME"/bin/filebot`

### Version 4.9.1

1. `rm -rfv "$HOME"/filebot-491`
2. `rm "$HOME"/bin/filebot`

## Issues/Bugs

For any issues/bugs pertaining to FileBot, you may do so to the following channels:

1. [FileBot Forums](https://www.filebot.net/forums/)
2. [FileBot Subreddit](https://www.reddit.com/r/filebot/)
3. [FileBot Discord Server](https://discord.gg/skTt2em)

## Troubleshooting Information

**Why doesn’t Filebot work? It used to!**

Unfortunately, this is because of the TVDB API update around six months ago. The endpoints were updated in the latest versions of filebot. We provide the last FOSS version. To keep using Filebot, you will need to purchase your license, import and update your filebot on your slot. You may also find other alternatives.

**Why does Filebot keep crashing?**

Filebot is designed to compliment torrent clients on our infrastructure. Java, which is one of the dependencies of filebot, has a 1GB proclimit and is not recommended for running filebot in a cron or manage a whole folder at once. This type of action could quickly saturate an entire server’s cores.