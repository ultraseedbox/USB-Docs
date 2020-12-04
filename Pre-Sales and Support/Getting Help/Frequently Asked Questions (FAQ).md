#### Pre-Sales
##### Who is Ultraseedbox?

Ultraseedbox is a trusted app hosting platform that has been in operation for over a decade. We provide managed shared slots with one-click solutions for the most popular Linux media applications, non-root shell access, and premium support. We innovate and strive to make sure that our clients are taken care of.
##### What are the applications offered as one-click-installers?

* Airsonic
* Bazarr
* BTSync/Resilio Sync
* CouchPotato
* Emby (not available on Essential tier plans)
* Filebot
* Jackett
* JDownloader2
* Jellyfin (not available on Essential tier plans)
* LazyLibrarian
* Lidarr
* MariaDB
* Medusa
* Mylar
* Nextcloud
* NZBget
* NZBHydra2
* Ombi
* Plex (not available on Cheap and Robust Plans)
* Pydio
* pyLoad
* Radarr
* SABnzbd
* SickChill
* Sonarr
* Syncthing
* Tautulli
* Transmission
* Ubooquity
* ZNC
##### Where are your servers located?

Our servers are hosting with Novoserve and YISP. Both operate their data centers in the Netherlands.

##### Is root/sudo access available to install applications that are not offered by Ultraseedbox?

Users do not have sudo or root access.
##### What are the upload and download quota limits?

The amount of data you may download to your slot is unlimited; only the upload traffic is counted against the quota assigned to your service.
##### When does my upload traffic usage reset?

Your traffic resets every month on the day you signed up. This date is shown in your User Control Panel under the Slot Info tab.

##### What happens after I have exhausted my upload traffic for my billing period?

After you have exhausted your upload traffic quota, your upload speed will be throttled to 10Mbps until your next traffic reset date. Your download speed will always be unthrottled.

##### Do you offer the ability to add more upload bandwidth to my service?

