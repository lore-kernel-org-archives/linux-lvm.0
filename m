Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8NHPNr01669
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:25:23 -0400
Received: from mailhub.lss.emc.com (mailhub.lss.emc.com [168.159.2.31])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8NHPHEd012095
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:25:17 -0400
Received: from corpusic3.corp.emc.com (corpusic3.corp.emc.com [10.254.64.109])
	by mailhub.lss.emc.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	i8NHPDJa010069
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:25:14 -0400 (EDT)
Message-ID: <54E90801719C734E9969C98D40DE1E860836A89D@corpusmx2.corp.emc.com>
From: lemons_terry@emc.com
Date: Thu, 23 Sep 2004 13:25:12 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4A192.489BEDBC"
Subject: [linux-lvm] Extending a LVM2 strip set
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: Zhong_Jie@emc.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4A192.489BEDBC
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

=20

http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html
<http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html>  states:

=20

"In LVM 2, striped LVs can be extended by concatenating another set of
devices onto the end of the first set. So you can get into a situation =
where
your LV is a 2 stripe set concatenated with a linear set concatenated =
with a
4 stripe set. Are you confused yet?"

=20

As a matter of fact, I am!

=20

I need to start with a 2 disk (therefore, 2 stripe) logical volume, =
that I
later extend with 2 more disks.  How is this done?

=20

Thanks

tl

=20

Terry Lemons

CLARiiON Applications Integration Engineering

EMC=B2                =20

where information lives

=20

4400 Computer Drive, MS D239

Westboro MA 01580

Phone: 508 898 7312

Email:  Lemons_Terry@emc.com <mailto:Lemons_Terry@emc.com>=20

=20


------_=_NextPart_001_01C4A192.489BEDBC
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Terminal;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Garamond;
	panose-1:2 2 4 4 3 3 1 1 8 3;}
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
	{font-family:Arial;
	color:teal;
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

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>Hi</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'><a
href=3D"http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html">http://www.tld=
p.org/HOWTO/LVM-HOWTO/mapmode.html</a>
states:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>"</span></font>In LVM 2, striped =
LVs
can be extended by concatenating another set of devices onto the end of =
the
first set. So you can get into a situation where your LV is a 2 stripe =
set
concatenated with a linear set concatenated with a 4 stripe set. Are =
you confused
yet?<font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:teal'>"</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>As a matter of fact, I =
am!</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>I need to start with a 2 disk =
(therefore,
2 stripe) logical volume, that I later extend with 2 more disks. =A0How =
is this
done?</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>Thanks</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>tl</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dteal face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:teal'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma;color:navy'>Terry Lemons</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma;color:navy'>CLARiiON Applications Integration
Engineering</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.25in'><b><font size=3D6 =
color=3Dnavy
face=3DGaramond><span =
style=3D'font-size:26.0pt;font-family:Garamond;color:navy;
font-weight:bold'>EMC=B2&nbsp; </span></font></b><b><font color=3Dnavy =
face=3DArial><span
style=3D'font-family:Arial;color:navy;font-weight:bold'>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></b></p>

<p class=3DMsoNormal><b><font size=3D1 color=3Dteal face=3DArial><span
style=3D'font-size:9.0pt;font-family:Arial;color:teal;font-weight:bold'>=
where
information lives</span></font></b></p>

<p class=3DMsoNormal><font size=3D1 color=3Dblack face=3DTahoma><span =
style=3D'font-size:
9.0pt;font-family:Tahoma;color:black'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma;color:navy'>4400 Computer Drive, MS =
D239</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma;color:navy'>Westboro MA =
01580</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma;color:navy'>Phone: 508 898 =
7312</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma;color:navy'>Email:&nbsp; <a
href=3D"mailto:Lemons_Terry@emc.com">Lemons_Terry@emc.com</a></span></fo=
nt></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C4A192.489BEDBC--
