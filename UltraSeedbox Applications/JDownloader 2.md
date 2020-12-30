**JDownloader 2** is a download manager, written in Java, which allows automatic download of groups of files from one-click hosting sites. JDownloader has the following features

* Use of premium accounts
* Parallel downloads
* Automatic CAPTCHA solving using its own OCR module
* Automatic extraction of archived files, decryption of RSDF, CCF and DLC Container files
* Integrated package manager
* Themes
* Multilingual support

For more information about this app, refer to this link: [https://jdownloader.org/](https://jdownloader.org/)

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1592661355453.png)

## Initial Setup

In this section, we'll be setting up JDownloader2 for the first time. We'll be doing the following:

1. Accessing JDownloader Interface
2. Changing the Generated Password
3. Creating and logging into your MyJdownloader2 Account (Optional)

### Accessing the JDownloader Interface

* Install Jdownloader2 from our UCP. Once installed, go under JDownloader details to get your randomly-generated password.

![](https://docs.usbx.me/uploads/images/gallery/2020-07/image-1595684678945.png)

* Press **Connect** to load up the JDownloader Interface.
* Enter the user-generated password to get access to the main interface.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597682476779.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597682518436.png)

### Changing the Generated Password

Upon installation, JDownloader will generate a password for you. If you need to set a new password, do the following:

* Log in to your seedbox's SSH and enter the following command:

```sh
nano "$HOME"/.config/jdownloader2/.vncpass_clear && jd2pass=$(cat "$HOME"/.config/jdownloader2/.vncpass_clear) && clear && app-jdownloader2 restart && echo "Password set successfully." && echo "Your password is $jd2pass"
```

* You'll see a nano text window. Enter your desired password then save it by doing **CTRL + O**, press **ENTER** and **CTRL + X**

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597687218323.png)

* Your JDownloader instance will restart automatically and your password will be displayed again.

```sh
Password set successfully.
Your password is your-secure-password-here
usbdocs@lw873:~$
```

* Once that's done, you can enter your JDownloader instance with your new password.

::: info
If you chose your own password, this will not show up under your UCP.
:::

### Registration to MyJDownloader and Accessing MyJdownloader Interface (Optional)

  * Go to [https://my.jdownloader.org](https://my.jdownloader.org) and click Register now
  * Put in your email address and captcha. Once that's done click **Register**.

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583479803654.png)

  * You'll receive an email from JDownloader. Click **Finish Registration now**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583479683589.png)

  * Then, enter your desired password and click **Confirm**

![](https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583479852769.png)

* Login into your JDownloader instance and click the MyJdownloader tab

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597688107447.png)

* Enter your credentials under My Account. You may set your Device Name here.
* Press **Connect** and wait for the green text to show.

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597688312231.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597688390006.png)

* In [https://my.jdownloader.org](https://my.jdownloader.org), sign in with your registered credentials. Once logged in, your JDownloader instance will be shown with your set device name.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585841259543.png)

* Click the said instance to access your instance's web interface

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585841313491.png)