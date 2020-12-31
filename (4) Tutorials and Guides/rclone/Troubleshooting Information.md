#### Can you help me with rclone?

Rclone is a powerful tool that allows you to create virtual drives or mount points. The following help in this section will assume that you have installed your rclone with the help from our documentation and guidelines.

While it is an excellent tool, it is not very reliable. It should never be used to write data directly to your cloud services with our applications. Use `mergerfs` for that purpose. It is also essential that those who utilize them will know how to troubleshoot them when needed.

Please do not mount to any of the default directories such as:

* `files`
* `media`
* `bin`
* `.apps`
* `.config`
* `www`
* `/homexx/username/`

This will lead to instabilities within your slot.

Please click [here](https://docs.usbx.me/books/rclone) to go to our Rclone setup guide.

Due to these variables involved, official support for rclone or applications utilizing these applications will not be provided.

#### Job for rclone-vfs.service failed because the control process exited with error code. See "systemctl --user status rclone-vfs.service" and "journalctl --user -xe" for details.

This may be due to the following reasons:
* Check your service file for typos.
  * Make sure `/homexx/yyyyy` is your *actual *home directory.
* Make sure all the paths referenced in the file exist.
  * You need to create the following folders: `Stuff`, `Stuff/Mount`, `Stuff/Local` (if using MergerFS Setup), and `scripts`.
  * We recommend using the default settings as it is specifically tuned to our slots.
* What does `~/bin/rclone version` return in SSH?
  * If the output is `No such file/directory`, this means you have not downloaded rclone.
* Execute `~/bin/rclone listremotes`. Is the remote name the same as the one in the first configuration line? For example, it should return gdrive such as

```
ExecStart=/homexx/yyyyy/bin/rclone mount **gdrive**: /homexx/yyyyy/Stuff/Mount \
```

Following the advice above, you should find the issue, and when you have, do not forget to execute `systemctl --user daemon-reload` before trying to enable it again.

#### ls: cannot access 'SomeDirectory': Transport endpoint is not connected

This means the rclone process/mount is dead but the mount is still fused. If you’re using systemd following our guide, please stop your mount using systemctl:

* Run the following command:

```sh
systemctl --user stop rclone-vfs
```

* If using mergerfs

```sh
systemctl --user stop mergerfs
```

* Then, execute the following command:

```sh
mount | grep $USER
```

* Disconnect the rclone mount with the following command:

```sh
fusermount -zu /path/to/SomeDirectory
```

* Finally, fill all remaining rclone processes by running the following command:

```sh
killall rclone

```

Now follow the process to restart your mount below.

#### How do I restart my rclone cloud or mergerfs mount?

Execute the following in your shell terminal (SSH)

1. Stop all currently running applications that utilize the mount. This applies to Plex, Radarr, Sonarr, etc. (can be done in ucp or ssh using `app-[name] stop`).
2. SSH into your seedbox slot.
3. Run `systemctl --user stop rclone-vfs` and `systemctl --user stop mergerfs` if using mergerfs
4. Run `fusermount -u /path/to/mount` and `fusermount -u /path/to/mergerfs` if using mergerfs
5. Run `systemctl --user start rclone-vfs` and `systemctl --user start mergerfs` if running mergerfs
6. Verify that the mount is working by going into your mount folder and running `ls -la` to verify we are connected. If using mergerfs, check the mergerfs folder too.
7. Start all applications from the UCP or ssh using `app-[name] start`. (replace [name] with app name, app-plex start.)

#### I use rclone or a cloud mount, and my xx application is not working or is slow. Why is that?

As stated, you should not use rclone or cloud mount directly with applications that will attempt to write directly to it. You should use MergerFS for that. Please check our resource for MergerFS [here](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup).