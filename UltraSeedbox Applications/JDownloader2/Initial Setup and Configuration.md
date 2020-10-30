In this guide, we'll be setting up JDownloader2 for the first time. We'll be doing the following:

1. Accessing JDownloader Interface
2. Changing the Generated Password
3. Creating and logging into your MyJdownloader2 Account (Optional)

* * *

## Initial Setup
### Accessing the JDownloader Interface

* Install Jdownloader2 from our UCP. Once installed, go under JDownloader details to get your randomly-generated password.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-07/image-1595684678945.png"></p>

* Press **Connect** to load up the JDownloader Interface.
* Enter the user-generated password to get access to the main interface.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597682476779.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597682518436.png"></p>

### Changing the Generated Password

Upon installation, JDownloader will generate a password for you. If you need to set a new password, you have 2 choices.

* You can generate a new password by running `Upgrade and repair` on the UCP

* You can also set your own password by logging in to your seedbox's SSH and enter the following command.

```sh
nano "$HOME"/.config/jdownloader2/.vncpass_clear && jd2pass=$(cat "$HOME"/.config/jdownloader2/.vncpass_clear) && clear && app-jdownloader2 restart && echo "Password set successfully." && echo "Your password is $jd2pass"
```

* You'll see a nano text window. Enter your desired password then save it by doing **CTRL + O**, press **ENTER** and **CTRL + X**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597687218323.png"></p>

* Your JDownloader instance will restart automatically and your password will be displayed again.

```sh
Password set successfully.
Your password is your-secure-password-here
usbdocs@lw873:~$
```

* Once that's done, you can enter your JDownloader instance with your new password.

<c><p class="callout info">If you chose your own password, this will not show up under your UCP.</p></c>


### Registration to MyJDownloader and Accessing MyJdownloader Interface (Optional)

  * Go to [https://my.jdownloader.org](https://my.jdownloader.org) and click Register now
  * Put in your email address and captcha. Once that's done click **Register**.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583479803654.png"></p>

  * You'll receive an email from JDownloader. Click **Finish Registration now**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583479683589.png"></p>

  * Then, enter your desired password and click **Confirm**

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583479852769.png"></p>

* Login into your JDownloader instance and click the MyJdownloader tab

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597688107447.png"></p>

* Enter your credentials under My Account. You may set your Device Name here.
* Press **Connect** and wait for the green text to show.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597688312231.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1597688390006.png"></p>

* In [https://my.jdownloader.org](https://my.jdownloader.org), sign in with your registered credentials. Once logged in, your JDownloader instance will be shown with your set device name.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585841259543.png"></p>

* Click the said instance to access your instance's web interface

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585841313491.png"></p>