<p id="bkmrk-in-this-tutorial%2C-we" style="text-align: justify;">In this guide, we'll be exploring options on how to limit your seeding torrent's ratio. One where you will apply seeding limit to all of your torrents and using one of Deluge's third party plugins called LabelPlus. With LabelPlus, you can label some torrents you chose automatically according to your set filters and more, depending on what you set each label. You can also move and throttle torrents within a label with ease.</p>
<p id="bkmrk-this-requires-the-fo" style="text-align: justify;">This requires the following:</p>
<ul id="bkmrk-deluge-installed-on-" style="text-align: justify;">
<li>Deluge installed on your seedbox</li>
<li>Deluge Thin Client (It does now have WebUI access)</li>
<li>LabelPlus egg</li>
</ul>
<p id="bkmrk-in-this-guide%2C-we%27ll" style="text-align: justify;">In this guide, we'll be briefly teach you how to set it up. For LabelPlus, we will also guide you on how to automatically label and set max seeding ratio to some torrents.</p>
<hr id="bkmrk-" />
<h2 id="bkmrk-global-seeding-limit">Global Seeding Limit</h2>
<ul id="bkmrk-to-apply-a-certain-r">
<li style="text-align: justify;">To apply a certain ratio limit to all of your torrents, simply to your Deluge preferences and click Queue</li>
<li style="text-align: justify;">Check "Stop seeding when share ratio reaches" and set the number in the box to any ratio you want.
<ul>
<li style="text-align: justify;">In this example, we set it to 2</li>
</ul>
</li>
<li style="text-align: justify;">Click apply and then OK</li>
</ul>
<p id="bkmrk--0"><a href="https://docs.usbx.me/uploads/images/gallery/2020-03/deluge-seed.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/deluge-seed.png" alt="deluge-seed.png" /></a></p>
<hr id="bkmrk--1" />
<h2 id="bkmrk-labelplus">LabelPlus</h2>
<h3 id="bkmrk-installation">Installation</h3>
<ul id="bkmrk-install-deluge-via-u">
<li>Grab and install Deluge PC Client and Label Plus from the links provided</li>
</ul>
<pre><code class="language-">Deluge Client 1.3.15
    Windows - https://ftp.osuosl.org/pub/deluge/windows/deluge-1.3.15-win32-py2.7.exe
    MacOS - http://download.deluge-torrent.org/mac_osx/deluge-1.3.15.1-macosx-x64.dmg
    Linux - Refer to your distribution
 
