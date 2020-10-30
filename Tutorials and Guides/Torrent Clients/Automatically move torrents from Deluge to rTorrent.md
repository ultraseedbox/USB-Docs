<c><p class="callout warning">This guide is for advanced users only and is not officially supported by USB, as it is frequently updated voluntarily by our staff and it may be broken in some slots. Only proceed if you know what you're doing. If there are any questions on the installation or the execution of the scripts, you may ask on the USB Community server.</p></c>

As many of you know, Deluge is fast and more aggressive to upload but it starts to become a real nuisance once you load more than 500 torrents. rTorrent, on the other hand, is good at handling a large amount of seeding torrents, making it ideal for long term seeding.

This guide will help you automate the process of moving your torrents from Deluge to rTorrent for long-term seeding.

<c><p class="callout info">The script is unable to transfer your torrent stats (ratio/seeding time) from Deluge to rTorrent.</p></c>

***

## Preparation

* By default, Deluge downloads to `~/Downloads` and rTorrent downloads to `~/files`.
* Please ensure that **both Deluge and rTorrent download to the _same_ directory.**

<c><p class="callout info">Deluge _requires_ an absolute path to your **Download to:** directory, so you'll have to enter something like `/home13/username/Downloads`, not `~/Downloads`. rTorrent, on the other hand, will accept shortcuts such as `~/Downloads`.</p></c>

***

## Install Dependencies

* Login to your slot's SSH terminal and execute the following commands

### Python 3

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Language%20Installers/python-pip-install.sh
bash python-pip-install.sh
```

### perl

```sh
screen -m bash -c "curl -L http://xrl.us/installperlnix | bash"
```

* Get your slot's full path by doing the following. Take note of the following output.

```sh
pwd
```

* After that run the following commands

```sh
exec $SHELL
python -m pip install requests service_identity cryptography perl
perl -MCPAN -e 'install Convert::Bencode'
```

* The installer is interactive so respond to the prompts as follows

```
Would you like to configure as much as possible automatically? [yes] yes

What approach do you want? (Choose 'local::lib', 'sudo' or 'manual') local::lib

Would you like me to append that to /homexx/username/.bashrc now? [yes] yes
```

* After the installation, reload `.bashrc` by doing the following command

```sh
exec $SHELL
```

***

## Download Scripts

* For this guide, we will install it in `$HOME/scripts`
  * You may choose another folder accordingly.
* Run the following:

```sh
mkdir -p "$HOME"/scripts/move-torrent/
cd "$HOME"/scripts/move-torrent/
wget https://raw.githubusercontent.com/lethanhviet/autoExport/master/rtorrent_fast_resume.pl -O "$HOME"/scripts/move-torrent/rtorrent_fast_resume.pl
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/deluge-rtorrent/autoExport.py -O "$HOME"/scripts/move-torrent/autoExport.py
```

***

## Configuration

* Edit `autoExport.py` in your favorite editor. We'll use `nano`.
* The following are optional fields and can be leave as blank
  * Fill out `discord_url` if you want Discord notifications
  * Enable `is_interactive` if you want to run the script manually and see the output in your terminal.

```sh
nano "$HOME"/scripts/move-torrent/autoExport.py
```

* Find this section of the script and edit accordingly

```py
#######################################################
# Customize
#######################################################
is_interactive = False 								# Set this to True to allow direct output or set to False for cron
discord_url = "" 									# Discord Webhook URL
minseedtime = 24 									# Minimum seeding time (in hours)
src = home_dir + "/scripts/" 						# Where is rtorrent_fast_resume.pl kept?
state_folder = home_dir + "/.config/deluge/state/" 	# Link to deluge's state folder
watch_folder = home_dir + "/watch/" 				# Link to rTorrent's watch folder
deluge_port = 12345 								# Deluge Port. Found under "Remote client access" section in UCP
deluge_user = "username" 							# Deluge Username. Found under "Remote client access" section in UCP
deluge_pass = "p@55w0rd" 							# Deluge Password. Found under "Remote client access" section in UCP
```

It is critical you ensure your folder paths are properly quoted

For example: `watch_folder = "/homeXX/user/watch/"`

* `autoExport.sh` is the script you'll actually run. The `autoExport.sh` script essentially just runs the `autoExport.py` script, but specifically using the custom version of Python included with Deluge.
* Run the following command to download this.

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/deluge-rtorrent/autoExport.sh -O "$HOME"/scripts/move-torrent/autoExport.sh
```

```sh
chmod +x "$HOME"/scripts/move-torrent/autoExport.sh
```

***

## Testing the script

* You can now choose to test out your script by running it manually

```sh
"$HOME"/scripts/move-torrent/autoExport.sh
```

Be sure to set `is_interactive = True` in order to see the output in your terminal window

***

## Setting Up Scheduling with cron

* Get the full path of the script by running the following

`echo "$HOME"/scripts/move-torrent/autoExport.sh`

```sh
usbdocs@lw840:~$ echo "$HOME"/scripts/move-torrent/autoExport.sh
/home23/usbdocs/scripts/move-torrent/autoExport.sh
```

* To set up a cron job,

```sh
crontab -e
```

* Add the following entry to run the script. This assumes you want to execute the script every 6 hours

```
0 */6 * * * /home23/usbdocs/scripts/move-torrent/autoExport.sh
```

<c><p class="callout info">For more information on crontab schedules, visit [crontab.guru](https://crontab.guru/)</p></c>