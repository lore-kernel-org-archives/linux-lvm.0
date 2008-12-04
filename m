Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB4MiOEG012380
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 17:44:24 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB4Mi8YU016237
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 17:44:08 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id C2400130022
	for <linux-lvm@redhat.com>; Thu,  4 Dec 2008 16:44:08 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id B294713002B
	for <linux-lvm@redhat.com>; Thu,  4 Dec 2008 16:44:08 -0600 (CST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C95661.D0C9E2F5"
Date: Thu, 4 Dec 2008 16:44:07 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C232CAD@excs01.bucoks>
From: "James A. Dinkel" <jdinkel@bucoks.com>
Subject: [linux-lvm] volume group device nodes are left behind after
	removing a san snapshot
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


------_=_NextPart_001_01C95661.D0C9E2F5
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I had a san snapshot attached to a server with a volume group on it.  I
deactivated the snapshot, but the volume group node still exists at
/dev/vgname.

=20

I've tried pvscan and vgmknodes to try and get rid of it, but they
complain about not being able to read /dev/sdh1 and the node remains.
This is a problem because it will not let me create a new volume group
with that same name, and it must have the same name because it is part
of a script.

=20

I'm sure a reboot would get rid of it, but this is a 24/7 server and any
downtime is a huge ordeal.  If anyone knows how to force the removal of
the volume group without rebooting, it would be a big help.

=20

Thanks,=20

James Dinkel

=20


------_=_NextPart_001_01C95661.D0C9E2F5
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40"
xmlns:ns0=3D"urn:schemas-microsoft-com:office:smarttags">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I had a san snapshot attached to a server with a =
volume
group on it.&nbsp; I deactivated the snapshot, but the volume group node =
still
exists at /dev/vgname.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;ve tried pvscan and vgmknodes to try and get =
rid of
it, but they complain about not being able to read /dev/sdh1 and the =
node
remains. &nbsp;This is a problem because it will not let me create a new =
volume
group with that same name, and it must have the same name because it is =
part of
a script.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m sure a reboot would get rid of it, but this =
is a
24/7 server and any downtime is a huge ordeal.&nbsp; If anyone knows how =
to force
the removal of the volume group without rebooting, it would be a big =
help.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,</span></font>&nbsp;<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>James Dinkel<ns0:State w:insAuthor=3D"James Dinkel"
 w:insDate=3D"2008-12-04T16:35:00Z" w:endInsAuthor=3D"James Dinkel"
 w:endInsDate=3D"2008-12-04T16:35:00Z"><ns0:place w:insAuthor=3D"James =
Dinkel"
  w:insDate=3D"2008-12-04T16:35:00Z" w:endInsAuthor=3D"James Dinkel"
  =
w:endInsDate=3D"2008-12-04T16:35:00Z"></ns0:place></ns0:State></span></fo=
nt><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C95661.D0C9E2F5--
