Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7PGjnEg002764
	for <linux-lvm@redhat.com>; Mon, 25 Aug 2014 12:45:49 -0400
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7PGjgSW023228
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 25 Aug 2014 12:45:43 -0400
Received: by mail-vc0-f179.google.com with SMTP id hq11so15610159vcb.10
	for <linux-lvm@redhat.com>; Mon, 25 Aug 2014 09:45:39 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 25 Aug 2014 12:45:39 -0400
Message-ID: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
From: Elvin Cako <ecako@cogolabs.com>
Content-Type: multipart/mixed; boundary=001a1135f066b8f931050176eae3
Subject: [linux-lvm] Setting up LVM cache causes crash
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
Cc: data <data@cogolabs.com>

--001a1135f066b8f931050176eae3
Content-Type: multipart/alternative; boundary=001a1135f066b8f92d050176eae1

--001a1135f066b8f92d050176eae1
Content-Type: text/plain; charset=UTF-8

Hello,

Kernel:

3.10.0-123.6.3.el7.x86_64 #1 SMP Wed Aug 6 21:12:36 UTC 2014 x86_64 x86_64
x86_64 GNU/Linux

Issue:
In trying to set up the new LVM caching, I've run into some issues. I have
followed the steps in the lvm manual:

       0. Create an origin LV we wish to cache (yours may already exist)

       # lvcreate -L 10G -n lvx vg /dev/slow



       Already Exists



       1. Create a cache data LV

       # lvcreate -L 1G -n lvx_cache vg /dev/fast


       [root@cheeseboy mysql_python]# vgextend dataraid10 /dev/md30
/dev/md31 /dev/md32 /dev/md33 /dev/md34



       [root@cheeseboy mysql_python]# lvcreate -i 5 -I 32 -l 100%FREE -n
dataraid10ssdcache dataraid10

  Logical volume "dataraid10ssdcache" created


       2. Create a cache metadata LV

       # lvcreate -L 8M -n lvx_cache_meta vg /dev/fast


       [root@cheeseboy mysql_python]# vgextend dataraid10 /dev/md35


       [root@cheeseboy mysql_python]# lvcreate -i 1 -I 32 -L 20G -n
dataraid10metadata dataraid10

  Ignoring stripesize argument with single stripe

  Logical volume "dataraid10metadata" created


       3. Create a cache pool LV specifying cache mode "writethrough"

       # lvconvert --type cache-pool --poolmetadata vg/lvx_cache_meta \

            --cachemode writethrough vg/lvx_cache


       [root@cheeseboy mysql_python]# lvconvert --type cache-pool
--poolmetadata dataraid10/dataraid10metadata --cachemode writethrough
dataraid10/dataraid10ssdcache

  Converted dataraid10/dataraid10ssdcache to cache pool.




       4. Create a cache LV by combining the cache pool LV and origin LV

       # lvconvert --type cache --cachepool vg/lvx_cache vg/lvx


       [root@cheeseboy mysql_python]# lvconvert --type cache --cachepool
dataraid10/dataraid10ssdcache dataraid10/dataraid10one

  dataraid10/dataraid10one is now cached.



[root@cheeseboy mysql_python]# vgchange -a y dataraid10  [==> causes crash]

All the above steps seem to run perfectly fine. The issue arises when I try
to activate the volume group after. Every time an activation is attempted
the box crashes. Everything works fine once I revert back to before the
cache was implemented.

Additional info:

*PVSCAN*
Not sure whether related but running pvscan results in the following:

[root@cheeseboy mysql_python]# pvscan

  No device found for PV gjmSco-2SdO-5uwL-lSQD-nwYo-fUE1-REYBQ4.

  No device found for PV OnYrCH-Qfv0-AMdo-7IKv-bd6L-FgMk-bvQALX.

  No device found for PV cpuPLk-GZWG-hcz4-4Byc-jFVH-d2o3-zT1Yn1.

  No device found for PV dzvkpM-CLSx-UdJG-RUP4-aazN-Ew8Y-z5ePLc.

  No device found for PV 0c7AOC-Ulj3-tHKs-XfLz-1Mgc-AzEn-dOFQJx.

  No device found for PV HDPYYO-Us7J-wpfM-718x-D32U-IEXg-J8tDTa.

  No device found for PV h6F3OG-u3Bm-yjwX-rDe3-xfvm-KxtW-bZa0Zv.

  No device found for PV R0rajR-2os4-3z6g-TWur-6NR5-B5SE-4frydn.

  No device found for PV 7aNXGY-uEOp-54Vc-GWZl-yhEn-DGOG-D8IqDe.

  .

  .

  .


lvdisplay does not show logical volumes:



[root@cheeseboy mysql_python]# lvdisplay

  No device found for PV gjmSco-2SdO-5uwL-lSQD-nwYo-fUE1-REYBQ4.

  No device found for PV OnYrCH-Qfv0-AMdo-7IKv-bd6L-FgMk-bvQALX.

  No device found for PV cpuPLk-GZWG-hcz4-4Byc-jFVH-d2o3-zT1Yn1.

  No device found for PV dzvkpM-CLSx-UdJG-RUP4-aazN-Ew8Y-z5ePLc.

  No device found for PV 0c7AOC-Ulj3-tHKs-XfLz-1Mgc-AzEn-dOFQJx.

  No device found for PV HDPYYO-Us7J-wpfM-718x-D32U-IEXg-J8tDTa.

  No device found for PV h6F3OG-u3Bm-yjwX-rDe3-xfvm-KxtW-bZa0Zv.

  No device found for PV R0rajR-2os4-3z6g-TWur-6NR5-B5SE-4frydn.

  No device found for PV 7aNXGY-uEOp-54Vc-GWZl-yhEn-DGOG-D8IqDe.

  No device found for PV 2GmnAa-b54k-P9kx-LS4t-ZVsq-aMt1-3Eaor2.

  No device found for PV xyRCY0-SnWX-HZXw-t6rj-J8lK-bnhc-2WOh0f.

  No device found for PV L2dFmg-3vo3-Qgzp-cke5-WQAA-2jo3-hYGSR1.

  No device found for PV E52f7l-zIdM-xJCH-Bv3i-Bz59-HXrY-r1dKqU.

  No device found for PV s5M4FU-JW1J-24rU-Jrko-LisL-XceJ-ESxZYx.

  No device found for PV 95bymI-HufG-WuPZ-xRfF-XU2v-vgoE-8T1vTZ.

  No device found for PV mflwNJ-PNDc-iUAJ-2g4J-zMM3-bFBM-4rdnhI.

  No device found for PV iiHFY6-fcco-DTZI-z9Qd-3lDu-lp1p-8BRfED.

  No device found for PV 11wo7e-0uyN-PMUY-Ghf2-4lIK-hAOM-A9yjkK.

  No device found for PV F9BOg5-Teoj-JZhM-ceXi-acFe-tjFi-aP9NYb.

  PV WtZGHQ-aa5r-WvSh-1GHN-uxMu-G9Mu-jy67Hs not recognised. Is the device
missing?

  No device found for PV XQHcKW-3vGk-6hSJ-6XQm-U3EO-U2I9-KeQJ2b.

  No device found for PV jdzvH3-dtdp-YAWB-924q-vklQ-ecSz-HEqxls.

  No device found for PV AGvbXF-p5N5-18Wy-VsUa-Nc23-o5Xc-CRFAWW.

  No device found for PV rj4zVq-1NFN-r3Pv-PH2L-mj1j-MAss-0308eY.

  No device found for PV vHThPr-Z2e6-4pHW-2OvI-32f6-IbvZ-Gibrni.

  No device found for PV guPIc9-q8t8-hdCv-33Us-0REQ-iNlG-gkR4yP.

  --- Logical volume ---

  LV Path                /dev/centos_cheeseboy/root

  LV Name                root

  VG Name                centos_cheeseboy

  LV UUID                6WOyCP-nBHy-Uigl-Md0Q-E0hf-ef01-2pnE1S

  LV Write Access        read/write

  LV Creation host, time localhost, 2014-08-14 10:39:43 -0400

  LV Status              available

  # open                 1

  LV Size                100.03 GiB

  Current LE             25607

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto

  - currently set to     256

  Block device           253:0



  --- Logical volume ---

  LV Path                /dev/centos_cheeseboy/swap

  LV Name                swap

  VG Name                centos_cheeseboy

  LV UUID                DAmiIx-El4e-8Ykl-lOY9-74LS-Ovzg-h2Lye4

  LV Write Access        read/write

  LV Creation host, time localhost, 2014-08-14 10:39:44 -0400

  LV Status              available

  # open                 2

  LV Size                11.18 GiB

  Current LE             2862

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto

  - currently set to     256

  Block device           253:1


I am able to get around this by running the "pvscan --cache" command.


[root@cheeseboy mysql_python]# pvscan --cache /dev/md*

