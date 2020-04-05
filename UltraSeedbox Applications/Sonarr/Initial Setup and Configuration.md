<p id="bkmrk-in-this-article%2C-we%27" style="text-align: justify;"><span style="font-weight: 400;">In this guide, we&rsquo;ll be setting up Sonarr for the first time. This guide assumes that that this is your first time installing Sonarr and you'll be storing your media locally, saving to <code>~/media</code>. We'll be doing the following:</span></p>
<ol id="bkmrk-enabling-automatic-o">
<li style="font-weight: 400;"><span style="font-weight: 400;">Enabling automatic organization and adding a root Folder</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Adding indexers</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Connecting your download clients</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Adding your first series</span></li>
</ol>
<hr id="bkmrk-" />
<h2 id="bkmrk-%C2%A0-0" style="text-align: justify;">Initial Setup</h2>
<h3 id="bkmrk-enabling-automatic-o-0">Enabling Automatic Organization and Add Root Folder</h3>
<ul id="bkmrk-access-and-login-to-">
<li>Access and login to your Sonarr instance using the credentials you set during installation</li>
<li>Go to&nbsp;<strong>Settings</strong></li>
</ul>
<p id="bkmrk--0"><img id="bkmrk--32" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419597706.png" /></p>
<ul id="bkmrk-make-sure-that-advan">
<li style="text-align: justify;">Make sure that advanced settings is set to Shown and click Media Management</li>
</ul>
<p id="bkmrk--1"><img id="bkmrk--33" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419650980.png" /></p>
<ul id="bkmrk-under-episode-naming">
<li style="text-align: justify;">Under Episode Naming section check Rename Episodes
<ul>
<li>You can leave the rest of the options as-is. The defaults work well with Plex's naming scheme.</li>
</ul>
</li>
</ul>
<p id="bkmrk--2"><img id="bkmrk--34" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419756894.png" /></p>
<ul id="bkmrk-under-importing-sect">
<li>Under Importing section Make sure that <strong>Use hardlinks instead of copy</strong> is checked,
<ul>
<li>Hardlinks effectively creates a file that points directly to your source file. You can do anything to this file without affecting your source filt and vice versa. This is useful when you're seeding from torrents.
<ul>
<li>This is to prevent to have 2 copies of the same movie without affecting your files.</li>
</ul>
</li>
<li>If your root folder is located on a mount (eg rclone mount), you should set this to No.
<ul>
<li>Hardlinks does not work on mounts. Sonarr will resort to copying, which is prone to errors.</li>
<li>For this, consider using&nbsp;<a href="https://docs.usbx.me/books/rclone/page/rclone-vfs-and-mergerfs-setup">Rclone VFS and MergerFS Setup</a></li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk--3"><img id="bkmrk--35" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581419843155.png" /></p>
<ul id="bkmrk-then-on-root-folders">
<li style="text-align: justify;">Then on Root Folders, select Add Root Folder</li>
</ul>
<p id="bkmrk--4"><img id="bkmrk--36" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420185797.png" /></p>
<ul id="bkmrk-this-will-bring-up-t">
<li style="text-align: justify;">This will bring up the File Browser window.</li>
<li>Select homexx folder where homexx contains the node where your seedbox is in.
<ul>
<li>In the screenshot, the seedbox is on home1</li>
<li>It may vary but always select the homexx folder</li>
</ul>
</li>
</ul>
<p id="bkmrk--5"><img id="bkmrk--37" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420233225.png" /></p>
<ul id="bkmrk-once-opened%2C-select-">
<li style="text-align: justify;">Once opened, select your seedbox (indicated by your seedbox username)</li>
</ul>
<p id="bkmrk--6"><img id="bkmrk--38" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420350002.png" /></p>
<ul id="bkmrk-then-select-the-medi">
<li style="text-align: justify;">Then select the media folder and select TV Shows. Click OK after.
<ul>
<li>This folder is generated upon receiving your seedbox. This is where you'll be saving your media.</li>
</ul>
</li>
</ul>
<p id="bkmrk--7"><img id="bkmrk--39" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581420399482.png" /></p>
<p id="bkmrk-%C2%A0">&nbsp;</p>
<p id="bkmrk--8"><img id="bkmrk--40" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581427179448.png" /></p>
<ul id="bkmrk-once-that%27s-done%2C-cl">
<li style="text-align: justify;">Once that's done, click OK. You'll see the absolute path of the Root folder.&nbsp;</li>
</ul>
<p id="bkmrk--9"><img id="bkmrk--41" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432213121.png" /></p>
<ul id="bkmrk-click-save-changes-t">
<li style="text-align: justify;">Click Save changes to save your changes</li>
</ul>
<p id="bkmrk--10"><img id="bkmrk--42" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432295172.png" /></p>
<h3 id="bkmrk-adding-indexers">Adding indexers</h3>
<ul id="bkmrk-now-click-the-indexe">
<li>Now click the Indexers tab (red box)</li>
<li>Add an indexer by clicking the big plus button (Blue box) and input what is asked on each indexer you wish.
<ul id="bkmrk-depending-on-the-ind">
<li>Depending on the indexer, it'll ask for your account credentials or a passkey. Refer to your indexer/tracker for more information on what to put.</li>
</ul>
</li>
</ul>
<p id="bkmrk--11"><img id="bkmrk--43" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432442828.png" /></p>
<p id="bkmrk--12"><img id="bkmrk--44" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581432490163.png" /></p>
<ul id="bkmrk-once-that%27s-done%2C-cl-0">
<li>Once that's done, click save changes.</li>
</ul>
<h3 id="bkmrk-adding-download-clie" class="">Adding Download Clients</h3>
<ul id="bkmrk-now%2C-click-the-downl">
<li id="bkmrk-now%2C-click-the-downl-0" style="text-align: justify;">Now, click the Download client tab</li>
</ul>
<p id="bkmrk--13"><img id="bkmrk--45" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939206720.png" /></p>
<ul id="bkmrk-to-add-your-preferre">
<li>To add your preferred client, click the big + button then select your preferred client.</li>
</ul>
<p id="bkmrk--14"><img id="bkmrk--46" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939312684.png" /></p>
<p id="bkmrk--15"><img id="bkmrk--47" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1581939369821.png" /></p>
<p id="bkmrk-for-connection-detai" class="callout info">For connection details on each client, you may refer to this guide: <a href="https://docs.usbx.me/books/sonarr/page/download-client-connection-details">Download Client Connection Details</a></p>
<h3 id="bkmrk-adding-your-first-mo" class="">Adding Your First Series</h3>
<ul id="bkmrk-to-add-a-series%2C-cli">
<li id="bkmrk-to-add-a-series%2C-cli-0" style="text-align: justify;">To add a series, click Series</li>
</ul>
<p id="bkmrk--16"><img id="bkmrk--48" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644002305.png" /></p>
<ul id="bkmrk-then-click-add-new-s">
<li style="text-align: justify;">Then click Add New Series</li>
</ul>
<p id="bkmrk--17"><img id="bkmrk--49" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644075866.png" /></p>
<ul id="bkmrk-this-page-will-be-sh">
<li style="text-align: justify;">This page will be shown. Search and select the series that you wish to grab.</li>
</ul>
<p id="bkmrk--18"><img id="bkmrk--50" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644111951.png" /></p>
<p id="bkmrk--19"><img id="bkmrk--51" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644201738.png" /></p>
<ul id="bkmrk-once-selected%2C-you-c">
<li style="text-align: justify;">Once selected, you can change if you want to monitor the series for any new releases, your preferred quality profile, and the series type.</li>
<li style="text-align: justify;">Once that's done, you can click the green button to add it to your Sonarr.
<ul>
<li style="text-align: justify;">If you want to immediately search for the series in your indexers, check Start search for missing episodes.</li>
</ul>
</li>
</ul>
<p id="bkmrk--20"><img id="bkmrk--52" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582644649509.png" /></p>
<p id="bkmrk-%C2%A0-1">&nbsp;</p>
<hr id="bkmrk--21" />
<h2 id="bkmrk-settings-overview">Settings Overview</h2>
<h3 id="bkmrk-media-management">Media Management</h3>
<ul id="bkmrk-here%2C-you-can-set-so">
<li style="text-align: justify;">Here, you can set Sonarr's organization options. The following can be set here:\
<ul>
<li style="text-align: justify;">Episode naming</li>
<li style="text-align: justify;">Folder options</li>
<li style="text-align: justify;">Importing options</li>
<li style="text-align: justify;">File Management</li>
<li style="text-align: justify;">Permissions</li>
<li style="text-align: justify;">Sonarr Root Folders</li>
</ul>
</li>
</ul>
<p id="bkmrk--22"><img id="bkmrk--53" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582811257219.png" /></p>
<h3 id="bkmrk-profiles">Profiles</h3>
<ul id="bkmrk-here%2C-you-can-edit-p">
<li>Here, you can edit profiles for different resolutions.</li>
<li>Each profile you can set which resolution you'd like to grab, the cutoff to which you'll set Sonarr to stop grabbing releases of that episode and any custom formats you've wished to grab.</li>
<li>Here, you can set Language profiles to filter out releases that are in your specified language</li>
<li>You can also set Release profiles and Delay profiles
<ul>
<li>Release profiles&nbsp;
<ul>
<li>By specifying a number of terms, Sonarr will filter out more releases and continue to watch for releases that better match your preferences.</li>
</ul>
</li>
<li>Delay profiles are also helpful if you want to emphasize one protocol (Usenet or Torrent) over the other</li>
</ul>
</li>
</ul>
<p id="bkmrk--23"><img id="bkmrk--54" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-02/scaled-1680-/image-1582811819656.png" /></p>
<h3 id="bkmrk-quality">Quality</h3>
<ul id="bkmrk-here%2C-this-is-where-">
<li style="text-align: justify;">Here, this is where you'll control the size limits of each resolution. Anything that's not within the set limits will be rejected from the releases.</li>
</ul>
<p id="bkmrk--24"><img id="bkmrk--55" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583126914027.png" /></p>
<h3 id="bkmrk-indexers">Indexers</h3>
<ul id="bkmrk-this-is-where-sonarr">
<li>This is where Sonarr will grab releases from. You can set your preferred tracker and/or usenet indexers.</li>
<li>You may also set some options on how frequent you check your torrents, your torrent minimum age and set your restrictions.</li>
</ul>
<p id="bkmrk--25"><img id="bkmrk--56" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127081502.png" /></p>
<h3 id="bkmrk-download-clients">Download Clients</h3>
<ul id="bkmrk-this-is-where-you%27ll">
<li style="text-align: justify;">This is where you'll set your download clients and how Sonarr handles completed and failed downloads.</li>
<li style="text-align: justify;">This is also where you can set your Remote Path Mappings.</li>
</ul>
<p id="bkmrk--26"><img id="bkmrk--57" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127171540.png" /></p>
<h3 id="bkmrk-connect">Connect</h3>
<ul id="bkmrk-here%2C-you-can-set-in">
<li>Here, you can set integrations to other apps which will trigger actions from Sonarr.</li>
<li>Most popular apps that you can integrate with are
<ul>
<li>Plex</li>
<li>Emby/Jellyfin</li>
<li>Execute custom Scripts</li>
<li>Slack notifications</li>
</ul>
</li>
</ul>
<p id="bkmrk--27"><img id="bkmrk--58" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127294239.png" /></p>
<h3 id="bkmrk-metadata">Metadata</h3>
<ul id="bkmrk-this-is-where-you-ca">
<li style="text-align: justify;">This is where you can generate metadata (NFO) files to be used by some applications. It holds information on the media you downloaded such as Show name, Season, Banner/Poster links, Description, etc. which is read and displayed by the application for you.</li>
<li style="text-align: justify;">All of our supported media center apps can generate its own metadata files so there's no real need to enable one of the options although, it'll speed up library rescanning since it won't need to search and match metadata from online sources.</li>
</ul>
<p id="bkmrk--28"><img id="bkmrk--59" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583127333868.png" /></p>
<h3 id="bkmrk-tags">Tags</h3>
<ul id="bkmrk-here%2C-it%27ll-list-you">
<li><span class="ILfuVd"><span class="e24Kjd">Here, it'll list your set tags.</span></span></li>
<li><span class="ILfuVd"><span class="e24Kjd">Tags are used to bind Restrictions and Delay Profiles to specific series,</span></span></li>
</ul>
<p id="bkmrk--29"><img id="bkmrk--60" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583128408428.png" /></p>
<h3 id="bkmrk-general">General</h3>
<ul id="bkmrk-here%2C-you-can-change">
<li>Here, you can change the general settings of Sonarr.</li>
<li>Most are set by USB so you can leave them as-is.</li>
<li>Should there be a need to do so, you can change Log Level.</li>
</ul>
<p id="bkmrk--30"><img id="bkmrk--61" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583128448697.png" /></p>
<h3 id="bkmrk-ui">UI</h3>
<ul id="bkmrk-here%2C-you-can-change-0">
<li style="text-align: justify;">Here, you can change UI settings.</li>
</ul>
<p id="bkmrk--31"><img id="bkmrk--62" class="align-center" src="https://docs.usbx.me/uploads/images/gallery/2020-03/scaled-1680-/image-1583128477118.png" /></p>