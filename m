Message-ID: <003c01c320a6$1f0299f0$4d00a8c0@epsilon>
From: =?iso-8859-1?Q?Kim_Kr=FCger-Monsen?= <kim@nibland.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0039_01C320B6.DF574100"
Subject: [linux-lvm] Sorry to bother you...
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
Date: Tue May 27 06:26:10 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0039_01C320B6.DF574100
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

I'm really sorry to bother you, but I'm desperate and I don't know any =
more to do in order to get my LVM partitions back up again.

I have a machine with three discs and together they formed one 226GB =
large partition using LVM. One of those discs crashed and the data is =
unrecoverable, leaving me with two discs which still contains data, but =
how do I extract the data?? I'm using reiserfs since it was the only =
filesystem which could be resized on the fly as I understood it. Somehow =
the volume group vg01 is nowhere to find any more after the crash, but I =
can still do a pvscan and see that the discs are intact.

Please give me some hints here. I have searched and searched for =
information and I can't find anything applicable in my case. I really =
need to get to the data that's still there hidden... no backup is made =
due to another problem. :-(


Disc number one with still intact information.

--- Physical volume ---
PV Name               /dev/hda8
VG Name               vg01
PV Size               24.66 GB [51710337 secs] / NOT usable 4.19 MB =
[LVM: 152 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              6311
Free PE               0
Allocated PE          6311
PV UUID               13x8k8-ZCFk-aQib-FJXh-mDMj-QtG5-Xsfn4X

Disc number two with still intact information.

--- Physical volume ---
PV Name               /dev/hdd1
VG Name               vg01
PV Size               115.04 GB [241254657 secs] / NOT usable 4.25 MB =
[LVM: 243 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              29448
Free PE               0
Allocated PE          29448
PV UUID               knCAic-bPGx-jc7e-ZviH-etMb-s0t2-TBWh6H



I have replaced the 80GB /dev/hdc1 with one 1GB drive just to see if it =
had any effect, but no...
Disc number three=20

pvdisplay -- "/dev/hdc1" is a new physical volume of 1.02 GB


[root@linux etc]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hdc1  [       1.02 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdd1  [     115.04 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hda1  [     509.38 MB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hda2  [       4.88 GB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hda3  [       4.88 GB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hda4  [      28.08 GB] Primary  Windows98 extended =
partition [0x0F]
lvmdiskscan -- /dev/hda5  [       1.46 GB] Extended LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hda6  [       1.46 GB] Extended LINUX native =
partition [0x83]
lvmdiskscan -- /dev/hda7  [     509.38 MB] Extended LINUX swap partition =
[0x82]
lvmdiskscan -- /dev/hda8  [      24.66 GB] Extended LVM partition [0x8E]
lvmdiskscan -- /dev/hdb1  [      42.95 GB] Primary  LINUX native =
partition [0x83]
lvmdiskscan -- 4 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 11 partitions
lvmdiskscan -- 3 LVM physical volume partitions


[root@linux etc]# ll /etc/lvmconf/
total 5514
-rw-r-----    1 root     root      1256248 Mar  2 05:43 vg01.conf
-rw-r-----    1 root     root      1009720 Mar  2 05:42 vg01.conf.1.old
-rw-r-----    1 root     root       927528 Mar  2 05:39 vg01.conf.2.old
-rw-r-----    1 root     root       848480 Mar  2 01:33 vg01.conf.3.old
-rw-r-----    1 root     root       843600 Mar  2 01:32 vg01.conf.4.old
-rw-r-----    1 root     root       434000 Mar  2 01:06 vg01.conf.5.old
-rw-r-----    1 root     root       290956 Mar  2 01:04 vg01.conf.6.old

/etc/lvmtab is empty same goes for the /etc/lvmtab.d directory

The device /dev/vg01....  is also gone but I think it was there earlier =
after the crash, but I have tried several ways of getting the info back =
so it might have been removed by issuing any of the commands??

Thanks a bunch for any hints or directions in order to get the =
information back...

    /Kim


------=_NextPart_000_0039_01C320B6.DF574100
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm really sorry to bother you, but I'm =
desperate=20
and I don't know any more to do in order to get my LVM partitions back =
up=20
again.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a machine with three discs and =
together they=20
formed&nbsp;one 226GB large partition using LVM. One of those discs =
crashed and=20
the data is unrecoverable, leaving me with two discs which still =
contains data,=20
but how do I extract the data?? I'm using reiserfs since it was the only =

filesystem which could be resized on the fly as I understood it. Somehow =
the=20
volume group vg01 is nowhere to find any more after the crash, but I can =
still=20
do a pvscan and see that the discs are intact.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please give me some hints here. I have =
searched and=20
searched for information and I can't find anything applicable in my =
case. I=20
really need to get to the data that's still there hidden... no backup is =
made=20
due to another problem. :-(</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Disc number one with still intact=20
information.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Physical volume ---<BR>PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hda8<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg01<BR>PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
24.66 GB [51710337 secs] / NOT usable 4.19 MB [LVM: 152=20
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>PV=20
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
6311<BR>Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
6311<BR>PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
13x8k8-ZCFk-aQib-FJXh-mDMj-QtG5-Xsfn4X<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Disc number two with still intact=20
information.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Physical volume ---<BR>PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdd1<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg01<BR>PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
115.04 GB [241254657 secs] / NOT usable 4.25 MB [LVM: 243=20
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
yes (but full)<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
29448<BR>Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
29448<BR>PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
knCAic-bPGx-jc7e-ZviH-etMb-s0t2-TBWh6H</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have replaced the 80GB /dev/hdc1 with =
one 1GB=20
drive just to see if it had any effect, but no...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Disc number three </DIV>
<DIV>&nbsp;</DIV>
<DIV>pvdisplay -- "/dev/hdc1" is a new physical volume of 1.02=20
GB<BR><BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>[root@linux etc]# =
lvmdiskscan<BR>lvmdiskscan --=20
reading all disks / partitions (this may take a while...)<BR>lvmdiskscan =
--=20
/dev/hdc1&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.02 GB] =
Primary&nbsp; LVM=20
partition [0x8E]<BR>lvmdiskscan -- /dev/hdd1&nbsp; =
[&nbsp;&nbsp;&nbsp;&nbsp;=20
115.04 GB] Primary&nbsp; LVM partition [0x8E]<BR>lvmdiskscan -- =
/dev/hda1&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp; 509.38 MB] Primary&nbsp; LINUX native =
partition=20
[0x83]<BR>lvmdiskscan -- /dev/hda2&nbsp; =
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4.88 GB] Primary&nbsp; LINUX native partition [0x83]<BR>lvmdiskscan --=20
/dev/hda3&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.88 GB] =
Primary&nbsp;=20
LINUX native partition [0x83]<BR>lvmdiskscan -- /dev/hda4&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28.08 GB] Primary&nbsp; Windows98 =
extended=20
partition [0x0F]<BR>lvmdiskscan -- /dev/hda5&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.46 GB] Extended LINUX native =
partition=20
[0x83]<BR>lvmdiskscan -- /dev/hda6&nbsp; =
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1.46 GB] Extended LINUX native partition [0x83]<BR>lvmdiskscan --=20
/dev/hda7&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp; 509.38 MB] Extended LINUX swap =

partition [0x82]<BR>lvmdiskscan -- /dev/hda8&nbsp;=20
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24.66 GB] Extended LVM partition=20
[0x8E]<BR>lvmdiskscan -- /dev/hdb1&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
42.95=20
GB] Primary&nbsp; LINUX native partition [0x83]<BR>lvmdiskscan -- 4=20
disks<BR>lvmdiskscan -- 0 whole disks<BR>lvmdiskscan -- 0 loop=20
devices<BR>lvmdiskscan -- 0 multiple devices<BR>lvmdiskscan -- 0 network =
block=20
devices<BR>lvmdiskscan -- 11 partitions<BR>lvmdiskscan -- 3 LVM physical =
volume=20
partitions<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>[root@linux etc]# ll =
/etc/lvmconf/<BR>total=20
5514<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1256248 Mar&nbsp; 2 05:43=20
vg01.conf<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp; =

root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1009720 Mar&nbsp; 2 05:42=20
vg01.conf.1.old<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 927528 Mar&nbsp; 2 05:39=20
vg01.conf.2.old<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 848480 Mar&nbsp; 2 01:33=20
vg01.conf.3.old<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 843600 Mar&nbsp; 2 01:32=20
vg01.conf.4.old<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 434000 Mar&nbsp; 2 01:06=20
vg01.conf.5.old<BR>-rw-r-----&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 290956 Mar&nbsp; 2 01:04=20
vg01.conf.6.old<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/etc/lvmtab is empty same goes for the=20
/etc/lvmtab.d directory</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>The device /dev/vg01....&nbsp; is =
also gone=20
but I think it was there earlier after the crash, but I have tried =
several ways=20
of getting the info back so it might have been removed by issuing any of =
the=20
commands??</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>Thanks a bunch for any hints or =
directions in=20
order to get the information back...</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>&nbsp;&nbsp;&nbsp; =
/Kim</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT =
size=3D2></FONT>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_0039_01C320B6.DF574100--
