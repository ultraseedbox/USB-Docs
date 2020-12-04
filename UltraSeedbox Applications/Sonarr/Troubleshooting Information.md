#### Why is Sonarr down with application error 502? It won't come back!

If your Sonarr is reporting 502 and you have followed all the instructions on the error page (restarting, then upgrading if that fails), then something else is going on. All troubleshooting from here requires you to access your [SSH terminal](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-ultraseedbox-slot-via-ssh).

* If you use mergerfs in conjunction with Sonarr or Radarr, first ensure your mono instance is not defunct with `ps aux | grep defunct`. If it's defunct, killing your mounts will release the process, and you will be able to restart Sonarr/Radarr. Rclone cloud mounts should not be used directly with any application. MergerFS should be used.
* Have you been into the system settings of Sonarr recently and use a password manager? Your password manager may have auto-filled the port. The ports should not be modified as they are just the internal docker ports, and SSL is handled via nginx. Please check the ports in the applications config.xml with the following command:

```sh
cat .apps/sonarr/config.xml | grep Port
```

Sonarr output should look like this:

```sh
support@server:~$ cat .apps/sonarr/config.xml | grep Port
  <Port>8989</Port>
  <SslPort>9898</SslPort>
```

If they report other values, then use a text editor on `config.xml` and change to the port displayed above.