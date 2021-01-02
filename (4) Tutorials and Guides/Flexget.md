**FlexGet** is a multi-purpose automation tool for content like torrents, NZBs, podcasts, comics, series, movies, etc and is able to handle different kinds of sources like RSS feeds, HTML pages and CSV files. This allows you to integrate and create powerful automation between your downloaders, organizers and your media servers.

This guide shows you the following:

* Install Python 3 and FlexGet to your seedbox slot
* Create your first FlexGet configuration
* Running FlexGet
* Scheduling your FlexGet tasks
* Upgrading and Removing FlexGet

***
## Initial Setup
### Installation of FlexGet via python's virtual environment
#### Installing Python 3 and FlexGet Into your Slot

* First, login to your seedbox's SSH
  * For more information on how to access your seedbox's SSH, visit [this guide to learn more.](https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh "How to connect to your seedbox via SSH")
* Run the following commands and follow the instructions. This will install Python 3 and FlexGet into your slot.

##### Python 3

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Language%20Installers/python-pip-install.sh
bash python-pip-install.sh
```

##### FlexGet

```sh
wget https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Flexget/flexget-install.sh
bash flexget-install.sh
```

### Configuring FlexGet
#### Creating config.yml

* Here, we will now create your first FlexGet YAML. Start by creating FlexGet's config folder by running the following command:

```sh
mkdir -p "$HOME"/.config/flexget
```

* Navigate to your created folder by doing

```sh
cd "$HOME"/.config/flexget
```

* Create a config.yml with the following

```sh
nano config.yml
```

#### Editing config.yml

In this part, depending on what you want to achieve your configuration may vary but take note that:

* FlexGet config uses YAML. Indentation and spacing is critical so take care when writing your config.
* YAML uses spaces, not tabs.

For this example, we'll be configuring FlexGet to monitor RSS feeds every minute and filters out the results using [Regular Expressions](https://www.geeksforgeeks.org/write-regular-expressions/) (regex). Those that are accepted will be fed directly to Deluge for it to download. The config is shown below.

##### Example YAML Config

```yaml
tasks:
  test-1:
    rss:
      url: https://rss.to/any/f4lt3r-h4h4
      all_entries: no
    regexp:
      accept:
        - .*1080p.*
      deluge:
        host: 127.0.0.1
        port: 11123
        username: xan
        password: somepassword
        label: flexget
```

##### YAML config with explanation

```yaml
tasks:
# A FlexGet config's main component are tasks, so we start here.

  test-1:
# This is the name of first task.
     
# Now, we will now add plugins. There are three main types of plugins we normally want in a task in order: an input, a filter, and an output.

    rss:
# This is an example of an input plugin, the first one to run in a task. This tells FlexGet where do you want it to look for things. In this example, we tell FlexGet to look into the RSS feeds for any updates.

      url: https://rss.to/any/f4lt3r-h4h4
# Here, you'll add your RSS link

      all_entries: no
# This entry tells FlexGet to have each entry only created on the first run it is seen.
     
    regexp:
# This is an example of a filter plugin. This tells FlexGet which of the entries the input plugin has that you want. Here, we're using the regexp plugin to filter out entries that you want using regex.

      accept:
        - .*1080p.*
# Here, we tell FlexGet to accept all entries with the term 1080p in the title.
# The regex used here is .* which tells to match any characters, including whitespaces.
# You may refer to https://regexr.com/ to help you learn and build your own regex.

    deluge:
# This is an output plugin. This is to tell FlexGet what do with those things you want.

      host: 127.0.0.1
      port: 11123
      username: xan
      password: somepassword
      label: flexget
