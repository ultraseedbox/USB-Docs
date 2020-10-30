This guide lists optimizations when using `rclone mount` to host your files to your seedbox. This is to lessen the API request hits made by rclone to your cloud streaming service and to not hit your cloud streaming's download quotas.

***

## Media Centers
### Plex
#### Settings ⇾ Library

* `Scan my library periodically`: Daily
  * This lessens the API requests sent.
  * You can set this down to 6 hours if necessary.
  * You may also use Sonarr/Radarr's Connect to update your libraries if there are any new episodes/movies uploaded with periodic scanning to daily.
* `Generate video preview thumbnails`: never
* `Generate intro video markers`: never
* `Generate chapter thumbnails`: never
* `Analyze audio tracks for loudness`: never
  * The following settings do a full download of the file and is only used to create intro markers, generate thumbnails and analyze the audio track of each file.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596905991296.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906036724.png"></p>

#### Settings ⇾ Scheduled Tasks

* `Perform extensive media analysis during maintenance`: Unchecked
  * This does a full download and is only used for bandwidth analysis with streaming.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906120578.png"></p>

### Emby/Jellyfin
#### Settings ⇾ Advanced ⇾ Scheduled Tasks

* `Scan Media Library`: Every 24 Hours
  * This lessens the API requests sent.
  * You can set this down to 6 hours if necessary.
  * You may also use Sonarr/Radarr's Connect to update your libraries if there are any new episodes/movies uploaded with periodic scanning to daily.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906513315.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906695674.png"></p>

* `Thumbnail Image Extraction`: none
  * It does the full download of the file and is only used to generate thumbnails. This can be set per-library.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596906693494.png"></p>

## Downloaders
### Sonarr/Radarr
#### Settings ⇾ Media Management ⇾ File Management

* `Analyze video files`: Unchecked
  * It downloads the media file in full to perform media analysis (Extracting video information from the media file)
  * This should be turned off as this happens frequently on library refreshes if left on.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596907268973.png"></p>

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596907298474.png"></p>