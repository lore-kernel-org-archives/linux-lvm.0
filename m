Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0R03l110338
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 19:03:47 -0500
Received: from birao.terra.com.br (birao.terra.com.br [200.176.10.197])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0R03k49003623
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 19:03:46 -0500
Received: from buvuma.terra.com.br (buvuma.terra.com.br [200.176.10.12])
	by birao.terra.com.br (Postfix) with ESMTP id C097D108C49A
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 22:03:44 -0200 (BRST)
Received: from AIT0002 (mail.expressojundiai.com.br [200.246.100.190])
	(authenticated user rodolphopicolo)
	by buvuma.terra.com.br (Postfix) with ESMTP id 46F017A40FC
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 22:03:41 -0200 (BRST)
From: "Rodolpho" <rodolphopicolo@terra.com.br>
Date: Thu, 26 Jan 2006 22:03:48 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0010_01C622C4.6C606970"
Message-Id: <20060127000341.46F017A40FC@buvuma.terra.com.br>
Subject: [linux-lvm] pvcreate and Volume Id
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

------=_NextPart_000_0010_01C622C4.6C606970
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

      Hi All,

      I'm, for the first time, installing LVM1 on slackware 10.2, and I one
doubt.

 

      pvcreate sets the same Volume Id  for all hard drives?

 

      With a exemple:

 

      I have a server with 3 scsi hard drives: sda 32Gb, sdb 74Gb e sdc
74Gb. I created a Physical Volume with sdb and sdc, because sda will not be
an lvm, so:

 

      pvcreate /dev/sdb

      pvcarete /dev/sdc

 

      When I turn on the server, lilo says that the Volume Id is duplicated,
which is true, and I confirmed with lilo -T vol-ID.

 

 

Thanks, All

Rodolpho


------=_NextPart_000_0010_01C622C4.6C606970
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
span.EstiloDeEmail17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DPT-BR link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hi =
All,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:
"Courier New"'>I&#8217;m, for the first time, installing LVM1 on =
slackware 10.2,
and I one doubt.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pvcreate
sets the same Volume Id &nbsp;for all hard =
drives?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With
a exemple:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I
have a server with 3 scsi hard drives: sda 32Gb, sdb 74Gb e sdc 74Gb. I =
created
a Physical Volume with sdb and sdc, because sda will not be an lvm, =
so:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pvcreate
/dev/sdb<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pvcarete
/dev/sdc<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When
I turn on the server, lilo says that the Volume Id is duplicated, which =
is
true, and I confirmed with lilo &#8211;T =
vol-ID.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier New"'>Thanks, =
All<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>Rodolpho</span></font><font
size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

</body>

</html>

------=_NextPart_000_0010_01C622C4.6C606970--
