File Transfer Protocol (FTP) is one of the ways you can do to manage your files on your seedbox. With this, you can download and upload your files and directories, move them around, rename them and much more.

This guide shows you on how to change your password and the general settings to put in an FTP client.

***

## Changing your SSH/FTP Password

Before logging into your FTP Client, you should first set your own SSH/FTP password.

* Login to your [User Control Panel](https://cp.ultraseedbox.com) and login with the credentials you set and Press **Connect**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-13-9%5B1%5D.png">
</p>

* Click **Access details** and click **Change password** beside SSH access.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-14-38%5B1%5D.png">
</p>

* Set your password to anything you wish.
  * We recommend using a unique password that you do not use in any of your existing accounts and has the following:
    * At least 12 characters
    * An uppercase letter
    * A lowercase letter
    * At least 1 number
    * At least 1 symbol
* Once you're done, click **Confirm change**.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-19-3%5B1%5D.png">
</p>

* A popup saying Password successfully changed should appear on the lower right corner of the page, signifying that the password is set successfully.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-7_11-25-0%5B1%5D.png">
</p>

***

## FTPS vs. SFTP

UltraSeedbox supports the File Transfer Protocol over SSL (FTPS) and SSH File Transfer Protocol (SFTP). These file transfer protocols provide secure file transfers between your slots and your PC. Also, both protocols do not count towards your allocated upload bandwidth.

### File Transfer Protocol over SSL (FTPS)

* Widely Supported
* Runs over TCP port 21
* Site to site transfers possible
* Only supports username and password for authentication

### SSH File Transfer Protocol (SFTP)

* Not all devices supported SFTP
* Runs on TCP port 22
* Can be more secure by using SSH key pairs as the authentication method, aside from username and password
* Some utilities, such as `rsync` only supports SFTP to sync/transfer files

### Recommendations

Both protocols are safe to use, but we recommended that you should use **SFTP with [Public Key Authentication](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication)** for file transfers and interacting with the seedbox's terminal. This provides greater cryptographic strength than even long passwords provide and makes it easier for you to login by providing automated, passwordless login to your seedbox.

***

## Connecting to your seedbox using FTP Client

Here are the settings that you can use to connect to your seedbox slot via FTP to manage your files.

### File Transfer Protocol SSL (FTPS)
```
Hostname: lwxxx.usbx.me or IP address: xxx.xxx.xxx.xxx
Username: <your-seedbox-username>
Password: <your-ssh/ftp-password>
Port: 21
Encryption: Explicit FTPS
```

## SSH File Transfer Protocol (SFTP)

```
Hostname: lwxxx.usbx.me or IP address: xxx.xxx.xxx.xxx
Username: <your-seedbox-username>
Password: <your-ssh/ftp-password>
Port: 22
```

For SFTP, you may also use [Public Key Authentication](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/public-key-authentication) in lieu of a password. This makes it more secure and convenient for you.