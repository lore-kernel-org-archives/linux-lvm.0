MIME-Version: 1.0
From: Sherpa Sherpa <norbuurgen@gmail.com>
Date: Thu, 11 Oct 2018 08:53:07 +0545
Message-ID: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d7ba160577eb49ef"
Subject: [linux-lvm] what is the IOPS behavior when partitions of single
 disk(raid5 backend) are used in an LVM?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: teigland@redhat.com, linux-lvm@redhat.com

--000000000000d7ba160577eb49ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have LVM(backed by hardware RAID5) with logical volume and a volume group
named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2 sdb3 created from
same sdb disk. The system as 42 cores and about 128G memory. Although i
dont see CPU spikes in htop the load average output from uptime is ~43+ as
well as vmstat shows constant iowait of 20-40 where the context switches is
constantly around 80,000-150000 and even more at peak hours, the cpu idle
time is also hovers around 70-85. Below is output of iostat -xp 1 where the
%util is constantly 100%

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           8.91    0.00    1.31   10.98    0.00   78.80

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s
avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
sda               0.00   264.00    0.00   58.00     0.00  1428.00
49.24     0.02    0.28    0.00    0.28   0.21   1.20
sda1              0.00     0.00    0.00    0.00     0.00     0.00
0.00     0.00    0.00    0.00    0.00   0.00   0.00
sda2              0.00     0.00    0.00    0.00     0.00     0.00
0.00     0.00    0.00    0.00    0.00   0.00   0.00
sda3              0.00   264.00    0.00   58.00     0.00  1428.00
49.24     0.02    0.28    0.00    0.28   0.21   1.20
sdb               0.00   316.00    4.00   86.00   512.00  1608.00
47.11    36.02    0.27    5.00    0.05  11.11 100.00
sdb1              0.00   312.00    4.00   63.00   3512.00  4500.00
60.06    34.02    100.00    5.00    0.00  14.93 100.00
sdb2              0.00     0.00    0.00   821.00     450.00    84.00
  8.00     82.00    99.19    0.00    0.19  47.62 100.00
sdb3              0.00     4.00    0.00    2.00     0.00    24.00
24.00     0.00    0.00    0.00    0.00   0.00   0.00
dm-0              0.00     0.00    0.00    6.00     0.00    24.00
8.00     0.00    0.00    0.00    0.00   0.00   0.00
dm-1              0.00     0.00    4.00  396.00   512.00  1584.00
10.48    36.02    8180.00  5.00   8180.00 2.50 100.00
dm-2              0.00     0.00    0.00  329.00     0.00  3896.00
23.68     0.85    2.58    0.00    2.58   0.05   1.60
dm-3              0.00     0.00    0.00    0.00     0.00     0.00
0.00     0.00    0.00    0.00    0.00   0.00   0.00

Similarly the TPS/iops is around 600-1000 most of the time(eg. iostat
outptu below)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          22.24    0.35    2.56   32.08    0.00   42.77

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda             527.00      3828.00      1536.00       3828       1536
sdb             576.00      8532.00      2804.00       8532       2804
sdc              42.00       280.00       156.00        280        156
dm-0              0.00         0.00         0.00          0          0
dm-1            956.00      8400.00      2804.00       8400       2804
dm-2            569.00      4108.00      1692.00       4108       1692
dm-3              0.00         0.00         0.00          0          0

Here is vmstat 1 output

procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu=
-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id =
wa st
 2 22 986520 621704 440356 23588860    0    0  2560  8140 27032 132198
16  2 46 36  0
 7 23 986520 672528 440204 23532752    0    0  2360     8 26659 107002
10  2 48 41  0
22 18 986520 697048 440084 23496096    0    0  3152 22520 60223 187651
25  5 46 25  0
 2 18 986520 688596 439984 23501104    0    0  2436   684 50451 210261
20  5 49 26  0
13 33 986520 663680 439984 23495812    0    0  1712 149956 38549
136294 15  4 45 36  0
 9 34 986520 647308 439968 23507944    0    0  1484  1832 51501 174355
