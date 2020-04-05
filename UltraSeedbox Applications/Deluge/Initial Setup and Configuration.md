<h2 id="bkmrk-%3Elol%3C">Initial Setup</h2>
<p id="bkmrk-deluge-is-already-co" style="text-align: justify;">Deluge is already configured and tuned out of the box. To Install Deluge:</p>
<ul id="bkmrk-install-it-from-our-">
<li style="text-align: justify;">Install it from our Control Panel</li>
<li style="text-align: justify;">Add in you desired password in the textbox</li>
<li style="text-align: justify;">Once installed, click Connect under Deluge</li>
<li style="text-align: justify;">Enter your set password.</li>
<li style="text-align: justify;">There will be a textbox asking you if you want to change the default password, which is the one you set in UCP. Click No.</li>
</ul>
<p id="bkmrk--0"><img id="bkmrk--19" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573813864485.png" /></p>
<ul id="bkmrk-then%2C-the-connection">
<li style="text-align: justify;">Then, the Connection Manager settings will appear. Just click the host in the box and click <strong>Connect</strong></li>
</ul>
<p id="bkmrk--1"><img id="bkmrk--20" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573813975710.png" /></p>
<ul id="bkmrk-you-are-now-logged-i">
<li style="text-align: justify;">You are now logged into Deluge&rsquo;s Web UI</li>
</ul>
<p id="bkmrk-we-recommend-your-de" class="callout info">We recommend your Deluge password consists of LETTERS and NUMBERS only. This is particularly useful when you're using deluge-console injection for autodl-irssi.</p>
<hr id="bkmrk--2" />
<h2 id="bkmrk-default-file-paths">Default File Paths</h2>
<p id="bkmrk-default-downloads-fo">Default Downloads Folder:&nbsp;<code>~/Downloads</code></p>
<p id="bkmrk-deluge%27s-config-fold">Deluge's config folder: <code>~/.config/deluge</code></p>
<hr id="bkmrk--5" />
<h2 id="bkmrk-settings-overview-0">Settings Overview</h2>
<ul id="bkmrk-to-access-deluge%27s-s">
<li>To access Deluge's settings, click the&nbsp;<strong>Preferences</strong> button.</li>
</ul>
<p id="bkmrk--6"><img id="bkmrk--22" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826338240.png" /></p>
<ul id="bkmrk-below-are-the-follow">
<li>Below are the following important settings that you might be interested at.</li>
</ul>
<h3 id="bkmrk-downloads">Downloads</h3>
<ul id="bkmrk-here%2C-you-can-set-th">
<li style="text-align: justify;">Here, you can set the location of the Deluge's Download folder. It is defaulted to <code>~/Downloads</code></li>
<li style="text-align: justify;">You can also set a folder to move your completed downloads, get a copy of .torrent files to a separate folder and auto-add .torrents</li>
<li style="text-align: justify;">You can set allocation and other options. It's best to leave these options as-is unless you know what you're doing.</li>
</ul>
<p id="bkmrk--7"><img id="bkmrk--23" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826028621.png" /></p>
<h3 id="bkmrk-network">Network</h3>
<ul id="bkmrk-here%2C-you-can-set-op">
<li style="text-align: justify;">Here, you can set option for port assignments, peer byte TOS, and BitTorrent Protocol extras.</li>
<li style="text-align: justify;">The settings here are configured for the use of private trackers. It's best to leave these options as-is.</li>
<li style="text-align: justify;">If you're going to use primarily public trackers, check all Network extras and click OK to apply.</li>
</ul>
<p id="bkmrk--8"><img id="bkmrk--24" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826052419.png" /></p>
<h3 id="bkmrk-bandwidth">Bandwidth</h3>
<ul id="bkmrk-here%2C-you-may-set-ba">
<li>Here, you may set bandwidth usage that will be applied to all of your seeding torrents.</li>
<li>Here, you can also set the Maximum Download and Upload speed here
<ul>
<li style="text-align: justify;">We recommend not to set these. Any attempts of throttling upload or download will be detected by your tracker and will be restricting your access to the torrents. It is best to set a ratio limit to your torrents which you may do so by going here:&nbsp;<a title="Setting Max Seed Limit in Deluge using LabelPlus" href="https://docs.usbx.me/books/deluge/page/setting-max-seed-limit-in-deluge-using-labelplus">Setting Max Seed Limit in Deluge using LabelPlus</a> and <a href="https://docs.usbx.me/books/deluge/page/initial-setup-and-configuration#bkmrk-queue">Deluge's Queue Options</a></li>
</ul>
</li>
</ul>
<p id="bkmrk--10"><img id="bkmrk--26" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826085303.png" /></p>
<h3 id="bkmrk-interface">Interface</h3>
<ul id="bkmrk-here%2C-you-can-set-so">
<li style="text-align: justify;">Here, you can set some changes to your Deluge WebUI</li>
<li style="text-align: justify;">You can also change your set Deluge WebUI password here
<ul>
<li>Take note that you're only changing the WebUI password.</li>
<li>Remote access/deluge-console password will not be changed. Should you need to change the remote access password, you may have to reinstall Deluge.</li>
</ul>
</li>
<li style="text-align: justify;">For the rest, it's best to leave these as-is.</li>
</ul>
<p id="bkmrk--11"><img id="bkmrk--27" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826101214.png" /></p>
<h3 id="bkmrk-queue">Queue</h3>
<ul id="bkmrk-here%2C-you-can-change">
<li id="bkmrk-%C2%A0-2" style="text-align: justify;">Here, you can change how many active, active downloading and active seeding.
<ul id="bkmrk-you-can-set-these-to">
<li>You can set these to&nbsp;<code>-1</code> for unlimited Active torrents. Downside of this is that this'll hamper performance, especially IO if you have lots of active torrents.&nbsp;</li>
</ul>
</li>
<li>You can also set global ratio seeding limits here.
<ul id="bkmrk-if-you%27re-using-publ">
<li style="text-align: justify;">If you're using public trackers, USB TOS allows clients to seed public torrents up to 2.0. This is to adhere fair usage rules and to not drain your allocated bandwidth.</li>
<li style="text-align: justify;">There are mosre flexible options to set ratio limits. You may visit this guide to learn more: <a title="Limiting Seeding Ratio in Deluge" href="https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge">Limiting Seeding Ratio in Deluge</a></li>
</ul>
</li>
</ul>
<p id="bkmrk--14"><img id="bkmrk--30" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826215686.png" /></p>
<h3 id="bkmrk-plugins">Plugins</h3>
<ul id="bkmrk-here%2C-you-can-enable">
<li id="bkmrk-%C2%A0-5" style="text-align: justify;">Here, you can enable and install plugins.
<ul>
<li style="text-align: justify;">For more information on this, refer to this guide: <a title="Installing Deluge Plugins" href="https://docs.usbx.me/books/deluge/page/installing-deluge-plugins">Installing Deluge Plugins</a></li>
</ul>
</li>
</ul>
<p id="bkmrk--17"><img id="bkmrk--33" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826287076.png" /></p>
<h3 id="bkmrk-execute">Execute</h3>
<ul id="bkmrk-here%2C-you-may-put-in">
<li id="bkmrk-%C2%A0-6">Here, you may put in the absolute path of scripts for it to be executed according to your set Torrent event.</li>
</ul>
<p id="bkmrk--18"><img id="bkmrk--34" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image-1573826301343.png" /></p>