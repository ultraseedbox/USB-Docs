ruTorrent is equipped with most of the plugins any client needs. Should there be a plugin that you need that is not installed, this guide will help you learn to install those plugins. To do this, you will need to access the seedbox via SSH. For more information on that, visit this guide to learn more: [How to connect to your seedbox via SSH](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")

***

## Installation

* To install any plugin, first navigate to ruTorrent's plugin folder by doing the following command

```sh
cd ~/www/rutorrent/plugins/
```

* Then, visit [this link](https://github.com/Novik/ruTorrent/wiki/Plugins#currently-there-are-the-following-plugins "ruTorrent Plugins") to check the following plugins available.
* To install the plugin, run the following command
    * `plugin_name` is the name of the plugin you wish to install

```sh
svn checkout https://github.com/Novik/ruTorrent/trunk/plugins/plugin_name
```

***

## Recommended Plugins

### throttle

```sh
cd ~/www/rutorrent/plugins/
svn checkout https://github.com/Novik/rutorrent/trunk/plugins/throttle
```

### ExtRatio

```sh
cd ~/www/rutorrent/plugins/
svn checkout https://github.com/Novik/rutorrent/trunk/plugins/extratio
```

### ratiocolor

```sh
cd www/rutorrent/plugins/
svn co https://github.com/Gyran/rutorrent-ratiocolor.git/trunk ratiocolor

# To change to colored text only

sed -i "s:changeWhat = \"cell-background\";:changeWhat = \"font\";:g" ~/www/rutorrent/plugins/ratiocolor/init.js

# To change back to default

sed -i "s:changeWhat = \"font\";:changeWhat = \"cell-background\";:g" ~/www/rutorrent/plugins/ratiocolor/init.js
```

***

There are few plugins that cannot be installed using this such as mediashare, plowshare and others.

If you want any specific plugin to be installed which cannot be installed by this method, please contact support.