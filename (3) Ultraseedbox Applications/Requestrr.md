**Requestrr** is a chatbox that interfaces Ombi/Sonarr/Radarr and chat services such as Discord and Telegram. This allows you to request TV Shows and Movies within your chat room. These are the following features:


* Ability to request content via Discord/Telegram using a chat bot
* Apple's Siri integration
* Users can get notified when their requests complete
* Sonarr/Radarr V2/V3 integration
* Ombi V3 integration with support for per user roles/quotas
* Fully configurable via a web 

For more information about this app, please visit [this link](https://github.com/darkalfx/requestrr) for more info.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587393859563.png)
![](https://docs.usbx.me/uploads/images/gallery/2020-04/image-1587393916437.png)

***

## Initial Setup

In this section, we'll be setting up Requestrr for the first time. This guide assumes the following:

* You have a working Sonarr/Radarr/Ombi Setup
* You have basic knowledge in Discord

### Creating a Discord Bot Token

Upon installation of Requestrr, you will need to set up a *Client ID* and a *bot token,* which can be done via the [Discord Developer Portal](https://discordapp.com/developers/applications).

![](https://i.imgur.com/FYKErTx.png)

The Discord Developer Portal is where we will create our new discord bot so that Requestrr can function. Click **New Application** button in the top right to begin the process.

![](https://i.imgur.com/N2sgen4.png)

Give your new bot a name. For this, I’m going to use `USBRequesterr`. Click create to move on to this screen. 

![](https://i.imgur.com/1FyE84Y.png)

Take note of the client ID highlighted. You will need this later, so make a note of it somewhere safe. Return to Requestrr and paste your Client ID into the relevant field

![](https://i.imgur.com/yXp3ImJ.png)

Go back to the Developer portal. We will now be creating the bot itself. Click **Bot** on the left-hand side, then the **Add Bot** button.

![](https://i.imgur.com/ABH0gGV.png)

This will show you the bot creation screen. You only need to take note of one thing, and that is the **copy button** under token. Click this and keep the output safe. We also recommend toggling **Public Bot** off. This is to restrict other people from inviting your bot to their servers and only you can invite the bot.

![](https://i.imgur.com/1CeOlGa.png)

Return to Requestrr and paste your token in the Bot Token Field.

![](https://i.imgur.com/PWcYWap.png)

The final step now is to test by clicking on the **Test** settings button near the bottom of Requestrr.

![](https://i.imgur.com/NX0v79i.png)

If you see the green banner, Click **Save Changes** at the bottom of the page.

![](https://i.imgur.com/gQ4qtiF.png)

You are ready to move on to configuring a discord server and adding the bot.

### Adding Your Requestrr Bot to Discord Server

Adding Requestrr is relatively simple once the bot has been created. First, create a discord server for your Requestrr bot. In the discord app, scroll the left-hand bar till you find this icon and click it.

![](https://i.imgur.com/2bA3wyl.png)

Go ahead and **Create my Own**.

![](https://i.imgur.com/e8oKAWw.png)

Give it a name and click **Create**.

![](https://i.imgur.com/rmS8wuH.png)

You will now have a new server in your discord list, Open up Requestrr and look for the bright blue **Copy Invite** Link button, and click it.

![](https://i.imgur.com/MFdqGD7.png)

Paste the invite link into your browser. Once logged in, you will have a drop-down menu, select your new server, and click **Continue**. 

![](https://i.imgur.com/lB5FbVB.png)

On the next screen, you can leave unchanged and click **Authorize**.

![](https://i.imgur.com/k1T8mzU.png)

In discord, your new bot should appear. If it appears offline, be sure your settings are saved and restart Requestrr.

Finally, we can test our bot with a simple `!ping` command. If all is working, the bot should reply “Pong”.

![](https://i.imgur.com/CU7lItr.png)

You are now ready to use the new bot. But first, we must link up Sonarr/Radarr/Ombi.

### Connecting Requestrr to Sonarr/Radarr or Ombi
#### Radarr

```
API: Version 3
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Radarr API Key} Found under Radarr>Settings>General 
SSL: Checked
Base URL: /radarr
```

![](https://i.imgur.com/QdmNYl0.png)

You will need to click the load buttons next to the path and profile to populate them, as shown in the screenshot above. Be sure to click save at the bottom right of the page.

![](https://i.imgur.com/GVMknqi.png)

#### Sonarr

```
API: Version 3
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Sonarr API Key}  Found under Sonarr >Settings>General 
SSL: Checked
Base URL: /sonarr
```

![](https://i.imgur.com/FJ78VkR.png)

You will need to click the load buttons next to the path and profile to populate them, as shown in the screenshot above. Make sure to click save at the bottom right of the page.


![](https://i.imgur.com/GVMknqi.png)

#### Ombi

```
API: Version 3-4
Hostname or IP: {username}.{servername}.usbx.me
Port: 443
API Key: {Ombi API Key}  Found under Settings>Ombi>API Key
SSL: Checked
Base URL: /ombi
```

You may need to check your Base URL. For more information, you may visit the guide here: [Setting up SSL on your Ombi Instance](https://docs.usbx.me/books/ombi/page/initial-setup-and-configuration#bkmrk-setting-up-ssl-on-yo)

![](https://i.imgur.com/5us2aiv.png)

You will need to click the load buttons next to the path and profile to populate them, as shown in the screenshot above. Make sure to click save at the bottom right of the page.

![](https://i.imgur.com/GVMknqi.png)

***

## Requesting for First Media

By default, the bot will register any commands with the `!` prefix, for example.

```
!movie = A movie you wish to request
!tv = A tv show you wish to request
```

So let me show you a tv show request process. I’m going to use the show “The Expanse”. So the command goes like this. 

![](https://i.imgur.com/RnKFY2h.png)

The bot then returns a list of options.

![](https://i.imgur.com/JKC6kmg.png)

I want option one, so the command is:

![](https://i.imgur.com/h9fYQo3.png)

Now select which season do I want. I want them all, so choose option 0

![](https://i.imgur.com/d1f504L.png)

This presents me with

![](https://i.imgur.com/UDx8qfH.png)

All you need to do is click the reaction button under the poster to complete the request.

![](https://i.imgur.com/EPJVqta.png)

The same process is applied to movies, but instead of using the `!tv` command, you would use the `!movie` command.