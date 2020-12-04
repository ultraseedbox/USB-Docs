#### How do I update Plex?

Our Upgrade/Repair Plex image is locked to a version/image we deemed as stable. This is due to some clients reporting issues on the newest Plex releases.

To upgrade to the latest Plex, you can do this via [SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh). You may refer [here](https://docs.usbx.me/books/plex-media-server/page/updating-plex-media-server-via-ssh) to how to upgrade your Plex to the newest version.

#### My Plex is down. What are some Troubleshooting Steps to resolve it?

Usual causes of this are Plex updates, or the server cannot read or write to the library, which is a common occurrence with rclone mounts. In these cases, the RAM usage of Plex would go up, and the system will kill your Plex instance.

It's also worth mentioning that some of Plex’s features, especially logins, Server Claiming API, and Web apps, are hosted by Plex. Please check here for any announcements on their system: [https://status.plex.tv](https://status.plex.tv). 

* First, try to restart Plex and see if it returns after 5 minutes.
* Check if the container is not damaged. Try to use the upgrade/repair option from your UCP action menu under Installed Applications -> Plex and wait for 5 minutes.
* Try to claim your server again, as your server token is expired. Visit https://plex.tv/claim to get your claim code. Then, use the Claim option from your UCP action menu under Installed Applications -> Plex. Paste your code and click claim.
* If it’s still not running, log in to your slot’s SSH and run the following command:

```sh
ps aux | grep [p]lex
```

* If it returns any sort of "D" state or <defunct>, something is holding the Plex process.
  * If Plex is Defunct, this is usually caused by a broken rclone mount. To fix that, you may visit this guide [here](https://docs.usbx.me/link/237#bkmrk-ls%3A-cannot-access-%27s) and restart Plex after. After restarting the mounts and Plex, run `ps aux | grep [p]lex`, and if it returns nothing, your Plex is running normally. If not, repeat the guide.
  * If it is still D state, then another 3rd party app is holding the process. Stop any application that is affiliated with your instance of Plex.
  * If `grep` returns normally, is not in a defunct state, but you cannot access Plex, your Plex database may be corrupted, and you may need to view the logs. You can either run the following command on SSH and look for any errors. You can also download your logs via https://app.plex.tv in your Plex settings.

```sh
cat .config/plex/Library/Application\ Support/Plex\ Media\ Server/Logs/Plex\ Media\ Server.log
```

  * Any SLOW QUERY and SQLite errors/warnings are signs of a corrupted database. You may attempt to repair your database, as stated by the guide [here.](https://docs.usbx.me/books/plex-media-server/page/repairing-plex-database)
  * If it doesn’t work, the last resort is to back up your old configuration to confirm that your database is corrupted and see if Plex comes online with a new configuration. Execute the following commands:



```sh
mv ~/.config/plex ~/.config/plex.bak
```

  * Then afterward, reinstall Plex. If it runs, you may need to do a fresh install of Plex.

#### Why is Plex producing a transcoder error?

The Plex Transcoder exited error is a general error for not playing back the media using the video player or transcoder, and you may need to view the logs. You can either run the following command on SSH and look for any errors. You can also download your logs via https://app.plex.tv in your Plex settings.

```sh
cat .config/plex/Library/Application\ Support/Plex\ Media\ Server/Logs/Plex\ Media\ Server.log
```

The most common bug was found recently is that we overlooked that the installer did not mount `/transcode` with `.config/plex/transcode` correctly, which results in the following error in your log:

`ERROR - Error creating directory "/transcode": Permission denied`

This can be resolved by running the following command:

```sh
app-plex upgrade
```

#### ERROR - ERROR - An error occurred reading the file: /homeXX/username/SOMEMOUNT/path/to/File.mp4 (5).

Something is wrong with your mount, and this will need to be troubleshot separately. In this case, it is usually `Error 403: Rate Limit Exceeded`, `rateLimitExceeded`, or a wholly dropped mount endpoint.

Any sort of SQLite/Database errors here will be a problem and could indicate your Plex database is corrupt or in the process of doing so. You may attempt to repair your database, as stated by the guide [here.](https://docs.usbx.me/books/plex-media-server/page/repairing-plex-database)