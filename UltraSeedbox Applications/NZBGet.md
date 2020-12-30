**NZBGet** is a binary downloader written in C++, which downloads files from Usenet based on the information given in nzb-files. It is designed with performance in mind to achieve maximum download speed by using very little system resources. Some of the features are:

* Fast deobfuscation (par-rename)
* RSS with duplicate check
* Flexible news server management
* Smart par-repair

More information of this app can be accessed at [this link.](https://nzbget.net/)

![](https://docs.usbx.me/uploads/images/gallery/2019-09/scaled-1680-/image-1568808281471.png)

***

## Initial Setup

In this section, we'll be setting up NZBGet for the first time. Here, we'll be doing the following tasks:

* Login to the NZBGet instance for the first time
* Change ControlUsername and ControlPassword
* Add Usenet indexers

You may also need the following: 

* A Usenet service provider, you can find a list of different providers here: [https://www.reddit.com/r/usenet/wiki/providers](https://www.reddit.com/r/usenet/wiki/providers)
* An indexer to obtain `.nzb` files, these are used to tell the server where to find the files

### First Login

* Upon clicking connect, you'll be greeted by this page. Enter the Username and Password chosen during install

![](https://i.imgur.com/MG6BkI9.png)

* Once logged in, you'll be greeted with the main interface of NZBget.

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572879211864.png)

### Adding News Servers

* You can add your news servers in **Settings -> News-Servers** section.

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

![](https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1572886463622.png)

***

## Extra Guides
### Installing NZBGet Post-processing Scripts

Post-processing scripts (pp-scripts) on NZBGet help in further processing your downloaded files after downloading and unpacking such as the following:

* Deleting unwanted files
* Renaming and sorting releases
* Unlocking password-protected archived files

In this section, we'll be showing you how to setup and enable Post-processing scripts for NZBGet.

#### Creating NZBget Scripts Folder

* Login to your seedbox's SSH and run the following command to create the `scripts` subfolder inside nzbget's config folder:

```sh
mkdir -p "$HOME"/.apps/nzbget/scripts
```

#### Downloading Scripts

* After that, just put any scripts that want on your newly created folder in `"$HOME"/.apps/nzbget/scripts`
  * The next section contains some of our recommended scripts.
  * In this guide, we'll be installing `flatten.py`.

```sh
usbdocs@lw976:~$ wget -P "$HOME"/.apps/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/flatten.py
--2020-06-02 13:01:17--  https://raw.githubusercontent.com/clinton-hall/GetScripts/master/flatten.py
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.192.133, 151.101.64.133, 151.101.128.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.192.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5075 (5.0K) [text/plain]
Saving to: ‘/home25/usbdocs/.apps/nzbget/scripts/flatten.py’

flatten.py                    100%[=================================================>]   4.96K  --.-KB/s    in 0s

2020-06-02 13:01:17 (54.3 MB/s) - ‘/home25/usbdocs/.apps/nzbget/scripts/flatten.py’ saved [5075/5075]

usbdocs@lw976:~$
```

* Login to your NZBGet instance and go to Settings -> Extension Scripts.
* Then, on Extensions click **Choose** and check the extension scripts that you want
* If you have multiple scripts, you can also organize which scripts goes first.
* AFter you've set the scripts to your liking, click **Apply**. Scroll down and click **Save all changes**. Reload NZBGet after to properly load up your scripts.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591095916166.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591099165126.png)

#### Recommended Post-Processing Scripts
##### flatten.py

* This script removes subdirectories and put all downloaded files into the root download directory. You can specify a unique directory and append category sub directory if wanted.

```sh
wget -P "$HOME"/.apps/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/flatten.py
```

##### DeleteSamples.py

* This script delete "-sample" files found alongside downloaded files.

```sh
wget -P "$HOME"/.apps/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/DeleteSamples.py
```

##### HashRenamer.py

* This script rename files with hashes from NZB's filename.

```sh
wget -P "$HOME"/.apps/nzbget/scripts https://raw.githubusercontent.com/Cloudbox/Cloudbox/master/roles/nzbget/files/HashRenamer.py
```

##### Passwordlist.py

* This script attempts to extract password-protected archives using a list of possible passwords.

```sh
wget -P "$HOME"/.apps/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/passwordList.py
```

##### reverse_name.py

* This extension script will reverse filenames first then rename to folder name on failure.

```sh
wget -P "$HOME"/.apps/nzbget/scripts https://raw.githubusercontent.com/Prinz23/nzbget-pp-reverse/master/reverse_name.py
```

##### VideoSort

* This script uses scene-standard naming conventions to match TV shows and movies and rename/move/sort/organize them as you like.

```sh
cd "$HOME"/.apps/nzbget/scripts
git clone https://github.com/nzbget/VideoSort
```

For more information and other recommended post-processing scripts, you can visit [NZBGet's Catalog of Post-processing scripts.](https://nzbget.net/catalog-of-extension-scripts)