Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F129308BDA1
	for <linux-lvm@redhat.com>; Sun,  7 Oct 2018 03:02:27 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E9C63082A2A
	for <linux-lvm@redhat.com>; Sun,  7 Oct 2018 03:02:26 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id w85so9582275vsa.10
	for <linux-lvm@redhat.com>; Sat, 06 Oct 2018 20:02:26 -0700 (PDT)
MIME-Version: 1.0
From: Sherpa Sherpa <norbuurgen@gmail.com>
Date: Sun, 7 Oct 2018 08:46:48 +0545
Message-ID: <CACkv3pXXmE0Qp4FyU8OqO8cVnUvFD4mrU5nrh=1u42tnm0vD4A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ec385e05779abbcd"
Subject: [linux-lvm] what is the IOPS behavior when partitions of single
 disk are used in an LVM?
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
To: linux-lvm@redhat.com

--000000000000ec385e05779abbcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have an ubuntu 14.04.1 LTS server which have LVM with logical volume and
a volume group named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2
sdb3 created from same sdb disk. The system as 42 cores and about 128G
memory. Although i dont see CPU spikes in htop the load average output from
uptime is ~43+ as well as vmstat shows constant iowait of 20-40 where
the context
switches is constantly around 80,000-150000 and even more at peak hours,
the cpu idle time is also hovers around 70-85. Below is output of iostat
-xp 1 where the %util is constantly 100%

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

I am assuming this is due to disk seek problem as the same disk partitions
are used for same LVM or may be its due to saturation of the disks(i dont
have the vendor provided IOPS data of this disk yet). As initial tuning i
have set vm.dirty_ratio to 5 and dirty_background_ratio to 2 + tried
deadline scheduler (currently noop) but this doesnt seem to help to reduce
the iowait. Any suggestions please ? Is this high IOwait and high load
average(40+) possibly due to multiple PVs(made from same sdb disk partition=
s)
in same volume group +same LV ?
Warm Regards
Sherpa

--000000000000ec385e05779abbcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-post-text" style=3D"margin:0px 0px 5px=
;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asia=
n:inherit;font-stretch:inherit;line-height:1.3;font-family:Arial,&quot;Helv=
etica Neue&quot;,Helvetica,sans-serif;font-size:15px;vertical-align:baselin=
e;box-sizing:inherit;width:666px;color:rgb(36,39,41)"><p style=3D"margin:0p=
x 0px 1em;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fo=
nt-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inhe=
rit;vertical-align:baseline;box-sizing:inherit;clear:both">I have an ubuntu=
 14.04.1 LTS server which have LVM with logical volume and a volume group n=
amed &quot;dbstore-lv&quot; and &quot;dbstore-vg&quot; which have sdb1 sdb2=
 sdb3 created from same sdb disk. The system as 42 cores and about 128G mem=
ory. Although i dont see CPU spikes in=C2=A0<code style=3D"margin:0px;paddi=
ng:1px 5px;border:0px;font-style:inherit;font-variant:inherit;font-weight:i=
nherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,=
Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu =
Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot=
;,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-sizing:in=
herit;background-color:rgb(239,240,241);white-space:pre-wrap">htop</code>=
=C2=A0the load average output from=C2=A0<code style=3D"margin:0px;padding:1=
px 5px;border:0px;font-style:inherit;font-variant:inherit;font-weight:inher=
it;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,Mona=
co,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans=
 Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,mo=
nospace,sans-serif;font-size:13px;vertical-align:baseline;box-sizing:inheri=
t;background-color:rgb(239,240,241);white-space:pre-wrap">uptime</code>=C2=
=A0is ~43+ as well as vmstat shows constant iowait of 20-40 where the=C2=A0=
<code style=3D"margin:0px;padding:1px 5px;border:0px;font-style:inherit;fon=
t-variant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inhe=
rit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Libe=
ration Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mo=
no&quot;,&quot;Courier New&quot;,monospace,sans-serif;font-size:13px;vertic=
al-align:baseline;box-sizing:inherit;background-color:rgb(239,240,241);whit=
e-space:pre-wrap">context switches</code>=C2=A0is constantly around 80,000-=
150000 and even more at peak hours, the cpu idle time is also hovers around=
 70-85. Below is output of=C2=A0<code style=3D"margin:0px;padding:1px 5px;b=
