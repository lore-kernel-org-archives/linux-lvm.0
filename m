Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66988032257
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 05:08:08 -0400
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i66987e1010333
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 05:08:07 -0400
Received: from echo (echo.echohome.org [192.168.2.254])
	by server.echohome.org (8.11.6/linuxconf) with ESMTP id i66981313730
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 05:08:02 -0400
From: "Erik Ch. Ohrnberger" <Erik@server.echohome.org>
Date: Tue, 6 Jul 2004 05:15:47 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAA/pQLRFt5WE61X2AOKMsBdgEAAAAA@EchoHome.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00B4_01C46318.4C3B0DC0"
In-Reply-To: 
Subject: [linux-lvm] RE: First corrupt partician tables,
	then lvm control data lost
Reply-To: Erik@server.echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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

------=_NextPart_000_00B4_01C46318.4C3B0DC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Additionally, pvscan reports the following:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "u00_vg" =
(run
vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "u00_vg" =
(run
vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "u00_vg" =
(run
vgscan)
pvscan -- total: 3 [204.96 GB] / in use: 3 [204.96 GB] / in no VG: 0 [0]

What must I do to re-associate the pv into the vg?

-----Original Message-----
From: Erik Ch. Ohrnberger [mailto:Erik@EchoHome.org] On Behalf Of
lvm@echohome.org
Sent: Monday, July 05, 2004 8:56 PM
To: 'linux-lvm@redhat.com'
Subject: First corrupt partician tables, then lvm control data lost


Well, I've slowly been coming to grips with recovering with what to me =
is a
pretty serious hard disk calamity.
=20
I rebooted my Linux system, as it was up and running for 48 days or so, =
and
it just seemed to be time to do it.  When the system came back up, many =
of
the hard disk partician tables were lost, and it wouldn't boot.
=20
After much research on the Internet, I found that a partician table =
could be
re-written and all the data in the file system maintained.  I also found =
a
tool, TestDisk at http://www.cgsecurity.org by Christophe GRENIER
<grenier@cgsecurity.org>, which seemed to do a good job of sniffing out
partician tables from the remaining file system data.  Well, it did OK =
on
the system disk, found the first FAT partician and the ext3 partician =
for
the root of the system.  In fact, after it wrote out the partician =
table, I
could mount the root file system without any sort of fsck required.  =
Very
cool.
=20
Of the LVM hard disks, which is why I'm sending this email to the =
mailing
list, 3 out of 4 partician tables were identified and recovered =
(/dev/hde1,
/dev/hdf1, /dev/hdg1).  For Lvm, I always used a single primary =
partician,
non-bootable, which uses the entire space on the hard disk.  So =
recovering
this partician table should be no problem, right?  I used fdisk and
re-created the partician table.
=20
OK, so I've not re-written the grub boot-loader on the system disk, but =
I
did boot off of a rescue CD and performed a chroot to where the root =
file
system was mounted, so I have a chrooted environment, and I can run =
access
the binaries and file from the old system hard disk.  I check to make =
sure
that the lvm module was loaded using lsmod, and it was so, now I figured =
I'd
see how far I could get to recover the 130 GB of data that was on the =
LVM
volume.
=20
First things first, I tried vgscan, and got the following results:
=20
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "u00_vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

So, I'm at a loss here.  What is the next step in the recovery?  How can =
I
get my vg and lv groups back?
=20
    Thanks in advance for the help.
=20
    Erik.
=20


------=_NextPart_000_00B4_01C46318.4C3B0DC0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY style=3D"BACKGROUND-COLOR: #ffffff" bgColor=3D#ffffff =
background=3D"">
<DIV><SPAN class=3D455511409-06072004><FONT face=3DArial color=3D#0000ff =

size=3D2>Additionally, pvscan reports the following:</FONT></SPAN></DIV>
<DIV><SPAN class=3D455511409-06072004><FONT face=3DArial color=3D#0000ff =
size=3D2>pvscan=20
-- reading all physical volumes (this may take a while...)<BR>pvscan -- =
inactive=20
PV "/dev/hdg1"&nbsp; is associated to unknown VG "u00_vg" (run =
vgscan)<BR>pvscan=20
-- inactive PV "/dev/hdh1"&nbsp; is associated to unknown VG "u00_vg" =
(run=20
vgscan)<BR>pvscan -- inactive PV "/dev/hde1"&nbsp; is associated to =
unknown VG=20
"u00_vg" (run vgscan)<BR>pvscan -- total: 3 [204.96 GB] / in use: 3 =
[204.96 GB]=20
/ in no VG: 0 [0]<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D455511409-06072004><FONT face=3DArial color=3D#0000ff =
size=3D2>What=20
must I do to re-associate the pv into the vg?</DIV></FONT></SPAN>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B> Erik =
Ch.=20
  Ohrnberger [mailto:Erik@EchoHome.org] <B>On Behalf Of=20
  </B>lvm@echohome.org<BR><B>Sent:</B> Monday, July 05, 2004 8:56=20
  PM<BR><B>To:</B> 'linux-lvm@redhat.com'<BR><B>Subject:</B> First =
corrupt=20
  partician tables, then lvm control data lost<BR><BR></FONT></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial =
size=3D2>Well, I've slowly=20
  been coming to grips with recovering with&nbsp;what to me is a pretty =
serious=20
  hard disk calamity.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial size=3D2>I =
rebooted my=20
  Linux system, as it was up and running for 48 days or so, and it just =
seemed=20
  to be time to do it.&nbsp; When the system came back up, many of the =
hard disk=20
  partician tables were lost, and it wouldn't boot.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial =
size=3D2>After much=20
  research on the Internet, I found that a partician table could be =
re-written=20
  and all the data in the file system maintained.&nbsp; =
</FONT></SPAN><SPAN=20
  class=3D955372400-06072004><FONT face=3DArial size=3D2>I also found a =
tool, TestDisk=20
  at <A =
href=3D"http://www.cgsecurity.org">http://www.cgsecurity.org</A>&nbsp;by =

  Christophe GRENIER &lt;<A=20
  href=3D"mailto:grenier@cgsecurity.org">grenier@cgsecurity.org</A>&gt;, =
which=20
  seemed to do a good job of sniffing out partician tables from the =
remaining=20
  file system data.&nbsp; Well, it did OK on the system disk, found the =
first=20
  FAT partician and the ext3 partician for the root of the system.&nbsp; =
In=20
  fact, after it wrote out the partician table, I could mount the root =
file=20
  system without any sort of fsck required.&nbsp; Very =
cool.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial size=3D2>Of =
the LVM hard=20
  disks, which is why I'm sending this email to the mailing list, 3 out =
of 4=20
  partician tables were identified and recovered (/dev/hde1, /dev/hdf1,=20
  /dev/hdg1).&nbsp; For L</FONT></SPAN><SPAN =
class=3D955372400-06072004><FONT=20
  face=3DArial size=3D2>vm, I always used a single primary partician, =
non-bootable,=20
  which uses the entire space on the hard disk.&nbsp; So recovering this =

  partician table should be no problem, right?&nbsp; I used fdisk and =
re-created=20
  the partician table.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial size=3D2>OK, =
so I've not=20
  re-written the grub boot-loader on the system disk, but I did boot off =
of a=20
  rescue CD and performed a chroot to where the root file system was =
mounted, so=20
  I have a chrooted environment, and I can run access the binaries and =
file from=20
  the old system hard disk.&nbsp; I check to make sure that the lvm =
module was=20
  loaded using lsmod, and it was so, now I figured I'd see how far I =
could get=20
  to recover the 130 GB of data that was on the LVM =
volume.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial =
size=3D2>First things=20
  first, I tried&nbsp;vgscan, and got the following =
results:</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial =
size=3D2>vgscan -- reading=20
  all physical volumes (this may take a while...)<BR>vgscan -- ERROR=20
  "vg_read_with_pv_and_lv(): current PV" can't get data of volume group =
"u00_vg"=20
  from physical volume(s)<BR>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" =

  successfully created<BR>vgscan -- WARNING: This program does not do a =
VGDA=20
  backup of your volume group<BR></FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial size=3D2>So, =
I'm at a loss=20
  here.&nbsp; What is the next step in the recovery?&nbsp; How can I get =
my vg=20
  and lv groups back?</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;=20
  Thanks in advance for the help.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;=20
  Erik.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D955372400-06072004><FONT face=3DArial=20
size=3D2>&nbsp;</DIV></BLOCKQUOTE></FONT></SPAN></BODY></HTML>

------=_NextPart_000_00B4_01C46318.4C3B0DC0--