[root@cheeseboy mysql_python]# lvdisplay

  --- Logical volume ---

  LV Path                /dev/centos_cheeseboy/root

  LV Name                root

  VG Name                centos_cheeseboy

  LV UUID                6WOyCP-nBHy-Uigl-Md0Q-E0hf-ef01-2pnE1S

  LV Write Access        read/write

  LV Creation host, time localhost, 2014-08-14 10:39:43 -0400

  LV Status              available

  # open                 1

  LV Size                100.03 GiB

  Current LE             25607

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto

  - currently set to     256

  Block device           253:0



  --- Logical volume ---

  LV Path                /dev/centos_cheeseboy/swap

  LV Name                swap

  VG Name                centos_cheeseboy

  LV UUID                DAmiIx-El4e-8Ykl-lOY9-74LS-Ovzg-h2Lye4

  LV Write Access        read/write

  LV Creation host, time localhost, 2014-08-14 10:39:44 -0400

  LV Status              available

  # open                 2

  LV Size                11.18 GiB

  Current LE             2862

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto

  - currently set to     256

  Block device           253:1



  --- Logical volume ---

  LV Path                /dev/dataraid10/dataraid10one

  LV Name                dataraid10one

  VG Name                dataraid10

  LV UUID                wxexCz-Bt86-JT8d-4iFa-esYy-vDqX-LRdfZO

  LV Write Access        read/write

  LV Creation host, time cheeseboy.adverplex.com, 2014-08-18 10:27:10 -0400

  LV Status              NOT available

  LV Size                27.84 TiB

  Current LE             7297020

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto



  --- Logical volume ---

  LV Path                /dev/dataraid10/dataraid10two

  LV Name                dataraid10two

  VG Name                dataraid10

  LV UUID                bRxXOb-44NS-DpvG-kwlt-Pqb4-ikrS-57sIS5

  LV Write Access        read/write

  LV Creation host, time cheeseboy.adverplex.com, 2014-08-18 10:29:05 -0400

  LV Status              NOT available

  LV Size                16.24 TiB

  Current LE             4256595

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto



  --- Logical volume ---

  LV Path                /dev/dataraid10/tmpdir

  LV Name                tmpdir

  VG Name                dataraid10

  LV UUID                xA6k4n-sDfH-Cnuc-SL1e-jrTZ-s1xW-cxzXvt

  LV Write Access        read/write

  LV Creation host, time cheeseboy.adverplex.com, 2014-08-18 10:41:27 -0400

  LV Status              NOT available

  LV Size                405.26 GiB

  Current LE             103747

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto



  --- Logical volume ---

  LV Path                /dev/dataraid10/dataraid10ssdcache

  LV Name                dataraid10ssdcache

  VG Name                dataraid10

  LV UUID                2xhgEd-OLMK-Zwgp-4FgT-5Ncw-msJf-zyLWLa

  LV Write Access        read/write

  LV Creation host, time cheeseboy.adverplex.com, 2014-08-25 11:06:26 -0400

  LV Status              NOT available

  LV Size                3.87 TiB

  Current LE             1013475

  Segments               1

  Allocation             inherit

  Read ahead sectors     auto




I've read that disabling the lv2-lvmetad daemon might yield some results.
This did not change the outcome.


[root@cheeseboy ~]# service lvm2-lvmetad stop

Redirecting to /bin/systemctl stop  lvm2-lvmetad.service

Warning: Stopping lvm2-lvmetad.service, but it can still be activated by:

  lvm2-lvmetad.socket


[root@cheeseboy ~]# systemctl stop lvm2-lvmetad.socket

[root@cheeseboy ~]#



-- 
Elvin

--001a1135f066b8f92d050176eae1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"im" style=3D"font-family:arial,sans-serif;fo=
nt-size:13px"><div>Hello,</div><div><br></div><div>Kernel:</div><div><p sty=
le=3D"margin:0px;font-size:11px;font-family:Menlo">3.10.0-123.6.3.el7.x86_6=
4 #1 SMP Wed Aug 6 21:12:36 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux</p>
</div><div><br></div><div>Issue:</div>In trying to set up the new LVM cachi=
ng, I&#39;ve run into some issues. I have followed the steps in the lvm man=
ual:<div><br></div></div><div style=3D"font-family:arial,sans-serif;font-si=
ze:13px">
<div class=3D"im"><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=
=C2=A0 =C2=A0 =C2=A0 =C2=A00. Create an origin LV we wish to cache (yours m=
ay already exist)</p><p style=3D"margin:0px;font-size:11px;font-family:Menl=
o">=C2=A0=C2=A0 =C2=A0 =C2=A0 # lvcreate -L 10G -n lvx vg /dev/slow</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0</p></div><p style=3D"margin:0px;font-size:11px;font-family:Menlo=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0Already Exists</p><div class=3D"im"><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">
<br></p><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:=
13px"><br></p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=
=A0=C2=A0 =C2=A0 =C2=A0 1. Create a cache data LV</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">
=C2=A0=C2=A0 =C2=A0 =C2=A0 # lvcreate -L 1G -n lvx_cache vg /dev/fast</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo"><br></p></div><p sty=
le=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0[root@cheeseboy mysql_python]# vgextend dataraid10 /dev/md30 /dev/md31 /=
dev/md32 /dev/md33 /dev/md34</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0[root@cheeseboy mysql_python]# lvcreate -i 5 -I 32 -l 100%FREE -n datara=
id10ssdcache dataraid10</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Logical vol=
ume &quot;dataraid10ssdcache&quot; created</p><div class=3D"im"><p style=3D=
"margin:0px;font-size:11px;font-family:Menlo;min-height:13px"><br></p><p st=
yle=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0=C2=A0 =C2=A0 =C2=A0 2. Create a cache metadata LV</p><p style=3D"mar=
gin:0px;font-size:11px;font-family:Menlo">=C2=A0=C2=A0 =C2=A0 =C2=A0 # lvcr=
eate -L 8M -n lvx_cache_meta vg /dev/fast</p><p style=3D"margin:0px;font-si=
ze:11px;font-family:Menlo"><br></p></div>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0[root@cheeseboy mysql_python]# vgextend dataraid10 /dev/md35</p><=
p style=3D"margin:0px;font-size:11px;font-family:Menlo"><br></p><p style=3D=
"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 =C2=A0 =C2=A0 =C2=A0[root@cheeseboy mysql_python]# lvcreate -i 1 -I =
32 -L 20G -n dataraid10metadata dataraid10</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">=C2=A0 Ignoring stripesize argument with single=
 stripe</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 Logical volume &quot;dataraid10metadata&quot; created</p><div class=
=3D"im"><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:=
13px"><br></p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=
=A0=C2=A0 =C2=A0 =C2=A0 3. Create a cache pool LV specifying cache mode &qu=
ot;writethrough&quot;</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0=C2=A0 =C2=
=A0 =C2=A0 # lvconvert --type cache-pool --poolmetadata vg/lvx_cache_meta \=
</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --cachemode writethrough vg/lvx_cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:13px"><b=
r></p></div><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-hei=
ght:13px">=C2=A0 =C2=A0 =C2=A0 =C2=A0[root@cheeseboy mysql_python]# lvconve=
rt --type cache-pool --poolmetadata dataraid10/dataraid10metadata --cachemo=
de writethrough dataraid10/dataraid10ssdcache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:13px">=
=C2=A0 Converted dataraid10/dataraid10ssdcache to cache pool.</p><div class=
=3D"im"><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:=
13px">=C2=A0 =C2=A0 =C2=A0</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:13px"><b=
r></p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0=C2=A0=
 =C2=A0 =C2=A0 4. Create a cache LV by combining the cache pool LV and orig=
in LV</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0=C2=A0 =C2=A0 =C2=A0 # lvconvert --type cache --cachepool vg/lvx_cach=
e vg/lvx</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo"><br></=
p></div><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0[root@cheeseboy mysql_python]# lvconvert --type cache --ca=
chepool dataraid10/dataraid10ssdcache dataraid10/dataraid10one</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 dataraid10/=
dataraid10one is now cached.</p><p style=3D"margin:0px;font-size:11px;font-=
family:Menlo"><br></p><p style=3D"margin:0px;font-size:11px;font-family:Men=
lo"><br>
</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">[root@cheesebo=
y mysql_python]# vgchange -a y dataraid10 =C2=A0[=3D=3D&gt; causes crash]</=
p></div><div class=3D"im" style=3D"font-family:arial,sans-serif;font-size:1=
3px"><div><br>
</div><div>All the above steps seem to run perfectly fine. The issue arises=
 when I try to activate the volume group after. Every time an activation is=
 attempted the box crashes. Everything works fine once I revert back to bef=
ore the cache was implemented.</div>
<div><br></div><div>Additional info:<br></div><div><br></div></div><div sty=
le=3D"font-family:arial,sans-serif;font-size:13px"><b>PVSCAN</b></div><div =
class=3D"im" style=3D"font-family:arial,sans-serif;font-size:13px"><div>Not=
 sure whether related but running pvscan results in the following:</div>
