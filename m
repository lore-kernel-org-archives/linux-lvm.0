Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2IG11uA021503
	for <linux-lvm@redhat.com>; Tue, 18 Mar 2008 12:01:01 -0400
Received: from barney.tradebotsystems.com (barney.tradebotsystems.com
	[38.100.176.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2IG0RYa000385
	for <linux-lvm@redhat.com>; Tue, 18 Mar 2008 12:00:29 -0400
Received: from tradebotsystems.com (tbmail.tradebotsystems.com
	[192.168.254.26])
	by barney.tradebotsystems.com (8.13.6/8.14.1/Linux) with ESMTP id
	m2IG0Hr3021725
	for <linux-lvm@redhat.com>; Tue, 18 Mar 2008 11:00:19 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C88911.2902ADA8"
Date: Tue, 18 Mar 2008 11:00:17 -0500
Message-ID: <07774C6E31D94A44A2A60E2085944F0901398E92@tbmail.tradebot.com>
From: "Taylor Lewick" <tlewick@tradebotsystems.com>
Subject: [linux-lvm] vgimport without vgexport (hardware crash)
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

------_=_NextPart_001_01C88911.2902ADA8
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We have a database server accessing a disk array. (Array supports only a
single host connection)

Should that server suffer a hardware failure, we'd like to connect up a
standby server to take its place.

So in the event of a bad hardware failure, I won't be able to unmount
the filesystems, vgchange -an, and vgexport the volume groups.

=20

Can I expect a vgscan and vgimport to work on the new server if I wasn't
able to run vgexport?  Any other data I would need to make this work?

I know in HP-UX you were able to run a vgexport in output mode only, and
give it a map file and you could then import using this map file in this
scenario.

=20

Thanks,

Taylor


------_=_NextPart_001_01C88911.2902ADA8
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
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>We have a database server accessing a disk array. =
(Array
supports only a single host connection)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Should that server suffer a hardware failure, =
we&#8217;d
like to connect up a standby server to take its =
place.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>So in the event of a bad hardware failure, I =
won&#8217;t be
able to unmount the filesystems, vgchange &#8211;an, and vgexport the =
volume
groups.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Can I expect a vgscan and vgimport to work on the new =
server
if I wasn&#8217;t &nbsp;able to run vgexport?&nbsp; Any other data I =
would need to make
this work?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I know in HP-UX you were able to run a vgexport in =
output
mode only, and give it a map file and you could then import using this =
map file
in this scenario.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><st1:City w:st=3D"on"><st1:place w:st=3D"on"><font =
size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Taylor</span></font></st1:pl=
ace></st1:City><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

</body>

</html>

------_=_NextPart_001_01C88911.2902ADA8--
