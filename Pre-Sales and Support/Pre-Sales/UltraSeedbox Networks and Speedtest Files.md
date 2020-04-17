Here, we list the networks we use and the speed test options that you can do. We use multiple networks for our service that blends Tier-1 IP transits and exchanges with the commitment to run the network congestion-free.

### YISP

[YISP Main Website](https://yisp.nl/)

Server: LW9xx

#### Speedtest

##### Standard HTTP Test File

[http://speedtest.yisp.nl/files/10000mb.bin](http://speedtest.yisp.nl/files/10000mb.bin)

##### wget

```
IPv4: wget -4 -O /dev/null http://speedtest.yisp.nl/files/10000mb.bin

IPv6: wget -4 -O /dev/null http://speedtest.yisp.nl/files/10000mb.bin
```

##### iperf

```
Download: iperf3 -c speedtest.yisp.nl -P 10 -4 -R
Upload: iperf3 -c speedtest.yisp.nl -P 10 -4
```

#### Looking Glass/Reroute Tool

[YISP Looking Glass](http://lg.yisp.nl/)

### NovoServe

[NovoServe Main Site](https://www.novoserve.com/)

Server: LW8xx

#### Speedtest

##### Standard HTTP Test File

[http://speedtest.novoserve.com/10GB.bin](http://speedtest.novoserve.com/10GB.bin)

##### wget

```
IPv4: wget -4 -O /dev/null http://speedtest.novoserve.com/10GB.bin
IPv6: wget -6 -O /dev/null http://speedtest.novoserve.com/10GB.bin
```

#### Looking Glass/Reroute Tool

[NovoServe Looking Glass](http://lg.novoserve.com/)