<div><br></div></div><div style=3D"font-family:arial,sans-serif;font-size:1=
3px"><p style=3D"margin:0px;font-size:11px;font-family:Menlo">[root@cheeseb=
oy mysql_python]# pvscan</p><p style=3D"margin:0px;font-size:11px;font-fami=
ly:Menlo">
=C2=A0 No device found for PV gjmSco-2SdO-5uwL-lSQD-nwYo-fUE1-REYBQ4.</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device fou=
nd for PV OnYrCH-Qfv0-AMdo-7IKv-bd6L-FgMk-bvQALX.</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">
=C2=A0 No device found for PV cpuPLk-GZWG-hcz4-4Byc-jFVH-d2o3-zT1Yn1.</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device fou=
nd for PV dzvkpM-CLSx-UdJG-RUP4-aazN-Ew8Y-z5ePLc.</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">
=C2=A0 No device found for PV 0c7AOC-Ulj3-tHKs-XfLz-1Mgc-AzEn-dOFQJx.</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device fou=
nd for PV HDPYYO-Us7J-wpfM-718x-D32U-IEXg-J8tDTa.</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">
=C2=A0 No device found for PV h6F3OG-u3Bm-yjwX-rDe3-xfvm-KxtW-bZa0Zv.</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device fou=
nd for PV R0rajR-2os4-3z6g-TWur-6NR5-B5SE-4frydn.</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">
=C2=A0 No device found for PV 7aNXGY-uEOp-54Vc-GWZl-yhEn-DGOG-D8IqDe.</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 .</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 .</p><p style=3D"ma=
rgin:0px;font-size:11px;font-family:Menlo">
=C2=A0 .</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo"><br></=
p></div><div style=3D"font-family:arial,sans-serif;font-size:13px"><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">lvdisplay does not show lo=
gical volumes:</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo"><br></p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo"><br></p><p style=3D"margin=
:0px;font-size:11px;font-family:Menlo">[root@cheeseboy mysql_python]# lvdis=
play</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV gjmSco-2SdO-5uwL-lSQD-nwYo-fUE1-REYBQ4.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV OnYrCH-Q=
fv0-AMdo-7IKv-bd6L-FgMk-bvQALX.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV cpuPLk-GZWG-hcz4-4Byc-jFVH-d2o3-zT1Yn1.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV dzvkpM-C=
LSx-UdJG-RUP4-aazN-Ew8Y-z5ePLc.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV 0c7AOC-Ulj3-tHKs-XfLz-1Mgc-AzEn-dOFQJx.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV HDPYYO-U=
s7J-wpfM-718x-D32U-IEXg-J8tDTa.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV h6F3OG-u3Bm-yjwX-rDe3-xfvm-KxtW-bZa0Zv.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV R0rajR-2=
os4-3z6g-TWur-6NR5-B5SE-4frydn.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV 7aNXGY-uEOp-54Vc-GWZl-yhEn-DGOG-D8IqDe.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV 2GmnAa-b=
54k-P9kx-LS4t-ZVsq-aMt1-3Eaor2.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV xyRCY0-SnWX-HZXw-t6rj-J8lK-bnhc-2WOh0f.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV L2dFmg-3=
vo3-Qgzp-cke5-WQAA-2jo3-hYGSR1.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV E52f7l-zIdM-xJCH-Bv3i-Bz59-HXrY-r1dKqU.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV s5M4FU-J=
W1J-24rU-Jrko-LisL-XceJ-ESxZYx.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV 95bymI-HufG-WuPZ-xRfF-XU2v-vgoE-8T1vTZ.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV mflwNJ-P=
NDc-iUAJ-2g4J-zMM3-bFBM-4rdnhI.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV iiHFY6-fcco-DTZI-z9Qd-3lDu-lp1p-8BRfED.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV 11wo7e-0=
uyN-PMUY-Ghf2-4lIK-hAOM-A9yjkK.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV F9BOg5-Teoj-JZhM-ceXi-acFe-tjFi-aP9NYb.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 PV WtZGHQ-aa5r-WvSh-1GHN-uxMu-G=
9Mu-jy67Hs not recognised. Is the device missing?</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV XQHcKW-3vGk-6hSJ-6XQm-U3EO-U2I9-KeQJ2b.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV jdzvH3-d=
tdp-YAWB-924q-vklQ-ecSz-HEqxls.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV AGvbXF-p5N5-18Wy-VsUa-Nc23-o5Xc-CRFAWW.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV rj4zVq-1=
NFN-r3Pv-PH2L-mj1j-MAss-0308eY.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 No device f=
ound for PV vHThPr-Z2e6-4pHW-2OvI-32f6-IbvZ-Gibrni.</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 No device found for PV guPIc9-q=
8t8-hdCv-33Us-0REQ-iNlG-gkR4yP.</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 --- Logical=
 volume ---</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=
=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/cen=
tos_cheeseboy/root</p><p style=3D"margin:0px;font-size:11px;font-family:Men=
lo">
=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 VG Name=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 centos_cheeseboy</p=
><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6WOyCP-nBHy-Uigl-Md0Q-=
E0hf-ef01-2pnE1S</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Write Ac=
cess=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">=C2=A0 LV Creation host, time localhost, 2014-0=
8-14 10:39:43 -0400</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo">
=C2=A0 LV Status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 # open =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p style=3D"ma=
rgin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100.03 GiB</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">
=C2=A0 Current LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25607</p><p sty=
le=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Segments =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p style=3D"margin:0px;font-=
size:11px;font-family:Menlo">=C2=A0 Allocation =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;font-size:11px;font-family:=
Menlo">
=C2=A0 Read ahead sectors =C2=A0 =C2=A0 auto</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo">=C2=A0 - currently set to =C2=A0 =C2=A0 256</=
p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Block dev=
ice =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 253:0</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo;min-height:13px">
=C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=
=C2=A0 --- Logical volume ---</p><p style=3D"margin:0px;font-size:11px;font=
-family:Menlo">=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /dev/centos_cheeseboy/swap</p><p style=3D"margin:0px;font-size:1=
1px;font-family:Menlo">
=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 swap<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 VG Name=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 centos_cheeseboy</p=
><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DAmiIx-El4e-8Ykl-lOY9-=
74LS-Ovzg-h2Lye4</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Write Ac=
cess=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">=C2=A0 LV Creation host, time localhost, 2014-0=
8-14 10:39:44 -0400</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo">
=C2=A0 LV Status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 # open =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2</p><p style=3D"ma=
rgin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11.18 GiB</p><p style=3D"margin:0px;=
font-size:11px;font-family:Menlo">
=C2=A0 Current LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2862</p><p styl=
e=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Segments =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p style=3D"margin:0px;font-=
size:11px;font-family:Menlo">=C2=A0 Allocation =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;font-size:11px;font-family:=
Menlo">
=C2=A0 Read ahead sectors =C2=A0 =C2=A0 auto</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo">=C2=A0 - currently set to =C2=A0 =C2=A0 256</=
p><p style=3D"margin:0px;font-size:11px;font-family:Menlo"></p><p style=3D"=
margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 Block device =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 253:1</p><div class=
=3D"im"><p style=3D"margin:0px;font-size:11px;font-family:Menlo"><br></p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo"><span style=3D"font-=
family:arial;font-size:small">I am able to get around this by running the &=
quot;pvscan --cache&quot; command.</span><br>
</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo"><span style=3D=
"font-family:arial;font-size:small"><br></span></p></div><p style=3D"margin=
:0px;font-size:11px;font-family:Menlo">[root@cheeseboy mysql_python]# pvsca=
n --cache /dev/md*</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[root@cheeseboy my=
sql_python]# lvdisplay</p><p style=3D"margin:0px;font-size:11px;font-family=
:Menlo">=C2=A0 --- Logical volume ---</p><p style=3D"margin:0px;font-size:1=
1px;font-family:Menlo">
=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/=
centos_cheeseboy/root</p><p style=3D"margin:0px;font-size:11px;font-family:=
Menlo">=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 root</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0=
 VG Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 centos_chee=
seboy</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6WOyCP-nBHy-Uigl-Md0Q-=
E0hf-ef01-2pnE1S</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo=
">=C2=A0 LV Write Access=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 LV Creation host, time localhost, 2014-08-14 10:39:43 -0400</p><p st=
yle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Status=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available</p><p style=3D"margin:0=
px;font-size:11px;font-family:Menlo">=C2=A0 # open =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100.03 GiB</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Current LE =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25607</p><p style=3D"margin:0px;font-siz=
e:11px;font-family:Menlo">
=C2=A0 Segments =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p st=
yle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Allocation =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;fo=
nt-size:11px;font-family:Menlo">=C2=A0 Read ahead sectors =C2=A0 =C2=A0 aut=
o</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 - currently set to =C2=A0 =C2=A0 256</p><p style=3D"margin:0px;font-=
size:11px;font-family:Menlo">=C2=A0 Block device =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 253:0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo=
;min-height:13px">=C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;fo=
nt-family:Menlo">
=C2=A0 --- Logical volume ---</p><p style=3D"margin:0px;font-size:11px;font=
-family:Menlo">=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /dev/centos_cheeseboy/swap</p><p style=3D"margin:0px;font-size:1=
1px;font-family:Menlo">=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 swap</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 VG Name=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 centos_cheeseboy</p><p=
 style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DAmiIx-El4e-8Ykl-lOY9-74L=
