#### Why is my FTP not logging in?

This largely depends on the response of the FTP server. Here are some of the common errors and how to fix it.

##### Response: - 530 Non-anonymous sessions must use encryption.

Plain FTP is not supported at Ultraseedbox. You must connect over the following:

* Explicit TLS over port 21
* Explicit Auth SSL over port 21
* SFTP/SSH2 protocol over port 22

We have a help document to provide more in-depth help [here](https://docs.usbx.me/link/146#bkmrk-ftps-vs.-sftp).

##### Response: [SFTP] Status: Access denied or [FTP] Response: 530 Login incorrect.

This usually means your password is either.

* not set or;
* is no longer valid in your UCP's access details due to technical issues or announcements.

We have an extensive guide for this [here](https://docs.usbx.me/link/146#bkmrk-changing-your-ssh%2Fft).

##### Response: ERRCONN REFUSED or Connection Refused

The server’s fail2ban has been triggered due to too many invalid authentication attempts in a period. It restricts your IP address from logging in until that period is expired.

You will need to wait 10 minutes before trying again.

#### How to resolve slow FTP download speed issues?

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

#### I need plain FTP. Is there any way to use it?

Plain FTP is not supported on our slots due to our commitments to security and privacy for our clients.

However, should you really need plain FTP and you fully know the risks, you may install userland ProFTPD in your userspace.

Please see this help document for the installation of userland ProFTPD [here.](https://docs.usbx.me/books/file-transfer-protocol-%28ftp%29/page/userland-proftpd)

Then, once you finished installing and setting up roFTPD, you will need to edit `~/.config/proftpd/proftpd.conf` and change **TLSRequired on** to **TLSRequired off** using a text editor.

After that, run `systemctl --user restart proftpd` to reflect the changes in Userland ProFTPD. 

Logging in with the username/password combo you created during the install will now be unencrypted.

#### Why does the FTP connection keep disconnecting with Error: “Disconnect after 20 seconds of inactivity”?

Most FTP clients create new threads when transferring files. All this means is that your original connection has timed out for being idle for too long.

If you're having latency issues, then it's likely you will also experience this error too.

#### Some of my files have duplicates in `~/files` or `~/Downloads` directory and `~/media` directory. Are they using double disk space?

If you’re using Radarr/Sonarr/Sickchill/CouchPotato/Medusa etc., they should not be taking any additional space. By default, these applications create a *hardlink* of the media file to the default root directory of your application from the path that your Torrent client stores your original downloaded files with. A hard link can be described as a single file located at two different paths but pointing at the same block of data on the disk. Think of it as two signposts from other streets that direct you to the same destination. Hardlinks do not take any extra space. You can compare the inode numbers for both files from the Terminal ([SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) Access) with `ls -I` on both files’. The inode number will be the same.

Hardlinks allows your torrent client to continue seeding while having a “link file” on your media folder neatly arranged. If you wish to delete a file completely that has a hardlink, you may need to delete both the files from your Torrent Client and on your media folder.

You can read more about Hard Links here: [https://en.wikipedia.org/wiki/Hardlink](https://en.wikipedia.org/wiki/Hardlink).