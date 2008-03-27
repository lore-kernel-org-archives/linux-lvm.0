Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2RMRugM029451
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2008 18:27:57 -0400
Received: from extmail2.iongeo.com (extmail2.iongeo.com [209.163.254.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2RMRIAX002611
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2008 18:27:18 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C89059.B3220639"
Date: Thu, 27 Mar 2008 17:27:07 -0500
Content-Transfer-Encoding: 7bit
Message-ID: <C35C6F42A97E0C468C32F3AEE46CFF640401D788@digiexch03.iodigi.ioroot.tld>
From: "Nicholas Muguira" <Nicholas.Muguira@iongeo.com>
Subject: [linux-lvm] LVM Questions
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

------_=_NextPart_001_01C89059.B3220639
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am trying to judge the ability of LVM to address a problem I currently
have, and I have few questions:

=20

1)       Is there a way to configure LVM so that the data on remaining
PV's in a VG are is accessible after a PV fails?

2)       Is there a way to configure LVM so that the LV will still be
accesible and readable/writable if a PV fails while in use?

3)       Assuming groupings of external drives, can a LV be created and
exported on each group of the same name and then imported into different
systems. For example assuming 10 drives, drives a-e are in group 1 and
drives f-j are in group 2. Using System A with drives a-e connect to
/dev/sda-e create a parittion that spans the entire drive for each
drive. Create a PV on each partition (/dev/sd[a-e]1). Create a VG named
test with all partitions (/dev/sd[a-e]1). Create a LV that covers all of
the VG test. Mount the LV and format it (ext3 in this case). Umount and
vgexport the vg test. Repeat the steps with drives f-j with same VG and
LV names. Connect group 1 to System B and vgimport VG test, create LV
with it and mount the filesystem. Umount the filesystem and disconnect
group1. Connect group 2 to System B and vgimport VG test and mount the
filesystem (using LV previously created)?

=20

Raid is unavailable due to already deployed hardware, and I realize that
LVM is not Raid and will not give me a means to recover the data on the
failed HDD.

=20

Thanks,
Nick

This email and any files transmitted with it are confidential and are =
intended solely for the use of the individual or entity to whom they are =
addressed.  If you are not the original recipient or the person =
responsible for delivering the email to the intended recipient, be =
advised that you have received this email in error, and that any use, =
dissemination, forwarding, printing, or copying of this email is =
strictly prohibited. If you received this email in error, please =
immediately notify the sender and delete the original.



------_=_NextPart_001_01C89059.B3220639
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
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
	{mso-list-id:2097749794;
	mso-list-type:hybrid;
	mso-list-template-ids:-1925392666 67698705 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:1.0in;
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
font-family:Arial'>I am trying to judge the ability of LVM to address a =
problem
I currently have, and I have few questions:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-list:Ignore'>1)<font size=3D1 face=3D"Times New =
Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Is there a
way to configure LVM so that the data on remaining PV&#8217;s in a VG =
are is
accessible after a PV fails?<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-list:Ignore'>2)<font size=3D1 face=3D"Times New =
Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Is there a
way to configure LVM so that the <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">LV</st1:place></st1:City>
will still be accesible and readable/writable if a PV fails while in =
use?<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-list:Ignore'>3)<font size=3D1 face=3D"Times New =
Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Assuming
groupings of external drives, can a <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">LV</st1:place></st1:City>
be created and exported on each group of the same name and then imported =
into
different systems. For example assuming 10 drives, drives a-e are in =
group 1
and drives f-j are in group 2. Using System A with drives a-e connect to
/dev/sda-e create a parittion that spans the entire drive for each =
drive.
Create a PV on each partition (/dev/sd[a-e]1). Create a VG named test =
with all
partitions (/dev/sd[a-e]1). Create a <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">LV</st1:place></st1:City>
that covers all of the VG test. Mount the <st1:City =
w:st=3D"on"><st1:place w:st=3D"on">LV</st1:place></st1:City>
and format it (ext3 in this case). Umount and vgexport the vg test. =
Repeat the
steps with drives f-j with same VG and <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">LV</st1:place></st1:City>
names. Connect group 1 to System B and vgimport VG test, create =
<st1:City
w:st=3D"on"><st1:place w:st=3D"on">LV</st1:place></st1:City> with it and =
mount the
filesystem. Umount the filesystem and disconnect group1. Connect group 2 =
to
System B and vgimport VG test and mount the filesystem (using <st1:place =
w:st=3D"on"><st1:City
 w:st=3D"on">LV</st1:City></st1:place> previously =
created)?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Raid is unavailable due to already deployed hardware, =
and I
realize that LVM is not Raid and will not give me a means to recover the =
data
on the failed HDD.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<br>
Nick<o:p></o:p></span></font></p>

</div>

<div><p><font size=3D"2">
This email and any files transmitted with it are confidential and are =
intended solely for the use of the individual or entity to whom they are =
addressed.  If you are not the original recipient or the person =
responsible for delivering the email to the intended recipient, be =
advised that you have received this email in error, and that any use, =
dissemination, forwarding, printing, or copying of this email is =
strictly prohibited. If you received this email in error, please =
immediately notify the sender and delete the original.
</font></p></div>
</body>

</html>

------_=_NextPart_001_01C89059.B3220639--
