* Navigate to [Google Developer Console](https://console.developers.google.com/) and log into your Google account.
* Click Create on the right-hand side of the screen. On the screen that pops up enter a Project name and then click **Create**.
  * I'd recommend against using rclone in the project name, even just the default will do.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/Create.PNG)

* Click **Enable APIs and Services**, search for Drive and select **Google Drive**.
* Click **Enable** on the window that pops up.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/Enable.PNG)

* Click **Credentials** on the left side of the screen then click **Credentials in APIs & Services**.
* Click **Create credentials**, and select **OAuth client ID**.
  * You may be prompted to configure a consent screen. Click to do this, enter a name and then click **Save**.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/credentials.PNG)

* On the next screen select Desktop App and then select **Create**. The default name is fine and you do not need to change it.
* After you click **Create**, the window to the right will pop up. These are our keys to use in rclone configuration. Copy these or leave the window open for when you need them.
