Message-Id: <000a01c1c1dc$393ed6f0$0100a8c0@japanair>
From: ile <ileukens@t-online.de>
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_0007_01C1C1E4.9A96C180"
Subject: [linux-lvm] LVM Problem, VGs vanished (??) Need urgent help!
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
Date: Sat Mar  2 05:20:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0007_01C1C1E4.9A96C180
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i have a serious problem with my LVM (Suse 7.3).
I used to have 2 VGs (ROOT and TAN)=20
ROOT consisted of /hda1 /hdf1
TAN consisted of /hdh1 /hdg1

There was (hopefully still is) data on both VG.
Now the problem: I put in a new HD yesterday. Reboot. No VGs found =
anymore. All xxscan commands doesnt find any proof of the VGs. Well, i =
thought just put the new HD out and everything is ok, but without the =
new HD the situation is still the same.
The new HD was put alone on a cable. I didnt change anything in the =
system while the new HD was connected.
The system doesnt find a partition on hda now, dunno why. But everything =
on VG TAN should work since there is no evidence of any failure happened =
to hdg1 or hdh1. The system worked perfect for the last 2 weeks.
Now i dunno what to do anymore, since i dont want to loose any data on =
TAN (the root part is not that important). I would appreciate any help.

Regards
Jim


Situation now:
>lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/sda1 [      23.50 MB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- /dev/sda2 [     133.35 MB] Primary  LINUX swap partition =
[0x82]
lvmdiskscan -- /dev/sda3 [       1.86 GB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hdg1 [      57.25 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdh1 [      57.25 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hde1 [      76.34 GB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hdf1 [      74.53 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hda  [      76.34 GB] free whole disk
lvmdiskscan -- 6 disks
lvmdiskscan -- 1 whole disk
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 7 partitions
lvmdiskscan -- 3 LVM physical volume partitions

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg"  is in no VG  [8.00 GB]
pvscan -- inactive PV "/dev/hdh"  is in no VG  [8.00 GB]
pvscan -- inactive PV "/dev/hdf1" of VG "ROOT" [74.52 GB / 0 free]
pvscan -- total: 3 [90.53 GB] / in use: 1 [74.53 GB] / in no VG: 2 =
[16.00 GB]

pvdisplay /dev/hdf1
--- Physical volume ---
PV Name               /dev/hdf1
VG Name               ROOT
PV Size               74.53 GB / NOT usable 7.05 MB [LVM: 198.00 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              19078
Free PE               0
Allocated PE          19078
PV UUID               bmUZpk-p2Zd-GvxZ-IRfd-k0TA-B79z-iJKxGv

pvdisplay on all discs but hdf1 looks like this:
pvdisplay -- no physical volume identifier on "/dev/hdh1"

Partition check:
 hda:
 hde: hde1
 hdf: hdf1
 hdg: hdg1
 hdh: hdh1

If anyone needs more information i would be glad to give it to you.



------=_NextPart_000_0007_01C1C1E4.9A96C180
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4912.300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i have a serious problem with my LVM =
(Suse=20
7.3).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I used to have 2 VGs (ROOT and TAN) =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ROOT consisted of /hda1 =
/hdf1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>TAN consisted of /hdh1 =
/hdg1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>There was (hopefully still is) data on =
both=20
VG.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Now the problem: I put in a new HD =
yesterday.=20
Reboot. No VGs found anymore. All xxscan commands doesnt find any proof =
of the=20
VGs. Well, i thought just put the new HD out and everything is ok, but =
without=20
the new HD the situation is still the same.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The new HD was put alone on&nbsp;a =
cable. I didnt=20
change anything in the system while the new HD was =
connected.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The system doesnt find a partition on =
hda now,=20
dunno why. But everything on VG TAN should work since there is no =
evidence of=20
any failure happened to hdg1 or hdh1. The system worked perfect for the =
last 2=20
weeks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Now i dunno what to do anymore, =
since&nbsp;i dont=20
want to loose any data on TAN (the root part is not that important). I =
would=20
appreciate any help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jim</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Situation now:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&gt;lvmdiskscan<BR>lvmdiskscan -- =
reading all disks=20
/ partitions (this may take a while...)<BR>lvmdiskscan -- /dev/sda1=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23.50 MB] Primary&nbsp; LINUX native =
partition=20
[0x83]<BR>lvmdiskscan -- /dev/sda2 [&nbsp;&nbsp;&nbsp;&nbsp; 133.35 MB]=20
Primary&nbsp; LINUX swap partition [0x82]<BR>lvmdiskscan -- /dev/sda3=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.86 GB] Primary&nbsp; LINUX =
native=20
partition [0x83]<BR>lvmdiskscan -- /dev/hdg1 =
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
57.25 GB] Primary&nbsp; LVM partition [0x8E]<BR>lvmdiskscan -- /dev/hdh1 =

[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 57.25 GB] Primary&nbsp; LVM partition=20
[0x8E]<BR>lvmdiskscan -- /dev/hde1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76.34 =
GB]=20
Primary&nbsp; LINUX native partition [0x83]<BR>lvmdiskscan -- /dev/hdf1=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 74.53 GB] Primary&nbsp; LVM partition=20
[0x8E]<BR>lvmdiskscan -- /dev/hda&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
76.34=20
GB] free whole disk<BR>lvmdiskscan -- 6 disks<BR>lvmdiskscan -- 1 whole=20
disk<BR>lvmdiskscan -- 0 loop devices<BR>lvmdiskscan -- 0 multiple=20
devices<BR>lvmdiskscan -- 0 network block devices<BR>lvmdiskscan -- 7=20
partitions<BR>lvmdiskscan -- 3 LVM physical volume =
partitions<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- reading all physical volumes =
(this may=20
take a while...)<BR>pvscan -- inactive PV "/dev/hdg"&nbsp; is in no =
VG&nbsp;=20
[8.00 GB]<BR>pvscan -- inactive PV "/dev/hdh"&nbsp; is in no VG&nbsp; =
[8.00=20
GB]<BR>pvscan -- inactive PV "/dev/hdf1" of VG "ROOT" [74.52 GB / 0=20
free]<BR>pvscan -- total: 3 [90.53 GB] / in use: 1 [74.53 GB] / in no =
VG: 2=20
[16.00 GB]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>pvdisplay /dev/hdf1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--- Physical volume ---<BR>PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdf1<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ROOT<BR>PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
74.53 GB / NOT usable 7.05 MB [LVM: 198.00=20
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
NOT=20
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
yes (but full)<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
19078<BR>Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
19078<BR>PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
bmUZpk-p2Zd-GvxZ-IRfd-k0TA-B79z-iJKxGv</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>pvdisplay on all discs but hdf1 looks =
like=20
this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pvdisplay -- no physical volume =
identifier on=20
"/dev/hdh1"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Partition =
check:<BR>&nbsp;hda:<BR>&nbsp;hde:=20
hde1<BR>&nbsp;hdf: hdf1<BR>&nbsp;hdg: hdg1<BR>&nbsp;hdh: =
hdh1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If anyone needs more information i =
would be glad to=20
give it to you.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_0007_01C1C1E4.9A96C180--
