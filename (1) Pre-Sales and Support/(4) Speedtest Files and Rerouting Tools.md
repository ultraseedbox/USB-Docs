This lists the networks that we use and how to do rerouting on each network

***

## Ultraseedbox Networks and Speedtest Files 

Here, we list the networks we use and the speed test options that you can do. We use multiple networks for our service that blends Tier-1 IP transits and exchanges with the commitment to run the network congestion-free.

### YISP

[YISP Main Website](https://yisp.nl/)

Server: LW9xx

#### Speedtest Files

| Method | Link/Command |
| :--: | :--: |
| Standard HTTP File | http://speedtest.yisp.nl/files/10000mb.bin |
| wget IPV4 | `wget -4 -O /dev/null http://speedtest.yisp.nl/files/10000mb.bin` |
| wget IPV6 | `wget -4 -O /dev/null http://speedtest.yisp.nl/files/10000mb.bin` |
| iperf download | `iperf3 -c speedtest.yisp.nl -P 10 -4 -R` |
| iperf upload | `iperf3 -c speedtest.yisp.nl -P 10 -4` |

### NovoServe

[NovoServe Main Site](https://www.novoserve.com/)

Server: LW8xx

| Method | Link/Command |
| :--: | :--: |
| Standard HTTP File | http://speedtest.novoserve.com/10GB.bin |
| wget IPV4 | `wget -4 -O /dev/null http://speedtest.novoserve.com/10GB.bin` |
| wget IPV6 | `wget -6 -O /dev/null http://speedtest.novoserve.com/10GB.bin` |
| iperf download | `iperf3 -c speedtest.novoserve.com -P 10 -4 -R` |
| iperf upload | `iperf3 -c speedtest.novoserve.com -P 10 -4` |
| Ookla Speedtest | https://novoserve.speedtest.net/ |

***

## Rerouting Tools

::: info
The tools below only changes the route from our servers to your PC (Download). It does not have any control over the route from your PC to our servers (Upload) and is under your ISP's control. Contact your ISP and ask if they have any rerouting tools available.
:::

### Novoserve Rerouting Toool

In this guide, we'll be showing you how to use NovoServe's rerouting tool. This tool can help you reroute your connection to the most optimal route. This can help you max out your download speeds from our servers to your PC.

***

## RerouteIntel

* Visit NovoServe's Rerouting Tool here: [http://lg.novoserve.com/](http://lg.novoserve.com/)
* You should see a command prompt as shown. The prompt shows your IP address.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591003557442.png)

* Type in `reroute -i -y` and press `Enter`

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591002511213.png)

* It'll load to another page. Wait for RetouteIntel to finish. **DO NOT CLOSE THE WINDOW.**

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591003638039.png)

* Once finished, it'll show you the route chosen and how much faster the new route is compared to the worst route. By default, it is set for you to use this route for 10 days. After 10 days and you see any degradation in performance (eg. your transfers from the slot are slow, buffering issues, etc.), you may have to run RerouteIntel again.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591004141500.png)

* You can use the same route again by scrolling down the rerouting tool. You should see the `Rerouting tool` window. The available routes are shown under `Desired transit` and how long will the new route lasts under `Duration`.
* In this case, the desired Transit is Telia AMS (shown in RerouteIntel as `telia1`) and the maximum duration which is 3 weeks (21 days).
* Once that's done, click **Add reroute**. Wait for up to a minute for the rerouting tool to apply your preferred route.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591005137627.png)

### YISP Rerouting Tool

In this guide, we'll be showing you how to use YISP's rerouting tool. This tool can help you reroute your connection to the most optimal route. This can help you max out your download speeds from our servers to your PC.

* Visit YISP's Rerouting Tool here: [http://lg.yisp.nl/](http://lg.yisp.nl/)

* Under `Network tests`, your IP address is already filled. Make sure that the dropdown is `mtr (10sec)` and click `Run Test`.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1590999973681.png)

* After a few seconds, the Results window shows up. It shows you the traceroute results from our servers to your IP address.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591000372163.png)

* You'll need to look for the following:
  * The `hops`. These are the nodes that the packets pass through to get to your PC. Each line represents a node that the packet has pass through. Ideally, you want it to have the least amount of hops to reach your IP address.
  * `% of packet loss` shows the percentage of packet loss in each hop. Ideally, you'd want this to have a 0% loss in each hop.
  * The `average latency` of each node shows the latency of each hop. You should focus on the last hop, to which is the time it takes (in milliseconds) to reach the packet from our servers to yours. You'd want this to have lower average latency.
  * `StDev` provides the standard deviation of the latencies to each node. This allows you to assess if the average latencies represents the true center of the data set, or has been skewed by some sort of phenomena or measurement error. If the standard deviation is high, the latencies measured were inconsistent. Ideally, you'd want this to be at 0 on each hop.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591001124448.png)

* Now, scroll down to the `Reroute your IP` window. You can see different backbones that YISP provides.
* Select the first option, which is `Intelligent dynamic route (default)*` and click `Submit`. The first option lets YISP picks your most optimized backbone.
* Wait for a minute and run the network test again.

![](https://docs.usbx.me/uploads/images/gallery/2020-06/image-1591001656815.png)

* You should see similar (or different) results.
* You can also try different backbones and run network tests after. You need to look for the backbone that has:
  * The least number of hops
  * 0% packet loss on each hop
  * Low average latency
  * 0 StDev

* Regardless of the route chosen, it'll stick for 21 days. After 21 days, YISP will change routes. If you noticed degraded performance and is past 21 days since you did a reroute, you might have to do the rerouting again.