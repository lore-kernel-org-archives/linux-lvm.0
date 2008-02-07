Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m17Ed9kM024896
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 09:39:09 -0500
Received: from mail180.messagelabs.com (mail180.messagelabs.com
	[85.158.139.51])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id m17Ecc45001325
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 09:38:38 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C86997.1C98CEB7"
Date: Thu, 7 Feb 2008 14:38:31 -0000
Message-ID: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com>
From: "Gerrard Geldenhuis" <Gerrard.Geldenhuis@datacash.com>
Subject: [linux-lvm] Docs on clustererd option of vgcreate
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

------_=_NextPart_001_01C86997.1C98CEB7
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi=20

I am after a bit more documentation about the usage of the=20

--clustered option in vgcreate.

=20

At the moment I don't have a spare san drive with which I can
experiment. My understanding is that you would set this flag when
different hosts(nodes) connect to the same storage area typically a san
with lvm configured.=20

=20

I am after a bit more information describing this "clusterering"
functionality in lvm and how/where it is used. The man pages on lvm and
commands is a bit sparse and I am trawling through google results but
not with great success at the moment.

=20

Regards


------_=_NextPart_001_01C86997.1C98CEB7
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Hi <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I am after a bit more documentation about the =
usage
of the <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>--clustered option in =
vgcreate.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>At the moment I don&#8217;t have a spare san =
drive
with which I can experiment. My understanding is that you would set this =
flag
when different hosts(nodes) connect to the same storage area typically a =
san
with lvm configured. <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I am after a bit more information describing =
this &#8220;clusterering&#8221;
functionality in lvm and how/where it is used. The man pages on lvm and
commands is a bit sparse and I am trawling through google results but =
not with
great success at the moment.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Regards<o:p></o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C86997.1C98CEB7--
