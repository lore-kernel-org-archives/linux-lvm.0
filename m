Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2LI49q1008396
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 13:04:09 -0500
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k2LI41Xt006329
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 13:04:02 -0500
Message-ID: <001401c64d12$9337de20$150fa8c0@peterlustig>
From: "Sebastian Kindt" <sk_computer@gmx.de>
Date: Tue, 21 Mar 2006 19:09:14 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01C64D1A.F1815030"
Subject: [linux-lvm] Major Problems with my damaged LVM! Please Help! :-)
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

This is a multi-part message in MIME format.

------=_NextPart_000_0011_01C64D1A.F1815030
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I have a major Problem. First my initial situation:
I have a Fedora Core 3 System with one harddrive an the standard LVm =
Settings on it. Then the disk was full an I added a second harddrive and =
included it in the Volume Group. But I never enhanced the filesystem. So =
the second Harddisk was always empty. Then I set up a new System an put =
the empty HD from the old System in it. But I forget to remove the Disk =
from the VG of the old System. Now the old system doesn't boot up =
because the second hard drive is missing.
What are my possibillities to get the Data from this Harddisk back? At =
the Moment I have this disk in a system where the system is on a =
standard ext3 filesystem.

Please help me because the data on the disk is very important..

With best regards..

Now a few outputs:

fdisk /dev/hdd (The defect Harddisk)
/dev/hdd1   *           1         203      102280+  83  Linux
/dev/hdd2             204       79653    40042800   8e  Linux LVM

fdisk /dev/hde (the System)
/dev/hde1   *           1          13      104391   83  Linux
/dev/hde2              14        4865    38973690   83  Linux

[root@noname ~]# lvmdiskscan
  /dev/hda   [      186.31 GB]
  /dev/hde   [       37.27 GB] LVM physical volume
  /dev/hda1  [      186.31 GB]
  /dev/hde1  [      101.94 MB]
  /dev/hde2  [       37.17 GB]
  /dev/hdd   [       38.29 GB]
  /dev/hdd1  [       99.88 MB]
  /dev/hdd2  [       38.19 GB] LVM physical volume
  2 disks
  4 partitions
  1 LVM physical volume whole disk
  1 LVM physical volume

[root@noname ~]# lvdisplay
  Couldn't find device with uuid =
'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.
  Couldn't find all physical volumes for volume group VolGroup02.
  Volume group "VolGroup02" not found

[root@noname ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid =
'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.
  Couldn't find all physical volumes for volume group VolGroup02.
  Volume group "VolGroup02" not found
  Found volume group "VolGroup00" using metadata type lvm2

[root@noname ~]# vgdisplay
  Couldn't find device with uuid =
'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.
  Couldn't find all physical volumes for volume group VolGroup02.
  Volume group "VolGroup02" doesn't exist
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               37.25 GB
  PE Size               32.00 MB
  Total PE              1192
  Alloc PE / Size       0 / 0
  Free  PE / Size       1192 / 37.25 GB
  VG UUID               fruTb9-D6zB-puw4-k1vK-jCvN-B7Hf-tCu9pc

[root@noname ~]# pvscan
  Couldn't find device with uuid =
'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.
  PV unknown device   VG VolGroup02   lvm2 [37.25 GB / 32.00 MB free]
  PV /dev/hdd2        VG VolGroup02   lvm2 [38.16 GB / 38.16 GB free]
  PV /dev/hde         VG VolGroup00   lvm2 [37.25 GB / 37.25 GB free]
  Total: 3 [112.66 GB] / in use: 3 [112.66 GB] / in no VG: 0 [0   ]

[root@noname ~]# pvdisplay
  Couldn't find device with uuid =
'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.
  --- Physical volume ---
  PV Name               unknown device
  VG Name               VolGroup02
  PV Size               37.25 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              1192
  Free PE               1
  Allocated PE          1191
  PV UUID               qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ

  --- Physical volume ---
  PV Name               /dev/hdd2
  VG Name               VolGroup02
  PV Size               38.16 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              1221
  Free PE               1221
  Allocated PE          0
  PV UUID               ozQ418-X0l1-Mnmz-qBU5-pfsc-yi22-6QTTa0

  --- Physical volume ---
  PV Name               /dev/hde
  VG Name               VolGroup00
  PV Size               37.25 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              1192
  Free PE               1192
  Allocated PE          0
  PV UUID               CbAYwI-X34A-Yriz-sCmx-DtcE-aZQn-ewN4QF










------=_NextPart_000_0011_01C64D1A.F1815030
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2180" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a major Problem. First my =
initial=20
situation:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have a Fedora Core 3 System with one =
harddrive an=20
the standard LVm Settings on it. Then the disk was full an I added a =
second=20
harddrive and included it in the Volume Group. But I never enhanced the=20
filesystem. So the second Harddisk was always empty. Then I set up a new =
System=20
an put the empty HD from the old System in it. But I forget to remove =
the Disk=20
from the VG of the old System. Now the old system doesn't boot up =
because the=20
second hard drive is missing.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>What are my possibillities to get the =
Data from=20
this Harddisk back? At the Moment I have this disk in a system where the =
system=20
is on a standard ext3 filesystem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please help me because the data on the =
disk is very=20
important..</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>With best regards..</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now a few outputs:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>fdisk /dev/hdd (The defect =
Harddisk)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/dev/hdd1&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
203&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 102280+&nbsp; 83&nbsp;=20
Linux<BR>/dev/hdd2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
204&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 79653&nbsp;&nbsp;&nbsp;=20
40042800&nbsp;&nbsp; 8e&nbsp; Linux LVM<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>fdisk /dev/hde (the =
System)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/dev/hde1&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 104391&nbsp;&nbsp; 83&nbsp;=20
Linux<BR>/dev/hde2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4865&nbsp;&nbsp;&nbsp;=20
38973690&nbsp;&nbsp; 83&nbsp; Linux</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@noname ~]# lvmdiskscan<BR>&nbsp;=20
/dev/hda&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 186.31 =
GB]<BR>&nbsp;=20
/dev/hde&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 37.27 GB] LVM =

