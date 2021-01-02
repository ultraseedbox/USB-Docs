**File Transfer Protocol (FTP)** is one of the ways you can do to manage your files on your seedbox. With this, you can download and upload your files and directories, move them around, rename them and much more.

This guide shows you on how to change your password and the general settings to put in an FTP client.

***

## Connecting to your Ultraseedbox Slot via FTP
### Changing your SSH/FTP Password

Before logging into your FTP Client, you should first set your own SSH/FTP password.

* Login to your [User Control Panel](https://cp.ultraseedbox.com) and login with the credentials you set and Press **Connect**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-13-9%5B1%5D.png)

* Click **Access details** and click **Change password** beside SSH access.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-14-38%5B1%5D.png)

* Set your password to anything you wish.
  * We recommend using a unique password that you do not use in any of your existing accounts and has the following:
    * At least 12 characters
    * An uppercase letter
    * A lowercase letter
    * At least 1 number
    * At least 1 symbol
* Once you're done, click **Confirm change**.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-19-3%5B1%5D.png)

* A popup saying Password successfully changed should appear on the lower right corner of the page, signifying that the password is set successfully.

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-25-0%5B1%5D.png)

### FTPS vs. SFTP

Ultraseedbox supports the File Transfer Protocol over SSL (FTPS) and SSH File Transfer Protocol (SFTP). These file transfer protocols provide secure file transfers between your slots and your PC. Also, both protocols do not count towards your allocated upload bandwidth.

**File Transfer Protocol over SSL (FTPS)**

* Widely Supported
* Runs over TCP port 21
* Site to site transfers possible
* Only supports username and password for authentication

**SSH File Transfer Protocol (SFTP)**

* Not all devices supported SFTP
* Runs on TCP port 22
* Can be more secure by using SSH key pairs as the authentication method, aside from username and password
* Some utilities, such as `rsync` only supports SFTP to sync/transfer files

**Recommendations**

Both protocols are safe to use, but we recommended that you should use **SFTP with [Public Key Authentication](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication)** for file transfers and interacting with the seedbox's terminal. This provides greater cryptographic strength than even long passwords provide and makes it easier for you to login by providing automated, passwordless login to your seedbox.

### Connecting to your seedbox using FTP Client

Here are the settings that you can use to connect to your seedbox slot via FTP to manage your files.

#### File Transfer Protocol SSL (FTPS)
```
Hostname: lwxxx.usbx.me or IP address: xxx.xxx.xxx.xxx
Username: <your-seedbox-username>
Password: <your-ssh/ftp-password>
Port: 21
Encryption: Explicit FTPS
```

#### SSH File Transfer Protocol (SFTP)

```
Hostname: lwxxx.usbx.me or IP address: xxx.xxx.xxx.xxx
Username: <your-seedbox-username>
Password: <your-ssh/ftp-password>
Port: 22
```

For SFTP, you may also use [Public Key Authentication](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication) in lieu of a password. This makes it more secure and convenient for you.

***

## Recommended FTP Clients

Here are the FTP clients we recommended and how to setup FTP on each client to connect and manage your files on your seedbox.

### FileZilla

Filezilla is a free FTP application that is available in most platforms. This supports Explicit FTPS and SFTP protocols in addition to the following features:

* Supports resume of files
* Parallel downloading of files (up to 10 simultaneous transfers)
* Tabbed User Interface
* Configurable Speed limits

#### Installation

You can download and install FileZilla by going to the [FileZilla Downloads Page](https://filezilla-project.org/download.php?show_all=1) and download the latest version for your PC.

#### Setting Up FileZilla

* When launching for the first time, you'll be greeted by the main GUI of FileZilla.
* Click the Site Manager

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1586891413312.png)

* A new window appears. Click the site and name it.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1586891738433.png)

* Then you can input the following information from either of the 2 configurations.

##### FTPS

```
Protocol: FTP - File Transfer Protocol
Host: lwxxx.usbx.me
Port: 21
Encryption: Require explicit FTP over SSL

Logon type: Normal
Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```

##### SFTP (Normal Logon)

```
Protocol: SFTP - SSH File Transfer Protocol
Host: lwxxx.usbx.me
Port: 22
Encryption: Require explicit FTP over SSL

Logon type: Normal
Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```

##### SFTP (Keyfile Logon)

