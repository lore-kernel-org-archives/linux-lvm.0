Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i86Bkd330894
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 07:46:39 -0400
Received: from mtagate3.uk.ibm.com (mtagate3.uk.ibm.com [195.212.29.136])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i86BkVS0005577
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 07:46:37 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate3.uk.ibm.com (8.12.10/8.12.10) with ESMTP id i86BkQvH020286
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 11:46:26 GMT
Received: from LiivoTP (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i86BkOQC083924
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 12:46:25 +0100
Message-Id: <200409061146.i86BkOQC083924@d06nrmr1307.portsmouth.uk.ibm.com>
From: "Liivo Liivrand" <liivo@nnm.ee>
Date: Mon, 6 Sep 2004 14:46:23 +0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C49420.485A7A90"
Subject: [linux-lvm] vgextend and anomaly?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_000D_01C49420.485A7A90
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello!
 
I've set up LVM2 and using it for a long time. Now I'd like to extend it,
but some strange things will happen. Here is the output on what I'm doing.
Could anybody explain this and help me out?
 
--- Cut ---
 
# vgdisplay  -v
 
    Finding all volume groups
    Finding volume group "loop"
  --- Volume group ---
  VG Name               loop
  System ID
  Format                lvm2
  Metadata Areas        9
  Metadata Sequence No  26
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               1
  Max PV                255
  Cur PV                9
  Act PV                9
  VG Size               461.65 GB
  PE Size               4.00 MB
  Total PE              118183
  Alloc PE / Size       117760 / 460.00 GB
  Free  PE / Size       423 / 1.65 GB
  VG UUID               c3smTi-4zsd-3D88-XDrS-0qel-pdLU-hTjaZz
 
  --- Logical volume ---
  LV Name                /dev/loop/vrt
  VG Name                loop
  LV UUID                yyiueT-IIgT-C2PW-B6Q9-cuQF-lUE9-ri6tg8
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                460.00 GB
  Current LE             117760
  Segments               9
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:1

  --- Physical volumes ---
  PV Name               /dev/md20
  PV UUID               nCveg1-V16Y-08nq-BG1u-PJYj-HxDZ-0rTOwS
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md21
  PV UUID               8DifNi-Xsvx-1y8x-8ZYL-e2NE-lxZI-g5cn4E
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md22
  PV UUID               XXNuHR-9rUu-t88K-hEFb-vqQb-S1Sw-pZIbIU
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md23
  PV UUID               lQqCD8-nS21-47a7-y7mN-0Ysi-v6Ey-NJqOdA
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md24
  PV UUID               jCpAXU-k0qs-bVvI-Shyc-R2YR-hbnJ-aYulWR
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md10
  PV UUID               GJhjij-ovSA-dGbT-4duJ-E7lL-laRl-bD9oxO
  PV Status             allocatable
  Total PE / Free PE    8191 / 0
 
  PV Name               /dev/md11
  PV UUID               wDZ4XC-5bVL-hHQy-37cX-Dmov-1ARX-Fyg3G5
  PV Status             allocatable
  Total PE / Free PE    22499 / 0

  PV Name               /dev/md12
  PV UUID               6Ohei3-Qbtc-WL5g-Nmmg-mNnT-9t46-DObz2l
  PV Status             allocatable
  Total PE / Free PE    22499 / 0
 
  PV Name               /dev/md14
  PV UUID               AFr95V-lZhU-JfCC-q3DU-Z2me-Ax0a-x4qYvS
  PV Status             allocatable
  Total PE / Free PE    14999 / 423
 
# So far so good! No I'd like to add /dev/md13 to VG. First I make md13 and
check its status:
# ps axwf
 
26518 pts/0    S      0:26 nbd-client host2 9000 /dev/nb2
26591 pts/0    S      0:22 nbd-client host12 9001 /dev/nb12

# mkraid -R /dev/md13
DESTROYING the contents of /dev/md13 in 5 seconds, Ctrl-C if unsure!
handling MD device /dev/md13
analyzing super-block
disk 0: /dev/nb2, 25600000kB, raid superblock at 25599936kB
disk 1: /dev/nb12, 25608192kB, raid superblock at 25608128kB

# cat /proc/mdstat
 
md13 : active raid0 nbd12[1] nbd2[0]
      51206144 blocks 1024k chunks
 
# pvcreate -ff /dev/md13
  Physical volume "/dev/md13" successfully created

# fdisk -l /dev/md13
 
Disk /dev/md13: 52.4 GB, 52435091456 bytes
2 heads, 4 sectors/track, 12801536 cylinders
Units = cylinders of 8 * 512 = 4096 bytes
 
# Ok, this were all ok. But now!
# vgextend loop /dev/md13
  Volume group "loop" successfully extended

# vgdisplay -v
    Finding all volume groups
    Finding volume group "loop"
  --- Volume group ---
  VG Name               loop
  System ID
  Format                lvm2
  Metadata Areas        9
  Metadata Sequence No  27
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               1
  Max PV                255
  Cur PV                10
  Act PV                10
  VG Size               510.48 GB
  PE Size               4.00 MB
  Total PE              130684
  Alloc PE / Size       117760 / 460.00 GB
  Free  PE / Size       12924 / 50.48 GB
  VG UUID               c3smTi-4zsd-3D88-XDrS-0qel-pdLU-hTjaZz
 
  --- Logical volume ---
  LV Name                /dev/loop/vrt
  VG Name                loop
  LV UUID                yyiueT-IIgT-C2PW-B6Q9-cuQF-lUE9-ri6tg8
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                460.00 GB
  Current LE             117760
  Segments               9
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:1
 
  --- Physical volumes ---
  PV Name               /dev/md20
  PV UUID               nCveg1-V16Y-08nq-BG1u-PJYj-HxDZ-0rTOwS
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md21
  PV UUID               8DifNi-Xsvx-1y8x-8ZYL-e2NE-lxZI-g5cn4E
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md22
  PV UUID               XXNuHR-9rUu-t88K-hEFb-vqQb-S1Sw-pZIbIU
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md23
  PV UUID               lQqCD8-nS21-47a7-y7mN-0Ysi-v6Ey-NJqOdA
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md24
  PV UUID               jCpAXU-k0qs-bVvI-Shyc-R2YR-hbnJ-aYulWR
  PV Status             allocatable
  Total PE / Free PE    9999 / 0
 
  PV Name               /dev/md10
  PV UUID               GJhjij-ovSA-dGbT-4duJ-E7lL-laRl-bD9oxO
  PV Status             allocatable
  Total PE / Free PE    8191 / 0
 
  PV Name               /dev/md11
  PV UUID               wDZ4XC-5bVL-hHQy-37cX-Dmov-1ARX-Fyg3G5
  PV Status             allocatable
  Total PE / Free PE    22499 / 0
 
  PV Name               /dev/md12
  PV UUID               6Ohei3-Qbtc-WL5g-Nmmg-mNnT-9t46-DObz2l
  PV Status             allocatable
  Total PE / Free PE    22499 / 0
 
  PV Name               /dev/md14
  PV UUID               AFr95V-lZhU-JfCC-q3DU-Z2me-Ax0a-x4qYvS
  PV Status             allocatable
  Total PE / Free PE    14999 / 423
 
  PV Name               /dev/nb2
  PV UUID               Uuf1tv-4SGG-zbmD-qvxO-Q4ZN-5Iiv-rMJWds
  PV Status             allocatable
  Total PE / Free PE    12501 / 12501

--- Cut ---
 
Notice the last PV!!! I'm adding md13, but getting nb2, why???
 
--- Cut ---
 
# vgreduce loop /dev/md13
  Physical Volume "/dev/md13" not found in Volume Group "loop"

# vgreduce loop /dev/nb2
  Removed "/dev/nb2" from volume group "loop"

# uname -r
2.6.5-1.358

# rpm -qv lvm2
lvm2-2.00.15-2

--- Cut ---
 
So could anybody help me out and give me hint what to do to add successfully
md13. Note that all previos md-s are actually raid0 of nbd-s.
 
rgds,
Liivo Liivrand
 

------=_NextPart_000_000D_01C49420.485A7A90
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1458" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2>Hello!</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>I've =
set up LVM2 and=20
using it for a long time. Now I'd like to extend it, but some strange =
things=20
will happen. Here is the output on what I'm doing. Could anybody explain =
this=20
and help me out?</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>--- =
Cut=20
---</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
vgdisplay&nbsp;=20
-v</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;=20
Finding all volume groups<BR>&nbsp;&nbsp;&nbsp; Finding volume group=20
"loop"<BR>&nbsp; --- Volume group ---<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
loop<BR>&nbsp; System ID<BR>&nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
9<BR>&nbsp; Metadata Sequence No&nbsp; 26<BR>&nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>&nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>&nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>&nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1<BR>&nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>&nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
9<BR>&nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
9<BR>&nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
461.65 GB<BR>&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4.00 MB<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
118183<BR>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
117760 /=20
460.00 GB<BR>&nbsp; Free&nbsp; PE / =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 423=20
/ 1.65 GB<BR>&nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
c3smTi-4zsd-3D88-XDrS-0qel-pdLU-hTjaZz</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
--- Logical=20
volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/loop/vrt<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
loop<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
yyiueT-IIgT-C2PW-B6Q9-cuQF-lUE9-ri6tg8<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
460.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
117760<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
9<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
next free (default)<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; =

0<BR>&nbsp; Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
253:1<BR><BR>&nbsp; --- Physical volumes ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md20<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
nCveg1-V16Y-08nq-BG1u-PJYj-HxDZ-0rTOwS<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md21<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
8DifNi-Xsvx-1y8x-8ZYL-e2NE-lxZI-g5cn4E<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md22<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
XXNuHR-9rUu-t88K-hEFb-vqQb-S1Sw-pZIbIU<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md23<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
lQqCD8-nS21-47a7-y7mN-0Ysi-v6Ey-NJqOdA<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md24<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
jCpAXU-k0qs-bVvI-Shyc-R2YR-hbnJ-aYulWR<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md10<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
GJhjij-ovSA-dGbT-4duJ-E7lL-laRl-bD9oxO<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 8191 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md11<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
wDZ4XC-5bVL-hHQy-37cX-Dmov-1ARX-Fyg3G5<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 22499 /=20
0<BR><BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md12<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
6Ohei3-Qbtc-WL5g-Nmmg-mNnT-9t46-DObz2l<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 22499 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md14<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
AFr95V-lZhU-JfCC-q3DU-Z2me-Ax0a-x4qYvS<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 14999 /=20
423</FONT></SPAN></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># So =
far so good! No=20
I'd like to add /dev/md13 to VG. First I make md13 and check its=20
status:</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># ps=20
axwf</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>26518=20
pts/0&nbsp;&nbsp;&nbsp; S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0:26=20
nbd-client&nbsp;host2 9000 /dev/nb2<BR>26591 pts/0&nbsp;&nbsp;&nbsp;=20
S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0:22 nbd-client&nbsp;host12 9001=20
/dev/nb12<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
mkraid -R=20
/dev/md13<BR>DESTROYING the contents of /dev/md13 in 5 seconds, Ctrl-C =
if=20
unsure!<BR>handling MD device /dev/md13<BR>analyzing super-block<BR>disk =
0:=20
/dev/nb2, 25600000kB, raid superblock at 25599936kB<BR>disk 1: =
/dev/nb12,=20
25608192kB, raid superblock at 25608128kB<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># cat=20
/proc/mdstat</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>md13 : =
active raid0=20
nbd12[1] nbd2[0]<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51206144 blocks 1024k =

chunks</FONT></SPAN></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
pvcreate -ff=20
/dev/md13<BR>&nbsp; Physical volume "/dev/md13" successfully=20
created<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
fdisk -l=20
/dev/md13</FONT></SPAN></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>Disk =
/dev/md13: 52.4=20
GB, 52435091456 bytes<BR>2 heads, 4 sectors/track, 12801536 =
cylinders<BR>Units =3D=20
cylinders of 8 * 512 =3D 4096 bytes</FONT></SPAN></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># Ok, =
this were all=20
ok. But now!</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
vgextend loop=20
/dev/md13<BR>&nbsp; Volume group "loop" successfully=20
extended<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
vgdisplay=20
-v<BR>&nbsp;&nbsp;&nbsp; Finding all volume groups<BR>&nbsp;&nbsp;&nbsp; =
Finding=20
volume group "loop"<BR>&nbsp; --- Volume group ---<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
loop<BR>&nbsp; System ID<BR>&nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
9<BR>&nbsp; Metadata Sequence No&nbsp; 27<BR>&nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>&nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>&nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>&nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1<BR>&nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
255<BR>&nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
10<BR>&nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
10<BR>&nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
510.48 GB<BR>&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4.00 MB<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
130684<BR>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
117760 /=20
460.00 GB<BR>&nbsp; Free&nbsp; PE / =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
12924 / 50.48 GB<BR>&nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
c3smTi-4zsd-3D88-XDrS-0qel-pdLU-hTjaZz</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
--- Logical=20
volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/loop/vrt<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
loop<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
yyiueT-IIgT-C2PW-B6Q9-cuQF-lUE9-ri6tg8<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
available<BR>&nbsp; #=20
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
460.00 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
117760<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
9<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
next free (default)<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; =

0<BR>&nbsp; Block=20
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
253:1</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
--- Physical=20
volumes ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md20<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
nCveg1-V16Y-08nq-BG1u-PJYj-HxDZ-0rTOwS<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md21<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
8DifNi-Xsvx-1y8x-8ZYL-e2NE-lxZI-g5cn4E<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md22<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
XXNuHR-9rUu-t88K-hEFb-vqQb-S1Sw-pZIbIU<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md23<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
lQqCD8-nS21-47a7-y7mN-0Ysi-v6Ey-NJqOdA<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md24<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
jCpAXU-k0qs-bVvI-Shyc-R2YR-hbnJ-aYulWR<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 9999 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md10<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
GJhjij-ovSA-dGbT-4duJ-E7lL-laRl-bD9oxO<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 8191 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md11<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
wDZ4XC-5bVL-hHQy-37cX-Dmov-1ARX-Fyg3G5<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 22499 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md12<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
6Ohei3-Qbtc-WL5g-Nmmg-mNnT-9t46-DObz2l<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 22499 /=20
0</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/md14<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
AFr95V-lZhU-JfCC-q3DU-Z2me-Ax0a-x4qYvS<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 14999 /=20
423</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>&nbsp; =
PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/nb2<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
Uuf1tv-4SGG-zbmD-qvxO-Q4ZN-5Iiv-rMJWds<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 12501 /=20
12501<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>--- =
Cut=20
---</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>Notice =
the last=20
PV!!! I'm adding md13, but getting nb2, why???</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>--- =
Cut=20
---</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
vgreduce loop=20
/dev/md13<BR>&nbsp; Physical Volume "/dev/md13" not found in Volume =
Group=20
"loop"<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
vgreduce loop=20
/dev/nb2<BR>&nbsp; Removed "/dev/nb2" from volume group=20
"loop"<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># =
uname=20
-r<BR>2.6.5-1.358<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2># rpm =
-qv=20
lvm2<BR>lvm2-2.00.15-2<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>--- =
Cut=20
---</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>So =
could anybody=20
help me out and give me hint what to do to add successfully md13. Note =
that all=20
previos md-s are actually raid0 of nbd-s.</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2>rgds,</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial size=3D2>Liivo=20
Liivrand</FONT></SPAN></DIV>
<DIV><SPAN class=3D044062611-06092004><FONT face=3DArial=20
size=3D2>&nbsp;</DIV></FONT></SPAN></BODY></HTML>

------=_NextPart_000_000D_01C49420.485A7A90--