19  4 38 39  0
14 18 986520 608364 439340 23531976   12    0  1828 21344 63692 134934
15  4 48 33  0
11 23 986520 588220 437636 23549852    0    0  2528   192 33461 116199
13  3 50 35  0
 3 17 986520 601892 438080 23542508    0    0  3224 16376 74679 167580
20  5 40 34  0
 1 16 986520 567092 438080 23574776    0    0  2272 76624 40944 136229
16  4 51 29  0
 6 16 986520 584120 438380 23560932    0    0 18568     0 32038 108119
12  3 56 29  0
17 17 986520 568012 438392 23575828    0    0  2572 67248 54320 168767
19  4 51 26  0
 5 23 986520 566384 438124 23575640    0    0  2656   360 60057 158031
18  5 49 28  0
 1 29 986520 632216 438604 23546316    0    0  2520 28528 49198 109391
10  4 50 37  0
19 14 986508 621236 438616 23560516    0    0  2528  9368 39632 169120
19  4 44 32  0
 8 31 986532 653172 440340 23548788   32    0  2460   208 29679 116036
14  4 42 40  0
28 26 986532 675568 440344 23551600    0    0  4552  3928 29385 113816
16  3 39 42  0
10 34 986532 654700 440352 23561616    0    0  2712   816 31667 155532
20  3 40 37  0
15 20 986520 630768 440356 23577388   32    0  4416  4348 35499 175319
30  3 35 32  0

Below is excerpt of lsblk which shows lvm associated to disks

sdb                                8:16   0  19.7T  0 disk
=E2=94=9C=E2=94=80sdb1                             8:17   0   7.7T  0 part
=E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0   9.4=
T  0 lvm  /var/db/st01
=E2=94=9C=E2=94=80sdb2                             8:18   0   1.7T  0 part
=E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0   9.4=
T  0 lvm  /var/db/st01
=E2=94=94=E2=94=80sdb3                             8:19   0  10.3T  0 part
  =E2=94=94=E2=94=80archive--archivedbstore--lv (dm-0)     252:0    0  10.3=
T  0 lvm
/opt/archive/

Queue Depth for sdb

cat /sys/block/sdb/device/queue_depth
1020

I am assuming this is due to disk seek problem as the same disk partitions
are used for same LVM or may be its due to saturation of the disks(i dont
have the vendor provided IOPS data of this disk yet). As initial tuning i
have set vm.dirty_ratio to 5 and dirty_background_ratio to 2 + tried
deadline scheduler (currently noop) but this doesnt seem to help to reduce
the iowait. Any suggestions please ?


Warm Regards
Urgen Sherpa

--000000000000d7ba160577eb49ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font=
-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inher=
it;line-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helveti=
ca,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;cle=
ar:both;color:rgb(36,39,41)">I have LVM(backed by hardware RAID5) with logi=
cal volume and a volume group named &quot;dbstore-lv&quot; and &quot;dbstor=
e-vg&quot; which have sdb1 sdb2 sdb3 created from same sdb disk. The system=
 as 42 cores and about 128G memory. Although i dont see CPU spikes in=C2=A0=
<code style=3D"margin:0px;padding:1px 5px;border:0px;font-style:inherit;fon=
t-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inhe=
rit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Libe=
ration Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mo=
no&quot;,&quot;Courier New&quot;,monospace,sans-serif;font-size:13px;vertic=
al-align:baseline;box-sizing:inherit;background-color:rgb(239,240,241);whit=
e-space:pre-wrap">htop</code>=C2=A0the load average output from=C2=A0<code =
style=3D"margin:0px;padding:1px 5px;border:0px;font-style:inherit;font-vari=
ant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;fo=
nt-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation=
 Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quo=
