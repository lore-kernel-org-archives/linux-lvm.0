Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7C6pRa23531
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 02:51:27 -0400
Received: from ebb01.tietoenator.com (ebb01.tietoenator.com [193.12.180.61])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7C6pPe1020920
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 02:51:25 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C48038.C2E8B437"
Date: Thu, 12 Aug 2004 09:51:14 +0300
Message-ID: <30BB5E9998236744913B2C0E04D24D39061510CE@zonda.eu.tieto.com>
From: <Onni.Rautanen@tietoenator.com>
Subject: [linux-lvm] fix lost vgda
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C48038.C2E8B437
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a lvm system running with 3x80gb and 2x160gb disk and I was =
starting to do a transfer for the data to a raid5 system for some =
protection.

Accidentally when creating the partitions for the raid5 array I did it =
on the wrong machine =3D) and now I've lost the partition table/vgda for =
those 160gb disks in the lvm.

Is it possible to re-create the vgda from the remaining 80gb disks? Or =
is all my 550gb lost forever?

=20

=20

Onni Rautanen

System Specialist

=20

TietoEnator Corporation

Processing & Network

Direct: +358 3 235 9644

Mobile: +358 40 831 0742

Fax: +358 3 235 9030

E-mail: onni.rautanen@tietoenator.com

H=E4kil=E4polku 3 A, P.O. Box 262

FI-33101 TAMPERE, FINLAND

http://www.tietoenator.com <http://www.tietoenator.com/>=20

=20


------_=_NextPart_001_01C48038.C2E8B437
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"address"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"Street"/>
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
	{size:595.3pt 841.9pt;
	margin:70.85pt 2.0cm 70.85pt 2.0cm;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DFI link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I have a lvm system running with 3x80gb and =
2x160gb
disk and I was starting to do a transfer for the data to a raid5 system =
for
some protection.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Accidentally when creating the partitions for =
the
raid5 array I did it on the wrong machine =3D) and now I&#8217;ve lost =
the
partition table/vgda for those 160gb disks in the =
lvm.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Is it possible to re-create the vgda from the
remaining 80gb disks? Or is all my 550gb lost =
forever?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p class=3DMsoNormal><b><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray;font-weight:bold'>O=
nni
Rautanen<o:p></o:p></span></font></b></p>

<p class=3DMsoNormal><i><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray;font-style:italic'>=
System
Specialist<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray;font-style:italic'>=
<o:p>&nbsp;</o:p></span></font></i></p>

<p class=3DMsoNormal><b><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray;font-weight:bold'>T=
ietoEnator
Corporation<o:p></o:p></span></font></b></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray'>Processing &amp; =
Network<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray'>Direct: +358 3 =
235 9644<o:p></o:p></span></font></p>

<p class=3DMsoNormal><st1:City w:st=3D"on"><st1:place w:st=3D"on"><font =
size=3D1
  color=3Dgray face=3DArial><span lang=3DEN-GB =
style=3D'font-size:8.0pt;font-family:
  Arial;color:gray'>Mobile</span></font></st1:place></st1:City><font =
size=3D1
color=3Dgray face=3DArial><span lang=3DEN-GB =
style=3D'font-size:8.0pt;font-family:Arial;
color:gray'>: +358 40 831&nbsp;0742<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray'>Fax: +358 3 235 =
9030<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray'>E-mail:
onni.rautanen@tietoenator.com<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:8.0pt;font-family:Arial;color:gray'>H=E4kil=E4polku 3 =
A, <st1:address
w:st=3D"on"><st1:Street w:st=3D"on">P.O. Box</st1:Street> =
262</st1:address><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
style=3D'font-size:
8.0pt;font-family:Arial;color:gray'>FI-33101 TAMPERE, =
FINLAND<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 color=3Dgray face=3DArial><span =
style=3D'font-size:
8.0pt;font-family:Arial;color:gray'><a =
href=3D"http://www.tietoenator.com/"
title=3D"http://www.tietoenator.com/"><font color=3Dgray><span =
style=3D'color:gray'>http://www.tietoenator.com</span></font></a></span><=
/font><font
size=3D1 color=3Dgray face=3DArial><span =
style=3D'font-size:8.0pt;font-family:Arial;
color:gray'><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C48038.C2E8B437--