order:0px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-=
stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,Monaco,&quot=
;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&qu=
ot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,=
sans-serif;font-size:13px;vertical-align:baseline;box-sizing:inherit;backgr=
ound-color:rgb(239,240,241);white-space:pre-wrap">iostat -xp 1</code>=C2=A0=
where the=C2=A0<code style=3D"margin:0px;padding:1px 5px;border:0px;font-st=
yle:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&q=
uot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstre=
am Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif;font-s=
ize:13px;vertical-align:baseline;box-sizing:inherit;background-color:rgb(23=
9,240,241);white-space:pre-wrap">%util</code>=C2=A0is constantly 100%</p><p=
re style=3D"margin-top:0px;margin-bottom:1em;padding:5px;border:0px;font-st=
yle:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&q=
uot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstre=
am Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif;font-s=
ize:13px;vertical-align:baseline;box-sizing:inherit;width:auto;max-height:6=
00px;overflow:auto;background-color:rgb(239,240,241)"><code style=3D"margin=
:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-we=
ight:inherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,=
Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;D=
ejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier Ne=
w&quot;,monospace,sans-serif;vertical-align:baseline;box-sizing:inherit;whi=
te-space:inherit">avg-cpu:  %user   %nice %system %iowait  %steal   %idle
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
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;vertical-align:baseline;box-sizing:in=
herit;clear:both">Similarly the TPS/iops is around 600-1000 most of the tim=
e(eg. iostat outptu below)</p><pre style=3D"margin-top:0px;margin-bottom:1e=
m;padding:5px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Men=
lo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;Deja=
Vu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&q=
uot;,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-sizing=
:inherit;width:auto;max-height:600px;overflow:auto;background-color:rgb(239=
,240,241)"><code style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&qu=
ot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera =
Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif;vertical-align=
:baseline;box-sizing:inherit;white-space:inherit">avg-cpu:  %user   %nice %=
system %iowait  %steal   %idle
          22.24    0.35    2.56   32.08    0.00   42.77

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda             527.00      3828.00      1536.00       3828       1536
sdb             576.00      8532.00      2804.00       8532       2804
sdc              42.00       280.00       156.00        280        156
dm-0              0.00         0.00         0.00          0          0
dm-1            956.00      8400.00      2804.00       8400       2804
dm-2            569.00      4108.00      1692.00       4108       1692
dm-3              0.00         0.00         0.00          0          0
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;vertical-align:baseline;box-sizing:in=
herit;clear:both">Below is excerpt of=C2=A0<code style=3D"margin:0px;paddin=
g:1px 5px;border:0px;font-style:inherit;font-variant:inherit;font-weight:in=
herit;font-stretch:inherit;line-height:inherit;font-family:Consolas,Menlo,M=
onaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu S=
ans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;=
,monospace,sans-serif;font-size:13px;vertical-align:baseline;box-sizing:inh=
erit;background-color:rgb(239,240,241);white-space:pre-wrap">lsblk</code>=
=C2=A0which shows lvm associated to disks</p><pre style=3D"margin-top:0px;m=
argin-bottom:1em;padding:5px;border:0px;font-style:inherit;font-variant:inh=
erit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-fami=
ly:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&q=
uot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,&quo=
t;Courier New&quot;,monospace,sans-serif;font-size:13px;vertical-align:base=
line;box-sizing:inherit;width:auto;max-height:600px;overflow:auto;backgroun=
d-color:rgb(239,240,241)"><code style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:Consolas,Menlo,Monaco,&quot;Lucida Co=
nsole&quot;,&quot;Liberation Mono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;=
Bitstream Vera Sans Mono&quot;,&quot;Courier New&quot;,monospace,sans-serif=
;vertical-align:baseline;box-sizing:inherit;white-space:inherit">sdb       =
                         8:16   0  19.7T  0 disk
=E2=94=9C=E2=94=80sdb1                             8:17   0   7.7T  0 part
=E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0   9.4=
T  0 lvm  /var/db/st01
=E2=94=9C=E2=94=80sdb2                             8:18   0   1.7T  0 part
=E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0   9.4=
T  0 lvm  /var/db/st01
=E2=94=94=E2=94=80sdb3                             8:19   0  10.3T  0 part
  =E2=94=94=E2=94=80archive--archivedbstore--lv (dm-0)     252:0    0  10.3=
T  0 lvm  /opt/archive/
</code></pre><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;vertical-align:baseline;box-sizing:in=
herit;clear:both">I am assuming this is due to disk seek problem as the sam=
e disk partitions are used for same LVM or may be its due to saturation of =
the disks(i dont have the vendor provided IOPS data of this disk yet). As i=
nitial tuning i have set vm.dirty_ratio to 5 and dirty_background_ratio to =
2 + tried deadline scheduler (currently noop) but this doesnt seem to help =
to reduce the iowait. Any suggestions please ? Is this high IOwait and high=
 load average(40+) possibly due to multiple PVs(made=C2=A0<span style=3D"fo=
nt-family:inherit;font-style:inherit;font-variant-ligatures:inherit;font-va=
riant-caps:inherit;font-weight:inherit">from same sdb disk=C2=A0</span><spa=
n style=3D"font-family:inherit;font-style:inherit;font-variant-ligatures:in=
herit;font-variant-caps:inherit;font-weight:inherit">partitions) in same vo=
lume group=C2=A0</span><span style=3D"font-family:inherit;font-style:inheri=
t;font-variant-ligatures:inherit;font-variant-caps:inherit;font-weight:inhe=
rit">+same LV ?=C2=A0</span></p></div><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Warm Re=
gards<br></div>Sherpa<br></div></div></div></div>

--000000000000ec385e05779abbcd--
