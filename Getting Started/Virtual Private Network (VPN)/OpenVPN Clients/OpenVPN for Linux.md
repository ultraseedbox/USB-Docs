This short guide will walk you through on how to setup your OpenVPN Client in Linux. This guide will be using OpenVPN on Debian but should be similar on distributions such as Ubuntu, Linux Mint and elementary OS. It's best to refer to your distributions' manuals for specific instructions.

***

## Installing OpenVPN Client

* Open up your terminal and run the following command

```sh
sudo apt install openvpn ca-certificates
```

* Navigate to where you saved your file (Assuming that you saved the zip file in ~/Downloads) and unzip it to `/etc/openvpn`

```sh
cd ~/Downloads
sudo unzip {username}-x.zip -d /etc/openvpn/
```

* Then run OpenVPN using the following command

```sh 
sudo openvpn {username}-x.ovpn
```

* It'll show you the logs of the connection. Wait for a few minutes for it to successfully connect. You can also run the above command under `screen` or `tmux`.

* To stop the connection, do **CTRL + C** to stop the OVPN client.

* You can also confirm that you've successfully connected by visiting [What Is My Ip Address](https://whatismyipaddress.com/). You'll see the server's IP address listed.

![](https://docs.usbx.me/uploads/images/gallery/2020-05/image-1590686968356.png)