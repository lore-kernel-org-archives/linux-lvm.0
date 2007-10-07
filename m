Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l97G7sG8032509
	for <linux-lvm@redhat.com>; Sun, 7 Oct 2007 12:07:54 -0400
Received: from fmmailgate02.web.de (fmmailgate02.web.de [217.72.192.227])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l97G7fWb003196
	for <linux-lvm@redhat.com>; Sun, 7 Oct 2007 12:07:42 -0400
Received: from smtp05.web.de (fmsmtp05.dlan.cinetic.de [172.20.4.166])
	by fmmailgate02.web.de (Postfix) with ESMTP id 8567AA29A533
	for <linux-lvm@redhat.com>; Sun,  7 Oct 2007 18:07:36 +0200 (CEST)
Received: from [84.153.28.40] (helo=sandropc)
	by smtp05.web.de with asmtp (WEB.DE 4.108 #197) id 1IeYfG-0002sD-00
	for linux-lvm@redhat.com; Sun, 07 Oct 2007 18:07:34 +0200
From: "Sandro Steger" <stegersandro@web.de>
Date: Sun, 7 Oct 2007 18:07:42 +0200
Message-ID: <000001c808fc$31cfc560$02b2a8c0@sandropc>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C8090C.F55A1C00"
Sender: stegersandro@web.de
Subject: [linux-lvm] LVM Specifications
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

------=_NextPart_000_0001_01C8090C.F55A1C00
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

I try to write a LVM driver for Windows, because I haven=92t found a =
tool
which is able to mount LVM devices. Unfortunately, I haven=92t found =
documents
with details on the binary structure of LVM devices, expected behaviour =
or
encoding. I admit I haven=92t taken a look into the original source =
code.
That=92s why I can=92t estimate the effort writing a new driver (and if =
I have
to a document on its structure).

=20

If someone has some useful information on its exact functionality please =
let
me know.

=20

Best regards,

=20

Sandro Steger


No virus found in this outgoing message.
Checked by AVG Free Edition.=20
Version: 7.5.488 / Virus Database: 269.14.3/1054 - Release Date: =
06.10.2007
19:12
=20

------=_NextPart_000_0001_01C8090C.F55A1C00
Content-Type: text/html;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dwindows-1250">


<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceName"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceType"/>
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
span.E-MailFormatvorlage18
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:1984507561;
	mso-list-template-ids:2122119856;
	mso-list-style-name:Normal;}
@list l0:level1
	{mso-level-number-format:alpha-upper;
	mso-level-tab-stop:14.2pt;
	mso-level-number-position:left;
	margin-left:19.85pt;
	text-indent:-19.85pt;}
@list l0:level2
	{mso-level-tab-stop:25.5pt;
	mso-level-number-position:left;
	margin-left:25.5pt;
	text-indent:-11.3pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>

</head>

<body lang=3DDE link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I try to write a LVM driver for Windows, =
because I
haven&#8217;t found a tool which is able to <st1:place =
w:st=3D"on"><st1:PlaceType
 w:st=3D"on">mount</st1:PlaceType> <st1:PlaceName =
w:st=3D"on">LVM</st1:PlaceName></st1:place>
devices. Unfortunately, I haven&#8217;t found documents with details on =
the binary
structure of LVM devices, expected behaviour or encoding. I admit I =
haven&#8217;t
taken a look into the original source code. That&#8217;s why I =
can&#8217;t
estimate the effort writing a new driver (and if I have to a document on =
its
structure).<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>If someone has some useful information on its =
exact
functionality please let me know.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Best regards,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Sandro Steger<o:p></o:p></span></font></p>

</div>

</body>

</html>
<BR>

<P><FONT SIZE=3D2>No virus found in this outgoing message.<BR>
Checked by AVG Free Edition.<BR>
Version: 7.5.488 / Virus Database: 269.14.3/1054 - Release Date: =
06.10.2007 19:12<BR>
</FONT> </P>

------=_NextPart_000_0001_01C8090C.F55A1C00--
