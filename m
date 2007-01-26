Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0QGtXTn021407
	for <linux-lvm@redhat.com>; Fri, 26 Jan 2007 11:55:33 -0500
Received: from mailsrv.s3group.com (tales.s3group.com [193.120.90.35])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0QGtWEU031529
	for <linux-lvm@redhat.com>; Fri, 26 Jan 2007 11:55:33 -0500
Received: from exduba.dublin.ad.s3group.com (host-89-100.s3group.com
	[193.120.89.100] (may be forged))
	by mailsrv.s3group.com  with ESMTP id l0QGtPuC025631
	for <linux-lvm@redhat.com>; Fri, 26 Jan 2007 16:55:26 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C7416A.C67F36FE"
Date: Fri, 26 Jan 2007 16:55:25 -0000
Message-ID: <C611E2BD39743E4E81081CB440F0D0FFD0753E@exduba.dublin.ad.s3group.com>
From: "Bob Flynn" <Bob.Flynn@s3group.com>
Subject: [linux-lvm] lvm snapshot query
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

------_=_NextPart_001_01C7416A.C67F36FE
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

I have a question regarding LVM snapshots to provide multiple snapshots
of a directory during a day/week.

=20

Having looked around, it seems an ideal solution to a problem I am
looking at, but I am concerned about performance.

=20

Looking at http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html it
seems to indicate that is the snapshot will be a performance issue until
its released. I don't think I fully understand why ?

=20

Is it so it can rollback the writes to get to the original snapshot ?
The reason I ask is that on something like a netapp, you have the same
functionality without the performance penalty implied in the snapshot
discussion.

=20

=20

If I want to have multiple snapshots through the day/week. Is using LVM
snapshots alone a good solution is should some rsync solution be used as
well to avoid the performance hit ? Or can LVM on its own provide a
solution without a performance hit ?

=20

Thanks for any clarification. Apologies if this is the incorrect forum
for this, but I am specifically concerned about LVM implementation as in
Nahant.

=20

-Bob

=20



The information contained in this e-mail and in any attachments is confidential and is designated solely for the attention of the intended recipient(s). If you are not an intended recipient, you must not use, disclose, copy, distribute or retain this e-mail or any part thereof. If you have received this e-mail in error, please notify the sender by return e-mail and delete all copies of this e-mail from your computer system(s).
Please direct any additional queries to: communications@s3group.com.
Thank You.
------_=_NextPart_001_01C7416A.C67F36FE
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered)">
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
	{font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-GB link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>Hi,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>I have a question regarding LVM snapshots to =
provide multiple
snapshots of a directory during a day/week.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>Having looked around, it seems an ideal =
solution to a
problem I am looking at, but I am concerned about =
performance.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>Looking at <a
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html"
title=3D"blocked::http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html">=
http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html</a>
it seems to indicate that is the snapshot will be a performance issue =
until its
released. I don&#8217;t think I fully understand why ?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>Is it so it can rollback the writes to get to =
the
original snapshot ? The reason I ask is that on something like a netapp, =
you
have the same functionality without the performance penalty implied in =
the
snapshot discussion.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:18.0pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-IE =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>If I want to have multiple snapshots through =
the
day/week. Is using LVM snapshots alone a good solution is should some =
rsync
solution be used as well to avoid the performance hit ? Or can LVM on =
its own
provide a solution without a performance hit ?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>Thanks for any clarification. Apologies if =
this is
the incorrect forum for this, but I am specifically concerned about LVM
implementation as in Nahant.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-IE =
style=3D'font-size:
10.0pt;font-family:Arial'>-Bob</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

<BR><HR>
The information contained in this e-mail and in any attachments is confidential and is designated solely for the attention of the intended recipient(s). If you are not an intended recipient, you must not use, disclose, copy, distribute or retain this e-mail or any part thereof. If you have received this e-mail in error, please notify the sender by return e-mail and delete all copies of this e-mail from your computer system(s).
Please direct any additional queries to: communications@s3group.com.
Thank You.
<BR><HR><BR></body>

</html>

------_=_NextPart_001_01C7416A.C67F36FE--
