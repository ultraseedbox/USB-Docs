<p id="bkmrk-in-this-guide%2C-we%27ll" style="text-align: justify;">In this guide, we'll be setting up Airsonic for the first time. This assumes that your music library is in <code>~/media/Music</code>. We'll be doing the following steps:</p>
<ol id="bkmrk-setting-an-admin-pas" style="text-align: justify;">
<li>Setting an admin password</li>
<li>Adding music folders</li>
<li>Add a limited user</li>
</ol>
<hr id="bkmrk-" />
<h2 id="bkmrk-initial-setup">Initial Setup</h2>
<h3 id="bkmrk-setting-an-administr">Setting an administrator password</h3>
<ul id="bkmrk-after-installation%2C-">
<li>After installation, click <strong>Connect</strong> under Airsonic</li>
<li>The airsonic login appears. Login first using the default credentials which are the following:</li>
</ul>
<pre><code class="language-">Username: admin
Password: admin</code></pre>
<p id="bkmrk--0"><img id="bkmrk--11" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105392504.png" /></p>
<ul id="bkmrk-once-logged-in%2C-you%E2%80%99">
<li>Once logged in, you&rsquo;ll be greeted with the welcome message. We&rsquo;ll be doing step 1 which is changing the administrator password.</li>
<li>Click <strong>Change administrator password</strong></li>
</ul>
<p id="bkmrk--1"><img id="bkmrk--12" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105526127.png" /></p>
<ul id="bkmrk-you%E2%80%99ll-be-taken-to-t">
<li>You&rsquo;ll be taken to the settings under Users section. Find the&nbsp;<strong>Change password </strong>checkbox.</li>
</ul>
<p id="bkmrk--2"><img id="bkmrk--13" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105660761.png" /></p>
<ul id="bkmrk-tick-it-and-change-i">
<li>Tick it and change it to a your desired password.</li>
</ul>
<p id="bkmrk--3"><img id="bkmrk--14" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105705313.png" /></p>
<ul id="bkmrk-once-that%E2%80%99s-done%2C-cl">
<li>Once that&rsquo;s done, click <strong>Save.</strong></li>
</ul>
<h3 id="bkmrk-setting-media-folder">Setting Media Folders</h3>
<ul id="bkmrk-click%C2%A0home-to-show-t">
<li>Click&nbsp;<strong>Home</strong> to show the welcome message again. Click on step 2, which is&nbsp;<strong>Setup media folders</strong></li>
</ul>
<p id="bkmrk--4"><img id="bkmrk--15" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584105762707.png" /></p>
<ul id="bkmrk-in-this-step%2C-you-ne">
<li>In this step, you need to get the&nbsp;<strong>absolute path</strong> of your media folder. To do that, login to your slot&rsquo;s SSH terminal, navigate to your media folder and print the work directory (<code>pwd</code>) of that folder to get its absolute path
<ul>
<li>Login to your slot&rsquo;s SSH terminal
<ul>
<li>For more information on how to login to your seedbox's SSH terminal, refer to <a title="How to connect to your seedbox via SSH" href="https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh">this guide.</a></li>
</ul>
</li>
<li>Navigate to your media folder.
<ul>
<li>In this example, my Music folder is in <code>~/media</code>
<ul>
<li>To list the directories, do <code>ls</code></li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk--5"><img id="bkmrk--16" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584186717418.png" /></p>
<ul id="bkmrk-navigate-to-the-musi">
<li style="list-style-type: none;">
<ul>
<li style="list-style-type: none;">
<ul>
<li style="list-style-type: none;">
<ul>
<li style="list-style-type: none;">
<ul>
<li>Navigate to the Music folder by typing <code>cd &gt;folder-name-here&lt;</code>. In this case, I'll do <code>cd media</code> and <code>cd Music</code><br />
<ul>
<li>Now, do<code>pwd</code>&nbsp;to show and copy the full path of that folder.</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk--6"><img id="bkmrk--17" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584186813933.png" /></p>
<ul id="bkmrk-on-the-media-folders">
<li style="text-align: justify;">On the Media folders section, replace the&nbsp;<code>/music</code> with the full path of your music folder. In this case, <code>/home1/usbdocs/media/Music</code> is the full path. Scroll down and click save when done.</li>
</ul>
<p id="bkmrk--7"><img id="bkmrk--18" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584187026335.png" /></p>
<ul id="bkmrk-now%2C-click-scan-medi">
<li>Now, Click Scan Media folders now to initialize a full scan of the folder. This will take a while depending on the size of the library.</li>
</ul>
<h4 id="bkmrk-media-folder-structu">Media Folder Structure Recommendations</h4>
<ul id="bkmrk-we-recommend-this-fo">
<li>We recommend this folder structure for Airsonic to properly detect and organize the library.</li>
</ul>
<pre><code class="language-">Music
	Artist 1
    	Album 1 (year)
        	Artist 1 - Album 1 - Track 1.flac
	Artist 2
    	Album 2 (Year)
        Album 3 (Year)</code></pre>
<ul id="bkmrk-you-can-automate-thi">
<li>You can automate this setup by utilizing the following apps
<ul>
<li>MusicBrainz Picard</li>
<li><a title="Lidarr" href="https://docs.usbx.me/books/lidarr">Lidarr</a></li>
</ul>
</li>
</ul>
<h3 id="bkmrk-adding-a-limited-use">Adding a Limited user</h3>
<ul id="bkmrk-accessing-and-playin">
<li>Accessing and playing your library using a limited user is recommended than using your admin account because it prevents any unauthorized and/or accidental changes to your Airsonic instance.</li>
<li>To add a limited user, Go to Settings-&gt; Users</li>
</ul>
<p id="bkmrk--8"><img id="bkmrk--19" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584187458858.png" /></p>
<ul id="bkmrk-under-the-dropdown-m">
<li>Under the dropdown menu, select <code>--New user--</code></li>
<li>Then check the permissions needed.&nbsp;
<ul>
<li>Since this is a limited account, DO NOT tick administrative user</li>
</ul>
</li>
<li>Check all the media folders you want access with</li>
<li>At the end of the page, you need to add a username, email (any fake email is accepted here) and your set password.</li>
<li>Once that&rsquo;s all done, just click save.&nbsp;</li>
</ul>
<p id="bkmrk--9"><img id="bkmrk--20" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1584189737284.png" /></p>