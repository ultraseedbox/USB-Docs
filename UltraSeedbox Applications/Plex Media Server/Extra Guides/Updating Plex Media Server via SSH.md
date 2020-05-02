When you install or update Plex from the UCP or via SSH using `app-plex upgrade`, it'll update to the latest build that we've verified as stable. If you want to switch to another build, you may do so via the seedbox's SSH terminal. The following commands are listed below.

Take note that once you upgraded, you'll stay in that version until you run the update again.

#### Plex Stable Build

`app-plex upgrade --plex-version=public`

* This defaults to latest public stable build

#### Plex Pass Build

`app-plex upgrade --plex-version=latest`

* Running this command allows you to update to latest Plex beta build
* This requires your account to have a Plex Pass subscription.
  * If you do not have Plex Pass and you run this command, it'll update to the public stable build instead.

#### Upgrading/Downgrading Plex

`app-plex upgrade --plex-version=<version number>`

* This allows you to specify any version of Plex from v1.15 onward.