```

After that, save your work with **CTRL + O**, press **ENTER** then **CTRL + X**.

To check if your config is correctly formatted and configured, you may have to do the following commands:

* `flexget check` to check the config file for any errors
* `flexget --test execute` to test run your configuration.

::: warning
In my example, when you run it the first time, it may grab and download multiple torrents which may affect your tracker ratio. To mitigate this, run `flexget execute --learn`. This will save the entries accepted so it won't download again in the future.
:::

::: info
You may refer to [FlexGet Configuration](https://flexget.com/Configuration) for more information about making your own config as well as [FlexGet Cookbook](https://flexget.com/Cookbook) for some basic automation tasks that you can do with FlexGet.
:::

### Running FlexGet

Now, depending on your config you can either run it using cron or FlexGet's daemon mode.

#### Cron

* Type in your SSH window: `which flexget`. Take note of the output. This is the absolute path of FlexGet. Here, the absolute path is `/homexx/username/bin/flexget`

```sh
usbdocs@lw975:~$ which flexget
/home7/usbdocs/bin/flexget
usbdocs@lw975:~$ 
```

* Then type `crontab -e`.
  * If this is your first time running this command, there would be an option asking for your text editor. Select the editor you want but I would suggest selecting `1`.

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585835022440.png)

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585835057313.png)

* To set it running every minute, you may set it as `* * * * *` then the absolute path of FlexGet, which is `/homexx/username/bin/flexget`. Then, add in the arguments of FlexGet which is `--cron execute`.
* If we put it together, we get `* * * * * /homexx/username/bin/flexget --cron execute`

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585835133246.png)

::: info
You may refer to [Crontab Guru](https://crontab.guru/) which is an quick and simple editor for cron schedule expressions.
:::

* If you don't want cron to message you whenever there's an error in FlexGet, append `> /dev/null 2>&1` right after execute

![](https://docs.usbx.me/uploads/images/gallery/2020-04/scaled-1680-/image-1585835164953.png)

* Save your work with **CTRL + O**, press ENTER then **CTRL + X**

#### systemd/Daemon mode

::: info
For more information, please refer to [FlexGet Scheduler](https://flexget.com/Plugins/Daemon/scheduler).
:::

* Open up your FlexGet config and add the scheduler plugin before tasks

##### YAML config with Scheduler Plugin

```yaml
schedules:
  - tasks: [list, of, tasks]
    schedule:
      minute: X
      hour: X
      day: X
      day_of_week: X
      week: X
      month: X
      year: X
     
tasks:
  test-1:
    rss:
      url: https://rss.to/any/f4lt3r-h4h4
      all_entries: no
    regexp:
      accept:
        - .*1080p.*
    deluge:
      host: 127.0.0.1
      port: 11123
      username: xan
      password: somepassword
      label: flexget
```

* Say you want to run test-1 at 22:05, 22:45, 23:05, 23:45 every day and test-2 every minute, you'll set it as it is below
  * Take note that the scheduler plugin also supports cron expressions.

```yaml
schedules:
  - tasks: [test-1]
    schedule:
      minute: 5,45
      hour: 22,23
  - tasks: [test-2]
    interval:
      minute: 1

tasks:
  test-1:
    rss:
      url: https://rss.to/any/f4lt3r-h4h4
      all_entries: no
    regexp:
      accept:
        - .*1080p.*
    deluge:
      host: 127.0.0.1
      port: 11123
      username: xan
      password: somepassword
      label: flexget
  test-2:
    rss:
      url: https://rss.to/any/s4h3rz-d1cz
      all_entries: no
    regexp:
      accept:
        - .*2160p.*
    deluge:
      host: 127.0.0.1
      port: 11123
      username: xan
      password: somepassword
      label: flexget
```

* Save your work with CTRL + O, press ENTER then CTRL + X
* Then navigate to `/homexx/username/.config/systemd/user/` by typing `cd /homexx/username/.config/systemd/user/`
* Create a service file (`nano flexget-daemon.service`) and add the following:

```
[Unit]
Description=FlexGet Daemon

[Service]
Type=simple
ExecStart=/homexx/xxxxx/bin/flexget daemon start
ExecStop=/homexx/xxxxx/bin/flexget daemon stop
ExecReload=/homexx/xxxxx/bin/flexget daemon reload

[Install]
WantedBy=default.target
```

* Save your work with CTRL + O, press ENTER then CTRL + X
* Run `systemctl --user daemon-reload`
* Run `systemctl --user enable --now flexget-daemon.service` to immediately start the daemon and to automatically restart whenever the daemon crashed or if there's a server restart
* To check if the daemon is running, run `flexget daemon status`

![](https://docs.usbx.me/uploads/images/gallery/2019-10/image2019-5-3_16-29-0%5B1%5D.png)

### Upgrading FlexGet

* To upgrade FlexGet, just run the following command:

```sh
"$HOME"/flexget/bin/python -m pip install flexget --upgrade
```

### Removing FlexGet

* To remove FlexGet, simply delete the `flexget` folder and your symbolic link.

```sh
rm -rfv "$HOME"/flexget
rm "$HOME"/bin/flexget
```

* If you also want to uninstall Python 3, run the following commands:

```sh
rm -rfv "$HOME"/.pyenv
```

* Remove the following lines from `.bashrc`

```
export PATH="/homexx/username/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```