Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2SCebJs007499
	for <linux-lvm@redhat.com>; Fri, 28 Mar 2008 08:40:37 -0400
Received: from barney.tradebotsystems.com (barney.tradebotsystems.com
	[38.100.176.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2SCeR3h018634
	for <linux-lvm@redhat.com>; Fri, 28 Mar 2008 08:40:27 -0400
Received: from tradebotsystems.com (tbmail.tradebotsystems.com
	[192.168.254.26])
	by barney.tradebotsystems.com (8.13.6/8.14.1/Linux) with ESMTP id
	m2SCeJZY010711
	for <linux-lvm@redhat.com>; Fri, 28 Mar 2008 07:40:21 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C890D0.E1B9E4AC"
Subject: RE: [linux-lvm] vgimport without vgexport (hardware crash)
Date: Fri, 28 Mar 2008 07:40:19 -0500
Message-ID: <07774C6E31D94A44A2A60E2085944F09013994F3@tbmail.tradebot.com>
In-Reply-To: <07774C6E31D94A44A2A60E2085944F0901398E92@tbmail.tradebot.com>
References: <07774C6E31D94A44A2A60E2085944F0901398E92@tbmail.tradebot.com>
From: "Taylor Lewick" <tlewick@tradebotsystems.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C890D0.E1B9E4AC
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just wanted to let everyone know, that I've tested moving a disk array
between two hosts several times and everything works.

Our setup is a database server connected to a dell md1000 disk array and
the disks have been carved into 3 volume groups.

=20

We've simulated a server crash by just powering it off, and connecting
the disk array to another like linux server.

When you boot up the new server you just have to tell the bios to import
the foreign configuration (that's at hardware level).

=20

The first time I tried it, because we didn't run a vgexport on the
primary server (you wouldn't have the chance to do that in a crash
situation),

I had to vgexport the volume groups, then vgimport and vgchange them,
then mount the filesystems.  But I discovered, that if you add the same
entries to /etc/fstab for the logical volumes on the backup server, that
you do not have to run any lvm steps like vgexport, vgimport, or
vgchange, the OS does all of that automatically.  And if you boot the
backup server when its not connected to the disk array, it just fails
trying to mount those drives but it doesn't keep the O.S. from starting
up.

=20

So the net of all of this is if we have a hardware failure on our
database server we can have it back up and running on a secondary server
in less then 5 minutes, unless it has to do an fsck on the filesystems.

=20

Taylor

=20

=20

=20


------_=_NextPart_001_01C890D0.E1B9E4AC
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:Arial;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Just wanted to let everyone know, =
that I&#8217;ve
tested moving a disk array between two hosts several times and =
everything
works.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Our setup is a database server =
connected
to a dell md1000 disk array and the disks have been carved into 3 volume
groups.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>We&#8217;ve simulated a server =
crash by
just powering it off, and connecting the disk array to another like =
linux
server.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>When you boot up the new server you =
just
have to tell the bios to import the foreign configuration (that&#8217;s =
at
hardware level).<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>The first time I tried it, because =
we didn&#8217;t
run a vgexport on the primary server (you wouldn&#8217;t have the chance =
to do
that in a crash situation),<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I had to vgexport the volume =
groups, then
vgimport and vgchange them, then mount the filesystems.&nbsp; But I =
discovered, that
if you add the same entries to /etc/fstab for the logical volumes on the =
backup
server, that you do not have to run any lvm steps like vgexport, =
vgimport, or
vgchange, the OS does all of that automatically.&nbsp; And if you boot =
the backup
server when its not connected to the disk array, it just fails trying to =
mount
those drives but it doesn&#8217;t keep the O.S. from starting =
up.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>So the net of all of this is if we =
have a
hardware failure on our database server we can have it back up and =
running on a
secondary server in less then 5 minutes, unless it has to do an fsck on =
the
filesystems.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><st1:City w:st=3D"on"><st1:place w:st=3D"on"><font =
size=3D2
  color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
  color:navy'>Taylor</span></font></st1:place></st1:City><font size=3D2
color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C890D0.E1B9E4AC--
