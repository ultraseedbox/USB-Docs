When you install or update Plex from the UCP or via SSH using `app-plex upgrade`, it'll update to the latest build that we've verified as stable. USB recommends to use the verified PMS build for the best experience.

If you want to switch to another build, you may do so via the seedbox's SSH terminal. The following commands are listed below.

<c><p class="callout info">Take note that everytime you run the command, it will overwrite whatever Plex Media Server you're running. Your media and configuration is not affected.</p></c>

#### Plex Stable Build

```sh
app-plex upgrade --plex-version=public
```

* This defaults to the latest public stable build

#### Plex Pass Build

```sh
app-plex upgrade --plex-version=latest
```

* Running this command allows you to update to the latest Plex beta build
* This requires your account to have a Plex Pass subscription.
  * If you do not have Plex Pass and you run this command, it'll update to the public stable build instead.

#### Upgrading/Downgrading Plex

```sh
app-plex upgrade --plex-version=<version number>
```

* This allows you to specify any version of Plex from v1.15 onward.
* Take note that you have to put in the **full version number** of the build you want to install or the command will fail.
  * You can refer to [Plex's Official Docker Hub Page](https://hub.docker.com/r/plexinc/pms-docker/tags) or [LinuxServer.io's Plex Docker Hub Page](https://hub.docker.com/r/linuxserver/plex/tags) for the version number you want.
* For instance, if you want to install version 1.20.3.3483. After checking for the full version on the Docker Hub page, you will run the following

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-10/image-1603560343971.png"></p>

```bash
app-plex upgrade --plex-version=1.20.3.3483-211702a9f
```