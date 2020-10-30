Here, we list the networks we use and the speed test options that you can do. We use multiple networks for our service that blends Tier-1 IP transits and exchanges with the commitment to run the network congestion-free.

***

### YISP

[YISP Main Website](https://yisp.nl/)

Server: LW9xx

#### Speedtest Files

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-nrix{text-align:center;vertical-align:middle}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-9wq8">Standard HTTP FIle</th>
    <th class="tg-0pky">http://speedtest.yisp.nl/files/10000mb.bin</th>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2">wget</td>
    <td class="tg-0pky">IPV4: wget -4 -O /dev/null http://speedtest.yisp.nl/files/10000mb.bin<br></td>
  </tr>
  <tr>
    <td class="tg-0pky">IPV6: wget -6 -O /dev/null http://speedtest.yisp.nl/files/10000mb.bin<br></td>
  </tr>
  <tr>
    <td class="tg-nrix" rowspan="2">iperf</td>
    <td class="tg-0lax">Download: iperf3 -c speedtest.yisp.nl -P 10 -4 -R<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">Upload: iperf3 -c speedtest.yisp.nl -P 10 -4<br></td>
  </tr>
</table>

#### Looking Glass/Rerouting Tool

[YISP Looking Glass](http://lg.yisp.nl/)

For instructions on how to use the rerouting tool, click [here.](https://docs.usbx.me/books/rerouting-tools/page/using-yisp-rerouting-tool)

***

### NovoServe

[NovoServe Main Site](https://www.novoserve.com/)

Server: LW8xx

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-9wq8">Standard HTTP FIle</th>
    <th class="tg-0pky">http://speedtest.novoserve.com/10GB.bin<br></th>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2">wget</td>
    <td class="tg-0pky">IPV4: wget -4 -O /dev/null http://speedtest.novoserve.com/10GB.bin<br></td>
  </tr>
  <tr>
    <td class="tg-0pky">IPV6: wget -6 -O /dev/null http://speedtest.novoserve.com/10GB.bin<br></td>
  </tr>
</table>

#### Looking Glass/Rerouting Tool

[NovoServe Looking Glass](http://lg.novoserve.com/)

For instructions on how to use the rerouting tool, click [here.](https://docs.usbx.me/books/rerouting-tools/page/using-novoserve-rerouting-tool)