<ul id="bkmrk-open-your-control-pa">
<li>Open your Control Panel and click on the "Access Details" (1) tab. You will find your SSH Access (2) details on this page.
<ul id="bkmrk-if-you-are-unsure-of">
<li>If you are unsure of your username &amp; password, see Box (A)</li>
</ul>
</li>
</ul>
<p id="bkmrk-" class="align-center"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/image2019-6-13_22-37-47%5B1%5D.png" target="_blank" rel="noopener"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/image2019-6-13_22-37-47%5B1%5D.png" alt="image2019-6-13_22-37-47[1].png" /></a></p>
<ul id="bkmrk-you-now-need-to-conn">
<li style="text-align: justify;">You now need to connect via SSH and stop the WebUI before modifying the <code>web.conf</code> file.</li>
<li style="text-align: justify;">Open your SSH Program (such as PuTTY) and connect to your slot.
<ul id="bkmrk-for-more-information">
<li style="text-align: justify;">For more information, visit <a title="How to connect to your seedbox via SSH" href="https://docs.usbx.me/books/secure-shell-%28ssh%29/page/how-to-connect-to-your-seedbox-via-ssh">How to connect to your seedbox via SSH</a> to learn more</li>
</ul>
</li>
<li style="text-align: justify;">Once connected type the following command: <code>app-deluge stop</code></li>
</ul>
<p id="bkmrk--0" class="align-center"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_22h57_19%5B1%5D.png" target="_blank" rel="noopener"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/2019-06-13_22h57_19%5B1%5D.png" alt="2019-06-13_22h57_19[1].png" /></a></p>
<ul id="bkmrk-now-on-the-empty-lin">
<li style="text-align: justify;">Now on the empty line type the following command and press <strong>E</strong><strong>nter</strong></li>
</ul>
<pre><code class="language-align-center">sed -i.bak "/pwd_sha1/d" ~/.config/deluge/web.conf</code></pre>
<ul id="bkmrk-now-on-the-next-empt">
<li>Now on the next empty line type the following command and press <strong>E</strong><strong>nter</strong></li>
</ul>
<pre><code class="language-shell">sed -i.bak "/pwd_salt/d" ~/.config/deluge/web.conf</code></pre>
<p id="bkmrk--1" class="align-center"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_23h03_23%5B1%5D.png" target="_blank" rel="noopener"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/2019-06-13_23h03_23%5B1%5D.png" alt="2019-06-13_23h03_23[1].png" /></a></p>
<ul id="bkmrk-now-start-the-web-ui">
<li style="text-align: justify;">Now start the Web UI and the password will have been reset to the default password, which is "<strong>deluge</strong>" (without quotes).</li>
<li style="text-align: justify;">Start the Web UI by typing this command in the empty line:&nbsp;<code>app-deluge start</code></li>
</ul>
<p id="bkmrk--2" class="align-center"><a href="https://docs.usbx.me/uploads/images/gallery/2019-11/2019-06-13_23h06_06%5B1%5D.png" target="_blank" rel="noopener"><img src="https://docs.usbx.me/uploads/images/gallery/2019-11/scaled-1680-/2019-06-13_23h06_06%5B1%5D.png" alt="2019-06-13_23h06_06[1].png" /></a></p>