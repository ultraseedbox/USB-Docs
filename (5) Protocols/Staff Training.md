##  Introduction

This a rough collection of fixes, tips & tricks and routine jobs associated with being part of the Ultraseedbox Staff. Some may not apply depending on your role here — don’t worry this is just to give you the newcomer a point of reference when working. You are still encouraged to ask questions, be inquisitive and learn as much as you can.


This guide does not aim to address one specific issue but merely serves as a record of all the fixes and tidbits we learn in a staffer’s role. We hope you enjoy your stay with us and we welcome you wholeheartedly to the Ultraseedbox Family. 


*Please note this guide is forever evolving. If you would like to add to the guide with your tidbit, please feel free to do so but please make sure it is under a relevant header. If one does not exist please create one.*

## Ticket Tidbits

### WHMCS Auto-refresh

WHMCS has a useful auto-refresh feature which can help you keep on top of tickets. For example: If you go to `Support tab > Support tickets > Open` you will see a list of open tickets. Under the main tabs are two gray tabs marked `Search/Filter` and `auto-refresh`. Clicking auto-refresh will allow you to pick an interval then `Click Apply`. This now sticks for every session so you can keep the page open and have it update the screen each minute.

### Transfers underway must be marked IN PROGRESS!

If you see things like slot info in a note, or "transfer" stuff like this, and you do reply to it, make sure to put it in "In Progress" state when you reply, otherwise clients will end up with 2 slots for free basically (because we keep track of the migrated slots this way to mark them for removal after client has verified their migrated data. The "In Progress" state is for when we will reply to them later (like working on the issue still, for example). If you're working on the ticket, just do "WIP" on a note - that's how other staff will know to leave it alone (vs doing an "in progress" state).

### Guest Tickets

Try to get a client to make a linked ticket, not a guest. You can't see the client's slot details via WHMCS. Solve issue or suggest resolution if possible with info available, but also include information and link on how to submit a “verified” logged-in ticket.

You can tell this if slot information is missing from the bar above their reply, send them this with your twist:

```
We are always happy to assist our customers but, to provide the best experience possible, it's recommended to open a support ticket from within the client area only.

The client login page to submit a verified ticket is located at:

> https://my.ultraseedbox.com/clientarea.php

This helps us to verify your account and enables us to see your service details on our end to provide you with the best support possible.

Please accept our apologies for any inconvenience this may cause.
```

## General Tidbits

Just a tip on app troubleshooting here:

UCP wasn't showing any version for rTorrent

```
stop rTorrent
backup rTorrent
uninstall rTorrent
reinstall rTorrent
restore rTorrent which now works (and usually does for a borked UCP app like this)
```

`app-rtorrent stop`

`mv ~/.config/rtorrent ~/.config/rtorrent.BAK`

In UCP: Uninstall rTorrent and then reinstall rTorrent

`app-rtorrent stop`

`mv ~/.config/rtorrent ~/.config/rtorrent.FRESH`

`cp -rv ~/.config/rtorrent.BAK ~/.config/rtorrent`

`app-rtorrent restart`

## Application Tidbits

### Ombi

If a client's Ombi installation is inaccessible due to an incorrectly set **Base URL**, then you will need to fix it by editing the database file itself.  

#### Database Base URL Edit

`app-ombi stop`

Make backup of file to edit:

`cp ~/.config/ombi/OmbiSettings.db ~/.config/ombi/OmbiSettings.db.bak`

Download:

` ~/.config/ombi/OmbiSettings.db `

Open with (DB Browser for SQLite)[https://sqlitebrowser.org/] - a small app that should be available on Windows, Mac, and linux

```
Browse Data (TAB)

Tab: Global Settings (dropdown list)

Select cell with {"BaseUrl":"/lw913.usbx.me:17696"

Fix incorrect setting with: "edit Database Cell" section on right

{"BaseUrl":"/servername.usbx.me:port"

with correct baseurl setting:

{"BaseUrl":"/ombi"

Click Apply

"DB Browser for SQLite" File >> Write Changes
```


Upload fixed "OmbiSettings.db" overwriting `~/.config/ombi/OmbiSettings.db` on client's slot


`app-ombi restart`

The client's Ombi installation should now be fixed and accessible from `https://username.lw/###.usbx.me/ombi`

### RUTORRENT


The client cannot connect to rTorrent session via ruTorrent, but we can. 


### Plex

Non-direct/nonsec connection showing in plex

A reclaim will generally resolve the "non-direct/non-secure" connections

`app-plex claim -c {claim-code-here}`

### Bazarr

If you happen to use HTTP Proxy when working with a clients slot it has been reported that certain plugins may cause a infinite number of refreshes to occur. This has so far been confirmed with Bazarr and  proxy switchyOmega Firefox Addon but may also affect other applications.

## Migration steps Tidbits (For those given Migration Duties)

Please Refer to the below entries for the differences in type of upgrades that can occur

Login to the new assigned slot

`migrate-user-data -e emailaliasnumber username oldslotname`

If you get an error message saying cannot accept email, You must contact iStan Who will likely ask you to contact Panda to Whitelist your staff email in our tools. ASK STAN FIRST

The tool will email when the transfer is started and when finished. Next inputs is old slot username and old service without the host.

When it starts, connect to the screen with `screen -r transfer` and wait for the actual files to transfer for an accurate ETA.

Then in this ticket SET STATUS TO IN-PROGRESS (IMPORTANT !!!!!) and insert predefined reply Upgrades and Migrations -> 4. Transfer started and fill the predefined info (hours)

Once the initial transfer is completed, check the user hasn’t moved stuff from transfer using `ncdu -x --exclude=transfer` , `~/media` and `~/files` should be checked specifically, these folders could be populated by user applications so you will have to use best judgement here on if you think a user has moved data.

If they have moved data, then send them a ticket along these lines:

```
Hi,

As I have checked now, the data transfer was completed, we have copied a complete 1:1 to a folder called transfer on your brand new slot but it seems like you have already moved your data out of the transfer folder. Is it correct? If yes, we would be truly grateful if you could verify this data migration at your earliest convenience so that we can put the node back in the selection pool.

We will allow 24 hours before the script will automatically run maintenance.

Otherwise, we can run a final pass of data migration for any missing data.

```

You would run second pass inside a screen with the `-S` switch added:

`screen -S 2ndpass`

`migrate-user-data -s -e emailaliasnumber username oldslotname`

Then add note onto ticket “2ndpass running in screen `2ndpass` \
(no email notification will be sent on 2nd pass completion)

After the client replies confirming the data and verifying it, we send the predefined reply 7 "old slot deleted" and then post the original slot username@LW### to the #server-migration discord channel, which then Tier2 purges it for recycling.

## Upgrade steps
### Pro-rated

Confirm first with Article1. ` Upgrade - Hi [NAME], Your slot would be upgraded on a pro-rated basis, any amount already paid this term wi… `

`Make a note in the ticket of the old slot details` (If no shell password is set then please set one that is safe) SET TICKET TO IN PROGRESS

`Click the current product under the blue title`

`Select current slot from the product drop down`

`Click the upgrade button and select the new upgraded slot`

This should show the prorated cost at the bottom

`Click Create order ` (This becomes slightly more complex if invoice is already created)

`after the order is created, click accept order`

 `use: 2. Invoice Generated reply from upgrade tree`

Once the User has paid invoice and it is confirmed You can check Invoices tab in the Product profile. You should also see that once the invoice is paid the products listed should change to the new upgraded slot.

`Click View Order in their product profile under the blue tile and Click Set back to pending`, This triggers the deployment script now you must keep an eye on the ticket and wait for the product to show as active.

 `use: 3. Slot deployed  reply from upgrade tree`

Await Client reply and proceed accordingly


### Free Upgrades

If a user is due an upgrade for free here are the steps.

`Make a note in the ticket of the old slot details`

`Click the current product under the blue title`

Since this is a free upgrade you just need to change product to the new item

`Now click view order`

This should show the new upgraded item, `change this to pending` and confirm

Refresh your ticket to confirm pending and new product name

`Once pending is active contact a staff member with Django access for new slot details.`

also, when you reply, `use the stream upgrade(free) status`


### Dedicated Disks

Dedicated Disks allow for transfers without a bandwidth limit, all of the normal steps apply with a minor change to the transfer command during the 1st pass.

`screen -S transfer`

`rsync -aHAXxv --numeric-ids --info=progress2 --delete-after --no-i-r -e "ssh -T -c aes128-ctr -o Compression=no -x" username@server.usbx.me:. Transfer`

This behaves in exactly the same manner as a normal transfer but will not email you so you will need to keep an active eye on it. Expect a long wait while `it builds the file list. It maybe a good idea to mark in the ticket under notes that the transfer is running inside the screen`

You can then continue with the second pass as usual.



```
 Math for transfer estimate  \
 \
2600000: size in MB

17: speed I usually just guess about it'll run at (and should usually)

60 and 60 are the: seconds then to hours conversion
```

## Mounting Tidbits

### Space Issues

If a client is complaining about a loss of space while using rclone check their history of commands, `history` command will show you the SSH commands for the user its quite possible they are doing a Mount to Mount copy which fills up their ` ~/.cache` folder this can be verified by running ` ncdu -x ` which will show you the space hogs on the system after a scan.

Mount to mount copy commands will have this structure

`cp -r ~/”path to mount” ~/”path to mount”`

You can see what a client is mounting by running the `mount | grep $USER ` never just assume a client is being honest when they say they have not run a Mount to Mount copy command check for yourself


### Crashed Mount cannot be remounted

Sometimes, especially if a mount is using Mergerfs files can be placed inside the folder that a mount is normally placed on top of, This will stop the mount from being able to start. Find out the usual paths for a user mount then run `umount -l  /path/to/folder/ then  ls -a /path/to/folder/ `if the folders contain files move them elsewhere and perform a restart of the mount service (Refer to USB Docs) then place the files you moved back into the mount folder.


## Raffle instructions

This is for discord use and will likely be handled by a single member of staff during special occasions

`.raffle start 24:00:00 ITEM HERE`

It asks for Description. Add one.

Then it asks how many winners. So add that. Bot only allows up to 9

Then it'll ask for 2 questions. First one if you want to set how many days do they have to be here. I set it personally to 1 day.

Then it'll ask if which Discord roles can join. Type in yes then when asked, type in Verified

## Useful commands

Disk Usage check

`iostat -xk 2 $(findmnt -T ~ | awk 'END {print $2}')`

Migration from other providers can be achieved using one of the following commands run from the clients USB slot

Standard port 22 copying all files to a folder called transfer to be run on USB slot

`rsync -aHAXxv --numeric-ids --info=progress2 --bwlimit=20000 user@oldhost:. transfer`

Custom Port and path copying to folder called transfer

`rsync -aHAXxv --numeric-ids --info=progress2 --bwlimit=20000 -e "ssh -p portnumberhere" username@oldbhost:/path/to/files transfer`

## Control System/Backend

### Port Bind Errors

```
{"result": false, "data": {"message": "/usr/bin/docker: Error response from daemon: driver failed programming external connectivity on endpoint btsync-rayray (1900751dcd33ccadc6bfb434131a89ffb98255a6cd71933d2242943fe1daea85): listen tcp 0.0.0.0:21120: bind: address already in use.\n"}}
```

If a user is having issues installing a new application especially if this is a new client/slot, This could mean another user has accidentally been assigned that port number on one of their applications.

However there are some steps that you can do

### Via UCP

```
Install

Uninstall

Cleanup
```

### VIA SSH

```
app-appname install

app-appname uninstall
````

### Contact Tier 1 Staff

If none of these actions help your only option is to Contact a Tier 1 to run a ps aux | grep command and see if there are any port clashes