S-Ovzg-h2Lye4</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Write Ac=
cess=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">=C2=A0 LV Creation host, time localhost, 2014-0=
8-14 10:39:44 -0400</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo">
=C2=A0 LV Status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 available<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 # open =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2</p><p style=3D"ma=
rgin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11.18 GiB</p><p style=3D"margin:0px;=
font-size:11px;font-family:Menlo">
=C2=A0 Current LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2862</p><p styl=
e=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Segments =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p style=3D"margin:0px;font-=
size:11px;font-family:Menlo">=C2=A0 Allocation =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;font-size:11px;font-family:=
Menlo">
=C2=A0 Read ahead sectors =C2=A0 =C2=A0 auto</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo">=C2=A0 - currently set to =C2=A0 =C2=A0 256</=
p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Block dev=
ice =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 253:1</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo;min-height:13px">
=C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=
=C2=A0 --- Logical volume ---</p><p style=3D"margin:0px;font-size:11px;font=
-family:Menlo">=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /dev/dataraid10/dataraid10one</p><p style=3D"margin:0px;font-siz=
e:11px;font-family:Menlo">
=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datar=
aid10one</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0=
 VG Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dataraid10<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wxexCz-Bt86-JT8d-4i=
Fa-esYy-vDqX-LRdfZO</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Write Ac=
cess=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">=C2=A0 LV Creation host, time=C2=A0<a href=3D"h=
ttp://cheeseboy.adverplex.com/" target=3D"_blank">cheeseboy.adverplex.com</=
a>, 2014-08-18 10:27:10 -0400</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Status=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NOT available</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 27.84 TiB</p><p style=3D"marg=
in:0px;font-size:11px;font-family:Menlo">
=C2=A0 Current LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7297020</p><p s=
tyle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Segments =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo">=C2=A0 Allocation =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;font-size:11px;font-family=
:Menlo">
=C2=A0 Read ahead sectors =C2=A0 =C2=A0 auto</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo;min-height:13px">=C2=A0 =C2=A0</p><p style=3D"=
margin:0px;font-size:11px;font-family:Menlo">=C2=A0 --- Logical volume ---<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/=
dataraid10/dataraid10two</p><p style=3D"margin:0px;font-size:11px;font-fami=
ly:Menlo">=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dataraid10two</p><p style=3D"margin:0px;font-size:11px;font-family:M=
enlo">=C2=A0 VG Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 dataraid10</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bRxXOb-44NS-DpvG-kwlt-=
Pqb4-ikrS-57sIS5</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo=
">=C2=A0 LV Write Access=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 LV Creation host, time=C2=A0<a href=3D"http://cheeseboy.adverplex.co=
m/" target=3D"_blank">cheeseboy.adverplex.com</a>, 2014-08-18 10:29:05 -040=
0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Sta=
tus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NOT available</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16.24 TiB</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Current LE =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4256595</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">
=C2=A0 Segments =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p st=
yle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Allocation =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;fo=
nt-size:11px;font-family:Menlo">=C2=A0 Read ahead sectors =C2=A0 =C2=A0 aut=
o</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:13p=
x">
=C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=
=C2=A0 --- Logical volume ---</p><p style=3D"margin:0px;font-size:11px;font=
-family:Menlo">=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /dev/dataraid10/tmpdir</p><p style=3D"margin:0px;font-size:11px;=
font-family:Menlo">
=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpdi=
r</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 VG Nam=
e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dataraid10</p><p s=
tyle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xA6k4n-sDfH-Cnuc-SL1e-jrTZ=
-s1xW-cxzXvt</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Write Ac=
cess=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">=C2=A0 LV Creation host, time=C2=A0<a href=3D"h=
ttp://cheeseboy.adverplex.com/" target=3D"_blank">cheeseboy.adverplex.com</=
a>, 2014-08-18 10:41:27 -0400</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Status=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NOT available</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 405.26 GiB</p><p style=3D"mar=
gin:0px;font-size:11px;font-family:Menlo">
=C2=A0 Current LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 103747</p><p st=
yle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Segments =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p style=3D"margin:0px;font-=
size:11px;font-family:Menlo">=C2=A0 Allocation =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;font-size:11px;font-family:=
Menlo">
=C2=A0 Read ahead sectors =C2=A0 =C2=A0 auto</p><p style=3D"margin:0px;font=
-size:11px;font-family:Menlo;min-height:13px">=C2=A0 =C2=A0</p><p style=3D"=
margin:0px;font-size:11px;font-family:Menlo">=C2=A0 --- Logical volume ---<=
/p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 LV Path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/=
dataraid10/dataraid10ssdcache</p><p style=3D"margin:0px;font-size:11px;font=
-family:Menlo">=C2=A0 LV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dataraid10ssdcache</p><p style=3D"margin:0px;font-size:11px;font=
-family:Menlo">=C2=A0 VG Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dataraid10</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV UUID=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2xhgEd-OLMK-Zwgp-4FgT-=
5Ncw-msJf-zyLWLa</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo=
">=C2=A0 LV Write Access=C2=A0 =C2=A0 =C2=A0 =C2=A0 read/write</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">
=C2=A0 LV Creation host, time=C2=A0<a href=3D"http://cheeseboy.adverplex.co=
m/" target=3D"_blank">cheeseboy.adverplex.com</a>, 2014-08-25 11:06:26 -040=
0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Sta=
tus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NOT available</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 LV Size=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.87 TiB</p><p style=
=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Current LE =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1013475</p><p style=3D"margin:0px;font-s=
ize:11px;font-family:Menlo">
=C2=A0 Segments =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</p><p st=
yle=3D"margin:0px;font-size:11px;font-family:Menlo">=C2=A0 Allocation =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inherit</p><p style=3D"margin:0px;fo=
nt-size:11px;font-family:Menlo">=C2=A0 Read ahead sectors =C2=A0 =C2=A0 aut=
o</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo">
</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:13px=
">=C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo"=
><span style=3D"font-family:arial;font-size:small"><br></span></p><p style=
=3D"margin:0px">
I&#39;ve read that=C2=A0disabling the lv2-lvmetad daemon might yield some r=
esults. This did not change the outcome.</p><p style=3D"margin:0px"><br></p=
><p style=3D"margin:0px;font-size:11px;font-family:Menlo">[root@cheeseboy ~=
]# service lvm2-lvmetad stop</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">Redirecting to /bi=
n/systemctl stop=C2=A0 lvm2-lvmetad.service</p><p style=3D"margin:0px;font-=
size:11px;font-family:Menlo">Warning: Stopping lvm2-lvmetad.service, but it=
 can still be activated by:</p>
<p style=3D"margin:0px"></p><p style=3D"margin:0px;font-size:11px;font-fami=
ly:Menlo">=C2=A0 lvm2-lvmetad.socket</p><p style=3D"margin:0px;font-size:11=
px;font-family:Menlo"><br></p><p style=3D"margin:0px;font-size:11px;font-fa=
mily:Menlo">
[root@cheeseboy ~]# systemctl stop lvm2-lvmetad.socket</p><p style=3D"margi=
n:0px;font-size:11px;font-family:Menlo"></p><p style=3D"margin:0px;font-siz=
e:11px;font-family:Menlo">[root@cheeseboy ~]#</p><p style=3D"margin:0px;fon=
t-size:11px;font-family:Menlo">
<br></p></div><div><br></div>-- <br><div dir=3D"ltr">Elvin</div>
</div>

--001a1135f066b8f92d050176eae1--

--001a1135f066b8f931050176eae3
Content-Type: text/plain; charset=US-ASCII; name="backupBefore.txt"
Content-Disposition: attachment; filename="backupBefore.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hza1b0ur0

