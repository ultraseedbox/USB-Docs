ProFTPD is an FTP server that can be used to offer FTP access to friends and family without revealing your slot's username and password. Instead, custom usernames and passwords can be set for each friend or family member.

In this guide, we'll be installing and setting up Userland ProFTPD into your slot. We'll be also teaching you how to manage and uninstall ProFTPD.

***

## Installation

* Run the following command to download the script and make it executable.

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/ProFTPD/proftpd-install.sh
chmod +x proftpd-install.sh
```

* Run the script by running the following

```sh
./proftpd-install.sh
```

* Then, you'll see the following output. Enter what is needed.

```sh
usbdocs@lw816:~$ ./proftpd-install.sh
Disclaimer: This installer is unofficial and USB staff will not support any issues with it
Type confirm if you wish to continue: confirm
FTP Root Folder: ~/files
Installing ProFTPD...
Configuring Authentication...
Username: usbdocs
Password: ********
ftpasswd: using alternate file: /home12/usbdocs/.config/proftpd/proftpd.passwd
ftpasswd: creating passwd entry for user usbdocs
ftpasswd: entry created
Do you want to create another user? (y/n) n
Installing Service...
Configuring TLS...
Generating RSA private key, 1024 bit long modulus (2 primes)
...............+++++
.................+++++
e is 65537 (0x010001)
Signature ok
subject=C = NL, ST = NH, L = Amsterdam, O = Ultraseedbox, CN = lw816.usbx.me
Getting Private key
Starting ProFTPD...
Downloading Scripts...
Cleaning Up...
Done!
Access your ProFTPD installation at ftp://lw816.usbx.me:32563
Run ./proftpd-uninstall.sh to uninstall | Run ./proftpd-users.sh to manage users
```

## Managing Users

* To manage users, run the following command

```sh
./proftpd-users.sh
```

* You should see the following output below. Follow the instructions shown.

```sh
usbdocs@lw816:~$ ./proftpd-users.sh
What do you want to do?
1) Create a user
2) Delete a user
3) Change a user's password
4) Exit
Select an option:
```

## Setting Permissions

* By default, ProFTPD will allow all created users access to the FTP root directory and all subdirectories.
* By setting up permissions, you can limit their access to only specific directories that you defined as their home.
* In ProFTPD, `~` is the FTP user's home directory. This can be different from your actual home directory.
* The following additional configuration will allow all FTP users full access to their FTP home directory.
* You can edit this by running your fave text editor `nano ~/.config/proftpd/proftpd.conf`

```
<Directory ~>
    <Limit ALL>
        AllowAll
    </Limit>
</Directory>
```

* You can change the limited commands by replacing ALL with specific commands or groups of commands as listed on [ProFTPD's <Limit> documentation](http://www.proftpd.org/docs/howto/Limit.html).
* You can also add subdirectories by copying the entire block and changing `~` to `~/directory` where the directory is the subdirectory you want to modify permissions.
* Shown here is a permissions example

```
# Permissions example
<Limit ALL>
    # Limit everything
    DenyAll
</Limit>
 
<Directory /home12/usbdocs/files>
    # Allow everyone inside this folder
    <Limit ALL>
        AllowAll
    </Limit>
</Directory>
 
<Directory /home12/usbdocs/files/test1>
    # Allow "test1" inside this folder and all other users will be denied
    <Limit ALL>
        Order Allow,Deny
        AllowUser test1
        Deny ALL
    </Limit>
</Directory>
```

* Restart ProFTPD for the configuration changes to take effect.

```
systemctl --user proftpd restart
```