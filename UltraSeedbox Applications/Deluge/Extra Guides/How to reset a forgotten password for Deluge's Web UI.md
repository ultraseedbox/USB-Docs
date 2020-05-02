This guide will show you how to reset your Deluge's Web UI password.

<c><p class=callout info>Should you need to change your Deluge's *daemon password*, you may need to reinstall your Deluge instance with your preferred password.</p></c>

***

* Open your USB Control Panel and click on the "Access Details" (1) tab. You will find your SSH Access (2) details on this page.
  * If you are unsure of your username & password, see Box (A)

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-13_22-37-47%5B1%5D.png">
</p>

* Connect to your seedbox's SSH
  * For more information, visit [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH") to learn more.
* Once connected type the following command: `app-deluge stop`

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_22h57_19%5B1%5D.png">
</p>

* Now on the empty line type the following command and press **Enter**

`sed -i.bak "/pwd_sha1/d" ~/.config/deluge/web.conf`

* Now on the next empty line type the following command and press **Enter**

`sed -i.bak "/pwd_salt/d" ~/.config/deluge/web.conf`

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_23h03_23%5B1%5D.png">
</p>

* Now start your deluge instance by running `app-deluge start` 
* Once started, enter `deluge` as your password.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_23h06_06%5B1%5D.png">
</p>