#### How to check the high utilization of the disk I’m in?

If your apps are slow and your slot is running sluggish, this is the most common cause.

Any sort of file access on the disk creates io load on the HDD, either by you or other users in the node. This is not an issue with the NVME slots due to their breakneck IO speeds.

Typical applications that do this include the following:

* Torrent clients checking torrents.
* A very active torrent, usually a public torrent
* Unpacking files
* Constant rclone operations to and from providers
* Usenet operations (Unpacking, Downloading, Repairing, etc.)

Run this command in your [shell](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) terminal and pay attention to the last column %util.

```sh
iostat -xk 2 $(findmnt -T ~ | awk 'END {print $2}')
```

If this is 100% after a few minutes, then the disk is entirely saturated, affecting performance. We recommend curbing your settings in your installed applications to prevent this.

If you're doing none of the above, you may need to submit a ticket.

#### How to clear up disk space or move data from my slot?

The easiest way to manage any data is by using your favorite S/FTP client. Filezilla is the most popular choice. We recommend using SFTP as your connection of choice due to it being more flexible on which folders to manage. You can also drag and drop with an S/FTP client, which makes it incredibly useful as a whole. The downside of this is that it takes time for the client to process your moves. Our help guide for S/FTP is available [here](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29).

The fastest way, however, is by using [SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh), but this might be intimidating for inexperienced users. For starters, you can use Midnight Commander, which is a graphical user interface file manager in your slot. It can be started by executing `mc` in your shell. You can also read our basic Linux cheat sheet [here.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/your-ultraseedbox-linux-terminal---helpful-commands-for-learning-linux)

#### Why am I unable to connect with SSH, and why is there an error “Resource Temporarily Unavailable”?

In most cases, this is your total `proclimit` being saturated. We implement resource limits in each slot to ensure fair resource usage on all users. Usually, apps like rclone or syncthing are responsible due to hundreds of worker threads spawned by the application, and in most cases, restarting your applications before logging into SSH again should fix the issue. If it does not work, you may need to submit a ticket.

#### Some of my files have duplicates in `~/files` or `~/Downloads` directory and `~/media` directory. Are they using double disk space?

If you’re using Radarr/Sonarr/Sickchill/CouchPotato/Medusa etc., they should not be taking any additional space. By default, these applications create a *hardlink* of the media file to the default root directory of your application from the path that your Torrent client stores your original downloaded files with. A hard link can be described as a single file located at two different paths but pointing at the same block of data on the disk. Think of it as two signposts from other streets that direct you to the same destination. Hardlinks do not take any extra space. You can compare the inode numbers for both files from the Terminal ([SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) Access) with `ls -I` on both files’. The inode number will be the same.

Hardlinks allows your torrent client to continue seeding while having a “link file” on your media folder neatly arranged. If you wish to delete a file completely that has a hardlink, you may need to delete both the files from your Torrent Client and on your media folder.

You can read more about Hard Links here: [https://en.wikipedia.org/wiki/Hardlink](https://en.wikipedia.org/wiki/Hardlink).