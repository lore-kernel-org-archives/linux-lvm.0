Message-ID: <004d01c20110$f2b8ff70$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004A_01C200D6.4644CAB0"
Subject: [linux-lvm] Error on lvcreate or lvremove!
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue May 21 16:48:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_004A_01C200D6.4644CAB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I did not have this kind of problem before but I installed LVM1.1-rc2,
I am experiencing the following errors;

Problem1) could not create an LV from RAID1 vol group
    [root@localhost /]# lvcreate -l 496 -n lvraid1 volRaid1
    lvcreate -- ERROR "Operation not permitted" opening logical volume =
"/dev/volRaid1/lvraid1"

Problem2) I could not remove it
    [root@localhost /]# lvremove /dev/volRaid1/lvraid1
    lvremove -- do you really want to remove "/dev/volRaid1/lvraid1"? =
[y/n]: y
    lvremove -- ERROR "lv_release(): LV number" releasing logical volume =
"/dev/volRaid1/lvraid1"

Problem3) I could not create a striped LV
    [root@localhost /]# lvcreate -l200 -i2 -I4 -n lvjb2s volDisk2
    lvcreate -- not enough allocatable/free physical volume space in =
"volDisk2"
    lvcreate -- please check, if physical volumes are allocatable

Attched are more system information.

Please provide me your help,

Thanks,

Bo

[root@localhost /]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md0"   of VG "volRaid0" [1.95 GB / 1.95 GB =
free]
pvscan -- ACTIVE   PV "/dev/md1"   of VG "volRaid0" [1.95 GB / 1.95 GB =
free]
pvscan -- ACTIVE   PV "/dev/md2"   of VG "volRaid0" [1.95 GB / 1.95 GB =
free]
pvscan -- ACTIVE   PV "/dev/md3"   of VG "volRaid1" [992 MB / 992 MB =
free]
pvscan -- ACTIVE   PV "/dev/md4"   of VG "volRaid1" [992 MB / 992 MB =
free]
pvscan -- ACTIVE   PV "/dev/md5"   of VG "volRaid5" [1.95 GB / 1.95 GB =
free]
pvscan -- ACTIVE   PV "/dev/md6"   of VG "volRaid5" [1.95 GB / 1.95 GB =
free]
pvscan -- ACTIVE   PV "/dev/hdc9"  of VG "volDisk"  [992 MB / 992 MB =
free]
pvscan -- ACTIVE   PV "/dev/hdc10" of VG "volDisk2" [992 MB / 992 MB =
free]
pvscan -- ACTIVE   PV "/dev/hdd9"  of VG "volDisk"  [992 MB / 992 MB =
free]
pvscan -- ACTIVE   PV "/dev/hdd10" of VG "volDisk2" [992 MB / 992 MB =
free]
pvscan -- ACTIVE   PV "/dev/hda15" of VG "volDisk"  [996 MB / 996 MB =
free]
pvscan -- ACTIVE   PV "/dev/hda16" of VG "volDisk2" [996 MB / 996 MB =
free]
pvscan -- total: 13 [17.59 GB] / in use: 13 [17.59 GB] / in no VG: 0 [0]

[root@localhost /]# vgdisplay
--- Volume group ---
VG Name               volRaid0=20
VG Access             read/write
VG Status             available/resizable
VG #                  2
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               5.84 GB
PE Size               4 MB
Total PE              1496
Alloc PE / Size       0 / 0
Free  PE / Size       1496 / 5.84 GB
VG UUID               89ZFBj-yaQ0-c26m-uKgF-YhvG-2lGR-C8cvWm

--- Volume group ---
VG Name               volRaid1=20
VG Access             read/write
VG Status             available/resizable
VG #                  3
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               1.94 GB
PE Size               4 MB
Total PE              496
Alloc PE / Size       0 / 0
Free  PE / Size       496 / 1.94 GB
VG UUID               3keDZ8-jgky-uhKS-q1bi-d1Jf-qmsq-hw7GUs

--- Volume group ---
VG Name               volRaid5=20
VG Access             read/write
VG Status             available/resizable
VG #                  4
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               3.89 GB
PE Size               4 MB
Total PE              996
Alloc PE / Size       0 / 0
Free  PE / Size       996 / 3.89 GB
VG UUID               U2l1OW-L3ha-r3kH-BPXw-IJP5-ksA7-77iRJB

--- Volume group ---
VG Name               volDisk=20
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               2.91 GB
PE Size               4 MB
Total PE              745
Alloc PE / Size       0 / 0
Free  PE / Size       745 / 2.91 GB
VG UUID               7RhXUS-Pw5B-EBYN-GKIM-PO1d-4uD7-4apSvp

--- Volume group ---
VG Name               volDisk2=20
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               2.91 GB
PE Size               4 MB
Total PE              745
Alloc PE / Size       0 / 0
Free  PE / Size       745 / 2.91 GB
VG UUID               VT6shD-P4lh-Rk2g-DUHi-T2ch-p14Q-kl3BuV



