Here, we'll be setting up NZBGet for the first time. In this guide we'll be doing the following tasks:

* Login to the NZBGet instance for the first time
* Change ControlUsername and ControlPassword
* Add Usenet indexers

You may also need the following: 

* A Usenet service provider, you can find a list of different providers here: [https://www.reddit.com/r/usenet/wiki/providers](https://www.reddit.com/r/usenet/wiki/providers)
* An indexer to obtain `.nzb` files, these are used to tell the server where to find the files

***

## Initial Setup
### First Login


* Upon clicking connect, you'll be greeted by this page. Enter the Username and Password chosen during install


<p align="center">
<img src="https://i.imgur.com/MG6BkI9.png">
</p>

* Once logged in, you'll be greeted with the main interface of NZBget.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572879211864.png">
</p>


## Adding News Servers

* You can add your news servers in Settings -> News-Servers section.

```
Active: Yes
Name: Chosen name for this server
Host: my.newsserver.com (You can find the host for your provider either in the email given to you when you signed up or your newserver provider customer panel) 
Port: 119 (This is normally fine however this depends on your provider check your provided news provider details)
Username: Username given to you by your provider
Password: Password given to you by your provider
Encryption: This depends on your provider, check your provided news provider details (This can cause slower downloads when enabled)
Connections: This varies depending on provider, check your provided news provider details

```

* Once you've added the necessary information. Click **Save all changes** and **Reload NZBGet** to load the new configuration.

<p align="center">
<img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572886463622.png">
</p>