#### Bad response from server: (0 [error,getplugins])

This error requires your webserver to be reinstalled from your UCP. The reinstall webserver button (Orange button) can be found in your main dashboard next to your traffic quota. You can also do this on your slot’s shell by running the following commands:

```sh
app-nginx uninstall
app-nginx install
```

#### No connection to rTorrent. Check if it is running. Check $ scgi_port and $ scgi_host in config.php and scgi_port in rTorrent config file.

This error means that rTorrent is not running, and it usually needs to be restarted from your UCP or running `app-rtorrent restart` while connected to your shell.
This can happen in a few scenarios:

* Your allotted disk quota is exceeded, so your session cannot write to your directory.
  * You will need to connect to your service via Shell or FTP, remove unneeded data, and restart rTorrent.
* You have a bad torrent in your session.
  * You need to restart rTorrent, quickly connect to your ruTorrent, and stop all torrents. Then, start the torrents one by one. Usually, torrents with random letters or a `.meta` extension in the name are the bad torrents. Once you have found the files, remove it from the client, and try again.
* Your HDD’s IO is extremely saturated.
  * You will need to check this using `iostat`. Visit this guide [here](https://docs.usbx.me/link/235#bkmrk-how-to-check-the-hig) for more information.

#### Error downloading files. Make sure autodl-irssi is started and configured properly (e.g., password, port number): Error getting files listing: Error: Could not connect: (111) Connection refused

Two common reasons why you would receive the error:

* The first and most common is irssi is just not running for whatever reason, such as a hard crash or a reboot. In most cases restarting autodl-irssi will fix the issue.
* The other reason may be you have reinstalled ruTorrent. This changes the GUI password, so autodl-irssi can no longer connect to ruTorrent. In this case, you will need to back up `~/.autodl/autodl.cfg` and reinstall autodl-irssi.

#### Uncaught TypeError: Cannot read property 'rTorrent' of undefined or JS errors in general;

These errors are usually caused by security and antivirus software or browser extensions such as ad blockers preventing the scripts from ruTorrent from loading. Try disabling these and test ruTorrent in an incognito tab to start. These are almost always client-side.

Clients who use Kaspersky software are most likely to see this error.

#### Why does the main IP of my seedbox and torrent clients appear different? Which IP should I report to trackers?

Our seedbox IPs are pooled to avoid clashing on trackers with a more extensive user database to help peers and seeders. If you need to submit IP's to trackers, then you should use the IP's that are binding to the torrent clients. You can obtain them by the following methods:

```
rTorrent: cat .config/rtorrent/rtorrent.rc | grep bind
ruTorrent: Settings -> Advanced -> Bind (bottom field)
```

#### Why aren’t my torrents producing any upload? They’re not seeding!

This usually causes the following:

* After the first couple of hours, Linux distros and freeware content are generally overpopulated. For that, you may have to grab the torrent as it is posted on the website. Tracker forums usually have methods to snatch them automatically via RSS or Autodl-irssi.
* Some tracker forums block the seeding of new torrents after a particular ratio within a day. You may have to refer to your tracker’s rules for this.
* Your torrents may have some errors. Check the torrent’s status for this.
* rTorrent, by default, has a script that stops common public torrents from seeding after it has been finished downloading.

#### Why is Autounpack not working? How to configure it correctly?

A lot of plugins have compatibility issues after 0.9.6, and this is one of them, unfortunately. You will need to rollback your client to 0.9.6 for this and a few other plugins to work.

You can resolve it using the `repair` option in your UCP under the rTorrent action menu in the installed application tab. This should revert you to 0.9.6 by running `app-rtorrent install -v 0.9.6`. `app-rtorrent repair` will also work in your shell.