### Resetting LazyLibrarian Credentials

* Login to your seedbox's SSH and paste the following commands. This command replaces the 

```sh
sed -i "s/http_user =.*/http_user = $USER/g" $HOME/.config/lazylibrarian/config.ini && cat $HOME/.config/lazylibrarian/config.ini | grep http_user && sed -i "s/http_pass =.*/http_pass = $RANDOM/g" $HOME/.config/lazylibrarian/config.ini && cat $HOME/.config/lazylibrarian/config.ini | grep http_pass && app-lazylibrarian restart
```

* Upon entering, you'll get an output similar to this.

```sh
http_user = usbdocs
http_pass = 31752
```

* Note `http_user` and `http_pass`. These are your new credentials as your username and password respectively. Login using these credentials and reset them with your preferred credentials after.