#### Why does Deluge keep crashing?

This is a typical characteristic of Deluge. It usually happens when downloading, where the client will prioritize torrent traffic over the WebUI. Deluge is aggressive and caches the information into the RAM. In turn, the Deluge WebUI loses connection, and the Daemon would appear offline.

It will come back/stabilize some minutes after the download is completed, and no action needs to be taken at that time.

If it's not coming back, a misconfigured plugin may be interfering with Deluge. The usual case with this is ltconfig with high-performance seed preset engaged. This preset most likely crashes Deluge. We recommend using our default tunings first, as it is tuned specifically for our slots.

#### Why aren’t my torrents producing any upload? They’re not seeding!

This usually causes the following:

* After the first couple of hours, Linux distros and freeware content are generally overpopulated. For that, you may have to grab the torrent as it is posted on the website. Tracker forums usually have methods to snatch them automatically via RSS or Autodl-irssi.
* Some tracker forums block the seeding of new torrents after a particular ratio within a day. You may have to refer to your tracker’s rules for this.
* You may have some plugin that blocks your torrents from uploading.
* Your torrents may have some errors. Check the torrent’s status for this.

#### Why does the main IP of my slot and torrent clients appear different? Which IP should I report to trackers?

Our seedbox IPs are pooled to avoid clashing on trackers with a more extensive user database to help peers and seeders.

If you need to submit Deluge’s IP to your trackers, then you should use the IP's that are binding to the torrent clients. You can obtain them by logging into Deluge and go to **Settings -> Network -> Interface**. Copy the IP from that field.