LabelPlus: https://github.com/ratanakvlun/deluge-labelplus/releases/download/v0.3.2.2/LabelPlus-0.3.2.2-py2.7.egg</code></pre>
<div data-type="aside">
<div data-type="aside">
<div>
<ul>
<li style="text-align: justify;">Open up Deluge Client on your PC</li>
<li style="text-align: justify;">Click Preferences -&gt; Interface and Uncheck Classic Mode</li>
<li style="text-align: justify;">Confirm to restart Deluge</li>
</ul>
</div>
</div>
</div>
<p id="bkmrk--2" style="text-align: justify;"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-8-58%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-26_17-8-58%5B1%5D.png" alt="image2019-8-26_17-8-58[1].png" /></a></p>
<div data-type="aside">
<div data-type="aside">
<div>
<ul>
<li style="text-align: justify;">Once Rebooted, a window named Connection Manager appears. Click Add.</li>
<li style="text-align: justify;">Go back to your UCP, under applications Tab find remote client access under Deluge and input the values accordingly.</li>
<li style="text-align: justify;">Once that's done, click add and wait for the Green circle to pop up.</li>
<li style="text-align: justify;">Once that's popped up, highlight your new details and click Connect.</li>
</ul>
</div>
</div>
</div>
<p id="bkmrk--3" style="text-align: justify;"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-12-28%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-26_17-12-28%5B1%5D.png" alt="image2019-8-26_17-12-28[1].png" /></a></p>
<div data-type="aside">
<div data-type="aside">
<div>
<ul>
<li style="text-align: justify;">Once connected, go to Preferences -&gt; Plugin.</li>
<li>Click Install Plugin and navigate to the file named LabelPlus-0.3.2.2-py2.7.egg and click Open
<ul>
<li style="text-align: justify;">This'll install the plugin on your PC client and to the Seedbox Client.</li>
<li style="text-align: justify;">After it's installed, tick LabelPlus and click OK. You may have to do that a few times to get it properly installed.</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
<p id="bkmrk--4"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-3-23%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-3-23%5B1%5D.png" alt="image2019-8-30_21-3-23[1].png" /></a></p>
<div data-type="aside">
<div data-type="aside">
<div>
<ul>
<li>Close Preferences. On the left side, click LabelPlus Tab.</li>
</ul>
</div>
</div>
</div>
<p id="bkmrk--5"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-4-27%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-4-27%5B1%5D.png" alt="image2019-8-30_21-4-27[1].png" /></a></p>
<div data-type="aside">
<div data-type="aside">
<div>
<ul>
<li>Right click the space&nbsp;&rarr; Add Label and name it.</li>
<li>Click OK. You'll see your newly created Label.</li>
</ul>
</div>
</div>
</div>
<p id="bkmrk--6"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-5-11%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-5-11%5B1%5D.png" alt="image2019-8-30_21-5-11[1].png" /></a></p>
<div data-type="aside">
<div data-type="aside">
<div>
<ul>
<li style="text-align: justify;">Right click that new label and select Label Options to set your preferences, as described below.</li>
</ul>
</div>
</div>
</div>
<p id="bkmrk--7"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-7-0%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-7-0%5B1%5D.png" alt="image2019-8-30_21-7-0[1].png" /></a></p>
<div data-type="aside">
<div data-type="aside">
<div></div>
</div>
</div>
<h3 id="bkmrk-labelplus-label-opti">LabelPlus Label Options</h3>
<h4 id="bkmrk-downloads">Downloads</h4>
<ul id="bkmrk-here%2C-you-can-set-se">
<li style="text-align: justify;">Here, you can set set the download directory and to move some of your specifically labelled torrents to different locations</li>
</ul>
<p id="bkmrk--9"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-8-3%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-8-3%5B1%5D.png" alt="image2019-8-30_21-8-3[1].png" /></a></p>
<h4 id="bkmrk-bandwidth">Bandwidth</h4>
<ul id="bkmrk-here%2C-you-can-set-yo">
<li>Here, you can set your labelled torrents your maximum DL, UL, connections and upload slots.
<ul>
<li>We do not recommend throttling upload speed on any trackers, whether is public or private. Throttling speeds will be detected by the tracker and your download speeds will also be throttled to a crawl or will be IP banned.</li>
<li>We recommend seeding them at a certain ratio instead.</li>
</ul>
</li>
</ul>
<p id="bkmrk--10"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-30_21-8-34%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-8-34%5B1%5D.png" alt="image2019-8-30_21-8-34[1].png" /></a></p>
<h4 id="bkmrk-queue">Queue</h4>
<ul id="bkmrk-here%2C-you-can-set-to">
<li>Here, you can set to seed your set torrents at a certain ratio.</li>
<li>You may also opt to remove torrents once it reaches your certain ratio.
<ul>
<li>Shown here, I created a label named Publics and set all my public tracker torrents to seed up to 2.0. Once that is reached, it'll be stopped by the plugin automatically.</li>
<li>USB TOS allows clients to seed public torrents up to 2.0. This is to adhere fair usage rules and to not drain your allocated bandwidth.</li>
</ul>
</li>
</ul>
<p id="bkmrk--11"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-21-16%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-26_17-21-16%5B1%5D.png" alt="image2019-8-26_17-21-16[1].png" /></a></p>
<h4 id="bkmrk-autolabel">Autolabel</h4>
<ul id="bkmrk-it-can-check-the-fol">
<li>It can check the following data. And if it matches, it'll assign the torrent to your set Label and it'll trigger whatever you set in the first three tabs of your Label.
<ul>
<li>Name of the torrent</li>
<li>Tracker</li>
<li>Any files in the torrent</li>
<li>Label</li>
</ul>
</li>
<li>You can also specify different matching modes for each.
<ul>
<li>In the screenshot, I put in some of the known public tracker domains in the Label Publics.</li>
<li>When I downloaded a torrent from tracker domains containing the ones I've set, it'll automatically put to Publics label and set to stop seeding until the ratio of 2.0 as set above.</li>
</ul>
</li>
</ul>
<p id="bkmrk--12"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-8-26_17-21-56%5B1%5D.png" target="_blank" rel="noopener"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-26_17-21-56%5B1%5D.png" alt="image2019-8-26_17-21-56[1].png" /></a></p>