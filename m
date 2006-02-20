Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1KJVR132340
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2006 14:31:27 -0500
Received: from mail.packetmotion.com (66-147-215-243.focaldata.net
	[66.147.215.243] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1KJVPc7023581
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2006 14:31:25 -0500
Received: from pmi00exf00.us.packetmotion.com (unknown [66.147.215.243])
	by mail.packetmotion.com (Postfix) with ESMTP id 168C8E00A2
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2006 11:29:02 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C63653.D828060E"
Date: Mon, 20 Feb 2006 11:28:56 -0800
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B485D23@pmi00exf00.us.packetmotion.com>
From: "Mitchell Christensen" <mchristensen@packetmotion.com>
Subject: [linux-lvm] Using LVM to snapshot Oracle
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

------_=_NextPart_001_01C63653.D828060E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey,

=20

I was wondering about the feasibility of using the LVM snapshot facility
to backup/restore Oracle.  Does this make sense?

=20

A few issues that I am concerned about are,

*	Would it be any better/faster/cheaper than RMAN (the standard
Oracle backup facility)?
*	Would hot-backups be possible, or would the database need to be
in a quiescent state?
*	Is anyone else out there doing this (or anything similar)?
*	Is it reasonable to expect that I could simply take a snapshot
of all Oracle related files and be able to restore a viable Oracle
instance from that snapshot?

Any feedback and/or advice would be greatly appreciated.

=20

-Mitch


------_=_NextPart_001_01C63653.D828060E
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	{mso-list-id:970014495;
	mso-list-type:hybrid;
	mso-list-template-ids:-1848613240 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
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
font-family:Arial'>Hey,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I was wondering about the feasibility of using the =
LVM
snapshot facility to backup/restore Oracle.&nbsp; Does this make =
sense?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>A few issues that I am concerned about =
are,<o:p></o:p></span></font></p>

<ul style=3D'margin-top:0in' type=3Ddisc>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>Would it be any =
better/faster/cheaper
     than RMAN (the standard Oracle backup =
facility)?<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>Would hot-backups be =
possible,
     or would the database need to be in a quiescent =
state?<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>Is anyone else out =
there doing
     this (or anything similar)?<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'><font size=3D2 =
face=3DArial><span
     style=3D'font-size:10.0pt;font-family:Arial'>Is it reasonable to =
expect that
     I could simply take a snapshot of all Oracle related files and be =
able to
     restore a viable Oracle instance from that =
snapshot?<o:p></o:p></span></font></li>
</ul>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Any feedback and/or advice would be greatly =
appreciated.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-Mitch<o:p></o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C63653.D828060E--
