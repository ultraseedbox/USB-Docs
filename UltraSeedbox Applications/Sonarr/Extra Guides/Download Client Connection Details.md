<h3 id="bkmrk-torrent-clients">Torrent Clients</h3>
<h4 id="bkmrk-deluge">Deluge<textarea style="display: none;"></textarea></h4>
<pre><code class="language-">Host: {servername}.usbx.me
Port: WebUI Port from UCP
Password: As configured in UCP
Category: tv-sonarr
Recent Priority: Last
Older Priority: Last
Add Paused: NO
Use SSL: NO</code></pre>
<h4 id="bkmrk-rtorrent">rTorrent</h4>
<pre><code class="language-">Host: {username}.{servername}.usbx.me
Port: 443
URL Path: /RPC2
Use SSL: YES
Username: Your slot username
Password: As configured in UCP under ruTorrent
Category: tv-sonarr
Recent Priority: Normal
Older Priority: Normal
Add Stopped: NO</code></pre>
<h4 id="bkmrk-transmission">Transmission</h4>
<pre><code class="language-">Host: {servername}.usbx.me
Port: RPC Port from UCP
Username: As slot username
Password: As configured in UCP
Category: tv-sonarr
Recent Priority: Last
Older Priority: Last
Add Paused: NO
Use SSL: NO</code></pre>
<h3 id="bkmrk-usenet-clients">Usenet Clients</h3>
<h4 id="bkmrk-sabnzbd">SABnzbd</h4>
<pre><code class="language-">Host: {username}.{servername}.usbx.me
Port: 443
URL Path: /sabnzbd
Use SSL: YES
API Key: As obtained from SABnzbd
Username: Configured during SABnzbd setup
Password: Configured during SABnzbd setup
Category: tv
Recent Priority: Default
Older Priority: Default</code></pre>
<h4 id="bkmrk--1">Nzbget</h4>
<pre><code class="language-">Host: {servername}.usbx.me
Port: WebUI Port from UCP
Username:
Password:
Category: tv
Recent Priority: Normal
Older Priority: Normal
Add Paused: NO
Use SSL: NO</code></pre>