For more information on this, you can refer to this guide: [Public Key Authentication](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication)
```
Protocol: SFTP - SSH File Transfer Protocol
Host: lwxxx.usbx.me
Port: 22
Encryption: Require explicit FTP over SSL

Logon type: Key file
Username: <your-usb-username>
Key file: <your-usb-public-key>
```

* In this screenshot, FTPS is used.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1586892224176.png)

* Once that's done, press OK.

* Another window appears, asking if you want to save your password. We recommend selecting Save passwords protected by a master password. Add your master password and click OK

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587050535259.png)

* Click the site manager arrow and select your created site

* Enter your master password when prompted

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587050740418.png)


* If logging in the first time, you'll see this message. Just click **OK**

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587050806591.png)


* Once logged in, you'll see your seedbox contents on the right side of the GUI

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587051017826.png)


### WinSCP

WinSCP (Windows Secure Copy) is a free and open-source SFTP, FTP, WebDAV, Amazon S3 and SCP client for Windows. It offers basic file manager and file synchronization functionality. For secure transfers, it uses Secure Shell (SSH) and supports the SCP protocol in addition to SFTP. In addition to this, WinSCP also offers the following features:

* Batch file scripting, command-line interface and .NET wrapper
* Directory synchronization
* Integrated text editor
* Integration with [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/)

#### Installation

To download and install WinSCP, you can do so [at this page.](https://winscp.net/eng/download.php)

#### Setting Up WinSCP

* When launching for the first time, the login dialog will show up first.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587142367395.png)


* Here, you can add the settings you wish

##### FTPS

```
Fle Protocol: FTP
Encryption: TLS/SSL Explicit Encryption
Host: lwxxx.usbx.me
Port: 21

Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```

##### SFTP (Normal Logon)

```
Fle Protocol: SFTP
Host: lwxxx.usbx.me
Port: 22

Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```

##### SFTP (Keyfile Logon)

For more information on this, you can refer to this guide: [Public Key Authentication](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication)
```
Fle Protocol: SFTP
Host: lwxxx.usbx.me
Port: 22

Username: <your-usb-username>
Password: <blank>

To add keyfile, go to Advanced -> SSH -> Authentication -> Private key file
```

* Once it's added, click **Save** and add a name.
  * You can check *Save Password* if you prefer. This is only if you're using your own device.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587144533204.png)


* In this example, SFTP is used.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587144581113.png)


![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587144322005.png)


* After it has been added, just double-click your newly created site to login.

* If it's your first time logging in, you might see this window. Just click yes to continue.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587144805852.png)


* After a few moments, you're logged in into your seedbox.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587144888862.png)

***

## Userland ProFTPD

**ProFTPD** is an FTP server that can be used to offer FTP access to friends and family without revealing your slot's username and password. Instead, custom usernames and passwords can be set for each friend or family member.

In this section, we'll be installing and setting up Userland ProFTPD into your slot. We'll be also teaching you how to manage and uninstall ProFTPD.

### Installation

* Run the following command to download the script and make it executable.

```sh
wget https://raw.githubusercontent.com/ultraseedbox/Ultraseedbox-Scripts/master/ProFTPD/proftpd-install.sh
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

### Managing Users

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

### Setting Permissions

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

```sh
systemctl --user proftpd restart
```

***

## Troubleshooting Information

**Why is my FTP not logging in?**

This largely depends on the response of the FTP server. Here are some of the common errors and how to fix it.

**Response: - 530 Non-anonymous sessions must use encryption.**

Plain FTP is not supported at Ultraseedbox. You must connect over the following:

* Explicit TLS over port 21
* Explicit Auth SSL over port 21
* SFTP/SSH2 protocol over port 22

We have a help document to provide more in-depth help [here](https://docs.usbx.me/link/146#bkmrk-ftps-vs.-sftp).

**Response: [SFTP] Status: Access denied or [FTP] Response: 530 Login incorrect.**

This usually means your password is either.

* not set or;
* is no longer valid in your UCP's access details due to technical issues or announcements.

We have an extensive guide for this [here](https://docs.usbx.me/link/146#bkmrk-changing-your-ssh%2Fft).

**Response: ERRCONN REFUSED or Connection Refused**

The server’s fail2ban has been triggered due to too many invalid authentication attempts in a period. It restricts your IP address from logging in until that period is expired.

You will need to wait 10 minutes before trying again.

**How to resolve slow FTP download speed issues?**

This usually is caused by our servers’ route to your ISP is not optimal and needs a reroute.

In that case, you may visit the following guides:

* NovoServe [LW8XX] - [Using NovoServe Rerouting Tool](https://docs.usbx.me/books/rerouting-tools/page/using-novoserve-rerouting-tool)
* YISP [LW9XX] - [Using the YISP Rerouting Tool](https://docs.usbx.me/books/rerouting-tools/page/using-yisp-rerouting-tool).

Another common issue is that if you have a Windows 10 PC, the **Receive Window Auto-Tuning Level** setting in `netsh` is set improperly. Windows usually reset this during OS upgrades.

Try running `netsh interface tcp show global` using Command Prompt or PowerShell running in Administrator mode. You should see the following settings.

```ps
PS C:\Windows\system32> netsh interface tcp show global
Querying active state...

