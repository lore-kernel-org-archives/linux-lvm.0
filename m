Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3J1H1nm001451
	for <linux-lvm@redhat.com>; Thu, 18 Apr 2013 21:17:01 -0400
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3J1H0Pv011293
	for <linux-lvm@redhat.com>; Thu, 18 Apr 2013 21:17:00 -0400
Received: by mail-pd0-f181.google.com with SMTP id y10so1879898pdj.26
	for <linux-lvm@redhat.com>; Thu, 18 Apr 2013 18:16:59 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 18 Apr 2013 18:16:59 -0700
Message-ID: <CAH5g024xgwq43FN11Wr5AgYEJKhWZQyXd3KZhqwoqceWNF5MCQ@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec52161c7d0f7b804daac7916
Subject: [linux-lvm] (LONG) Delay when writing to LVM after boot
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--bcaec52161c7d0f7b804daac7916
Content-Type: text/plain; charset=ISO-8859-1

I have one LVG with one LV consisting of several physical drives, ranging
from 500G to 3T, with a total size of 6.5T, formatted with ext4.

After I boot the system, when anything writes a file to that LV, the write
hangs for 1 minute or more, then continues at full speed with no errors.
Some apps, though can't handle the delay, and report that the write fails.

This does not occur with a small file ( < 50M or so ). But the first time a
larger file is written, then the delay. And this delay occurs only one time.

I have noticed something similar in the past with smaller LVs ( < 1T ), but
the delay was insignificant then.  But as I grew this LV, the delay
increased.

I can run e2fsck on the LV, and even optimize directories (-D option), with
no delay occurring.

I have tried googling, but have not found any mention of something like
this (maybe not using the right key words?). So, does this sound familiar
to any LVM experts out there? Any suggestions?

FWIW: I'm currently running Fedora 17 (64 bit), kernel
3.8.4-102.fc17.x86_64 (although I have seen this problem on 32 bit
kernels/machines as well). I have 4 physical drives (500G, 1T, 1.5T, 3T),
and non-raid configured.

Some other info:

[root@elmer ken]# lvmdiskscan
  /dev/vg_elmer/lv_swap [       3.62 GiB]
  /dev/sda1             [     500.00 MiB]
  /dev/vg_elmer/lv_root [      23.81 GiB]
  /dev/sda2             [      27.47 GiB] LVM physical volume
  /dev/VG_NAS/LV_NAS    [       5.46 TiB]
  /dev/sdb1             [       2.73 TiB] LVM physical volume
  /dev/sdc1             [     465.76 GiB] LVM physical volume
  /dev/sdd1             [     931.51 GiB] LVM physical volume
  /dev/sde1             [       1.36 TiB] LVM physical volume
  3 disks
  1 partition
  0 LVM physical volume whole disks
  5 LVM physical volumes
[root@elmer ken]# lvdisplay
  --- Logical volume ---
  LV Path                /dev/VG_NAS/LV_NAS
  LV Name                LV_NAS
  VG Name                VG_NAS
  LV UUID                IO93PY-kFF2-19u7-33lX-m7Mg-8BZC-q12ttn
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                5.46 TiB
  Current LE             1430794
  Segments               5
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:2
[root@elmer ken]#

(note: sda is separate physical drive with system/kernel only - vg_elmer-*)

T IA

ken

--bcaec52161c7d0f7b804daac7916
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>I have one LV=
G with one LV consisting of several physical drives, ranging from 500G to 3=
T, with a total size of 6.5T, formatted with ext4.<br><br></div>After I boo=
t the system, when anything writes a file to that LV, the write hangs for 1=
 minute or more, then continues at full speed with no errors. Some apps, th=
ough can&#39;t handle the delay, and report that the write fails.<br>
<br></div>This does not occur with a small file ( &lt; 50M or so ). But the=
 first time a larger file is written, then the delay. And this delay occurs=
 only one time.<br><br></div>I have noticed something similar in the past w=
ith smaller LVs ( &lt; 1T ), but the delay was insignificant then.=A0 But a=
s I grew this LV, the delay increased.<br>
<br></div>I can run e2fsck on the LV, and even optimize directories (-D opt=
ion), with no delay occurring. <br><br></div>I have tried googling, but hav=
e not found any mention of something like this (maybe not using the right k=
ey words?). So, does this sound familiar to any LVM experts out there? Any =
suggestions?<br>
<br></div>FWIW: I&#39;m currently running Fedora 17 (64 bit), kernel 3.8.4-=
102.fc17.x86_64 (although I have seen this problem on 32 bit kernels/machin=
es as well). I have 4 physical drives (500G, 1T, 1.5T, 3T), and non-raid co=
nfigured.<br>
<br>Some other info:<br><br>[root@elmer ken]# lvmdiskscan <br>=A0 /dev/vg_e=
lmer/lv_swap [=A0=A0=A0=A0=A0=A0 3.62 GiB] <br>=A0 /dev/sda1=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 [=A0=A0=A0=A0 500.00 MiB] <br>=A0 /dev/vg_elmer/lv_ro=
ot [=A0=A0=A0=A0=A0 23.81 GiB] <br>=A0 /dev/sda2=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 [=A0=A0=A0=A0=A0 27.47 GiB] LVM physical volume<br>
=A0 /dev/VG_NAS/LV_NAS=A0=A0=A0 [=A0=A0=A0=A0=A0=A0 5.46 TiB] <br>=A0 /dev/=
sdb1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=A0=A0=A0=A0=A0=A0 2.73 TiB] LVM =
physical volume<br>=A0 /dev/sdc1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=A0=
=A0=A0=A0 465.76 GiB] LVM physical volume<br>=A0 /dev/sdd1=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 [=A0=A0=A0=A0 931.51 GiB] LVM physical volume<br>
=A0 /dev/sde1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=A0=A0=A0=A0=A0=A0 1.36 =
TiB] LVM physical volume<br>=A0 3 disks<br>=A0 1 partition<br>=A0 0 LVM phy=
sical volume whole disks<br>=A0 5 LVM physical volumes<br>[root@elmer ken]#=
 lvdisplay <br>=A0 --- Logical volume ---<br>
=A0 LV Path=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /dev/VG_NAS/LV_NAS=
<br>=A0 LV Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LV_NAS<br>=A0 =
VG Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VG_NAS<br>=A0 LV UUID=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IO93PY-kFF2-19u7-33lX-m7Mg-8B=
ZC-q12ttn<br>=A0 LV Write Access=A0=A0=A0=A0=A0=A0=A0 read/write<br>
=A0 LV Creation host, time , <br>=A0 LV Status=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 available<br>=A0 # open=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1<br>=A0 LV Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5.4=
6 TiB<br>=A0 Current LE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1430794<br>=A0 =
Segments=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5<br>=A0 Allocation=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inherit<br>
=A0 Read ahead sectors=A0=A0=A0=A0 auto<br>=A0 - currently set to=A0=A0=A0=
=A0 256<br>=A0 Block device=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 253:2<br>[root@el=
mer ken]# <br><br></div>(note: sda is separate physical drive with system/k=
ernel only - vg_elmer-*)<br><br></div>T IA<br>
<br></div>ken<br><br></div>

--bcaec52161c7d0f7b804daac7916--