------=_NextPart_000_004A_01C200D6.4644CAB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4522.1800" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I did not have this kind of problem =
before but I=20
installed LVM1.1-rc2,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I am experiencing the following=20
errors;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Problem1) could not create an =
LV&nbsp;from RAID1=20
vol group</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; [root@localhost /]# =
lvcreate -l=20
496 -n lvraid1 volRaid1<BR>&nbsp;&nbsp;&nbsp; lvcreate -- ERROR =
"Operation not=20
permitted" opening logical volume "/dev/volRaid1/lvraid1"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Problem2) I could not remove =
it</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; [root@localhost /]# =
lvremove=20
/dev/volRaid1/lvraid1<BR>&nbsp;&nbsp;&nbsp; lvremove -- do you really =
want to=20
remove "/dev/volRaid1/lvraid1"? [y/n]: y<BR>&nbsp;&nbsp;&nbsp; lvremove =
-- ERROR=20
"lv_release(): LV number" releasing logical volume=20
"/dev/volRaid1/lvraid1"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Problem3) I could not create a striped=20
LV</FONT><FONT face=3DArial size=3D2><BR>&nbsp;&nbsp;&nbsp; =
[root@localhost /]#=20
lvcreate -l200 -i2 -I4 -n lvjb2s volDisk2<BR>&nbsp;&nbsp;&nbsp; lvcreate =
-- not=20
enough allocatable/free physical volume space in=20
"volDisk2"<BR>&nbsp;&nbsp;&nbsp; lvcreate -- please check, if physical =
volumes=20
are allocatable</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Attched are more system =
information.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please provide me your =
help,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Bo</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@localhost /]# pvscan<BR>pvscan -- =
reading all=20
physical volumes (this may take a while...)<BR>pvscan -- =
ACTIVE&nbsp;&nbsp; PV=20
"/dev/md0"&nbsp;&nbsp; of VG "volRaid0" [1.95 GB / 1.95 GB =
free]<BR>pvscan --=20
ACTIVE&nbsp;&nbsp; PV "/dev/md1"&nbsp;&nbsp; of VG "volRaid0" [1.95 GB / =
1.95 GB=20
free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/md2"&nbsp;&nbsp; of VG =
"volRaid0"=20
[1.95 GB / 1.95 GB free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV=20
"/dev/md3"&nbsp;&nbsp; of VG "volRaid1" [992 MB / 992 MB free]<BR>pvscan =
--=20
ACTIVE&nbsp;&nbsp; PV "/dev/md4"&nbsp;&nbsp; of VG "volRaid1" [992 MB / =
992 MB=20
free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/md5"&nbsp;&nbsp; of VG =
"volRaid5"=20
[1.95 GB / 1.95 GB free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV=20
"/dev/md6"&nbsp;&nbsp; of VG "volRaid5" [1.95 GB / 1.95 GB =
free]<BR>pvscan --=20
ACTIVE&nbsp;&nbsp; PV "/dev/hdc9"&nbsp; of VG "volDisk"&nbsp; [992 MB / =
992 MB=20
free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/hdc10" of VG "volDisk2" =
[992 MB /=20
992 MB free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/hdd9"&nbsp; of VG=20
"volDisk"&nbsp; [992 MB / 992 MB free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; =
PV=20
"/dev/hdd10" of VG "volDisk2" [992 MB / 992 MB free]<BR>pvscan --=20
ACTIVE&nbsp;&nbsp; PV "/dev/hda15" of VG "volDisk"&nbsp; [996 MB / 996 =
MB=20
free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/hda16" of VG "volDisk2" =
[996 MB /=20
996 MB free]<BR>pvscan -- total: 13 [17.59 GB] / in use: 13 [17.59 GB] / =
in no=20
VG: 0 [0]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@localhost /]# vgdisplay<BR>--- =
Volume group=20
---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
volRaid0 <BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
5.84 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1496<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / =
0<BR>Free&nbsp;=20
PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1496 / 5.84 GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
89ZFBj-yaQ0-c26m-uKgF-YhvG-2lGR-C8cvWm</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
volRaid1 <BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
1.94 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
496<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / =
0<BR>Free&nbsp;=20
PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 496 / 1.94 GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
3keDZ8-jgky-uhKS-q1bi-d1Jf-qmsq-hw7GUs</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
volRaid5 <BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
3.89 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
996<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / =
0<BR>Free&nbsp;=20
PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 996 / 3.89 GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
U2l1OW-L3ha-r3kH-BPXw-IJP5-ksA7-77iRJB</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
volDisk <BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
2.91 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
745<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / =
0<BR>Free&nbsp;=20
PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 745 / 2.91 GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
7RhXUS-Pw5B-EBYN-GKIM-PO1d-4uD7-4apSvp</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
volDisk2 <BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
3<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
2.91 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
745<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / =
0<BR>Free&nbsp;=20
PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 745 / 2.91 GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
VT6shD-P4lh-Rk2g-DUHi-T2ch-p14Q-kl3BuV</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_004A_01C200D6.4644CAB0--