t;,&quot;Courier New&quot;,monospace,sans-serif;font-size:13px;vertical-ali=
gn:baseline;box-sizing:inherit;background-color:rgb(239,240,241);white-spac=
e:pre-wrap">uptime</code>=C2=A0is ~43+ as well as vmstat shows constant iow=
ait of 20-40 where the=C2=A0<code style=3D"margin:0px;padding:1px 5px;borde=
r:0px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stre=
tch:inherit;line-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Luc=
ida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,=
&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans=
-serif;font-size:13px;vertical-align:baseline;box-sizing:inherit;background=
-color:rgb(239,240,241);white-space:pre-wrap">context switches</code>=C2=A0=
is constantly around 80,000-150000 and even more at peak hours, the cpu idl=
e time is also hovers around 70-85. Below is output of=C2=A0<code style=3D"=
margin:0px;padding:1px 5px;border:0px;font-style:inherit;font-variant:inher=
it;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-family=
:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quo=
t;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;=
Courier New&quot;,monospace,sans-serif;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit;background-color:rgb(239,240,241);white-space:pre-wra=
p">iostat -xp 1</code>=C2=A0where the=C2=A0<code style=3D"margin:0px;paddin=
g:1px 5px;border:0px;font-style:inherit;font-variant:inherit;font-weight:in=
herit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,M=
onaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu S=
ans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;=
,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-sizing:inh=
erit;background-color:rgb(239,240,241);white-space:pre-wrap">%util</code>=
=C2=A0is constantly 100%</p><pre style=3D"margin-top:0px;margin-bottom:1em;=
padding:5px;border:0px;font-variant-numeric:inherit;font-variant-east-asian=
:inherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menl=
o,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaV=
u Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&qu=
ot;,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-sizing:=
inherit;width:auto;max-height:600px;overflow:auto;background-color:rgb(239,=
240,241);color:rgb(36,39,41)"><code style=3D"margin:0px;padding:0px;border:=
0px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretc=
h:inherit;line-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucid=
a Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&q=
uot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-s=
erif;vertical-align:baseline;box-sizing:inherit;white-space:inherit">avg-cp=
u:  %user   %nice %system %iowait  %steal   %idle
           8.91    0.00    1.31   10.98    0.00   78.80

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz =
avgqu-sz   await r_await w_await  svctm  %util
sda               0.00   264.00    0.00   58.00     0.00  1428.00    49.24 =
    0.02    0.28    0.00    0.28   0.21   1.20
sda1              0.00     0.00    0.00    0.00     0.00     0.00     0.00 =
    0.00    0.00    0.00    0.00   0.00   0.00
sda2              0.00     0.00    0.00    0.00     0.00     0.00     0.00 =
    0.00    0.00    0.00    0.00   0.00   0.00
sda3              0.00   264.00    0.00   58.00     0.00  1428.00    49.24 =
    0.02    0.28    0.00    0.28   0.21   1.20
sdb               0.00   316.00    4.00   86.00   512.00  1608.00    47.11 =
   36.02    0.27    5.00    0.05  11.11 100.00
sdb1              0.00   312.00    4.00   63.00   3512.00  4500.00    60.06=
    34.02    100.00    5.00    0.00  14.93 100.00
sdb2              0.00     0.00    0.00   821.00     450.00    84.00     8.=
00     82.00    99.19    0.00    0.19  47.62 100.00
sdb3              0.00     4.00    0.00    2.00     0.00    24.00    24.00 =
    0.00    0.00    0.00    0.00   0.00   0.00
dm-0              0.00     0.00    0.00    6.00     0.00    24.00     8.00 =
    0.00    0.00    0.00    0.00   0.00   0.00
dm-1              0.00     0.00    4.00  396.00   512.00  1584.00    10.48 =
   36.02    8180.00  5.00   8180.00 2.50 100.00
dm-2              0.00     0.00    0.00  329.00     0.00  3896.00    23.68 =
    0.85    2.58    0.00    2.58   0.05   1.60
