<p id="bkmrk-in-this-guide%2C-we%E2%80%99ll" style="text-align: justify;">In<span style="font-weight: 400;"> this guide, we&rsquo;ll be setting up Bazarr for the first time. This guide assumes the following:</span></p>
<ul id="bkmrk-you%E2%80%99ll-be-setting-up" style="text-align: justify;">
<li><span style="font-weight: 400;">You&rsquo;ll be setting up your library for the first time and your library is saved locally under <code>~/media</code></span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">You have both Radarr and Sonarr installed and configured</span></li>
</ul>
<p id="bkmrk-we%E2%80%99ll-be-doing-the-f" style="text-align: justify;">We&rsquo;ll be doing the following steps:</p>
<ul id="bkmrk-setting-up-subtitle-">
<li style="text-align: justify;"><span style="font-weight: 400;">Setting up subtitle providers</span></li>
<li style="text-align: justify;">
<p id="bkmrk-connecting-sonarr-an-0">Connecting Sonarr and Radarr</p>
</li>
<li style="text-align: justify;">Setting up username and password</li>
</ul>
<hr id="bkmrk-" />
<h2 id="bkmrk-initial-setup"><span style="font-weight: 400;">Initial Setup</span></h2>
<h3 id="bkmrk-setting-up-subtitle--0"><span style="font-weight: 400;">Setting Up Subtitle Providers</span></h3>
<ul id="bkmrk-upon-installation-an">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Upon successful installation, wait for up to 5 minutes for Bazarr to initialize.</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">After clicking Connect on the UCP, you&rsquo;ll be shown with Bazarr&rsquo;s first time setup guide.</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">You may leave the first page as-is. Click next to save and move on to the next step</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Here, we will set up subtitle providers.</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">On subtitles options section, leave both options as-is</span>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Plex requires that subtitle files should be at the same location as your movie file for it to be detected</span></li>
</ul>
</li>
</ul>
<ul id="bkmrk-here%2C-we-will-set-up"></ul>
<p id="bkmrk--1" style="text-align: justify;"><img id="bkmrk--30" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583144550353.png" /></p>
<ul id="bkmrk-then-enable-the-subt">
<li style="font-weight: 400;"><span style="font-weight: 400;">Then enable the subtitle providers that you wish to use</span>
<ul>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Some providers require you to add your credentials. Be sure to enter it accordingly</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">There are also some providers that needed anti-captcha API key. You can add the API key after the setup has finished under Settings -&gt; Subtitles -&gt; Anti-Captcha Options</span></li>
</ul>
</li>
</ul>
<p id="bkmrk--2"><img id="bkmrk--31" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583144623799.png" /></p>
<ul id="bkmrk-under-subtitle-langu">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Under Subtitle languages, click the drop-down box on enabled languages and select your preferred languages for Bazarr to search</span></li>
</ul>
<p id="bkmrk--3"><img id="bkmrk--32" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583144684332.png" /></p>
<ul id="bkmrk-then-you-can-set-the">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Then you can set the defaults for both Series and Movies</span>
<ul id="bkmrk-here%2C-you-can-set-th">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Here, you can set the default parameters and languages that you wish to search and download.</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">You can leave them as default and set them later or do it now, as shown in the following screenshot</span></li>
</ul>
</li>
</ul>
<p id="bkmrk--4"><span style="font-weight: 400;"><img class="align-center" src="https://pics.smallmilky.club/ShareX/2020/03/firefox_2aAn2QiG5i.png" /></span></p>
<ul id="bkmrk-once-that%E2%80%99s-done%2C-cl">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Once that&rsquo;s done, click Next</span></li>
</ul>
<h3 id="bkmrk-connecting-sonarr-an"><span style="font-weight: 400;">Connecting Sonarr and Radarr to Bazarr</span></h3>
<ul id="bkmrk-here%2C-you%E2%80%99ll-be-conn">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Here, you&rsquo;ll be connecting your Sonarr instance to Bazarr</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Login to your Sonarr instance and go to Settings -&gt; General</span></li>
</ul>
<p id="bkmrk--5"><img id="bkmrk--33" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583146447858.png" /></p>
<ul id="bkmrk-then-under-security%2C">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Then under Security, copy the API key provided</span></li>
</ul>
<p id="bkmrk--6"><img id="bkmrk--34" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583146641628.png" /></p>
<ul id="bkmrk-in-sonarr%2C-enable-us">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">In Sonarr, enable Use Sonarr and input the following</span></li>
</ul>
<pre><code class="language-">Hostname or IP address: username.lwxxx.usbx.me
Listening port: 443
Base URL: /sonarr
SSL enabled: On
API Key: &gt;paste Sonarr API key here&lt;
Download Only Monitored: Enabled (Recommended)</code></pre>
<ul id="bkmrk-once-that%E2%80%99s-done%2C-cl-0">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Once that&rsquo;s done, Click the test button to validate the settings.</span></li>
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">If it shows green text, click next to move on to the next step</span></li>
</ul>
<p id="bkmrk--7"><img id="bkmrk--35" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583146810530.png" /></p>
<ul id="bkmrk-repeat-the-same-step">
<li style="font-weight: 400; text-align: justify;"><span style="font-weight: 400;">Repeat the same steps on Radarr, using the following information</span></li>
</ul>
<pre><code class="language-">Hostname or IP address: username.lwxxx.usbx.me
Listening port: 443
Base URL: /radarr
SSL enabled: On
API Key: &gt;paste Radarr API key here&lt;
Download Only Monitored: Enabled (Recommended)</code></pre>
<ul id="bkmrk-to-get-radarr%27s-api-">
<li style="text-align: justify;">To get Radarr's API key, select Settings -&gt; General and copy the API key Under Security Settings</li>
</ul>
<p id="bkmrk--8"><img id="bkmrk--36" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583147755658.png" /></p>
<p id="bkmrk--9"><img id="bkmrk--37" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583147843356.png" /></p>
<p id="bkmrk--10"><img id="bkmrk--38" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583147908422.png" /></p>
<ul id="bkmrk-click-save-to-save-y">
<li style="text-align: justify;"><span style="font-weight: 400;">Click save to save your changes once testing is passed</span></li>
</ul>
<p id="bkmrk--11"><img id="bkmrk--39" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148067332.png" /></p>
<ul id="bkmrk-then-click-restart-o">
<li style="text-align: justify;"><span style="font-weight: 400;">Then click Restart on the red banner to restart the instance to properly apply the changes</span></li>
</ul>
<p id="bkmrk--12"><img id="bkmrk--40" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148108636.png" /></p>
<ul id="bkmrk-after-1-minute-or-so">
<li><span style="font-weight: 400;">After 1 minute or so, access your bazarr via <code>https://username.lwxxx.usbx.me/bazarr</code></span></li>
</ul>
<h3 id="bkmrk-setting-up-username-"><span style="font-weight: 400;">Setting Up Username and Password</span></h3>
<ul id="bkmrk-click-setting-then-o">
<li style="text-align: justify;"><span style="font-weight: 400;">Click Settings</span></li>
</ul>
<p id="bkmrk--13"><img id="bkmrk--41" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148199535.png" /></p>
<ul id="bkmrk-then-on-general-sett">
<li style="text-align: justify;"><span style="font-weight: 400;">Then on General settings, under Security settings Click on the Authentication dropbox and select either Basic (browser popup) or Forms (Login Page).</span>&nbsp;
<ul>
<li style="text-align: justify;"><span style="font-weight: 400;">We recommend selecting Forms (Login page) since it is non-intrusive and works on password managers</span></li>
</ul>
</li>
</ul>
<p id="bkmrk--14"><img id="bkmrk--42" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148270049.png" /></p>
<p id="bkmrk--15"><img id="bkmrk--43" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148338632.png" /></p>
<ul id="bkmrk-then-input-the-crede">
<li><span style="font-weight: 400;">Then input the credentials that you want</span></li>
</ul>
<p id="bkmrk--16"><img id="bkmrk--44" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148419788.png" /></p>
<ul id="bkmrk-once-that%E2%80%99s-done%2C-cl-1">
<li><span style="font-weight: 400;">Once that&rsquo;s done, click Save and restart the instance when prompted</span></li>
</ul>
<p id="bkmrk--17"><img id="bkmrk--45" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148452418.png" /></p>
<ul id="bkmrk-wait-for-a-few-minut">
<li><span style="font-weight: 400;">Wait for a few minutes. It&rsquo;ll redirect directly to your login page. Login using your set credentials to proceed.</span></li>
</ul>
<p id="bkmrk--18"><img id="bkmrk--46" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148543220.png" /></p>
<h3 id="bkmrk-downloading-subtitle">Downloading Subtitles</h3>
<ul id="bkmrk-at-initial-setup%2C-ba">
<li style="text-align: justify;">At initial setup, Bazarr will add your existing entries on your Sonarr/Radarr instances search for existing subtitles from their root folders. Both series/movie entries are found in Series and Movies respectively.</li>
</ul>
<p id="bkmrk--19"><img id="bkmrk--47" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583148848038.png" /></p>
<ul id="bkmrk-if-there-are-no-entr">
<li>If there are no entries on either of the two, you can force to refresh by going to System -&gt; Tasks (Red Box) and click the Refresh icon on the following tasks in order.
<ul>
<li>Update Series list from Sonarr</li>
<li>Update Movie list from Radarr</li>
<li>Update all Episode Subtitles from disk</li>
<li>Update all Movie Subtitles from disk</li>
</ul>
</li>
<li>Depending on the size of your library, this could take a while.</li>
</ul>
<p id="bkmrk--20"><img id="bkmrk--48" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149148784.png" /></p>
<ul id="bkmrk-then-if-everything-i">
<li>Then if everything is set, you can now download subtitles. You can opt to do the following
<ul>
<li>Let Bazarr download the subtitles by itself. There's an automated task that downloads wanted subtitles daily.</li>
<li>Force Bazarr to download wanted subtitles by going to Wanted and click Download Wanted Subtitles on Series and/or Movies</li>
</ul>
</li>
</ul>
<p id="bkmrk--21"><img id="bkmrk--49" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149680566.png" /></p>
<ul id="bkmrk-go-to-system--%3E-task">
<li>Go to System -&gt; Tasks and click the following
<ul>
<li>Update all Episode Subtitles from disk</li>
<li>Update all Movie Subtitles from disk</li>
</ul>
</li>
</ul>
<p id="bkmrk--22"><img id="bkmrk--50" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149549373.png" /></p>
<ul id="bkmrk-depending-on-your-li">
<li style="text-align: justify;">Depending on your library, this will take a while to search and download your subtitles.</li>
</ul>
<hr id="bkmrk--23" />
<h2 id="bkmrk-settings-overview"><span style="font-weight: 400;">Settings Overview</span></h2>
<h3 id="bkmrk-general"><span style="font-weight: 400;">General</span></h3>
<ul id="bkmrk-here-you-set-bazarr%E2%80%99">
<li style="text-align: justify;"><span style="font-weight: 400;">Here you set Bazarr&rsquo;s general settings. Here you can find the following relevant settings:</span>
<ul>
<li style="text-align: justify;"><span style="font-weight: 400;">Security settings to set your credentials</span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">Your Bazarr API Key</span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">Sonarr and Radarr Integration switches</span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">Path Mappings for both Movies and TV Shows</span>
<ul>
<li style="text-align: justify;"><span style="font-weight: 400;">This is used when your Radarr/Sonarr Instance is on another machine</span></li>
</ul>
</li>
<li><span style="font-weight: 400;">Setting up post-processing commands</span></li>
<li><span style="font-weight: 400;">Analytics for the Developers</span></li>
</ul>
</li>
</ul>
<p id="bkmrk--24"><img id="bkmrk--51" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149820156.png" /></p>
<h3 id="bkmrk-sonarr-and-radarr"><span style="font-weight: 400;">Sonarr and Radarr</span></h3>
<ul id="bkmrk-in-these-pages%2C-you-">
<li style="text-align: justify;"><span style="font-weight: 400;">In these pages, you can enter your Sonarr and Radarr credentials</span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">Here you may opt to enter if you want Bazarr to download only monitored releases</span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">You can also set here the automated task on when you want each to download wanted subtitles</span></li>
</ul>
<p id="bkmrk--25"><img id="bkmrk--52" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149887650.png" /></p>
<p id="bkmrk--26"><img id="bkmrk--53" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149924824.png" /></p>
<h3 id="bkmrk-subtitles"><span style="font-weight: 400;">Subtitles</span></h3>
<ul id="bkmrk-here%2C-you-can-set-wh">
<li style="text-align: justify;"><span style="font-weight: 400;">Here, you can set which providers Bazarr looks for subtitles. </span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">You can set on the minimum rating for subtitles, where Bazarr saves your subtitles, and other options for subtitles</span></li>
<li style="text-align: justify;"><span style="font-weight: 400;">Each subtitle provider requires either your token, your API key or your credentials. Some providers needed an anti-captcha key which you can also put in here.</span></li>
</ul>
<p id="bkmrk--27"><img id="bkmrk--54" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149943608.png" /></p>
<h3 id="bkmrk-notifications"><span style="font-weight: 400;">Notifications</span></h3>
<ul id="bkmrk-here%2C-you-can-set-no">
<li style="text-align: justify;"><span style="font-weight: 400;">Here, you can set notifications if Bazarr grabbed has grabbed any subtitles</span></li>
</ul>
<p id="bkmrk--28"><img id="bkmrk--55" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583149963886.png" /></p>