IyBHZW5lcmF0ZWQgYnkgTFZNMiB2ZXJzaW9uIDIuMDIuMTA1KDIpLVJIRUw3ICgyMDE0LTAzLTI2
KTogTW9uIEF1ZyAyNSAxMjozMjo0OSAyMDE0Cgpjb250ZW50cyA9ICJUZXh0IEZvcm1hdCBWb2x1
bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlvbiA9ICJDcmVhdGVkICphZnRlciogZXhl
Y3V0aW5nICd2Z2NoYW5nZSAtYSB5IGRhdGFyYWlkMTAnIgoKY3JlYXRpb25faG9zdCA9ICJjaGVl
c2Vib3kuYWR2ZXJwbGV4LmNvbSIJIyBMaW51eCBjaGVlc2Vib3kuYWR2ZXJwbGV4LmNvbSAzLjEw
LjAtMTIzLjYuMy5lbDcueDg2XzY0ICMxIFNNUCBXZWQgQXVnIDYgMjE6MTI6MzYgVVRDIDIwMTQg
eDg2XzY0CmNyZWF0aW9uX3RpbWUgPSAxNDA4OTg0MzY5CSMgTW9uIEF1ZyAyNSAxMjozMjo0OSAy
MDE0CgpkYXRhcmFpZDEwIHsKCWlkID0gIkgyWTBRbC0xQ3hOLWlkbVctQkJGQi10S0dpLTFPTVot
bjdPblI3IgoJc2Vxbm8gPSA3Cglmb3JtYXQgPSAibHZtMiIgIyBpbmZvcm1hdGlvbmFsCglzdGF0
dXMgPSBbIlJFU0laRUFCTEUiLCAiUkVBRCIsICJXUklURSJdCglmbGFncyA9IFtdCglleHRlbnRf
c2l6ZSA9IDgxOTIJCSMgNCBNZWdhYnl0ZXMKCW1heF9sdiA9IDAKCW1heF9wdiA9IDAKCW1ldGFk
YXRhX2NvcGllcyA9IDAKCglwaHlzaWNhbF92b2x1bWVzIHsKCgkJcHYwIHsKCQkJaWQgPSAiZ2pt
U2NvLTJTZE8tNXV3TC1sU1FELW53WW8tZlVFMS1SRVlCUTQiCgkJCWRldmljZSA9ICIvZGV2L21k
MTAiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBb
XQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFy
dCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJ
cHYxIHsKCQkJaWQgPSAiT25ZckNILVFmdjAtQU1kby03SUt2LWJkNkwtRmdNay1idlFBTFgiCgkJ
CWRldmljZSA9ICIvZGV2L21kMTEiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRB
QkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRl
cmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2
IFRlcmFieXRlcwoJCX0KCgkJcHYyIHsKCQkJaWQgPSAiY3B1UExrLUdaV0ctaGN6NC00QnljLWpG
VkgtZDJvMy16VDFZbjEiCgkJCWRldmljZSA9ICIvZGV2L21kMTIiCSMgSGludCBvbmx5CgoJCQlz
dGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0
MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQg
PSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHYzIHsKCQkJaWQgPSAiZHp2a3BN
LUNMU3gtVWRKRy1SVVA0LWFhek4tRXc4WS16NWVQTGMiCgkJCWRldmljZSA9ICIvZGV2L21kMTMi
CSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJ
CQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9
IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHY0
IHsKCQkJaWQgPSAiMGM3QU9DLVVsajMtdEhLcy1YZkx6LTFNZ2MtQXpFbi1kT0ZRSngiCgkJCWRl
dmljZSA9ICIvZGV2L21kMTQiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxF
Il0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFi
eXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRl
cmFieXRlcwoJCX0KCgkJcHY1IHsKCQkJaWQgPSAiSERQWVlPLVVzN0otd3BmTS03MTh4LUQzMlUt
SUVYZy1KOHREVGEiCgkJCWRldmljZSA9ICIvZGV2L21kMTUiCSMgSGludCBvbmx5CgoJCQlzdGF0
dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0Mzcw
NTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2
MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHY2IHsKCQkJaWQgPSAiaDZGM09HLXUz
Qm0teWp3WC1yRGUzLXhmdm0tS3h0Vy1iWmEwWnYiCgkJCWRldmljZSA9ICIvZGV2L21kMTYiCSMg
SGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlk
ZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIw
NDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHY3IHsK
CQkJaWQgPSAiUjByYWpSLTJvczQtM3o2Zy1UV3VyLTZOUjUtQjVTRS00ZnJ5ZG4iCgkJCWRldmlj
ZSA9ICIvZGV2L21kMTciCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0K
CQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRl
cwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFi
eXRlcwoJCX0KCgkJcHY4IHsKCQkJaWQgPSAiN2FOWEdZLXVFT3AtNTRWYy1HV1psLXloRW4tREdP
Ry1EOElxRGUiCgkJCWRldmljZSA9ICIvZGV2L21kMTgiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMg
PSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJ
IyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgw
ODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHY5IHsKCQkJaWQgPSAiMkdtbkFhLWI1NGst
UDlreC1MUzR0LVpWc3EtYU10MS0zRWFvcjIiCgkJCWRldmljZSA9ICIvZGV2L21kMTkiCSMgSGlu
dCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZf
c2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgK
CQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHYxMCB7CgkJ
CWlkID0gInh5UkNZMC1TbldYLUhaWHctdDZyai1KOGxLLWJuaGMtMldPaDBmIgoJCQlkZXZpY2Ug
PSAiL2Rldi9tZDIwIgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJ
CWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMK
CQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0
ZXMKCQl9CgoJCXB2MTEgewoJCQlpZCA9ICJMMmRGbWctM3ZvMy1RZ3pwLWNrZTUtV1FBQS0yam8z
LWhZR1NSMSIKCQkJZGV2aWNlID0gIi9kZXYvbWQyMSIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9
IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJCWRldl9zaXplID0gNDk4MTQzNzA1Ngkj
IDIuMzE5NjYgVGVyYWJ5dGVzCgkJCXBlX3N0YXJ0ID0gMjA0OAoJCQlwZV9jb3VudCA9IDYwODA4
NQkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJfQoKCQlwdjEyIHsKCQkJaWQgPSAiRTUyZjdsLXpJZE0t
eEpDSC1CdjNpLUJ6NTktSFhyWS1yMWRLcVUiCgkJCWRldmljZSA9ICIvZGV2L21kMjIiCSMgSGlu
dCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZf
c2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgK
CQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHYxMyB7CgkJ
CWlkID0gInM1TTRGVS1KVzFKLTI0clUtSnJrby1MaXNMLVhjZUotRVN4Wll4IgoJCQlkZXZpY2Ug
PSAiL2Rldi9tZDIzIgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJ
CWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMK
CQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0
ZXMKCQl9CgoJCXB2MTQgewoJCQlpZCA9ICI5NWJ5bUktSHVmRy1XdVBaLXhSZkYtWFUydi12Z29F
LThUMXZUWiIKCQkJZGV2aWNlID0gIi9kZXYvbWQyNCIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9
IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJCWRldl9zaXplID0gNDk4MTQzNzA1Ngkj
IDIuMzE5NjYgVGVyYWJ5dGVzCgkJCXBlX3N0YXJ0ID0gMjA0OAoJCQlwZV9jb3VudCA9IDYwODA4
NQkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJfQoKCQlwdjE1IHsKCQkJaWQgPSAibWZsd05KLVBORGMt
aVVBSi0yZzRKLXpNTTMtYkZCTS00cmRuaEkiCgkJCWRldmljZSA9ICIvZGV2L21kMjUiCSMgSGlu
dCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZf
c2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgK
CQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHYxNiB7CgkJ
CWlkID0gImlpSEZZNi1mY2NvLURUWkktejlRZC0zbER1LWxwMXAtOEJSZkVEIgoJCQlkZXZpY2Ug
PSAiL2Rldi9tZDI2IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJ
CWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMK
CQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0
ZXMKCQl9CgoJCXB2MTcgewoJCQlpZCA9ICIxMXdvN2UtMHV5Ti1QTVVZLUdoZjItNGxJSy1oQU9N
LUE5eWprSyIKCQkJZGV2aWNlID0gIi9kZXYvbWQyNyIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9
IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJCWRldl9zaXplID0gNDk4MTQzNzA1Ngkj
IDIuMzE5NjYgVGVyYWJ5dGVzCgkJCXBlX3N0YXJ0ID0gMjA0OAoJCQlwZV9jb3VudCA9IDYwODA4
NQkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJfQoKCQlwdjE4IHsKCQkJaWQgPSAiRjlCT2c1LVRlb2ot
SlpoTS1jZVhpLWFjRmUtdGpGaS1hUDlOWWIiCgkJCWRldmljZSA9ICIvZGV2L21kMjgiCSMgSGlu
dCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZf
c2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgK
CQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRlcmFieXRlcwoJCX0KCgkJcHYxOSB7CgkJ
CWlkID0gIld0WkdIUS1hYTVyLVd2U2gtMUdITi11eE11LUc5TXUtank2N0hzIgoJCQlkZXZpY2Ug
PSAiL2Rldi9tZDI5IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJ
CWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA4NDk5MDQyNTYJIyA0MDUuMjY2IEdpZ2FieXRlcwoJ
CQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSAxMDM3NDcJIyA0MDUuMjYyIEdpZ2FieXRl
cwoJCX0KCX0KCglsb2dpY2FsX3ZvbHVtZXMgewoKCQlkYXRhcmFpZDEwb25lIHsKCQkJaWQgPSAi
d3hleEN6LUJ0ODYtSlQ4ZC00aUZhLWVzWXktdkRxWC1MUmRmWk8iCgkJCXN0YXR1cyA9IFsiUkVB
RCIsICJXUklURSIsICJWSVNJQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQljcmVhdGlvbl9ob3N0ID0g
ImNoZWVzZWJveS5hZHZlcnBsZXguY29tIgoJCQljcmVhdGlvbl90aW1lID0gMTQwODM3MjAzMAkj
IDIwMTQtMDgtMTggMTA6Mjc6MTAgLTA0MDAKCQkJc2VnbWVudF9jb3VudCA9IDEKCgkJCXNlZ21l
bnQxIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDcyOTcwMjAJIyAy
Ny44MzU5IFRlcmFieXRlcwoKCQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9
IDEyCgkJCQlzdHJpcGVfc2l6ZSA9IDIwNDgJIyAxMDI0IEtpbG9ieXRlcwoKCQkJCXN0cmlwZXMg
PSBbCgkJCQkJInB2MCIsIDAsCgkJCQkJInB2MSIsIDAsCgkJCQkJInB2MiIsIDAsCgkJCQkJInB2
MyIsIDAsCgkJCQkJInB2NCIsIDAsCgkJCQkJInB2NSIsIDAsCgkJCQkJInB2NiIsIDAsCgkJCQkJ
InB2NyIsIDAsCgkJCQkJInB2OCIsIDAsCgkJCQkJInB2OSIsIDAsCgkJCQkJInB2MTAiLCAwLAoJ
CQkJCSJwdjExIiwgMAoJCQkJXQoJCQl9CgkJfQoKCQlkYXRhcmFpZDEwdHdvIHsKCQkJaWQgPSAi
YlJ4WE9iLTQ0TlMtRHB2Ry1rd2x0LVBxYjQtaWtyUy01N3NJUzUiCgkJCXN0YXR1cyA9IFsiUkVB
RCIsICJXUklURSIsICJWSVNJQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQljcmVhdGlvbl9ob3N0ID0g
ImNoZWVzZWJveS5hZHZlcnBsZXguY29tIgoJCQljcmVhdGlvbl90aW1lID0gMTQwODM3MjE0NQkj
IDIwMTQtMDgtMTggMTA6Mjk6MDUgLTA0MDAKCQkJc2VnbWVudF9jb3VudCA9IDEKCgkJCXNlZ21l
bnQxIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDQyNTY1OTUJIyAx
Ni4yMzc2IFRlcmFieXRlcwoKCQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9
IDcKCQkJCXN0cmlwZV9zaXplID0gMjA0OAkjIDEwMjQgS2lsb2J5dGVzCgoJCQkJc3RyaXBlcyA9
IFsKCQkJCQkicHYxMiIsIDAsCgkJCQkJInB2MTMiLCAwLAoJCQkJCSJwdjE0IiwgMCwKCQkJCQki
cHYxNSIsIDAsCgkJCQkJInB2MTYiLCAwLAoJCQkJCSJwdjE3IiwgMCwKCQkJCQkicHYxOCIsIDAK
CQkJCV0KCQkJfQoJCX0KCgkJdG1wZGlyIHsKCQkJaWQgPSAieEE2azRuLXNEZkgtQ251Yy1TTDFl
LWpyVFotczF4Vy1jeHpYdnQiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklURSIsICJWSVNJQkxF
Il0KCQkJZmxhZ3MgPSBbXQoJCQljcmVhdGlvbl9ob3N0ID0gImNoZWVzZWJveS5hZHZlcnBsZXgu
Y29tIgoJCQljcmVhdGlvbl90aW1lID0gMTQwODM3Mjg4NwkjIDIwMTQtMDgtMTggMTA6NDE6Mjcg
LTA0MDAKCQkJc2VnbWVudF9jb3VudCA9IDEKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4dGVu
dCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDEwMzc0NwkjIDQwNS4yNjIgR2lnYWJ5dGVzCgoJCQkJ
dHlwZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlw
ZXMgPSBbCgkJCQkJInB2MTkiLCAwCgkJCQldCgkJCX0KCQl9Cgl9Cn0K
--001a1135f066b8f931050176eae3
Content-Type: text/plain; charset=US-ASCII; name="backupAfter.txt"
Content-Disposition: attachment; filename="backupAfter.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hza1b4241

