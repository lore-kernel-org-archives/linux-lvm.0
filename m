Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7AIE49Q007792
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 14:14:04 -0400
Received: from smtp-rok.spirentcom.com (smtp-rok.spirentcom.com
	[208.22.58.135])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7AIE3hZ009766
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 14:14:03 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6BCA8.BF78CE05"
Date: Thu, 10 Aug 2006 14:13:57 -0400
Message-ID: <700E4C1906A0F34DB4C6ABC47B3E8FA5125E77@spcrokexcbe01.AD.SPIRENTCOM.COM>
From: "Musard, Kris" <Kris.Musard@spirentcom.com>
Subject: [linux-lvm] converting PV from md to non-md
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

------_=_NextPart_001_01C6BCA8.BF78CE05
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am trying to "undo" the software raid setup on a system.  I have been
able to simply change the partition type from "linux raid auto detect"
to "linux" and mount the filesystems which were previously formatted on
top of the md device directly to the underlying /dev/hda[0-9] device.
The PV was originally added as /dev/md1 to the VG.  I tried setting the
partition type from "linux raid autodetect" to "linux LVM" but vgscan
and vgimport both give an error about the PV is part of a multiple
device.  Does anyone have a procedure for going from LVM on top of linux
md software raid to LVM without md?  Any help would be much appreciated.

=20

Thank You


<DIV><FONT size=3D"1">

E-mail confidentiality.
--------------------------------
This e-mail contains confidential and / or privileged information belongi=
ng to Spirent Communications plc, its affiliates and / or subsidiaries. I=
f you are not the intended recipient, you are hereby notified that any di=
sclosure, copying, distribution and / or the taking of any action based u=
pon reliance on the contents of this transmission is strictly forbidden. =
If you have received this message in error please notify the sender by re=
turn e-mail and delete it from your system. If you require assistance, pl=
ease contact our IT department at helpdesk@spirentcom.com.

Spirent Communications plc,
Spirent House, Crawley Business Quarter, Fleming Way, Crawley, West Susse=
x, RH10 9QL, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Spirent House, Crawley Business Quarter, Fleming Way, Crawl=
ey, West Sussex, RH10 9QL, United Kingdom=20

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300=20

</FONT></DIV>

------_=_NextPart_001_01C6BCA8.BF78CE05
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:=
schemas-microsoft-com:office:word" xmlns=3D"http://www.w3.org/TR/REC-html=
40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii"=
>
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
	color:windowtext;}
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size=
:10.0pt;
font-family:Arial'>I am trying to &#8220;undo&#8221; the software raid se=
tup on
a system.&nbsp; I have been able to simply change the partition type from=
 &#8220;linux
raid auto detect&#8221; to &#8220;linux&#8221; and mount the filesystems =
which
were previously formatted on top of the md device directly to the underly=
ing
/dev/hda[0-9] device. &nbsp;&nbsp;The PV was originally added as /dev/md1=
 to
the VG.&nbsp; I tried setting the partition type from &#8220;linux raid
autodetect&#8221; to &#8220;linux LVM&#8221; but vgscan and vgimport both=
 give
an error about the PV is part of a multiple device.&nbsp; Does anyone hav=
e a
procedure for going from LVM on top of linux md software raid to LVM with=
out md?&nbsp;
Any help would be much appreciated.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size=
:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span style=3D'font-size=
:10.0pt;
font-family:Arial'>Thank You<o:p></o:p></span></font></p>

</div>

<br><DIV><FONT size=3D"1"><br><br>E-mail confidentiality.<br>------------=
--------------------<br>This e-mail contains confidential and / or privil=
eged information belonging to Spirent Communications plc, its affiliates =
and / or subsidiaries. If you are not the intended recipient, you are her=
eby notified that any disclosure, copying, distribution and / or the taki=
ng of any action based upon reliance on the contents of this transmission=
 is strictly forbidden. If you have received this message in error please=
 notify the sender by return e-mail and delete it from your system. If yo=
u require assistance, please contact our IT department at helpdesk@spiren=
tcom.com.<br><br>Spirent Communications plc,<br>Spirent House, Crawley Bu=
siness Quarter, Fleming Way, Crawley, West Sussex, RH10 9QL, United Kingd=
om.<br>Tel No. +44 (0) 1293 767676<br>Fax No. +44 (0) 1293 767677<br><br>=
Registered in England Number 470893<br>Registered at Spirent House, Crawl=
ey Business Quarter, Fleming Way, Crawley, West Sussex, RH10 9QL, United =
Kingdom <br><br>Or if within the US,<br><br>Spirent Communications,<br>26=
750 Agoura Road, Calabasas, CA, 91302, USA.<br>Tel No. 1-818-676- 2300 <b=
r><br></FONT></DIV></body>

</html>

------_=_NextPart_001_01C6BCA8.BF78CE05--
