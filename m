Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k139Ua121171
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 04:30:36 -0500
Received: from loncoche.terra.com.br (loncoche.terra.com.br [200.176.10.196])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k139UXma013919
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 04:30:34 -0500
Received: from ambrose.terra.com.br (ambrose.terra.com.br [200.176.10.10])
	by loncoche.terra.com.br (Postfix) with ESMTP id 97003D50012
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 07:30:32 -0200 (BRST)
Received: from AIT0002 (mail.expressojundiai.com.br [200.246.100.190])
	(authenticated user rodolphopicolo)
	by ambrose.terra.com.br (Postfix) with ESMTP id 0BF9B3C1C074
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 07:30:31 -0200 (BRST)
From: "Rodolpho" <rodolphopicolo@terra.com.br>
Date: Fri, 3 Feb 2006 07:30:55 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C62893.C63C6C30"
In-Reply-To: 
Message-Id: <20060203093031.0BF9B3C1C074@ambrose.terra.com.br>
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

------=_NextPart_000_0007_01C62893.C63C6C30
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

      Hi All,

      I'm, for the first time, configuring LVM1 on slackware 10.2, and I
have one doubt.

 

      pvcreate sets the same Volume Id  for all hard disks?

 

      With a exemple:

 

      I have a server with 3 scsi hard disks: sda 32Gb, sdb 74Gb e sdc 74Gb.
I created a Physical Volume with sdb and sdc, because sda will not be an
lvm, so:

 

      pvcreate /dev/sdb

      pvcarete /dev/sdc

 

      When I turn on the server, lilo says that the Volume Id is duplicated,
which is true, and I confirmed with lilo -T vol-ID.

 

            Is there something wrong with my configuration or should I look
for something to treat my lilo???

 

Thanks, All

Rodolpho


------=_NextPart_000_0007_01C62893.C63C6C30
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
	{mso-style-type:personal;
	font-family:Arial;
	color:windowtext;}
span.EstiloDeEmail18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
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
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Hi All,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
I&#8217;m, for the first time, configuring LVM1 on slackware 10.2, and I =
have one
doubt.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
pvcreate sets the same Volume Id &nbsp;for all hard =
disks?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
With a exemple:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
I have a server with 3 scsi hard disks: sda 32Gb, sdb 74Gb e sdc 74Gb. I
created a Physical Volume with sdb and sdc, because sda will not be an =
lvm, so:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
pvcreate /dev/sdb<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
pvcarete /dev/sdc<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
When I turn on the server, lilo says that the Volume Id is duplicated, =
which is
true, and I confirmed with lilo &#8211;T =
vol-ID.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Is
there something wrong with my configuration or should I look for =
something to
treat my lilo???<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;<o:p></o:p></span></font></p>

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

------=_NextPart_000_0007_01C62893.C63C6C30--
