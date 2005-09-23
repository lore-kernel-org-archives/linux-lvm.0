Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8NJ1eV28864
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 15:01:40 -0400
Received: from mailout-tlr.thomson.com (mailout-tlr.thomson.com
	[163.231.12.68])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8NJ1c29004973
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 15:01:39 -0400
Received: from mailout-tlr.thomson.com (localhost [127.0.0.1])
	by mailout-tlr.thomson.com (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	j8NJ1Xu9002210
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 19:01:33 GMT
Received: from tlrusmneagfe03.ERF.THOMSON.COM (tlrusmneagfe03.erf.thomson.com
	[163.231.22.177])
	by mailout-tlr.thomson.com (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	j8NJ1WCt002198
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 19:01:32 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5C071.43F11D0A"
Subject: RE: [linux-lvm] Recover Partition Table - vgdisplay/vgscan  fails
Date: Fri, 23 Sep 2005 14:01:31 -0500
Message-ID: <64A66E9DBE859F4993DBE06DECD4F95301B2D8E4@TLRUSMNEAGMBX21.ERF.THOMSON.COM>
From: <paul.stein@thomson.com>
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

------_=_NextPart_001_01C5C071.43F11D0A
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Additional information explaining what caused the below errors:
=20
+++++++++++++++ start +++++++++++++++++++++++++++++++++++++++++++++
=20
<root@paxton:~># fdisk /dev/sdo1
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.
=20

The number of cylinders for this disk is set to 3541.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)
Warning: invalid flag 0x0000 of partition table 4 will be corrected by
w(rite)
=20
Command (m for help): o
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.
=20

The number of cylinders for this disk is set to 3541.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)
Warning: invalid flag 0x0000 of partition table 4 will be corrected by
w(rite)
=20
Command (m for help): m
Command action
   a   toggle a bootable flag
   b   edit bsd disklabel
   c   toggle the dos compatibility flag
   d   delete a partition
   l   list known partition types
   m   print this menu
   n   add a new partition
   o   create a new empty DOS partition table
   p   print the partition table
   q   quit without saving changes
   s   create a new empty Sun disklabel
   t   change a partition's system id
   u   change display/entry units
   v   verify the partition table
   w   write table to disk and exit
   x   extra functionality (experts only)
=20
Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-3541, default 1):
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-3541, default 3541):
Using default value 3541
=20
Command (m for help): t
Selected partition 1
Hex code (type L to list codes): 8e
Changed system type of partition 1 to 8e (Linux LVM)
=20
Command (m for help): m
Command action
   a   toggle a bootable flag
   b   edit bsd disklabel
   c   toggle the dos compatibility flag
   d   delete a partition
   l   list known partition types
   m   print this menu
   n   add a new partition
   o   create a new empty DOS partition table
   p   print the partition table
   q   quit without saving changes
   s   create a new empty Sun disklabel
   t   change a partition's system id
   u   change display/entry units
   v   verify the partition table
   w   write table to disk and exit
   x   extra functionality (experts only)
=20
Command (m for help): p
=20
Disk /dev/sdo1: 29.1 GB, 29133909504 bytes
255 heads, 63 sectors/track, 3541 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
=20
     Device Boot    Start       End    Blocks   Id  System
/dev/sdo1p1             1      3541  28443051   8e  Linux LVM
=20
Command (m for help): v
62 unallocated sectors
=20
Command (m for help): v
62 unallocated sectors
=20
Command (m for help): w
The partition table has been altered!
=20
Calling ioctl() to re-read partition table.
=20
WARNING: Re-reading the partition table failed with error 16: Device or
resource busy.
The kernel still uses the old table.
The new table will be used at the next reboot.
Syncing disks.
=20
+++++++++++++++++++++++++++++ end ++++++++++++++++++++++++++++++++++++++

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Stein, Paul (TLR Corp)
Sent: Friday, September 23, 2005 11:20 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Recover Partition Table - vgdisplay/vgscan fails


I inadvertantly blew away the partition table on /dev/sdo that was in
use. While the system is still running and no errors have occured...yet,
I need
to get the partition table restored and  be able to vgdisplay the
datavg. Below is the sampling of error messages.
=20
<root@paxton:/proc/lvm># vgdisplay datavg
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

<root@paxton:/proc/lvm># vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "rootvg"
vgscan -- found active volume group "localvg"
vgscan -- found active volume group "datavg"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "datavg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups
=20
=20
=20
Is it safe to clear VGDA using the "dd if=3D/dev/zero =
of=3DPhysicalVolume
bs=3D512 count=3D1"  shown in the pvcreate man pages and the come back =
and
recreate the VGDA  using pvcreate, or use pvcreate outright not using
the dd method? Or, is there a better method to get /dev/sdo back into
the datavg
group while recreating the partition table?
=20
Paul Stein
=20

