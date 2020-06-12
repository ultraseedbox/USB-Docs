Listed below are scripts that installs some of the popular Plex Plugins into your PMS instance. To use it, just run the commands of the plug-ins that you need on your seedbox's SSH terminal and access your Plex afterwards. Some post-installation notes are detailed on each plug-in.

***

### Absolute Series Scanner/Hama Bundle

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/hama-ass.sh | bash
```

#### Post Installation

* More info here: [https://github.com/ZeroQI/Hama.bundle](https://github.com/ZeroQI/Hama.bundle)

### Sub-Zero

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/subzero.sh | bash
```

#### Post Installation

* Access its settings via Plugins and access the Sub-Zero interface via Kitana
* More info here: [https://github.com/pannal/Sub-Zero.bundle](https://github.com/pannal/Sub-Zero.bundle)

### Webtools

```
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/webtools.sh | bash
```

#### Post Installation

* After running the script do the following:
  * Connect to your Plex server
  * On Plugins section of your Plex server Settings, configure Webtools plugin (click the Gear icon) and do the following
    * Uncheck SSL
    * Set HTTP port to **33433**
    * Save settings
      * If plugin timeouts on Save just proceed to next step
  * Restart Plex from UCP or from SSH with `app-plex restart`
  * Then access the Webtools interface by accessing the Direct URL under Plex in UCP **- 2 on the port**
    * For example, if your plex runs on this port 12625, Webtools web interface will be available on 12623
* More info here: [https://github.com/ukdtom/WebTools.bundle](https://github.com/ukdtom/WebTools.bundle)

### Extended Personal Media Shows

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/epms.sh | bash
```

#### Post Installation

* More info here: [https://bitbucket.org/mjarends/extendedpersonalmedia-agent.bundle/src/master/README.md](https://bitbucket.org/mjarends/extendedpersonalmedia-agent.bundle/src/master/README.md)

### Trakt.tv Scrobbler

```sh
curl https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Plex/Plex-Plugins/trakt.sh | bash
```

#### Post Installation

* More info here: [https://github.com/trakt/Plex-Trakt-Scrobbler](https://github.com/trakt/Plex-Trakt-Scrobbler)