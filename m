Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n18KpYZi015606
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 15:51:34 -0500
Received: from mail-bw0-f160.google.com (mail-bw0-f160.google.com
	[209.85.218.160])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n18KpDd1030899
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2009 15:51:13 -0500
Received: by bwz4 with SMTP id 4so751785bwz.3
	for <linux-lvm@redhat.com>; Sun, 08 Feb 2009 12:51:13 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 8 Feb 2009 21:51:12 +0100
Message-ID: <47d4d3c80902081251o8182d36xcdc3165f9bf44410@mail.gmail.com>
From: "c.j." <chrisi1963@gmail.com>
Content-Type: multipart/alternative; boundary=001636c5a2a51b425504626e6ab8
Subject: [linux-lvm] Restoring LVM after HDD crash
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--001636c5a2a51b425504626e6ab8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi list!

I have troubles restoring my crashed lvm. I tried to add another HDD to my
LV but the disk was broken and now my LV is broken too ;(

How can I resotre my lv?

pvscan shows:

jserver:~# pvscan
  Couldn't find device with uuid 'eGwrO9-pZh4-66vo-cuLr-5cZm-Kk7b-FIcLXN'.
  Couldn't find device with uuid 'wHd06a-T0yf-aqrt-wZZk-z7jW-5gcs-TO2Vp6'.
  Couldn't find device with uuid 'eGwrO9-pZh4-66vo-cuLr-5cZm-Kk7b-FIcLXN'.
  Couldn't find device with uuid 'wHd06a-T0yf-aqrt-wZZk-z7jW-5gcs-TO2Vp6'.
  PV /dev/sde2        VG jserver        lvm2 [931,27 GB / 0    free]
  PV /dev/sdd1        VG jserver        lvm2 [931,51 GB / 0    free]
  PV unknown device   VG jserver        lvm2 [931,51 GB / 0    free]
  PV unknown device   VG jserver        lvm2 [931,51 GB / 0    free]
  PV /dev/sdb         VG jserver_data   lvm2 [931,51 GB / 0    free]
  PV /dev/sdc         VG jserver_data   lvm2 [931,51 GB / 0    free]
  Total: 6 [5,46 TB] / in use: 6 [5,46 TB] / in no VG: 0 [0   ]

lvs -a -o +devices -P shows

server:~# lvs -a -o +devices -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'eGwrO9-pZh4-66vo-cuLr-5cZm-Kk7b-FIcLXN'.
  Couldn't find device with uuid 'wHd06a-T0yf-aqrt-wZZk-z7jW-5gcs-TO2Vp6'.
  Couldn't find device with uuid 'eGwrO9-pZh4-66vo-cuLr-5cZm-Kk7b-FIcLXN'.
  Couldn't find device with uuid 'wHd06a-T0yf-aqrt-wZZk-z7jW-5gcs-TO2Vp6'.
  LV           VG           Attr   LSize Origin Snap%  Move Log Copy%
Convert Devices
  jlan_root    jserver      -wi---
3,64T                                       /dev/sde2(256)
  jlan_root    jserver      -wi---
3,64T                                       /dev/sdd1(0)
  jlan_root    jserver      -wi---
3,64T                                       unknown device(0)
  jlan_root    jserver      -wi---
3,64T                                       unknown device(0)
  jlan_swap    jserver      -wi---
1,00G                                       /dev/sde2(0)
  jserver_home jserver_data -wi-ao
1,82T                                       /dev/sdb(0)
  jserver_home jserver_data -wi-ao
1,82T                                       /dev/sdc(0)
  jserver_root jserver_ka   -wi-d-
1,82T                                       /dev/sde2(0)
  jserver_root jserver_ka   -wi-d-
1,82T                                       /dev/sdd1(0)


jserver is broken VG

my question is: how do i restore jserver?
i've read some howtows like
http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdatarecover.html
but how can I be sure that i use the right uuid for the right disks?

thx in advantage :)

chrisi