TCP Global Parameters

----------------------------------------------
Receive-Side Scaling State      	: enabled
Receive Window Auto-Tuning Level	: normal
Add-On Congestion Control Provider  : default
ECN Capability                  	: disabled
RFC 1323 Timestamps             	: disabled
Initial RTO                     	: 1000
Receive Segment Coalescing State	: enabled
Non Sack Rtt Resiliency         	: disabled
Max SYN Retransmissions         	: 4
Fast Open                       	: enabled
Fast Open Fallback              	: enabled
HyStart                         	: enabled
Proportional Rate Reduction     	: enabled
Pacing Profile                  	: off
```

**Receive Window Auto-Tuning Level** should be set to normal, but some clients have better results by switching from **normal **to **experimental**. To do that, run the following command:

```cmd
netsh int tcp set global autotuninglevel=experimental
```

The **experimental **option can give you full download speeds. Please make sure that you do a reboot before testing.

To go back to the default, run the following command:

```cmd
netsh int tcp set global autotuninglevel=normal
```

Another cause of this is the use of VPNs. There are chances that the VPN is throttling your speeds, so make sure you disable your VPN connection whenever you download your files from your slot.

Another possible reason is that your disk has very high IO utilization. To check, run this command in your shell and pay attention to the last column named **%util**. 

```ssh
iostat -xk 2 $(findmnt -T ~ | awk 'END {print $2}')
```

If this is 100%, the disk you’re in is entirely saturated, affecting your apps’ performance. You may need to send a ticket to our support system so the Ultraseedbox team can investigate.

**I need plain FTP. Is there any way to use it?**

Plain FTP is not supported on our slots due to our commitments to security and privacy for our clients.

However, should you really need plain FTP and you fully know the risks, you may install userland ProFTPD in your userspace.

Please see this help document for the installation of userland ProFTPD [here.](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/userland-proftpd)

Then, once you finished installing and setting up roFTPD, you will need to edit `~/.config/proftpd/proftpd.conf` and change **TLSRequired on** to **TLSRequired off** using a text editor.

After that, run `systemctl --user restart proftpd` to reflect the changes in Userland ProFTPD. 

Logging in with the username/password combo you created during the install will now be unencrypted.

**Why does the FTP connection keep disconnecting with Error: “Disconnect after 20 seconds of inactivity”?**

Most FTP clients create new threads when transferring files. All this means is that your original connection has timed out for being idle for too long.

If you're having latency issues, then it's likely you will also experience this error too.

**Some of my files have duplicates in `~/files` or `~/Downloads` directory and `~/media` directory. Are they using double disk space?**

If you’re using Radarr/Sonarr/Sickchill/CouchPotato/Medusa etc., they should not be taking any additional space. By default, these applications create a *hardlink* of the media file to the default root directory of your application from the path that your Torrent client stores your original downloaded files with. A hard link can be described as a single file located at two different paths but pointing at the same block of data on the disk. Think of it as two signposts from other streets that direct you to the same destination. Hardlinks do not take any extra space. You can compare the inode numbers for both files from the Terminal ([SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) Access) with `ls -I` on both files’. The inode number will be the same.

Hardlinks allows your torrent client to continue seeding while having a “link file” on your media folder neatly arranged. If you wish to delete a file completely that has a hardlink, you may need to delete both the files from your Torrent Client and on your media folder.

You can read more about Hard Links here: [https://en.wikipedia.org/wiki/Hardlink](https://en.wikipedia.org/wiki/Hardlink).