*Written by [https://github.com/fringillidaes](fringillidaes)*
***

This is a guide for recovering your plex database. You may get this error if your library fails to scan or maybe your plex logs contain the following lines, `Jun 11, 2020 03:57:22.781 [0x7f59bce20b80] ERROR - Database corruption:`. 

## Prerequisites 
To repair your database you will also need sqlite3. If you do not already have it installed,
```shell
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Language%20Installers/sqlite-installer.sh && bash sqlite-installer.sh
```

## Download and run repair script
To repair your database automatically run the following command on your slot,
```shell
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/plex-database-repair.sh && bash plex-database-repair.sh
```
