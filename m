Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6QHHPV03337
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 13:17:25 -0400
Received: from zcars04f.nortelnetworks.com (zcars04f.nortelnetworks.com
	[47.129.242.57])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6QHHIZc014883
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 13:17:18 -0400
Received: from zctfhxm0.corp.nortel.com (zctfhxm0.corp.nortel.com
	[47.164.129.155])
	by zcars04f.nortelnetworks.com (Switch-2.2.6/Switch-2.2.0) with ESMTP
	id j6QHH4O08926
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 13:17:04 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C59205.D378BB8F"
Date: Tue, 26 Jul 2005 19:16:57 +0200
Message-ID: <B06940B80A03814CAB09CDC85B9A987B21AF8D@zctfhxm0.corp.nortel.com>
From: "David Plainfosse" <david.plainfosse@nortel.com>
Subject: [linux-lvm] RAID device questions
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

------_=_NextPart_001_01C59205.D378BB8F
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like set up a RAID devices  on top of  SAS disks shared by two =
hosts via external SAS cable.
SAS disk are plug on each host.
 Each host has its own disk controller meaning that each host can access =
independtly both SAS disks (the local one + the
remote one).
SAS disk have independent  physical I/O that permits accessing disks =
indepently of the failure/reset of  each host.=20


I envision to use md to set up  two  RAID-1 devices one for  the Linux =
root FS and another one for the other file systems.

I understand from the RAID HOWTO manual that it is quite easy with 2.4 =
to set up a root file
system on top of RAID device.=20

I guess that both host in my configuration will try to boot from the =
same primary disk  ?
What if the external SAS cable are loss meaning that the RAID-1 device =
is broken. Does each host will try to boot from its own "local" root
file system ? What if the RAID device is set up in auto detection mode =
(does each host will declare the other disk has failed ) ?

I understand from the LVM section here below that LVM is the convenient =
way to partition a RAID device into multiple
resizable partitions. However, I wonder wether the md resync protocol =
latency is strongly dependent on the=20
size of the disk partition. In other words,  what would the impact on =
the resync latency to set up one single large RAID-1 device
instead of multiple small ones with different read/write patterns ?


David Plainfoss=E9
Architect GSM/UMTS Platform
Tel. : (33) 1 69 55 59 13 / ESN : 574 5913=20
Email: plaindav@nortel.com



7.3 Booting on RAID
There are several ways to set up a system that mounts it's root =
filesystem on a RAID device. Some
distributions allow for RAID setup in the installation process, and this =
is by far the easiest way to get a nicely
set up RAID system.
Newer LILO distributions can handle RAID-1 devices, and thus the kernel =
can be loaded at boot-time from a
RAID device. LILO will correctly write boot-records on all disks in the =
array, to allow booting even if the
primary disk fails.


11.2 LVM on RAID
The solution to the partitioning problem is LVM, Logical Volume =
Management. LVM has been in the stable
Linux kernel series for a long time now - LVM2 in the 2.6 kernel series =
is a further improvement over the
older LVM support from the 2.4 kernel series. While LVM has =
traditionally scared some people away because
of its complexity, it really is something that an administrator could =
and should consider if he wishes to use
more than a few filesystems on a server.
We will not attempt to describe LVM setup in this HOWTO, as there =
already is a fine HOWTO for exactly
this purpose. A small example of a RAID + LVM setup will be presented =
though. Consider the df output
below, of such a system:





------_=_NextPart_001_01C59205.D378BB8F
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7232.55">
<TITLE>RAID device questions</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I would like set up a RAID =
devices&nbsp; on top of&nbsp; SAS disks shared by two hosts via external =
SAS cable.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">SAS disk are plug on each host.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;Each host has its own disk =
controller meaning that each host can access independtly both SAS disks =
(the local one + the</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">remote one).</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">SAS disk have independent&nbsp; =
physical I/O that permits accessing disks indepently of the =
failure/reset of&nbsp; each host. </FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">I envision to use md to set up&nbsp; =
two&nbsp; RAID-1 devices one for&nbsp; the Linux root FS and another one =
for the other file systems.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I understand from the RAID HOWTO manual =
that it is quite easy with 2.4 to set up a root file</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">system on top of RAID device. </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I guess that both host in my =
configuration will try to boot from the same primary disk&nbsp; ?</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">What if the external SAS cable are =
loss meaning that the RAID-1 device is broken. Does each host will try =
to boot from its own &quot;local&quot; root</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">file system ? What if the RAID device =
is set up in auto detection mode (does each host will declare the other =
disk has failed ) ?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I understand from the LVM section here =
below that LVM is the convenient way to partition a RAID device into =
multiple</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">resizable partitions. However, I =
wonder wether the md resync protocol latency is strongly dependent on =
the </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">size of the disk partition. In other =
words,&nbsp; what would the impact on the resync latency to set up one =
single large RAID-1 device</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">instead of multiple small ones with =
different read/write patterns ?</FONT>
</P>
<BR>

<P><SPAN LANG=3D"fr"><B><FONT FACE=3D"Times New Roman">David =
Plainfoss=E9<BR>
</FONT></B><FONT FACE=3D"Times New Roman">Architect GSM/UMTS =
Platform<BR>
Tel. : (33) 1 69 55 59 13 / ESN : 574 5913<BR>
Email: plaindav@nortel.com</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"></SPAN>
</P>
<BR>
<BR>

<P><SPAN LANG=3D"en-us"><B><FONT SIZE=3D5 FACE=3D"Arial">7.3 Booting on =
RAID</FONT></B></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">There are =
several ways to set up a system that mounts it's root filesystem on a =
RAID device. Some</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">distributions =
allow for RAID setup in the installation process, and this is by far the =
easiest way to get a nicely</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">set up RAID =
system.</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">Newer LILO =
distributions can handle RAID-1 devices, and thus the kernel can be =
loaded at boot-time from a</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">RAID device. =
LILO will correctly write boot-records on all disks in the array, to =
allow booting even if the</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">primary disk =
fails.</FONT></SPAN>
</P>
<BR>

<P><SPAN LANG=3D"en-us"><B><FONT SIZE=3D5 FACE=3D"Arial">11.2 LVM on =
RAID</FONT></B></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">The solution to =
the partitioning problem is LVM, Logical Volume Management. LVM has been =
in the stable</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">Linux kernel =
series for a long time now - LVM2 in the 2.6 kernel series is a further =
improvement over the</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">older LVM =
support from the 2.4 kernel series. While LVM has traditionally scared =
some people away because</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">of its =
complexity, it really is something that an administrator could and =
should consider if he wishes to use</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">more than a few =
filesystems on a server.</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">We will not =
attempt to describe LVM setup in this HOWTO, as there already is a fine =
HOWTO for exactly</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">this purpose. A =
small example of a RAID + LVM setup will be presented though. Consider =
the</FONT> <FONT FACE=3D"Courier">df</FONT> <FONT FACE=3D"Times New =
Roman">output</FONT></SPAN>

<BR><SPAN LANG=3D"en-us"><FONT FACE=3D"Times New Roman">below, of such a =
system:</FONT></SPAN>
</P>
<BR>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C59205.D378BB8F--