dm-3              0.00     0.00    0.00    0.00     0.00     0.00     0.00 =
    0.00    0.00    0.00    0.00   0.00   0.00
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,s=
ans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:b=
oth;color:rgb(36,39,41)">Similarly the TPS/iops is around 600-1000 most of =
the time(eg. iostat outptu below)</p><pre style=3D"margin-top:0px;margin-bo=
ttom:1em;padding:5px;border:0px;font-variant-numeric:inherit;font-variant-e=
ast-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:Cons=
olas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&q=
uot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Couri=
er New&quot;,monospace,sans-serif;font-size:13px;vertical-align:baseline;bo=
x-sizing:inherit;width:auto;max-height:600px;overflow:auto;background-color=
:rgb(239,240,241);color:rgb(36,39,41)"><code style=3D"margin:0px;padding:0p=
x;border:0px;font-style:inherit;font-variant:inherit;font-weight:inherit;fo=
nt-stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,Monaco,&q=
uot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono=
&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospa=
ce,sans-serif;vertical-align:baseline;box-sizing:inherit;white-space:inheri=
t">avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          22.24    0.35    2.56   32.08    0.00   42.77

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda             527.00      3828.00      1536.00       3828       1536
sdb             576.00      8532.00      2804.00       8532       2804
sdc              42.00       280.00       156.00        280        156
dm-0              0.00         0.00         0.00          0          0
dm-1            956.00      8400.00      2804.00       8400       2804
dm-2            569.00      4108.00      1692.00       4108       1692
dm-3              0.00         0.00         0.00          0          0
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,s=
ans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:b=
oth;color:rgb(36,39,41)">Here is=C2=A0<code style=3D"margin:0px;padding:1px=
 5px;border:0px;font-style:inherit;font-variant:inherit;font-weight:inherit=
;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,Monaco=
,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans M=
ono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,mono=
space,sans-serif;font-size:13px;vertical-align:baseline;box-sizing:inherit;=
background-color:rgb(239,240,241);white-space:pre-wrap">vmstat 1</code>=C2=
=A0output</p><pre style=3D"margin-top:0px;margin-bottom:1em;padding:5px;bor=
der:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-s=
tretch:inherit;line-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;=
Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quo=
t;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,s=
ans-serif;font-size:13px;vertical-align:baseline;box-sizing:inherit;width:a=
uto;max-height:600px;overflow:auto;background-color:rgb(239,240,241);color:=
rgb(36,39,41)"><code style=3D"margin:0px;padding:0px;border:0px;font-style:=
inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-=
height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;=
,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream V=
era Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif;vertical-a=
lign:baseline;box-sizing:inherit;white-space:inherit">procs -----------memo=
ry---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id =
wa st
 2 22 986520 621704 440356 23588860    0    0  2560  8140 27032 132198 16  =
2 46 36  0
 7 23 986520 672528 440204 23532752    0    0  2360     8 26659 107002 10  =
2 48 41  0
22 18 986520 697048 440084 23496096    0    0  3152 22520 60223 187651 25  =
5 46 25  0
 2 18 986520 688596 439984 23501104    0    0  2436   684 50451 210261 20  =
5 49 26  0
13 33 986520 663680 439984 23495812    0    0  1712 149956 38549 136294 15 =
 4 45 36  0
 9 34 986520 647308 439968 23507944    0    0  1484  1832 51501 174355 19  =
4 38 39  0
14 18 986520 608364 439340 23531976   12    0  1828 21344 63692 134934 15  =
4 48 33  0
11 23 986520 588220 437636 23549852    0    0  2528   192 33461 116199 13  =
3 50 35  0
 3 17 986520 601892 438080 23542508    0    0  3224 16376 74679 167580 20  =
5 40 34  0
 1 16 986520 567092 438080 23574776    0    0  2272 76624 40944 136229 16  =
4 51 29  0
 6 16 986520 584120 438380 23560932    0    0 18568     0 32038 108119 12  =
3 56 29  0
17 17 986520 568012 438392 23575828    0    0  2572 67248 54320 168767 19  =
4 51 26  0
 5 23 986520 566384 438124 23575640    0    0  2656   360 60057 158031 18  =
5 49 28  0
 1 29 986520 632216 438604 23546316    0    0  2520 28528 49198 109391 10  =
