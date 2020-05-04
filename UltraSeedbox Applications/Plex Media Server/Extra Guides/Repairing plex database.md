*Written by [https://github.com/fringillidaes](fringillidaes)*
***

This is a guide for recovering your plex database. You may get this error if your library fails to scan or maybe your plex logs contain the following lines, `Database corruption at line......`

It is useful to have knowledge of the windows command line, using ssh to access your slot and ftp access. Here are some of the guides that you might need.

* [Connecting to your seedbox with FTP](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/connecting-to-your-seedbox-with-ftp)
* [Recommended FTP Clients](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/recommended-ftp-clients)
* [Command Prompt: 11 basic commands you should know (cd, dir, mkdir, etc.)](https://www.digitalcitizen.life/command-prompt-how-use-basic-commands)

## Prerequisites

* Before starting *MAKE SURE* you have *plex stopped* in your UCP and your *gdrive mount is stopped (this includes mergerfs)* if you have this configured. 

* Next, lets make a backup of your plex database directory over ssh by running the command `rar a plexdb.rar "$HOME/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/*"`

```sh
username@lwxx:~$ rar a plexdb.rar "$HOME/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/*"
RAR 5.40   Copyright (c) 1993-2016 Alexander Roshal   15 Aug 2016
Trial version             Type RAR -? for help

Evaluation copy. Please register.

Creating archive plexdb.rar

Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-2020-04-08  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-shm  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db-wal  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db-2020-04-08  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-wal  OK 
Adding    /homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db-shm  OK 
Done
```

* To make sure this was created in your home directory, run `rar l plexdb.rar`

```sh
username@lwxx:~$ rar l plexdb.rar
RAR 5.40   Copyright (c) 1993-2016 Alexander Roshal   15 Aug 2016
Trial version             Type RAR -? for help

Archive: plexdb.rar
Details: RAR 4

 Attributes      Size     Date    Time   Name
----------- ---------  ---------- -----  ----
 -rw-r--r--    339968  2020-04-08 04:04  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-2020-04-08
 -rw-r--r--     32768  2020-04-08 08:01  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-shm
 -rw-r--r--   1137112  2020-04-06 21:39  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db-wal
 -rw-r--r--    339968  2020-04-08 05:49  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db
 -rw-r--r--    334848  2020-04-08 04:04  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db-2020-04-08
 -rw-r--r--    334848  2020-04-06 21:39  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db
 -rw-r--r--   1137112  2020-04-08 08:01  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db-wal
 -rw-r--r--     32768  2020-04-06 21:39  homexx/usernamexx/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.blobs.db-shm
----------- ---------  ---------- -----  ----
              3689392                    8
```

* Next, download the `sqlite tool package` to repair the database. You can find this at https://www.sqlite.org/download.html and you want `sqlite-tools-win32-x86`

[Direct link to the one in this guide](https://www.sqlite.org/2020/sqlite-tools-win32-x86-3310100.zip)

<p align="center">
<img src="https://i.imgur.com/krJ1id8.png">
</p>

* Once its downloaded make sure to extract the zip file.

## Transferring your Plex Databse

* Transfer your database to your computer to be repaired using FTP. In this guide, we'll be using Filezilla.

* In your remote site, Navigate to: `.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/`

* Then, download the database file named `com.plexapp.plugins.library.db` to our sqlite directory
  * This might be in your downloads or wherever your web browser downloads files too.

<p align="center">
<img src="https://i.imgur.com/1cvJEbj.png">
</p>

## Repairing Plex Databse

* Open a command prompt window directory in the path of your sqlite directory
  * An easy way to open a comand prompt windows is to travel to the sqlite directory inside windows explore, shift + right-click, open a powershell windows here, then run `cmd`

<p align="center">
<img src="https://i.imgur.com/sJcLuoX.png">
</p>

* Now lets repair the database by running the following commands

```bat
copy com.plexapp.plugins.library.db com.plexapp.plugins.library.db.original
sqlite3 com.plexapp.plugins.library.db "DROP index 'index_title_sort_naturalsort'"
sqlite3 com.plexapp.plugins.library.db "DELETE from schema_migrations where version='20180501000000'"
sqlite3 com.plexapp.plugins.library.db .dump > dump.sql
del com.plexapp.plugins.library.db
sqlite3 com.plexapp.plugins.library.db < dump.sql
```

* To make sure our database has been properly repaired we can run the following

```bat
sqlite3 com.plexapp.plugins.library.db "PRAGMA integrity_check"
```

<p align="center">
<img src="https://i.imgur.com/0ssdzyL.png">
</p>

* Open up Filezilla again to transfer your repaired database back to your seedbox.
* Drag the new repaired database back into the directory on your seedbox `/.config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases`
  * If it asks you to overwrite the one on your seedbox hit ok.

<p align="center">
<img src="https://i.imgur.com/prKYLue.png">
</p>

* Delete the following files before restarting plex

```
com.plexapp.plugins.library.db-shm
com.plexapp.plugins.library.db-wal
```

<p align="center">
<img src="https://i.imgur.com/IVyxFBg.png">
</p>

* Once that's done, you can start Plex by running `app-plex start` or via UCP.
* If you are using mounts, start them first before starting Plex.

Some media might be missing if that was corrupted from the last import. You can trigger a manual re-scan or let Plex auto rescan.