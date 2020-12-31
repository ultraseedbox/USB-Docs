megatools is a collection of programs for accessing and managing Mega.co.nz account from your terminal. It allows the following features:

* Copy individual files as well as entire directory trees to and from your account
* Perform streaming downloads without needing to download the entire file.
* Register your account using the `megareg` tool, with the benefit of having true control of your encryption keys.

In this short guide, we'll be showing you how to install/upgrade and uninstall megatools from your USB slot as well as a short description of the commands you can do on megatools.

***

## Installing/Upgrading/Uninstalling megatools

* You can run the following commands to install megatools into your slot

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/megatools/megatools-installer.sh
bash megatools-installer.sh
```

## megatools commands

* Listed below are the following commands of megatools.

```
megacopy
	synchronize local and remote mega.nz directories
megadf
	display mega.nz storage quotas/usage
megadl
	download exported files from mega.nz
megaget
	download individual files from mega.nz
megals
	list files stored at mega.nz
megamkdir
	create directories at mega.nz
megaput
	upload files to mega.nz
megareg
	register a new mega.nz account
megarm
	remove files from mega.nz
```

* ou can get the usage guide by running the binary name with the `--help-basic` or `--help-all` options.
* You may also view the latest man pages here: [megatools(1)](https://megatools.megous.com/man/megatools.html)