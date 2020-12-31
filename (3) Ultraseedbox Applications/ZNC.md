**ZNC** is an IRC network bouncer or BNC that is written in C++. It can detach the client from the actual IRC server, and also from selected channels. Multiple clients from different locations can connect to a single ZNC account simultaneously and therefore appear under the same nickname on IRC. It has the following main features:

* SSL secured connections
* ZNC will remain connected to IRC even while you are offline
* Multiple users support
* Per Channel Playback Buffers
* Modules support

For more information, you can visit [this link.](https://wiki.znc.in/ZNC)

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1569835065899.png)

***

## Initial Setup

In this guide, you'll be setting up ZNC and adding your first network. Listed are the goals of this tutorial:

* Changing default ZNC Password
* Setting up global and network modules
* Adding your first IRC network
* Connecting your ZNC browser to your IRC client

### First Login and Changing ZNC Password

* When clicking **Connect**, you'll be greeted with the login page of ZNC's Web Interface

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576489841903.png)

* Login using the default credentials

```
Default ZNC Login Credentials

Username: admin
Password: admin
```

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576489975464.png)

* To change the password, go to **Your Settings** and set your password new password accordingly.
  * You do not need to change the other settings under Authentication

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576490256097.png)

* Scroll down to the bottom of the page and click **Save and Continue**

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576490425485.png)

### Setting your first IRC Server to ZNC

* First, on the same page under **IRC Information_,_** edit the following information listed according to your preferences.
  * Nickname
  * Alt. Nickname
  * Ident (Username)
  * Realname
  * Quit message
* This section will apply said information to all future networks.
  * You can also set different nicks, idents and such per network.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576492175146.png)

* Once that's done, scroll down to the bottom and click **Save and Continue**

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576490425485.png)

* To create your first ZNC Network (your IRC Network) by clicking Add under Your Settings -> Network

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576492278692.png)

* Set a name. In this setup, we'll be connecting to Freenode. We'll name this first network `Freenode`  
  * If you have registered on this IRC network or you prefer another nick/ident for this network, you may change so here.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576502697827.png)

* Uncheck `Connect to IRC & automatically re-connect`. 

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576501583766.png)

* On `Servers of this IRC network`, click **Add**

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576501750445.png)

* Then add the hostname and the port of the IRC network you're connecting with.  
  * If you're registered, DO NOT put your server/NickServ password in the Password field

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576502010577.png)

* Scroll down a bit and check the modules you need.
* Listed below are our recommended modules. Your choice of modules may vary, depending on your needs.

  * `crypt`
    * It encrypts channel/private messages
  * `keepnick`
    * This module keeps on trying to get your preferred nick
  * `kickrejoin`
    * Automatically rejoin channels after being kicked
  * `modules_online`
    * Makes ZNC's \*modules to be "online"
      * This is useful if you're using multiple IRC clients connected to ZNC
  * `route_replies`
      * It send replies (e.g. to /who) to the right client-only,
      * Prevents the client to excessively send /who requests
      * It is also useful if you're using multiple IRC clients
  * `sasl` or `nickserv`
      * This is where you'll put your IRC password

If you're using `sasl`, you'll put your IRC credentials under the Network modules of your network.

You'll see this on either the left or right-hand side of the page (depending on the theme) after you have saved your config.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576502955430.png)

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576503042923.png)

If you're using `nickserv`, input your IRC password on the textbox beside it

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576502274574.png)

  * `perform`
    * It executes your set commands after ZNC is successfully connected to the IRC network

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576502220467.png)

* Click **save and continue** to save your changes.
* Now you'll notice a message on the top of the page saying "To connect to this network from your IRC client, you can set the server password field as `admin/network_name:<znc_password>` or username field as `admin/network_name`." Take note of that.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576503132318.png)

### Connecting your IRC Client to ZNC
#### Hexchat

* Open hexchat and make sure that your Hexchat username the same as the one you set on ZNC
* Open Network List and click Add. Type any name you want and hit Enter.

[![ye.png](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/ye.png)](https://docs.usbx.me/uploads/images/gallery/2019-12/ye.png)

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576919691910.png)

* Highlight the Network you just made and Click Edit
* Click the text named `newserver/6667` and input there `lwxxx.ultraseedbox.com/ZNC_webui_port`, inputting the hostname of your server and the ZNC port shown on UCP.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576919798239.png)

* Then check the following
  * Connect to this Network automatically

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576920325013.png)

* Uncheck Use global user information and on the User name field, put in `admin/network_name`, replacing `network_name` with the name you set in ZNC
* In login method, select Server password (/PASS password)
* On Password, input your set ZNC password.
* Check if everything is correct. Once confirmed, Click Close, highlight your new network and click Connect

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576920372266.png)

* You'll be connected to your ZNC browser if you'll see the message `Welcome to ZNC`

[![sds.png](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/sds.png)](https://docs.usbx.me/uploads/images/gallery/2019-12/sds.png)

### Initializing Connection from your ZNC bouncer to your IRC network

* In your IRC window, type in `/znc connect`.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576920606903.png)

* If configured properly, you'll be greeted by your IRC network's Message of the Day.

![](https://docs.usbx.me/uploads/images/gallery/2019-12/scaled-1680-/image-1576920728181.png)