4 50 37  0
19 14 986508 621236 438616 23560516    0    0  2528  9368 39632 169120 19  =
4 44 32  0
 8 31 986532 653172 440340 23548788   32    0  2460   208 29679 116036 14  =
4 42 40  0
28 26 986532 675568 440344 23551600    0    0  4552  3928 29385 113816 16  =
3 39 42  0
10 34 986532 654700 440352 23561616    0    0  2712   816 31667 155532 20  =
3 40 37  0
15 20 986520 630768 440356 23577388   32    0  4416  4348 35499 175319 30  =
3 35 32  0
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,s=
ans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:b=
oth;color:rgb(36,39,41)">Below is excerpt of=C2=A0<code style=3D"margin:0px=
;padding:1px 5px;border:0px;font-style:inherit;font-variant:inherit;font-we=
ight:inherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,=
Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;D=
ejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier Ne=
w&quot;,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-siz=
ing:inherit;background-color:rgb(239,240,241);white-space:pre-wrap">lsblk</=
code>=C2=A0which shows lvm associated to disks</p><pre style=3D"margin-top:=
0px;margin-bottom:1em;padding:5px;border:0px;font-variant-numeric:inherit;f=
ont-variant-east-asian:inherit;font-stretch:inherit;line-height:inherit;fon=
t-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation =
Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot=
;,&quot;Courier New&quot;,monospace,sans-serif;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit;width:auto;max-height:600px;overflow:auto;bac=
kground-color:rgb(239,240,241);color:rgb(36,39,41)"><code style=3D"margin:0=
px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weig=
ht:inherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Me=
nlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;Dej=
aVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&=
quot;,monospace,sans-serif;vertical-align:baseline;box-sizing:inherit;white=
-space:inherit">sdb                                8:16   0  19.7T  0 disk
=E2=94=9C=E2=94=80sdb1                             8:17   0   7.7T  0 part
=E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0   9.4=
T  0 lvm  /var/db/st01
=E2=94=9C=E2=94=80sdb2                             8:18   0   1.7T  0 part
=E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0   9.4=
T  0 lvm  /var/db/st01
=E2=94=94=E2=94=80sdb3                             8:19   0  10.3T  0 part
  =E2=94=94=E2=94=80archive--archivedbstore--lv (dm-0)     252:0    0  10.3=
T  0 lvm  /opt/archive/
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,s=
ans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:b=
oth;color:rgb(36,39,41)">Queue Depth for sdb</p><pre style=3D"margin-top:0p=
x;margin-bottom:1em;padding:5px;border:0px;font-variant-numeric:inherit;fon=
t-variant-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-=
family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mo=
no&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,=
&quot;Courier New&quot;,monospace,sans-serif;font-size:13px;vertical-align:=
baseline;box-sizing:inherit;width:auto;max-height:600px;overflow:auto;backg=
round-color:rgb(239,240,241);color:rgb(36,39,41)"><code style=3D"margin:0px=
;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight=
:inherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menl=
o,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaV=
u Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&qu=
ot;,monospace,sans-serif;vertical-align:baseline;box-sizing:inherit;white-s=
pace:inherit">cat /sys/block/sdb/device/queue_depth
1020
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,s=
ans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:b=
oth;color:rgb(36,39,41)">I am assuming this is due to disk seek problem as =
the same disk partitions are used for same LVM or may be its due to saturat=
ion of the disks(i dont have the vendor provided IOPS data of this disk yet=
). As initial tuning i have set vm.dirty_ratio to 5 and dirty_background_ra=
tio to 2 + tried deadline scheduler (currently noop) but this doesnt seem t=
o help to reduce the iowait. Any suggestions please ?</p><p style=3D"margin=
:0px 0px 1em;padding:0px;border:0px;font-variant-numeric:inherit;font-varia=
nt-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:=
Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif;font-size:15px;vertic=
al-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)"><br></=
p><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Warm Regards<br></div>Urgen Sherpa<br></div=
></div></div></div>

--000000000000d7ba160577eb49ef--
