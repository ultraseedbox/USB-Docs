<p id="bkmrk-this-guide-will-teac" style="text-align: justify;">This guide will teach you how to install Deluge plugins. Delige plugins extend the functionality of what Deluge provides, giving you more ways to automate processes or simplifying tasks. Take note that you need to check what plugin you download. Specifically:</p>
<ul id="bkmrk-if-the-plugin-is-wri">
<li style="text-align: justify;">If the plugin is written for Deluge v.1.3.15</li>
<li style="text-align: justify;">It's written using python 2.7</li>
<li style="text-align: justify;">Its extention is&nbsp;<code>.egg</code></li>
</ul>
<p id="bkmrk-also-take-note-if-yo">Also take note if your plugin can be accessed with the thin client or the web client.</p>
<hr id="bkmrk-" />
<h2 id="bkmrk-installing-plugins">Installing Plugins</h2>
<ul id="bkmrk-login-to-your-deluge">
<li>Login to your Deluge's Client</li>
<li>Download the plugin that you want.</li>
<li>Go to Preferences -&gt; Plugin.</li>
<li>Click Install Plugin and navigate to your plugin_name.egg and click Open
<ul>
<li>This'll install the plugin on your PC client and to the Seedbox Client.</li>
<li>After it's installed, tick the label name and click OK. You may have to do that a few times to get it properly installed.</li>
</ul>
</li>
</ul>
<p id="bkmrk--0"><img class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-8-30_21-3-23%5B1%5D.png" alt="image2019-8-30_21-3-23[1].png" /></p>
<hr id="bkmrk--1" />
<h2 id="bkmrk-useful-plugins">Useful Plugins</h2>
<h3 id="bkmrk-simple-extractor">Simple-Extractor</h3>
<ul id="bkmrk-this-plugin-allows-y">
<li style="text-align: justify;">This plugin allows you to extract torrents files in-place after it has been finished downloading</li>
<li style="text-align: justify;">This is useful for Sonarr/Radarr with indexers that mainly deal with archived releases</li>
</ul>
<pre><code class="language-">https://github.com/cvarta/deluge-extractor/releases/download/v.0.4.1/SimpleExtractor-0.4.1-py2.7.egg</code></pre>
<h3 id="bkmrk-yarss2">YaRSS2</h3>
<ul id="bkmrk-this-plugin-allows-y-0">
<li style="text-align: justify;">This plugin allows you to download torrents from RSS feeds of trackers</li>
<li style="text-align: justify;">This also allows you to filter out the releases that you want using regex</li>
</ul>
<pre><code class="language-">https://bitbucket.org/bendikro/deluge-yarss-plugin/downloads/YaRSS2-1.4.3-py2.7.egg</code></pre>
<h3 id="bkmrk-autoremoveplus">AutoRemovePlus</h3>
<ul id="bkmrk-a-configurable-plugi">
<li style="text-align: justify;">A configurable plugin that allows you to remove torrents with your preferences.</li>
<li style="text-align: justify;">For an in-depth guide, you may visit this <a href="https://docs.usbx.me/books/deluge/page/automatically-remove-torrents-using-autoremoveplus">link.</a></li>
</ul>
<h3 id="bkmrk-labelplus">LabelPlus</h3>
<ul id="bkmrk-a-configurable-plugi-0">
<li style="text-align: justify;">A configurable plugin for Delige Thin client that allows you to organize torrents by labels</li>
<li style="text-align: justify;">This is useful if you want to separate public torrents from your privates, with different seeding limits</li>
<li style="text-align: justify;">An in-depth guide is written <a href="https://docs.usbx.me/books/deluge/page/limiting-seeding-ratio-in-deluge#bkmrk-labelplus">in this link.</a></li>
</ul>