In this guide, we'll be showing you how to use YISP's rerouting tool. This tool can help you reroute your connection to the most optimal route. This can help you max out your download speeds from our servers to your PC.

<c><p class="callout info">This tool only changes the route from our servers to your PC (Download). It does not have any control over the route from your PC to our servers (Upload) and is under your ISP's control. Contact your ISP and ask if they have any rerouting tools available.</p></c>

***

* Visit YISP's Rerouting Tool here: [http://lg.yisp.nl/](http://lg.yisp.nl/)

* Under `Network tests`, your IP address is already filled. Make sure that the dropdown is `mtr (10sec)` and click `Run Test`.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1590999973681.png"></p>

* After a few seconds, the Results window shows up. It shows you the traceroute results from our servers to your IP address.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591000372163.png"></p>

* You'll need to look for the following:
  * The `hops`. These are the nodes that the packets pass through to get to your PC. Each line represents a node that the packet has pass through. Ideally, you want it to have the least amount of hops to reach your IP address.
  * `% of packet loss` shows the percentage of packet loss in each hop. Ideally, you'd want this to have a 0% loss in each hop.
  * The `average latency` of each node shows the latency of each hop. You should focus on the last hop, to which is the time it takes (in milliseconds) to reach the packet from our servers to yours. You'd want this to have lower average latency.
  * `StDev` provides the standard deviation of the latencies to each node. This allows you to assess if the average latencies represents the true center of the data set, or has been skewed by some sort of phenomena or measurement error. If the standard deviation is high, the latencies measured were inconsistent. Ideally, you'd want this to be at 0 on each hop.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591001124448.png"></p>

* Now, scroll down to the `Reroute your IP` window. You can see different backbones that YISP provides.
* Select the first option, which is `Intelligent dynamic route (default)*` and click `Submit`. The first option lets YISP picks your most optimized backbone.
* Wait for a minute and run the network test again.

<p align="center"><img src="https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591001656815.png"></p>

* You should see similar (or different) results.
* You can also try different backbones and run network tests after. You need to look for the backbone that has:
  * The least number of hops
  * 0% packet loss on each hop
  * Low average latency
  * 0 StDev

* Regardless of the route chosen, it'll stick for 21 days. After 21 days, YISP will change routes. If you noticed degraded performance and is past 21 days since you did a reroute, you might have to do the rerouting again.