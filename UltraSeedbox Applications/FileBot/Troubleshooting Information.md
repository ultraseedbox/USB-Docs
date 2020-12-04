#### Why doesn’t Filebot work? It used to!

Unfortunately, this is because of the TVDB API update around six months ago. The endpoints were updated in the latest versions of filebot. We provide the last FOSS version. To keep using Filebot, you will need to purchase your license, import and update your filebot on your slot. You may also find other alternatives.

Upgrading and importing your filebot license: [https://github.com/ultraseedbox/UltraSeedbox-Scripts/tree/master/FileBot](https://github.com/ultraseedbox/UltraSeedbox-Scripts/tree/master/FileBot)

Updated AMC script with guide: [https://github.com/ultraseedbox/UltraSeedbox-Scripts/tree/master/FileBot/AMC](https://github.com/ultraseedbox/UltraSeedbox-Scripts/tree/master/FileBot/AMC)

#### Why does Filebot keep crashing?

Filebot is designed to compliment torrent clients on our infrastructure. Java, which is one of the dependencies of filebot, has a 1GB proclimit and is not recommended for running filebot in a cron or manage a whole folder at once. This type of action could quickly saturate an entire server’s cores.