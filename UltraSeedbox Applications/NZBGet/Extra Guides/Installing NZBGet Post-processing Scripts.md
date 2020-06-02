Post-processing scripts (pp-scripts) on NZBGet help in further processing your downloaded files after downloading and unpacking such as the following:

* Deleting unwanted files
* Renaming and sorting releases
* Unlocking password-protected archived files

In this guide, we'll be showing you how to setup and enable Post-processing scripts for NZBGet. 

***

## Creating NZBget Scripts Folder

* Login to your seedbox's SSH and run the following command to create the `scripts` subfolder inside nzbget's config folder:

```
mkdir -p "$HOME"/.config/nzbget/scripts
```

## Downloading Scripts

* After that, just put any scripts that want on your newly created folder in `"$HOME"/.config/nzbget/scripts`
  * The next section contains some of our recommended scripts.
  * In this guide, we'll be installing `flatten.py`.

```sh
usbdocs@lw976:~$ wget -P "$HOME"/.config/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/flatten.py
--2020-06-02 13:01:17--  https://raw.githubusercontent.com/clinton-hall/GetScripts/master/flatten.py
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.192.133, 151.101.64.133, 151.101.128.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.192.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5075 (5.0K) [text/plain]
Saving to: ‘/home25/usbdocs/.config/nzbget/scripts/flatten.py’

flatten.py                    100%[=================================================>]   4.96K  --.-KB/s    in 0s

2020-06-02 13:01:17 (54.3 MB/s) - ‘/home25/usbdocs/.config/nzbget/scripts/flatten.py’ saved [5075/5075]

usbdocs@lw976:~$
```
* Login to your NZBGet instance and go to Settings -> Extension Scripts.
* Then, on Extensions click **Choose** and check the extension scripts that you want
* If you have multiple scripts, you can also organize which scripts goes first.
* AFter you've set the scripts to your liking, click **Apply**. Scroll down and click **Save all changes**. Reload NZBGet after to properly load up your scripts.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591095916166.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591099165126.png"></p>

## Recommended Post-Processing Scripts
### flatten.py

* This script removes subdirectories and put all downloaded files into the root download directory. You can specify a unique directory and append category sub directory if wanted.

```sh
wget -P "$HOME"/.config/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/flatten.py
```

### DeleteSamples.py

* This script delete "-sample" files found alongside downloaded files.

```sh
wget -P "$HOME"/.config/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/DeleteSamples.py
```

### HashRenamer.py

* This script rename files with hashes from NZB's filename.

```sh
wget -P "$HOME"/.config/nzbget/scripts https://raw.githubusercontent.com/Cloudbox/Cloudbox/master/roles/nzbget/files/HashRenamer.py
```

### Passwordlist.py

* This script attempts to extract password-protected archives using a list of possible passwords.

```sh
wget -P "$HOME"/.config/nzbget/scripts https://raw.githubusercontent.com/clinton-hall/GetScripts/master/passwordList.py
```

### reverse_name.py

* This extension script for NZBGet will reverse filenames first then rename to folder name on failure.

```sh
wget -P "$HOME"/.config/nzbget/scripts https://raw.githubusercontent.com/Prinz23/nzbget-pp-reverse/master/reverse_name.py
```

### VideoSort

```sh
wget https://github.com/nzbget/VideoSort/releases/download/v8.0/videosort-8.0-dist.zip
unzip videosort-8.0-dist.zip -d "$HOME"/.config/nzbget/scripts
rm videosort-8.0-dist.zip
```

For more information and other recommended post-processing scripts, you can visit [NZBGet's Catalog of Post-processing scripts.](https://nzbget.net/catalog-of-extension-scripts)