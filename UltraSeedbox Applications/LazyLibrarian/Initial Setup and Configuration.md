This guide will walk you through setting up LazyLibrarian for the first time. This assumes that you'll be saving your books under `~/media/Books`. We'll be doing the following:

1. Setting up Access control (Login Credentials)
2. Setting Up Downloaders
3. Setting Up Providers

## Initial Setup
### Setting Up Access Control

* Upon launching, you'll be greeted by LazyLibrarian's Home Screen. Click **Config** to go to LazyLibrarian's configuration page

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589358185886.png"></p>

* Under Interface -> Access control, add in your desired username and password.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589358308735.png"></p>

* Once that's done, click **Save changes** and restart the application either clicking **Restart** or via UCP.

* Upon connecting again, enter your set username and password to continue.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589358670364.png"></p>

### Setting Downloaders

* Go to **Downloaders** tab. Here, you may set your preferred downloaders.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1589361883942.png)

You may refer to this separate guide for connection details to USB supported apps.

[Download Client Connection Details](https://docs.usbx.me/books/lazylibrarian/page/download-client-connection-details)

### Setting Up Providers


## Accessing LazyLibrarian via HTTPS

To access the web interface using HTTPS, do the following

* Login to your seedbox's SSH and run the following

```sh
nano $HOME/.apps/nginx/proxy.d/lazylibrarian.conf
```

* Paste the following and replace {LL_PORT} with LazyLibrarian's WebUI port on your UCP. Save it after.

```nginx
location /lazylibrarian {    

proxy_set_header    Host $host;
proxy_set_header    X-Real-IP $remote_addr;
proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_pass          http://127.0.0.1:{LL_PORT};
}
```

* Run the following command to replace http_root

```sh
sed -i 's/http_root =/http_root = \/lazylibrarian/g' $HOME/.config/lazylibrarian/config.ini
```

* Once that's done, restart both the webserver and LazyLibrarian

```
app-nginx restart && app-lazylibrarian restart
```