physical volume<BR>&nbsp; /dev/hda1&nbsp; =
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 186.31=20
GB]<BR>&nbsp; /dev/hde1&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 101.94=20
MB]<BR>&nbsp; /dev/hde2&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
37.17=20
GB]<BR>&nbsp; /dev/hdd&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
38.29=20
GB]<BR>&nbsp; /dev/hdd1&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
99.88=20
MB]<BR>&nbsp; /dev/hdd2&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
38.19 GB]=20
LVM physical volume<BR>&nbsp; 2 disks<BR>&nbsp; 4 partitions<BR>&nbsp; 1 =
LVM=20
physical volume whole disk<BR>&nbsp; 1 LVM physical =
volume<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@noname ~]# lvdisplay<BR>&nbsp; =
Couldn't find=20
device with uuid 'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.<BR>&nbsp; =
Couldn't=20
find all physical volumes for volume group VolGroup02.<BR>&nbsp; Volume =
group=20
"VolGroup02" not found</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@noname ~]# vgscan<BR>&nbsp; =
Reading all=20
physical volumes.&nbsp; This may take a while...<BR>&nbsp; Couldn't find =
device=20
with uuid 'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.<BR>&nbsp; Couldn't =
find all=20
physical volumes for volume group VolGroup02.<BR>&nbsp; Volume group=20
"VolGroup02" not found<BR>&nbsp; Found volume group "VolGroup00" using =
metadata=20
type lvm2<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@noname ~]# vgdisplay<BR>&nbsp; =
Couldn't find=20
device with uuid 'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.<BR>&nbsp; =
Couldn't=20
find all physical volumes for volume group VolGroup02.<BR>&nbsp; Volume =
group=20
"VolGroup02" doesn't exist<BR>&nbsp; --- Volume group ---<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
VolGroup00<BR>&nbsp; System ID<BR>&nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Metadata Sequence No&nbsp; 7<BR>&nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>&nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>&nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
37.25 GB<BR>&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
32.00 MB<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1192<BR>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 /=20
0<BR>&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1192 /=20
37.25 GB<BR>&nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
fruTb9-D6zB-puw4-k1vK-jCvN-B7Hf-tCu9pc</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@noname ~]# pvscan<BR>&nbsp; =
Couldn't find=20
device with uuid 'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.<BR>&nbsp; PV =
unknown=20
device&nbsp;&nbsp; VG VolGroup02&nbsp;&nbsp; lvm2 [37.25 GB / 32.00 MB=20
free]<BR>&nbsp; PV /dev/hdd2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
VG=20
VolGroup02&nbsp;&nbsp; lvm2 [38.16 GB / 38.16 GB free]<BR>&nbsp; PV=20
/dev/hde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG=20
VolGroup00&nbsp;&nbsp; lvm2 [37.25 GB / 37.25 GB free]<BR>&nbsp; Total: =
3=20
[112.66 GB] / in use: 3 [112.66 GB] / in no VG: 0 [0&nbsp;&nbsp;=20
]<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@noname ~]# pvdisplay<BR>&nbsp; =
Couldn't find=20
device with uuid 'qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ'.<BR>&nbsp; --- =

Physical volume ---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
unknown device<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
VolGroup02<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
37.25 GB / not usable 0<BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
yes<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32768<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1192<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1191<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
qSazfv-F1Sa-jUKa-FtbY-o7HP-dGmG-YzhpfZ</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp; --- Physical volume =
---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdd2<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
VolGroup02<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
38.16 GB / not usable 0<BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
yes<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32768<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1221<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1221<BR>&nbsp; Allocated=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ozQ418-X0l1-Mnmz-qBU5-pfsc-yi22-6QTTa0</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp; --- Physical volume =
---<BR>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hde<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
VolGroup00<BR>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
37.25 GB / not usable 0<BR>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
yes<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32768<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1192<BR>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1192<BR>&nbsp; Allocated=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
CbAYwI-X34A-Yriz-sCmx-DtcE-aZQn-ewN4QF<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV>
<DIV><BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_0011_01C64D1A.F1815030--
