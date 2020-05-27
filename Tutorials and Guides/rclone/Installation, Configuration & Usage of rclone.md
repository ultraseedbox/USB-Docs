<p class="callout warning">USB support is unable to provide support for rclone, this is due to the large volume of variables and different configurations possible with rclone. The guides found here on the knowledge-base should be able to guide you through using rclone, and any further questions can easily be answered with a quick Google search. You may also be able to find community support for rclone through our community Discord server or the Rclone forums.</p>

In this guide we will be going over the installation of rclone. We'll also cover basic usage such as setting up a remote, and how to copy files between your seedbox and a remote file host.

***

## Installation

To begin, make sure you know how to SSH into your slot. All rclone commands are performed via SSH. You can find a guide on SSH [here](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh).

To install rclone run the command below, this command will automatically install rclone to your slot for you.

### rclone stable

```
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Installer%20Scripts/rclone-install-stable.sh | bash
```

### rclone beta

```
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/MergerFS-Rclone/Installer%20Scripts/rclone-install-beta.sh | bash
```

***

## Configuration

Now we need to configure a remote to use with rclone. For this guide we will be configuring Google Drive. This is the most common remote people tend to use as it offers large storage capacities for a reasonable price. If you wish to use a different cloud host feel free to modify the steps you take.

* Run the command `rclone config`

```
kbguides@lw914:~$ rclone config
2019/06/15 18:16:33 NOTICE: Config file "/home27/kbguides/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q>
```

* Press `n` and then **Enter**. Type the name you wish to use for your remote and then press **Enter** once more.
* Scroll through the list of supported remotes and pick the one you wish. For this example we will be using Google Drive, so we will type `12` then press **Enter**.

```
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
...
11 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
12 / Google Drive
   \ "drive"
13 / Hubic
   \ "hubic"
...
```

* You will be prompted to enter your `client_id`. If you have not generated your keys yet or do not know what it is I recommend using this guide to help you generate them [Configuring Oauth for Google Drive](https://docs.usbx.me/books/rclone/page/configuring-oauth-for-google-drive).
* Once you have followed the steps in the guide, copy your client ID and paste it into the terminal, next press **Enter**. Now copy your client secret, paste it in, and again press **Enter**

```
Google Application Client Id
Setting your own is recommended.
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.
If you leave this blank, it will use an internal key which is low performance.
Enter a string value. Press Enter for the default ("").
client_id> example12345

Enter a string value. Press Enter for the default ("").
client_secret> example12345
```

* Choose the scope you wish to give rclone. Full access is safe and likely the most useful one to you, so in this case we will type `1` then press **Enter**.

```
Scope that rclone should use when requesting access from drive.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Full access all files, excluding Application Data Folder.
   \ "drive"
 2 / Read-only access to file metadata and file contents.
   \ "drive.readonly"
   / Access to files created by rclone only.
 3 | These are visible in the drive website.
   | File authorization is revoked when the user deauthorizes the app.
   \ "drive.file"
   / Allows read and write access to the Application Data folder.
 4 | This is not visible in the drive website.
   \ "drive.appfolder"
   / Allows read-only access to file metadata but
 5 | does not allow any access to read or download file content.
   \ "drive.metadata.readonly"
scope> 1
```

* Unless you know what you are doing, leave the `root folder` blank and press **Enter**. Leave Service Account Credentials JSON file path blank also, again press **Enter**. Then type `n` to choose to not edit advanced config and press **Enter**.

```
ID of the root folder
Leave blank normally.
Fill in to access "Computers" folders. (see docs).
Enter a string value. Press Enter for the default ("").
root_folder_id>
 
Service Account Credentials JSON file path
Leave blank normally.
Needed only if you want use SA instead of interactive login.
Enter a string value. Press **Enter** for the default ("").
service_account_file>
 
Edit advanced config? (y/n)
y) Yes
n) No
y/n> n
```

* Type `n` to choose to not use auto config and press **Enter**. You will be provided with a URL, copy this URL and paste it into your web browser. Choose the Google Drive account you wish to use and click Allow to give rclone permission to use it. You will be given a code, copy this and place it into your terminal, then press Enter. Finally type `n` to choose to not configure as a team drive and press **Enter**.

```
Use auto config?
 * Say Y if not sure
 * Say N if you are working on a remote or headless machine
y) Yes
n) No
y/n> n
 
If your browser doesn't open automatically go to the following link: <URL WILL BE HERE>
Log in and authorize rclone for access
Enter verification code> random string
 
Configure this as a team drive?
y) Yes
n) No
y/n> n
```

* You will be shown a confirmation screen. If all is okay type `y` and then press **Enter** to save your configuration. If you notice any issues, you can edit them from here by typing `e`, or delete them using `d`. Finally, press `q` and then **Enter** to quit the rclone config wizard.
    

```
--------------------
[test]
type = drive
client_id = blank
client_secret = blank
scope = drive
token = {"access_token":"blank"}
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d>
```

***

## Usage

rclone is interacted with purely through SSH. Please ensure you are familiar with the Linux terminal and using SSH prior to trying to use rclone.

### General Commands

These commands are useful to remember. They allow you to interact with rclone and move files around between your local and remote storage or even between two remote destinations.

```
config - Execute this command to add, modify or remove remote file hosts.
Usage: rclone config
 
copy - Used to copy files between two locations, remote -> remote, remote -> local, local -> remote
Usage: rclone copy [-P] {origin} {destination}
 
move - Same as copy however does not leave the files at the source
Usage: rclone move [-P] {origin} {destination}
 
sync - Will make the destination directory identical to the origin. If files exist on destination that do not on origin they will be deleted. Be careful with the sync command as it can cause date loss.
Usage: rclone sync [-P] {origin} {destination}
 
When dealing with remote filesystems use:
{remote}:{path}
 
For example, if you wished to copy a file named movie.mkv from your current working directory to a path named Movies in a remote name Drive you'd use this command:
rclone copy movie.mkv Drive:Movies
```
