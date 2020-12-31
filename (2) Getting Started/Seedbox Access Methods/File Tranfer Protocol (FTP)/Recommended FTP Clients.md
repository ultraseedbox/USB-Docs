Here are the FTP clients we recommended and how to setup FTP on each client to connect and manage your files on your seedbox.

# FileZilla

Filezilla is a free FTP application that is available in most platforms. This supports Explicit FTPS and SFTP protocols in addition to the following features:

* Supports resume of files
* Parallel downloading of files (up to 10 simultaneous transfers)
* Tabbed User Interface
* Configurable Speed limits

## Installation

You can download and install FileZilla by going to the [FileZilla Downloads Page](https://filezilla-project.org/download.php?show_all=1) and download the latest version for your PC.

## Setting Up FileZilla

* When launching for the first time, you'll be greeted by the main GUI of FileZilla.
* Click the Site Manager

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1586891413312.png)

* A new window appears. Click the site and name it.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1586891738433.png)

* Then you can input the following information from either of the 2 configurations.

### FTPS

```
Protocol: FTP - File Transfer Protocol
Host: lwxxx.usbx.me
Port: 21
Encryption: Require explicit FTP over SSL

Logon type: Normal
Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```
### SFTP (Normal Logon)

```
Protocol: SFTP - SSH File Transfer Protocol
Host: lwxxx.usbx.me
Port: 22
Encryption: Require explicit FTP over SSL

Logon type: Normal
Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```

### SFTP (Keyfile Logon)

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


# WinSCP

WinSCP (Windows Secure Copy) is a free and open-source SFTP, FTP, WebDAV, Amazon S3 and SCP client for Windows. It offers basic file manager and file synchronization functionality. For secure transfers, it uses Secure Shell (SSH) and supports the SCP protocol in addition to SFTP. In addition to this, WinSCP also offers the following features:

* Batch file scripting, command-line interface and .NET wrapper
* Directory synchronization
* Integrated text editor
* Integration with [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/)

## Installation

To download and install WinSCP, you can do so [at this page.](https://winscp.net/eng/download.php)

 ## Setting Up WinSCP

* When launching for the first time, the login dialog will show up first.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587142367395.png)


* Here, you can add the settings you wish

### FTPS

```
Fle Protocol: FTP
Encryption: TLS/SSL Explicit Encryption
Host: lwxxx.usbx.me
Port: 21

Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```
### SFTP (Normal Logon)

```
Fle Protocol: SFTP
Host: lwxxx.usbx.me
Port: 22

Username: <your-usb-username>
Password: <your-ssh/ftp-password>
```

### SFTP (Keyfile Logon)

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