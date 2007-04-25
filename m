Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3PHTh3q022001
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 13:29:43 -0400
Received: from pruche.dit.umontreal.ca (pruche.DIT.UMontreal.CA
	[132.204.246.22])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3PHTeeO002729
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 13:29:40 -0400
Received: from MAPIUDEM2.sim.umontreal.ca (sequoia.sim.umontreal.ca
	[10.125.12.35])
	by pruche.dit.umontreal.ca (8.13.7/8.13.7) with ESMTP id l3PHTYCA021354
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 13:29:39 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C7875F.35BC877D"
Date: Wed, 25 Apr 2007 13:28:57 -0400
Message-ID: <070FB8DB1EFA214292C54DCBECEB27CF058F1D@MAPIUDEM2.sim.umontreal.ca>
From: "Boudreau Luc" <luc.boudreau@umontreal.ca>
Subject: [linux-lvm] LVM on RAID 5
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

------_=_NextPart_001_01C7875F.35BC877D
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there.

=20

We're planning to setup a material RAID 5 array and then setup LVM on
it. Is there any known gotchas or anything specific to look for with
such a configuration ? What performance alterations should we encounter
?

=20

=20

=20

Luc Boudreau


------_=_NextPart_001_01C7875F.35BC877D
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DFR-CA link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal>Hi there.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>We&#8217;re planning to setup a material RAID 5 =
array and
then setup LVM on it. Is there any known gotchas or anything specific to =
look
for with such a configuration ? What performance alterations should we
encounter ?<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Times =
New Roman","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Times =
New Roman","serif"'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Times =
New Roman","serif"'>Luc
Boudreau</span><o:p></o:p></p>

</div>

</body>

</html>

------_=_NextPart_001_01C7875F.35BC877D--