------_=_NextPart_001_01C5C071.43F11D0A
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1515" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D775410019-23092005><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Additional information explaining what caused =
the below=20
errors:</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D775410019-23092005><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D775410019-23092005><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>+++++++++++++++ start=20
+++++++++++++++++++++++++++++++++++++++++++++</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D775410019-23092005><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D775410019-23092005><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>&lt;<A =
href=3D"mailto:root@paxton">root@paxton</A>:~&gt;#=20
fdisk /dev/sdo1<BR>Device contains neither a valid DOS partition table, =
nor Sun,=20
SGI or OSF disklabel<BR>Building a new DOS disklabel. Changes will =
remain in=20
memory only,<BR>until you decide to write them. After that, of course, =
the=20
previous<BR>content won't be recoverable.</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV><SPAN class=3D775410019-23092005>
<DIV dir=3Dltr align=3Dleft><BR><FONT face=3DArial color=3D#0000ff =
size=3D2>The number of=20
cylinders for this disk is set to 3541.<BR>There is nothing wrong with =
that, but=20
this is larger than 1024,<BR>and could in certain setups cause problems=20
with:<BR>1) software that runs at boot time (e.g., old versions of =
LILO)<BR>2)=20
booting and partitioning software from other OSs<BR>&nbsp;&nbsp; (e.g., =
DOS=20
FDISK, OS/2 FDISK)<BR>Warning: invalid flag 0x0000 of partition table 4 =
will be=20
corrected by w(rite)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): o<BR>Building a new DOS disklabel. Changes will remain in memory=20
only,<BR>until you decide to write them. After that, of course, the=20
previous<BR>content won't be recoverable.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><BR><FONT face=3DArial color=3D#0000ff =
size=3D2>The number of=20
cylinders for this disk is set to 3541.<BR>There is nothing wrong with =
that, but=20
this is larger than 1024,<BR>and could in certain setups cause problems=20
with:<BR>1) software that runs at boot time (e.g., old versions of =
LILO)<BR>2)=20
booting and partitioning software from other OSs<BR>&nbsp;&nbsp; (e.g., =
DOS=20
FDISK, OS/2 FDISK)<BR>Warning: invalid flag 0x0000 of partition table 4 =
will be=20
corrected by w(rite)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): m<BR>Command action<BR>&nbsp;&nbsp; a&nbsp;&nbsp; toggle a =
bootable=20
flag<BR>&nbsp;&nbsp; b&nbsp;&nbsp; edit bsd disklabel<BR>&nbsp;&nbsp;=20
c&nbsp;&nbsp; toggle the dos compatibility flag<BR>&nbsp;&nbsp; =
d&nbsp;&nbsp;=20
delete a partition<BR>&nbsp;&nbsp; l&nbsp;&nbsp; list known partition=20
types<BR>&nbsp;&nbsp; m&nbsp;&nbsp; print this menu<BR>&nbsp;&nbsp;=20
n&nbsp;&nbsp; add a new partition<BR>&nbsp;&nbsp; o&nbsp;&nbsp; create a =
new=20
empty DOS partition table<BR>&nbsp;&nbsp; p&nbsp;&nbsp; print the =
partition=20
table<BR>&nbsp;&nbsp; q&nbsp;&nbsp; quit without saving =
changes<BR>&nbsp;&nbsp;=20
s&nbsp;&nbsp; create a new empty Sun disklabel<BR>&nbsp;&nbsp; =
t&nbsp;&nbsp;=20
change a partition's system id<BR>&nbsp;&nbsp; u&nbsp;&nbsp; change=20
display/entry units<BR>&nbsp;&nbsp; v&nbsp;&nbsp; verify the partition=20
table<BR>&nbsp;&nbsp; w&nbsp;&nbsp; write table to disk and =
exit<BR>&nbsp;&nbsp;=20
x&nbsp;&nbsp; extra functionality (experts only)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): n<BR>Command action<BR>&nbsp;&nbsp; e&nbsp;&nbsp;=20
extended<BR>&nbsp;&nbsp; p&nbsp;&nbsp; primary partition =
(1-4)<BR>p<BR>Partition=20
number (1-4): 1<BR>First cylinder (1-3541, default 1):<BR>Using default =
value=20
1<BR>Last cylinder or +size or +sizeM or +sizeK (1-3541, default =
3541):<BR>Using=20
default value 3541</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): t<BR>Selected partition 1<BR>Hex code (type L to list codes):=20
8e<BR>Changed system type of partition 1 to 8e (Linux LVM)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): m<BR>Command action<BR>&nbsp;&nbsp; a&nbsp;&nbsp; toggle a =
bootable=20
flag<BR>&nbsp;&nbsp; b&nbsp;&nbsp; edit bsd disklabel<BR>&nbsp;&nbsp;=20
c&nbsp;&nbsp; toggle the dos compatibility flag<BR>&nbsp;&nbsp; =
d&nbsp;&nbsp;=20
delete a partition<BR>&nbsp;&nbsp; l&nbsp;&nbsp; list known partition=20
types<BR>&nbsp;&nbsp; m&nbsp;&nbsp; print this menu<BR>&nbsp;&nbsp;=20
n&nbsp;&nbsp; add a new partition<BR>&nbsp;&nbsp; o&nbsp;&nbsp; create a =
new=20
empty DOS partition table<BR>&nbsp;&nbsp; p&nbsp;&nbsp; print the =
partition=20
table<BR>&nbsp;&nbsp; q&nbsp;&nbsp; quit without saving =
changes<BR>&nbsp;&nbsp;=20
s&nbsp;&nbsp; create a new empty Sun disklabel<BR>&nbsp;&nbsp; =
t&nbsp;&nbsp;=20
change a partition's system id<BR>&nbsp;&nbsp; u&nbsp;&nbsp; change=20
display/entry units<BR>&nbsp;&nbsp; v&nbsp;&nbsp; verify the partition=20
table<BR>&nbsp;&nbsp; w&nbsp;&nbsp; write table to disk and =
exit<BR>&nbsp;&nbsp;=20
x&nbsp;&nbsp; extra functionality (experts only)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): p</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Disk /dev/sdo1:=20
29.1 GB, 29133909504 bytes<BR>255 heads, 63 sectors/track, 3541=20
cylinders<BR>Units =3D cylinders of 16065 * 512 =3D 8225280 =
bytes</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;=20
Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;=20
Blocks&nbsp;&nbsp; Id&nbsp;=20
System<BR>/dev/sdo1p1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3541&nbsp; 28443051&nbsp;&nbsp; 8e&nbsp; =
Linux=20
LVM</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): v<BR>62 unallocated sectors</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): v<BR>62 unallocated sectors</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Command (m for=20
help): w<BR>The partition table has been altered!</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>Calling ioctl() to=20
re-read partition table.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>WARNING:=20
Re-reading the partition table failed with error 16: Device or resource=20
busy.<BR>The kernel still uses the old table.<BR>The new table will be =
used at=20
the next reboot.<BR>Syncing disks.</FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft></SPAN><SPAN =
class=3D775410019-23092005><FONT face=3DArial=20
color=3D#0000ff size=3D2>+++++++++++++++++++++++++++++ end=20
++++++++++++++++++++++++++++++++++++++</FONT></SPAN></DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Stein, Paul =
(TLR=20
Corp)<BR><B>Sent:</B> Friday, September 23, 2005 11:20 AM<BR><B>To:</B>=20
linux-lvm@redhat.com<BR><B>Subject:</B> [linux-lvm] Recover Partition =
Table -=20
vgdisplay/vgscan fails<BR></FONT><BR></DIV>
<DIV></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D338550616-23092005>I =
inadvertantly blew=20
away the partition table on /dev/sdo that was in use. While the system =
is still=20
running and no errors have occured...yet, I need</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D338550616-23092005>to get =
the partition=20
table restored and&nbsp; be able to vgdisplay the datavg. Below is the =
sampling=20
of error messages.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;<A=20
href=3D"mailto:root@paxton:/proc/lvm">root@paxton:/proc/lvm</A>&gt;# =
vgdisplay=20
datavg<BR>vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT =
consistent;=20
please run vgscan<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&lt;<A=20
href=3D"mailto:root@paxton:/proc/lvm">root@paxton:/proc/lvm</A>&gt;#=20
vgscan<BR>vgscan -- reading all physical volumes (this may take a=20
while...)<BR>vgscan -- found active volume group "rootvg"<BR>vgscan -- =
found=20
active volume group "localvg"<BR>vgscan -- found active volume group=20
"datavg"<BR>vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't =
get=20
data of volume group "datavg" from physical volume(s)<BR>vgscan -- =
"/etc/lvmtab"=20
and "/etc/lvmtab.d" successfully created<BR>vgscan -- WARNING: This =
program does=20
not do a VGDA backup of your volume groups</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D338550616-23092005><FONT face=3DArial size=3D2>Is it =
safe to clear=20
VGDA using the "dd if=3D/dev/zero of=3DPhysicalVolume bs=3D512 =
count=3D1"&nbsp; shown in=20
the pvcreate man pages and the come back and</FONT></SPAN></DIV>
<DIV><SPAN class=3D338550616-23092005><FONT face=3DArial =
size=3D2>recreate the=20
VGDA&nbsp; using pvcreate, or use pvcreate outright not using the dd =
method? Or,=20
is there a better method to get /dev/sdo back into the=20
datavg</FONT></SPAN></DIV>
<DIV><SPAN class=3D338550616-23092005><FONT face=3DArial size=3D2>group =
while=20
recreating the partition table?</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft>
<DIV align=3Dleft><FONT face=3D"Comic Sans MS" size=3D4>Paul =
Stein</FONT></DIV></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C5C071.43F11D0A--
