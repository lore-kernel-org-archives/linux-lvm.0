Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3QMtNxv008606
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2006 18:55:23 -0400
Received: from sccrmhc11.comcast.net (sccrmhc11.comcast.net [63.240.77.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3QMtGG1029328
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2006 18:55:16 -0400
From: "Greg Hartzog" <glhartzog@comcast.net>
Date: Wed, 26 Apr 2006 18:55:08 -0400
Message-ID: <000601c66984$779e7230$640a0a0a@laptopoptimus>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C66962.F08CD230"
Subject: [linux-lvm] Cloning Logical Volumes
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

------=_NextPart_000_0007_01C66962.F08CD230
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello there folks.  I have a question.

 

I am looking for a better way of cloning logical volumes then creating a new
logical volume, identical to a source logical volume, and using "dd" to copy
data between the two logical volumes.

 

I would love to use dm-mirror to do this, but I do not think any interface
has been provided to do this yet.

 

All suggestions and ideas appreciated.

 

I am running lvm2-2.02.04-r1 & 2.6.15 kernel.

 

Thanks!

 


------=_NextPart_000_0007_01C66962.F08CD230
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
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
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

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'>Hello there folks.&nbsp; I have a =
question.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'>I am looking for a better way of cloning logical =
volumes
then creating a new logical volume, identical to a source logical =
volume, and
using &#8220;dd&#8221; to copy data between the two logical =
volumes.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'>I would love to use dm-mirror to do this, but I do =
not think
any interface has been provided to do this =
yet.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'>All suggestions and ideas =
appreciated.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'>I am running lvm2-2.02.04-r1 &amp; 2.6.15 =
kernel.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'>Thanks!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0007_01C66962.F08CD230--
