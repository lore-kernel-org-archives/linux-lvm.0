Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2FFEFmq030167
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 11:14:15 -0400
Received: from web58308.mail.re3.yahoo.com (web58308.mail.re3.yahoo.com
	[68.142.236.161])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m2FFDhvJ018929
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 11:13:43 -0400
Date: Sat, 15 Mar 2008 08:13:37 -0700 (PDT)
From: lemon lemon <sse450@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1981084577-1205594017=:49971"
Message-ID: <56318.49971.qm@web58308.mail.re3.yahoo.com>
Subject: [linux-lvm] how to recover lvm after OS re-install
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

--0-1981084577-1205594017=:49971
Content-Type: text/plain; charset=us-ascii

Hello,

I had to re-install my OS from scratch after a software problem (perl).

Now struggling to recover the logical volume I had before the server crash. It is full of files, data etc. OS was not (and is not) on that hard disk. That is a separate data partition (actually a hard raid array). There is no any hard disk failure. And, I didn't formatted this disk during re-install OS. So, I think, the data should be there untouched.

What I did:
#pvcreate /dev/sdc
#vgcreate -s 32M raid_vg0 /dev/sdc (I used the same PE size as before)
#lvcreate -l 23839 -n raid_lv0 raid_vg0 (maximum extents from vgdisplay)

Unfortunately, it complains when mounting raid_lv0:
#mount: you must specify the filesystem type

Obviously, if I format it, there will be no problem in mounting, but will lose all the data on it. 

Is there a way to mount this lv without losing data? Or, should I forget about all the data on that disk?

Please help!

Best wishes,
Mufit

Some info:
[root@server dev]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               raid_vg0
  PV Size               745.00 GB / not usable 32.00 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              23839
  Free PE               0
  Allocated PE          23839
  PV UUID               2Xd3p7-KlaX-SIbW-vCKH-uJ73-Ldeh-QG0P9r

[root@server dev]# vgdisplay
  --- Volume group ---
  VG Name               raid_vg0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               744.97 GB
  PE Size               32.00 MB
  Total PE              23839
  Alloc PE / Size       23839 / 744.97 GB
  Free  PE / Size       0 / 0
  VG UUID               MUz02m-JWYb-f2gP-8PBc-0y2I-a1y8-sZfrOx

[root@server dev]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/raid_vg0/raid_lv0
  VG Name                raid_vg0
  LV UUID                2yoy12-qASz-qdmy-AcB4-iaG3-XGN8-mwv9VS
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                744.97 GB
  Current LE             23839
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0








      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
--0-1981084577-1205594017=:49971
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Hello,</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">I had to re-install my OS from scratch after a software problem (perl).</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Now struggling to recover the logical volume I had before the server crash. It is full of files, data etc. OS was not (and is not) on that hard disk. That is a separate data partition
 (actually a hard raid array). There is no any hard disk failure. And, I didn't formatted this disk during re-install OS. So, I think, the data should be there untouched.</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">What I did:</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">#pvcreate /dev/sdc</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">#vgcreate -s 32M raid_vg0 /dev/sdc (I used the same PE size as before)</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier
 New,courier,monaco,monospace,sans-serif;">#lvcreate -l 23839 -n raid_lv0 raid_vg0 (maximum extents from vgdisplay)</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Unfortunately, it complains when mounting raid_lv0:</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">#mount: you must specify the filesystem type</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Obviously, if I format it, there will be no problem in mounting, but will lose all the data on it. </span><br style="font-family: Courier
 New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Is there a way to mount this lv without losing data? Or, should I forget about all the data on that disk?</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Please help!</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Best wishes,</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Mufit</span><br
 style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">Some info:</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">[root@server dev]# pvdisplay</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; --- Physical volume ---</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdc</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span
 style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raid_vg0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 745.00 GB / not usable 32.00 MB</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768</span><br style="font-family:
 Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23839</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23839</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; PV
 UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2Xd3p7-KlaX-SIbW-vCKH-uJ73-Ldeh-QG0P9r</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">[root@server dev]# vgdisplay</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; --- Volume group ---</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raid_vg0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier
 New,courier,monaco,monospace,sans-serif;">&nbsp; System ID</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Metadata Sequence No&nbsp; 2</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG
 Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span
 style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</span><br
 style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 744.97 GB</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32.00 MB</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23839</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Alloc PE /
 Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23839 / 744.97 GB</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MUz02m-JWYb-f2gP-8PBc-0y2I-a1y8-sZfrOx</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">[root@server dev]# lvdisplay</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier
 New,courier,monaco,monospace,sans-serif;">&nbsp; --- Logical volume ---</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/raid_vg0/raid_lv0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raid_vg0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2yoy12-qASz-qdmy-AcB4-iaG3-XGN8-mwv9VS</span><br style="font-family: Courier
 New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; LV
 Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 744.97 GB</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23839</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span
 style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><span style="font-family: Courier New,courier,monaco,monospace,sans-serif;">&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:0</span><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br style="font-family: Courier New,courier,monaco,monospace,sans-serif;"><br><br><br></div><br>
      <hr size=1>Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile. <a href="http://us.rd.yahoo.com/evt=51733/*http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ "> Try it now.</a></body></html>
--0-1981084577-1205594017=:49971--