--001636c5a2a51b425504626e6ab8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi list!<br><br>I have troubles restoring my crashed lvm. I tried to add an=
other HDD to my LV but the disk was broken and now my LV is broken too ;(<b=
r><br>How can I resotre my lv?<br><br>pvscan shows:<br><br>jserver:~# pvsca=
n <br>
&nbsp; Couldn&#39;t find device with uuid &#39;eGwrO9-pZh4-66vo-cuLr-5cZm-K=
k7b-FIcLXN&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;wHd06a-T=
0yf-aqrt-wZZk-z7jW-5gcs-TO2Vp6&#39;.<br>&nbsp; Couldn&#39;t find device wit=
h uuid &#39;eGwrO9-pZh4-66vo-cuLr-5cZm-Kk7b-FIcLXN&#39;.<br>
&nbsp; Couldn&#39;t find device with uuid &#39;wHd06a-T0yf-aqrt-wZZk-z7jW-5=
gcs-TO2Vp6&#39;.<br>&nbsp; PV /dev/sde2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; VG jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [931,27 GB=
 / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/sdd1&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; VG jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm=
2 [931,51 GB / 0&nbsp;&nbsp;&nbsp; free]<br>
&nbsp; PV unknown device&nbsp;&nbsp; VG jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; lvm2 [931,51 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV unk=
nown device&nbsp;&nbsp; VG jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; lvm2 [931,51 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/sdb&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG jserver_data&nbsp;&nbsp; lvm2 [=
931,51 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/sdc&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG jserver_data&nbsp;&nbsp; lvm2 [931,51 G=
B / 0&nbsp;&nbsp;&nbsp; free]<br>
&nbsp; Total: 6 [5,46 TB] / in use: 6 [5,46 TB] / in no VG: 0 [0&nbsp;&nbsp=
; ]<br><br>lvs -a -o +devices -P shows<br><br>server:~# lvs -a -o +devices =
-P<br>&nbsp; Partial mode. Incomplete volume groups will be activated read-=
only.<br>&nbsp; Couldn&#39;t find device with uuid &#39;eGwrO9-pZh4-66vo-cu=
Lr-5cZm-Kk7b-FIcLXN&#39;.<br>
&nbsp; Couldn&#39;t find device with uuid &#39;wHd06a-T0yf-aqrt-wZZk-z7jW-5=
gcs-TO2Vp6&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;eGwrO9-p=
Zh4-66vo-cuLr-5cZm-Kk7b-FIcLXN&#39;.<br>&nbsp; Couldn&#39;t find device wit=
h uuid &#39;wHd06a-T0yf-aqrt-wZZk-z7jW-5gcs-TO2Vp6&#39;.<br>
&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp; =
LSize Origin Snap%&nbsp; Move Log Copy%&nbsp; Convert Devices&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; jlan_root&nbsp;&nbsp;&n=
bsp; jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi--- 3,64T&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sde2(256)&n=
bsp;&nbsp; <br>&nbsp; jlan_root&nbsp;&nbsp;&nbsp; jserver&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; -wi--- 3,64T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdd1(0)&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp; jlan_root&nbsp;&nbsp;&nbsp; jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -w=
i--- 3,64T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; unknown device(0)<br>&nbsp; jlan_root&nbsp;&nbsp;&nbsp; jserv=
er&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi--- 3,64T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unknown device(0)<br>&nbsp=
; jlan_swap&nbsp;&nbsp;&nbsp; jserver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi--- =
1,00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /dev/sde2(0)&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp; jserver_home jserver_data -wi-ao 1,82T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb(0)&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; <br>&nbsp; jserver_home jserver_data -wi-ao 1,82T&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/s=
dc(0)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; jserver_root jserver_ka&nbsp=
;&nbsp; -wi-d- 1,82T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/sde2(0)&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp; jserver_root jserver_ka&nbsp;&nbsp; -wi-d- 1,82T&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdd1(0)&nbs=
p;&nbsp;&nbsp;&nbsp; <br><br><br>jserver is broken VG<br><br>my question is=
: how do i restore jserver? <br>i&#39;ve read some howtows like <a href=3D"=
http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdatarecov=
er.html">http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/m=
datarecover.html</a><br>
but how can I be sure that i use the right uuid for the right disks?<br><br=
>thx in advantage :)<br><br>chrisi<br><br>

--001636c5a2a51b425504626e6ab8--
