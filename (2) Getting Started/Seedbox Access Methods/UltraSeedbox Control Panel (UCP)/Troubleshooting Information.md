#### I just signed up for a slot, and my UCP keeps saying invalid password!

Our server infrastructure is separate from our account/payment gateways.

* Customer Portal: [https://my.ultraseedbox.com](https://my.ultraseedbox.com) is for your products, invoices, and support.
* User Control Panel (UCP): [https://cp.ultraseedbox.com](https://cp.ultraseedbox.com) is for managing your seedbox.

You will receive an email regarding the successful deployment of your slot. As the email advises, you need to use the password reset form with the email you signed up with at [https://cp.ultraseedbox.com](https://cp.ultraseedbox.com). For more information, you can visit this guide [here](https://docs.usbx.me/link/171#bkmrk-resetting-the-ucp-pa).

#### How do I connect to my slot’s shell/SSH?

To connect to your slot’s shell for executing commands, you must first set your password in your UCP's access details and use an SSH client such as PuTTY to connect to your shell.

For more information, we have a help section for SSH [here](https://docs.usbx.me/books/secure-shell-%28ssh%29).

#### How to resolve stuck container errors?

This issue happens when the container is partially installed. You can use the Clean-Up button next to the Install button of any application you’re trying to install. You may also connect via [SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh) to your slot and remove it using the command `app-App_Name uninstall`.

#### How to upgrade the applications to their latest release?

Under the Installed Applications -> Application, you will see the action dropbox. You need to select upgrade/repair on your desired application, and this will pull the latest version.

Take note that while your desired app may have committed to its repo in the last 10 hours, it may be a pre-release. Your application will only pull the latest stable release when it's docker image is committed to the DOCKER repo. The Upgrade button is also not available to some torrent clients.

#### Why are my apps showing Error 502: Bad Gateway? 

An error 502: Bad Gateway error signifies that the webserver failed to start or got crashed. You may need to follow the instructions on the error page first and see if it fixes the issue.

If it doesn’t, it might be that you ran out of your allocated disk space, which crashes all of your apps.

Please ensure that you have at least 10GB of free disk space on your slot consistently to avoid this. To manage your data, please log in to your service with our recommended FTP file manager and delete some old/redundant files to free up some space.

Once done, kindly restart your webserver and the apps from your UCP main dashboard at [https://cp.ultraseedbox.com](https://cp.ultraseedbox.com).