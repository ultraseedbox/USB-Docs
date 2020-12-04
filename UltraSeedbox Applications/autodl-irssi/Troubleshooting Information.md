#### Why is autodl-irssi not working?

Check your autodl-irssi tab in ruTorrent and your ruTorrent logs. Below are the following common errors with autodl-irssi.

#### Error downloading files. Make sure autodl-irssi is started and configured properly (e.g., password, port number): Error getting files listing: Error: Could not connect: (111) Connection refused

Two common reasons why you would receive the error stated.

* The first and most common is irssi is just not running for whatever reason, such as a hard crash or a reboot. In most cases restarting autodl-irssi will fix the issue.
* The other reason may be you have reinstalled ruTorrent. This changes the GUI password, so autodl-irssi can no longer connect to ruTorrent. In this case, you will need to back up `~/.autodl/autodl.cfg` and reinstall autodl-irssi.