Yes. You can view bandwidth add ons available to your services on your account page [here](https://my.ultraseedbox.com/cart.php?gid=addons).

##### Which services are not counted towards my upload monthly traffic quota?

The following applications and services are not counted towards your upload traffic quota and will not be throttled after you’ve exhausted your upload traffic quota:

* FTP
* SSH
* Media center applications such as Plex, Emby, and Jellyfin.

##### How many Plex transcodes can I expect?

Generally, around one 10Mbps X264 -> X264 1080p transcode per available core but not guaranteed. Some servers have a GPU as a bonus to get a few more through that, but it is shared between the other users and is not dedicated to one user. Like all scenarios, we must remain considerate at all times. 4K should never be transcoded; if all of your devices cannot support 4K, I would advise against exclusively filming your content or collecting 4K. X265/HEVC -> X264 1080p will also create it's own challenges and will cut down your Plex performance significantly.

##### Do you offer data migrations from another provider to my service with you?

Yes. Please open a ticket [here](https://my.ultraseedbox.com/submitticket.php), and our support staff will be happy to do this on your behalf.

##### Does Ultraseedbox "oversell"?

This term is often thrown around on public forums and Reddit. No, we do not "oversell" slots. The fact is that you could put two or three users on a disk and overload the IO. Some clients can be noisy, that is a fact, of course, and we will do everything we can to resolve that issue. Everybody's expectations and habits are different. If a user needs to be moved for load balancing or better customer experience, we will do that.

#### Payments and Refunds
##### I want to pay automatically via PayPal. How can I do that?

After you have agreed to Ultraseedbox’s Terms of Service and chose PayPal as your payment option, you will see two buttons in the top right of your invoice, one will be PayPal Checkout, and the other will say Subscribe. Click the **subscribe button** to set up a pre-approved agreement with PayPal. After this, your subsequent invoices will be paid automatically. Take note that the Subscribe button will vanish on overdue invoices.

In regards to the pre-approved payments, this is an agreement between you and PayPal. If you cancel your service or apply for a refund, you must cancel this subscription on your end.

Any overpayments due to this are non-refundable and are automatically credited to the client’s account.

##### Do you offer any trials?

We do not offer any trials. However, if the service is not up to your standards or requirements, we will give you a prorated refund within your first seven days of service with us.

Please refer [here](https://docs.usbx.me/books/ultraseedbox-policies/page/refund-policy) for our refund policy in detail.

##### How can I cancel my service and receive an eligible first seven days of service prorated refund?

After working without our support team and confirming that our services are not right for you, you can request your service be immediately canceled from within your customer portal page [here.](https://my.ultraseedbox.com/)

Then proceed to open a ticket [here](https://my.ultraseedbox.com/submitticket.php) to request our support team to start the processing of your prorated refund.

##### Which currencies do you accept for payment?

* $ - United States Dollars
* € - Euros
* £ - British Pounds

##### Am I able to change the currency I had picked initially when I created my account?

No. This is not possible for tax and accounting reasons. If you wish to change your currency, you will need to register a new account.

##### What are the payment methods offered?

* PayPal
* Credit/Debit with PayPal as the secure processor
* Cryptocurrency

#### Security and Privacy
##### Can other users see or access the data in my slot home folder?

No. All users are jailed to their home directory and can not access other users’ home folders on the server. Never change the permissions of your home directory, as this will allow access of your home directory to other users.

##### Do you keep any logs of any kind?

We keep certain logs for troubleshooting purposes. For more information on this, please read the Data Handling Privacy.

##### Do Ultraseedbox Slots come with a VPN?

Yes, each service comes with three VPN configurations for three separate devices to keep your web browsing anonymous.

##### Can I change the username of my slot?

Changing usernames is not possible due to how your username is used for the deployment of your service. You may get a new slot with your username and ask us to move your files from your old slot to your new one.

##### How do I change my email address associated with my account?

For security reasons, you will need to open a support ticket [here](https://my.ultraseedbox.com/submitticket.php) with this request, and our support team will be happy to assist with applying the requested email change for you.

##### Does Ultraseedbox forward DMCA Notices?

Our Data Centers are in the EU and not in the US, but we are legally obligated to forward DMCA's from our host if required.

#### Managing Your Seedbox
##### Will I be able to install my applications other than the ones supported by Ultraseedbox?

Yes. You may install and run any programs in your userspace/Home directory via your slot's SSH shell access, providing they do not abuse server resources and is within our policies.

##### Are there any BitTorrent trackers that are not allowed?

The only type of tracker we restrict is seeding to public ones. We ask you to limit your public torrents to a ratio of 2. You can see how to do this on your respective clients here:

* [Deluge](https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge)
* [ruTorrent](https://docs.usbx.me/books/rtorrentrutorrent/page/limiting-seeding-ratio-in-rutorrent)
* [Transmission](https://docs.usbx.me/books/transmission/page/limit-seeding-ratio-in-transmission)

##### Do you allow the use of rclone for mounting of remote storage file systems such as Google Drive?

Yes. Our platform allows the installation of rclone and mount remote file systems such as Google Drive. Although official support will be limited due to the many variables involved with the use of remote file systems and mounts, our support team will do their best to point you to the correct guides to accomplish your goals by utilizing rclone mounts.

We have detailed guides located [here](https://docs.usbx.me/books/rclone) to set up and then utilize your rclone remote file system mounts.

##### What happens when my allocated storage runs out?

Your webserver and applications will temporarily be offline and inaccessible. However, your slot services such as FTP/SFTP/SSH will remain active and accessible for you to delete data then restart/repair your web server and applications to bring them back online.

##### Can rclone remote file system mounts be used as a source for streaming applications such as Plex/Emby/Jellyfin?

Yes. While remote file systems by nature will not be as stable as using local storage, in most cases, they will work quite well as a source for streaming applications such as Plex, Emby, and Jellyfin. We have a detailed guide located [here](https://docs.usbx.me/books/rclone/page/rclone-optimizations-for-apps) on optimizing applications for the use of rclone remote file system mounts.

##### Can rclone remote file system mounts be used as an endpoint location for applications importing data such as Radarr/Sonarr/Lidarr/Couchpotato/SickChill/Medusa?

Yes, but using a direct rclone remote file system mount as an endpoint for an application’s endpoint path is not recommended for stability reasons. MergerFS is a much more stable method to accomplish this and is strongly recommended. We have a MergerFS automation detailed guide located [here](https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup) on how to set this up.

##### Why is my all allocated traffic all consumed?

Usual reasons are the following:

* You may have a public torrent left seeding.
  * We have guides here that limit seeding of public torrents to 2 ratio as per USB policies.
    * [rTorrent](https://docs.usbx.me/books/rtorrent-rutorrent/page/limiting-seeding-ratio-in-rutorrent). Also, take note that rTorrent has a script that blocks common public torrents from seeding after downloading.
    * [Deluge](https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge)
    * [Transmission](https://docs.usbx.me/books/transmission/page/limit-seeding-ratio-in-transmission)
* You have continuously synced your files using rclone, Resilio Sync, Nextcloud, or Syncthing.
  * These applications are counted towards your upload bandwidth. You may have to throttle the speeds or schedule your transfers.
  * Another alternative is using FTP or SFTP for your transfers.
#### Support
##### Why is my slot suspended?

This is almost always due to a late payment. Ten days before your due, you will be receiving an email with your invoice. Failure to pay on time will lead to the suspension of your slot. After this, you have seven days to pay your overdue invoices, after which it gets automatically purged from our systems if not paid after that.

##### How can I upgrade my slot?

You will need to open a ticket [here](https://my.ultraseedbox.com/submitticket.php) and let support staff know which service you would like to upgrade. The support team will then generate a prorated invoice for you and walk you through the upgrade process steps.

##### How can I downgrade my slot?

We do not offer downgrades of a current service, but if you wish to purchase a downgrade slot and have our support team assist with migrating your current slot’s data, they will be happy to do so. Please open a ticket [here](https://my.ultraseedbox.com/submitticket.php) after you have purchased a downgraded slot to request our support team to begin your data migration.

##### Do you accept recommendations for apps to be added as a one-click-installer?

Yes. Please feel free to submit a ticket [here](https://my.ultraseedbox.com/submitticket.php) to make an application suggestion. After there have been sufficient requests for an application, our dev team will do thorough testing of the application for both stability and security. Then, the application may be added as a one-click-installer.

##### How can I improve the download peering from my server with a reroute?

We have a helpful guide [here](https://docs.usbx.me/books/rerouting-tools) for rerouting your traffic for both Novoserve and YISP, which may help improve the peering to yours. For reference, All YISP slots have a subdomain that starts with lw9xx, and all NovoServe slots have a subdomain that starts with lw8xx.

##### Do you offer managed backups of my slot’s storage?

To provide you with some of the best and most competitive prices, we cannot offer managed backups. We encourage all users to implement their backup solutions so that data can be restored in the rare event of a hard drive failure.