IyBHZW5lcmF0ZWQgYnkgTFZNMiB2ZXJzaW9uIDIuMDIuMTA1KDIpLVJIRUw3ICgyMDE0LTAzLTI2
KTogTW9uIEF1ZyAyNSAxMjoxNDozMiAyMDE0Cgpjb250ZW50cyA9ICJUZXh0IEZvcm1hdCBWb2x1
bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlvbiA9ICJDcmVhdGVkICphZnRlciogZXhl
Y3V0aW5nICd2Z2Rpc3BsYXknIgoKY3JlYXRpb25faG9zdCA9ICJjaGVlc2Vib3kuYWR2ZXJwbGV4
LmNvbSIJIyBMaW51eCBjaGVlc2Vib3kuYWR2ZXJwbGV4LmNvbSAzLjEwLjAtMTIzLjYuMy5lbDcu
eDg2XzY0ICMxIFNNUCBXZWQgQXVnIDYgMjE6MTI6MzYgVVRDIDIwMTQgeDg2XzY0CmNyZWF0aW9u
X3RpbWUgPSAxNDA4OTgzMjcyCSMgTW9uIEF1ZyAyNSAxMjoxNDozMiAyMDE0CgpkYXRhcmFpZDEw
IHsKCWlkID0gIkgyWTBRbC0xQ3hOLWlkbVctQkJGQi10S0dpLTFPTVotbjdPblI3IgoJc2Vxbm8g
PSAxNAoJZm9ybWF0ID0gImx2bTIiICMgaW5mb3JtYXRpb25hbAoJc3RhdHVzID0gWyJSRVNJWkVB
QkxFIiwgIlJFQUQiLCAiV1JJVEUiXQoJZmxhZ3MgPSBbXQoJZXh0ZW50X3NpemUgPSA4MTkyCQkj
IDQgTWVnYWJ5dGVzCgltYXhfbHYgPSAwCgltYXhfcHYgPSAwCgltZXRhZGF0YV9jb3BpZXMgPSAw
CgoJcGh5c2ljYWxfdm9sdW1lcyB7CgoJCXB2MCB7CgkJCWlkID0gImdqbVNjby0yU2RPLTV1d0wt
bFNRRC1ud1lvLWZVRTEtUkVZQlE0IgoJCQlkZXZpY2UgPSAiL2Rldi9tZDEwIgkjIEhpbnQgb25s
eQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUg
PSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBl
X2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2MSB7CgkJCWlkID0g
Ik9uWXJDSC1RZnYwLUFNZG8tN0lLdi1iZDZMLUZnTWstYnZRQUxYIgoJCQlkZXZpY2UgPSAiL2Rl
di9tZDExIgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdz
ID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVf
c3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9
CgoJCXB2MiB7CgkJCWlkID0gImNwdVBMay1HWldHLWhjejQtNEJ5Yy1qRlZILWQybzMtelQxWW4x
IgoJCQlkZXZpY2UgPSAiL2Rldi9tZDEyIgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExP
Q0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2
NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4z
MTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2MyB7CgkJCWlkID0gImR6dmtwTS1DTFN4LVVkSkctUlVQ
NC1hYXpOLUV3OFktejVlUExjIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDEzIgkjIEhpbnQgb25seQoK
CQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0
OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2Nv
dW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2NCB7CgkJCWlkID0gIjBj
N0FPQy1VbGozLXRIS3MtWGZMei0xTWdjLUF6RW4tZE9GUUp4IgoJCQlkZXZpY2UgPSAiL2Rldi9t
ZDE0IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0g
W10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3Rh
cnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJ
CXB2NSB7CgkJCWlkID0gIkhEUFlZTy1VczdKLXdwZk0tNzE4eC1EMzJVLUlFWGctSjh0RFRhIgoJ
CQlkZXZpY2UgPSAiL2Rldi9tZDE1IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FU
QUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBU
ZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2
NiBUZXJhYnl0ZXMKCQl9CgoJCXB2NiB7CgkJCWlkID0gImg2RjNPRy11M0JtLXlqd1gtckRlMy14
ZnZtLUt4dFctYlphMFp2IgoJCQlkZXZpY2UgPSAiL2Rldi9tZDE2IgkjIEhpbnQgb25seQoKCQkJ
c3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgx
NDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50
ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2NyB7CgkJCWlkID0gIlIwcmFq
Ui0yb3M0LTN6NmctVFd1ci02TlI1LUI1U0UtNGZyeWRuIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDE3
IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10K
CQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQg
PSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2
OCB7CgkJCWlkID0gIjdhTlhHWS11RU9wLTU0VmMtR1dabC15aEVuLURHT0ctRDhJcURlIgoJCQlk
ZXZpY2UgPSAiL2Rldi9tZDE4IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJM
RSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3MDU2CSMgMi4zMTk2NiBUZXJh
Ynl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0gNjA4MDg1CSMgMi4zMTk2NiBU
ZXJhYnl0ZXMKCQl9CgoJCXB2OSB7CgkJCWlkID0gIjJHbW5BYS1iNTRrLVA5a3gtTFM0dC1aVnNx
LWFNdDEtM0Vhb3IyIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDE5IgkjIEhpbnQgb25seQoKCQkJc3Rh
dHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3
MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0g
NjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2MTAgewoJCQlpZCA9ICJ4eVJDWTAt
U25XWC1IWlh3LXQ2cmotSjhsSy1ibmhjLTJXT2gwZiIKCQkJZGV2aWNlID0gIi9kZXYvbWQyMCIJ
IyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJ
CWRldl9zaXplID0gNDk4MTQzNzA1NgkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJCXBlX3N0YXJ0ID0g
MjA0OAoJCQlwZV9jb3VudCA9IDYwODA4NQkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJfQoKCQlwdjEx
IHsKCQkJaWQgPSAiTDJkRm1nLTN2bzMtUWd6cC1ja2U1LVdRQUEtMmpvMy1oWUdTUjEiCgkJCWRl
dmljZSA9ICIvZGV2L21kMjEiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxF
Il0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFi
eXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRl
cmFieXRlcwoJCX0KCgkJcHYxMiB7CgkJCWlkID0gIkU1MmY3bC16SWRNLXhKQ0gtQnYzaS1CejU5
LUhYclktcjFkS3FVIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDIyIgkjIEhpbnQgb25seQoKCQkJc3Rh
dHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3
MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0g
NjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2MTMgewoJCQlpZCA9ICJzNU00RlUt
SlcxSi0yNHJVLUpya28tTGlzTC1YY2VKLUVTeFpZeCIKCQkJZGV2aWNlID0gIi9kZXYvbWQyMyIJ
IyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJ
CWRldl9zaXplID0gNDk4MTQzNzA1NgkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJCXBlX3N0YXJ0ID0g
MjA0OAoJCQlwZV9jb3VudCA9IDYwODA4NQkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJfQoKCQlwdjE0
IHsKCQkJaWQgPSAiOTVieW1JLUh1ZkctV3VQWi14UmZGLVhVMnYtdmdvRS04VDF2VFoiCgkJCWRl
dmljZSA9ICIvZGV2L21kMjQiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxF
Il0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFi
eXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRl
cmFieXRlcwoJCX0KCgkJcHYxNSB7CgkJCWlkID0gIm1mbHdOSi1QTkRjLWlVQUotMmc0Si16TU0z
LWJGQk0tNHJkbmhJIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDI1IgkjIEhpbnQgb25seQoKCQkJc3Rh
dHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3
MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0g
NjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2MTYgewoJCQlpZCA9ICJpaUhGWTYt
ZmNjby1EVFpJLXo5UWQtM2xEdS1scDFwLThCUmZFRCIKCQkJZGV2aWNlID0gIi9kZXYvbWQyNiIJ
IyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJ
CWRldl9zaXplID0gNDk4MTQzNzA1NgkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJCXBlX3N0YXJ0ID0g
MjA0OAoJCQlwZV9jb3VudCA9IDYwODA4NQkjIDIuMzE5NjYgVGVyYWJ5dGVzCgkJfQoKCQlwdjE3
IHsKCQkJaWQgPSAiMTF3bzdlLTB1eU4tUE1VWS1HaGYyLTRsSUstaEFPTS1BOXlqa0siCgkJCWRl
dmljZSA9ICIvZGV2L21kMjciCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxF
Il0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDQ5ODE0MzcwNTYJIyAyLjMxOTY2IFRlcmFi
eXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSA2MDgwODUJIyAyLjMxOTY2IFRl
cmFieXRlcwoJCX0KCgkJcHYxOCB7CgkJCWlkID0gIkY5Qk9nNS1UZW9qLUpaaE0tY2VYaS1hY0Zl
LXRqRmktYVA5TlliIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDI4IgkjIEhpbnQgb25seQoKCQkJc3Rh
dHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJZGV2X3NpemUgPSA0OTgxNDM3
MDU2CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQkJcGVfc3RhcnQgPSAyMDQ4CgkJCXBlX2NvdW50ID0g
NjA4MDg1CSMgMi4zMTk2NiBUZXJhYnl0ZXMKCQl9CgoJCXB2MTkgewoJCQlpZCA9ICJXdFpHSFEt
YWE1ci1XdlNoLTFHSE4tdXhNdS1HOU11LWp5NjdIcyIKCQkJZGV2aWNlID0gIi9kZXYvbWQyOSIJ
IyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQoJCQlmbGFncyA9IFtdCgkJ
CWRldl9zaXplID0gODQ5OTA0MjU2CSMgNDA1LjI2NiBHaWdhYnl0ZXMKCQkJcGVfc3RhcnQgPSAy
MDQ4CgkJCXBlX2NvdW50ID0gMTAzNzQ3CSMgNDA1LjI2MiBHaWdhYnl0ZXMKCQl9CgoJCXB2MjAg
ewoJCQlpZCA9ICJYUUhjS1ctM3ZHay02aFNKLTZYUW0tVTNFTy1VMkk5LUtlUUoyYiIKCQkJZGV2
aWNlID0gIi9kZXYvbWQzMCIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUi
XQoJCQlmbGFncyA9IFtdCgkJCWRldl9zaXplID0gMTY2MDQ4MDEyOAkjIDc5MS43NzkgR2lnYWJ5
dGVzCgkJCXBlX3N0YXJ0ID0gMjA0OAoJCQlwZV9jb3VudCA9IDIwMjY5NQkjIDc5MS43NzcgR2ln
YWJ5dGVzCgkJfQoKCQlwdjIxIHsKCQkJaWQgPSAiamR6dkgzLWR0ZHAtWUFXQi05MjRxLXZrbFEt
ZWNTei1IRXF4bHMiCgkJCWRldmljZSA9ICIvZGV2L21kMzEiCSMgSGludCBvbmx5CgoJCQlzdGF0
dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDE2NjA0ODAx
MjgJIyA3OTEuNzc5IEdpZ2FieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSAy
MDI2OTUJIyA3OTEuNzc3IEdpZ2FieXRlcwoJCX0KCgkJcHYyMiB7CgkJCWlkID0gIkFHdmJYRi1w
NU41LTE4V3ktVnNVYS1OYzIzLW81WGMtQ1JGQVdXIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDMyIgkj
IEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJ
ZGV2X3NpemUgPSAxNjYwNDgwMTI4CSMgNzkxLjc3OSBHaWdhYnl0ZXMKCQkJcGVfc3RhcnQgPSAy
MDQ4CgkJCXBlX2NvdW50ID0gMjAyNjk1CSMgNzkxLjc3NyBHaWdhYnl0ZXMKCQl9CgoJCXB2MjMg
ewoJCQlpZCA9ICJyajR6VnEtMU5GTi1yM1B2LVBIMkwtbWoxai1NQXNzLTAzMDhlWSIKCQkJZGV2
aWNlID0gIi9kZXYvbWQzMyIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUi
XQoJCQlmbGFncyA9IFtdCgkJCWRldl9zaXplID0gMTY2MDQ4MDEyOAkjIDc5MS43NzkgR2lnYWJ5
dGVzCgkJCXBlX3N0YXJ0ID0gMjA0OAoJCQlwZV9jb3VudCA9IDIwMjY5NQkjIDc5MS43NzcgR2ln
YWJ5dGVzCgkJfQoKCQlwdjI0IHsKCQkJaWQgPSAidkhUaFByLVoyZTYtNHBIVy0yT3ZJLTMyZjYt
SWJ2Wi1HaWJybmkiCgkJCWRldmljZSA9ICIvZGV2L21kMzQiCSMgSGludCBvbmx5CgoJCQlzdGF0
dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJZmxhZ3MgPSBbXQoJCQlkZXZfc2l6ZSA9IDE2NjA0ODAx
MjgJIyA3OTEuNzc5IEdpZ2FieXRlcwoJCQlwZV9zdGFydCA9IDIwNDgKCQkJcGVfY291bnQgPSAy
MDI2OTUJIyA3OTEuNzc3IEdpZ2FieXRlcwoJCX0KCgkJcHYyNSB7CgkJCWlkID0gImd1UEljOS1x
OHQ4LWhkQ3YtMzNVcy0wUkVRLWlObEctZ2tSNHlQIgoJCQlkZXZpY2UgPSAiL2Rldi9tZDM1Igkj
IEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCWZsYWdzID0gW10KCQkJ
ZGV2X3NpemUgPSAxOTkyNTg4ODAJIyA5NS4wMTQgR2lnYWJ5dGVzCgkJCXBlX3N0YXJ0ID0gMjA0
OAoJCQlwZV9jb3VudCA9IDI0MzIzCSMgOTUuMDExNyBHaWdhYnl0ZXMKCQl9Cgl9CgoJbG9naWNh
bF92b2x1bWVzIHsKCgkJZGF0YXJhaWQxMG9uZSB7CgkJCWlkID0gInd4ZXhDei1CdDg2LUpUOGQt
NGlGYS1lc1l5LXZEcVgtTFJkZlpPIgoJCQlzdGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUiLCAiVklT
SUJMRSJdCgkJCWZsYWdzID0gW10KCQkJY3JlYXRpb25faG9zdCA9ICJjaGVlc2Vib3kuYWR2ZXJw
bGV4LmNvbSIKCQkJY3JlYXRpb25fdGltZSA9IDE0MDgzNzIwMzAJIyAyMDE0LTA4LTE4IDEwOjI3
OjEwIC0wNDAwCgkJCXNlZ21lbnRfY291bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlzdGFydF9l
eHRlbnQgPSAwCgkJCQlleHRlbnRfY291bnQgPSA3Mjk3MDIwCSMgMjcuODM1OSBUZXJhYnl0ZXMK
CgkJCQl0eXBlID0gImNhY2hlIgoJCQkJY2FjaGVfcG9vbCA9ICJkYXRhcmFpZDEwc3NkY2FjaGUi
CgkJCQlvcmlnaW4gPSAiZGF0YXJhaWQxMG9uZV9jb3JpZyIKCQkJfQoJCX0KCgkJZGF0YXJhaWQx
MHR3byB7CgkJCWlkID0gImJSeFhPYi00NE5TLURwdkcta3dsdC1QcWI0LWlrclMtNTdzSVM1IgoJ
CQlzdGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUiLCAiVklTSUJMRSJdCgkJCWZsYWdzID0gW10KCQkJ
Y3JlYXRpb25faG9zdCA9ICJjaGVlc2Vib3kuYWR2ZXJwbGV4LmNvbSIKCQkJY3JlYXRpb25fdGlt
ZSA9IDE0MDgzNzIxNDUJIyAyMDE0LTA4LTE4IDEwOjI5OjA1IC0wNDAwCgkJCXNlZ21lbnRfY291
bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlzdGFydF9leHRlbnQgPSAwCgkJCQlleHRlbnRfY291
bnQgPSA0MjU2NTk1CSMgMTYuMjM3NiBUZXJhYnl0ZXMKCgkJCQl0eXBlID0gInN0cmlwZWQiCgkJ
CQlzdHJpcGVfY291bnQgPSA3CgkJCQlzdHJpcGVfc2l6ZSA9IDIwNDgJIyAxMDI0IEtpbG9ieXRl
cwoKCQkJCXN0cmlwZXMgPSBbCgkJCQkJInB2MTIiLCAwLAoJCQkJCSJwdjEzIiwgMCwKCQkJCQki
cHYxNCIsIDAsCgkJCQkJInB2MTUiLCAwLAoJCQkJCSJwdjE2IiwgMCwKCQkJCQkicHYxNyIsIDAs
CgkJCQkJInB2MTgiLCAwCgkJCQldCgkJCX0KCQl9CgoJCXRtcGRpciB7CgkJCWlkID0gInhBNms0
bi1zRGZILUNudWMtU0wxZS1qclRaLXMxeFctY3h6WHZ0IgoJCQlzdGF0dXMgPSBbIlJFQUQiLCAi
V1JJVEUiLCAiVklTSUJMRSJdCgkJCWZsYWdzID0gW10KCQkJY3JlYXRpb25faG9zdCA9ICJjaGVl
c2Vib3kuYWR2ZXJwbGV4LmNvbSIKCQkJY3JlYXRpb25fdGltZSA9IDE0MDgzNzI4ODcJIyAyMDE0
LTA4LTE4IDEwOjQxOjI3IC0wNDAwCgkJCXNlZ21lbnRfY291bnQgPSAxCgoJCQlzZWdtZW50MSB7
CgkJCQlzdGFydF9leHRlbnQgPSAwCgkJCQlleHRlbnRfY291bnQgPSAxMDM3NDcJIyA0MDUuMjYy
IEdpZ2FieXRlcwoKCQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBs
aW5lYXIKCgkJCQlzdHJpcGVzID0gWwoJCQkJCSJwdjE5IiwgMAoJCQkJXQoJCQl9CgkJfQoKCQlk
YXRhcmFpZDEwc3NkY2FjaGUgewoJCQlpZCA9ICIyeGhnRWQtT0xNSy1ad2dwLTRGZ1QtNU5jdy1t
c0pmLXp5TFdMYSIKCQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJCQlm
bGFncyA9IFtdCgkJCWNyZWF0aW9uX2hvc3QgPSAiY2hlZXNlYm95LmFkdmVycGxleC5jb20iCgkJ
CWNyZWF0aW9uX3RpbWUgPSAxNDA4OTc5MTg2CSMgMjAxNC0wOC0yNSAxMTowNjoyNiAtMDQwMAoJ
CQlzZWdtZW50X2NvdW50ID0gMQoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJ
CQkJZXh0ZW50X2NvdW50ID0gMTAxMzQ3NQkjIDMuODY2MSBUZXJhYnl0ZXMKCgkJCQl0eXBlID0g
ImNhY2hlLXBvb2wiCgkJCQlkYXRhID0gImRhdGFyYWlkMTBzc2RjYWNoZV9jZGF0YSIKCQkJCW1l
dGFkYXRhID0gImRhdGFyYWlkMTBzc2RjYWNoZV9jbWV0YSIKCQkJCWNodW5rX3NpemUgPSAxMjgK
CQkJfQoJCX0KCgkJZGF0YXJhaWQxMHNzZGNhY2hlX2NkYXRhIHsKCQkJaWQgPSAiZkhpbUIxLVJN
aUYtb2oxRi1VRWpTLU5zbk8tNXpERi1ZMjFUbWMiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklU
RSJdCgkJCWZsYWdzID0gW10KCQkJY3JlYXRpb25faG9zdCA9ICJjaGVlc2Vib3kuYWR2ZXJwbGV4
LmNvbSIKCQkJY3JlYXRpb25fdGltZSA9IDE0MDg5NzkwMzAJIyAyMDE0LTA4LTI1IDExOjAzOjUw
IC0wNDAwCgkJCXNlZ21lbnRfY291bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlzdGFydF9leHRl
bnQgPSAwCgkJCQlleHRlbnRfY291bnQgPSAxMDEzNDc1CSMgMy44NjYxIFRlcmFieXRlcwoKCQkJ
CXR5cGUgPSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDUKCQkJCXN0cmlwZV9zaXplID0g
NjQJIyAzMiBLaWxvYnl0ZXMKCgkJCQlzdHJpcGVzID0gWwoJCQkJCSJwdjIwIiwgMCwKCQkJCQki
cHYyMSIsIDAsCgkJCQkJInB2MjIiLCAwLAoJCQkJCSJwdjIzIiwgMCwKCQkJCQkicHYyNCIsIDAK
CQkJCV0KCQkJfQoJCX0KCgkJZGF0YXJhaWQxMHNzZGNhY2hlX2NtZXRhIHsKCQkJaWQgPSAidE5S
OWNwLXQyaGItRUNkYS1pbzJrLU4xcnQtNEMxYi0xWHAydDAiCgkJCXN0YXR1cyA9IFsiUkVBRCIs
ICJXUklURSJdCgkJCWZsYWdzID0gW10KCQkJY3JlYXRpb25faG9zdCA9ICJjaGVlc2Vib3kuYWR2
ZXJwbGV4LmNvbSIKCQkJY3JlYXRpb25fdGltZSA9IDE0MDg5NzkwODAJIyAyMDE0LTA4LTI1IDEx
OjA0OjQwIC0wNDAwCgkJCXNlZ21lbnRfY291bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlzdGFy
dF9leHRlbnQgPSAwCgkJCQlleHRlbnRfY291bnQgPSA1MTIwCSMgMjAgR2lnYWJ5dGVzCgoJCQkJ
dHlwZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlw
ZXMgPSBbCgkJCQkJInB2MjUiLCAwCgkJCQldCgkJCX0KCQl9CgoJCWx2b2wwX3Btc3BhcmUgewoJ
CQlpZCA9ICJTaU1lcXQtd01kZy1vcGZXLXl1Mk4tZ3A4Wi1wckRvLWNvTkRXWSIKCQkJc3RhdHVz
ID0gWyJSRUFEIiwgIldSSVRFIl0KCQkJZmxhZ3MgPSBbXQoJCQljcmVhdGlvbl9ob3N0ID0gImNo
ZWVzZWJveS5hZHZlcnBsZXguY29tIgoJCQljcmVhdGlvbl90aW1lID0gMTQwODk3OTE4MwkjIDIw
MTQtMDgtMjUgMTE6MDY6MjMgLTA0MDAKCQkJc2VnbWVudF9jb3VudCA9IDEKCgkJCXNlZ21lbnQx
IHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDUxMjAJIyAyMCBHaWdh
Ynl0ZXMKCgkJCQl0eXBlID0gInN0cmlwZWQiCgkJCQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFy
CgoJCQkJc3RyaXBlcyA9IFsKCQkJCQkicHYyNSIsIDUxMjAKCQkJCV0KCQkJfQoJCX0KCgkJZGF0
YXJhaWQxMG9uZV9jb3JpZyB7CgkJCWlkID0gIkdrMDBEbS1QejhDLWVhQU8tSEVlby12Wmx3LWRt
dVAtNm9mUUpiIgoJCQlzdGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUiXQoJCQlmbGFncyA9IFtdCgkJ
CWNyZWF0aW9uX2hvc3QgPSAiY2hlZXNlYm95LmFkdmVycGxleC5jb20iCgkJCWNyZWF0aW9uX3Rp
bWUgPSAxNDA4OTc5Mjk0CSMgMjAxNC0wOC0yNSAxMTowODoxNCAtMDQwMAoJCQlzZWdtZW50X2Nv
dW50ID0gMQoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2Nv
dW50ID0gNzI5NzAyMAkjIDI3LjgzNTkgVGVyYWJ5dGVzCgoJCQkJdHlwZSA9ICJzdHJpcGVkIgoJ
CQkJc3RyaXBlX2NvdW50ID0gMTIKCQkJCXN0cmlwZV9zaXplID0gMjA0OAkjIDEwMjQgS2lsb2J5
dGVzCgoJCQkJc3RyaXBlcyA9IFsKCQkJCQkicHYwIiwgMCwKCQkJCQkicHYxIiwgMCwKCQkJCQki
cHYyIiwgMCwKCQkJCQkicHYzIiwgMCwKCQkJCQkicHY0IiwgMCwKCQkJCQkicHY1IiwgMCwKCQkJ
CQkicHY2IiwgMCwKCQkJCQkicHY3IiwgMCwKCQkJCQkicHY4IiwgMCwKCQkJCQkicHY5IiwgMCwK
CQkJCQkicHYxMCIsIDAsCgkJCQkJInB2MTEiLCAwCgkJCQldCgkJCX0KCQl9Cgl9Cn0K
--001a1135f066b8f931050176eae3--
