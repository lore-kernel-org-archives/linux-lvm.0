Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0L1tD120716
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 20:55:13 -0500
Received: from mail.packetmotion.com (66-147-215-243.focaldata.net
	[66.147.215.243] (may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0L1t1XL032266
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 20:55:06 -0500
Received: from pmi00exf00.us.packetmotion.com (unknown [66.147.215.243])
	by mail.packetmotion.com (Postfix) with ESMTP id 5A4D1E0082
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 17:53:54 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C61E2D.939CF3DB"
Date: Fri, 20 Jan 2006 17:54:12 -0800
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B423CE6@pmi00exf00.us.packetmotion.com>
From: "Alex Chen" <achen@packetmotion.com>
Subject: [linux-lvm] Difference in LVM and LVM2 and their strength/weakness
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

------_=_NextPart_001_01C61E2D.939CF3DB
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings,

  I am tasked to investigate the differences between LVM and LVM2.  I am
new to LVM so it would be greatly appreciated if someone can explain or
point me to the right direction for the following questions:

=20

1.	What does LVM2 have that is not available in LVM?  Or is it a
only better architectured implementation of LVM?
2.	Which version of Red Hat enterprise system uses which LVM?  And
does the user need to do any configuration during installation?
3.	If LVM2 is definitely better than LVM, how stable is it?

=20

Thanks.

Alex


------_=_NextPart_001_01C61E2D.939CF3DB
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
 /* Font Definitions */
 @font-face
	{font-family:PMingLiU;
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 3 0 0 0 0 0 0 0;}
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
 /* List Definitions */
 @list l0
	{mso-list-id:425539588;
	mso-list-type:hybrid;
	mso-list-template-ids:38019660 67698703 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Greetings,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; I am tasked to investigate the differences =
between
LVM and LVM2.&nbsp; I am new to LVM so it would be greatly appreciated =
if
someone can explain or point me to the right direction for the following =
questions:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<ol style=3D'margin-top:0in' start=3D1 type=3D1>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>What does LVM2 have =
that is not
     available in LVM? &nbsp;Or is it a only better architectured =
implementation
     of LVM?<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>Which version of Red =
Hat
     enterprise system uses which LVM? &nbsp;And does the user need to =
do any
     configuration during installation?<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>If LVM2 is definitely =
better
     than LVM, how stable is it?<o:p></o:p></span></font></li>
</ol>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Alex<o:p></o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C61E2D.939CF3DB--
