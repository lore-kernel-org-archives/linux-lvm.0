Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2KDdUKj012444
	for <linux-lvm@redhat.com>; Tue, 20 Mar 2007 09:39:30 -0400
Received: from tumbleweed1.certmail.caregroup.org (tumbleweed1.caregroup.org
	[134.174.120.81])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2KDdS6W016738
	for <linux-lvm@redhat.com>; Tue, 20 Mar 2007 09:39:29 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Mounting part of a logical volume?
Date: Tue, 20 Mar 2007 09:39:18 -0400
Message-ID: <EED09BB41EE72044BCEE8156094FCE8F01838883@EVS4.its.caregroup.org>
In-Reply-To: <8C9360FAE05563F-EA0-3661@WEBMAIL-RC11.sysops.aol.com>
References: <8C9360FAE05563F-EA0-3661@WEBMAIL-RC11.sysops.aol.com>
From: mghofran@caregroup.harvard.edu
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C76AF5.2868D593"
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

------_=_NextPart_001_01C76AF5.2868D593
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi;

=20

Since you know you overwrote one disk and no hope of recovery on that,
do a vgreduce to get the disk out of the volume group and then try to
mount your lvols. It may let you do it if enough extents are available
via your second disk.

=20

=20

=20

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of p3tr0x@aol.com
Sent: Friday, March 16, 2007 2:26 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Mounting part of a logical volume?

=20

Hi,

I have a Fedora Core 6 system with a root volume group (VolGroup00)
spanning 2 physical drives. Through my own negligence the first drive
got overwritten when the system was rebooted with a bootable cd in the
drive. This effectively reformated the primary drive but left the second
drive intact. What I would like to do is mount the second drive to see
if there is any data worth retrieving before rebuilding the system.=20

I can boot onto a rescue CD so I can access the drive through lvm.
lvdisplay reports that it cannot find all of the physical volumes which
makes sense as the other drive was reformatted. pvscan also reports a
missing drive.=20

Can anyone give me a pointer on what might be my next step?

Thanks!
Pete=20

________________________________

AOL now offers free email to everyone. Find out more about what's free
from AOL at AOL.com
<http://pr.atwola.com/promoclk/1615326657x4311227241x4298082137/aol?redi
r=3Dhttp://www.aol.com> .


------_=_NextPart_001_01C76AF5.2868D593
Content-Type: text/html;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{color:blue;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Hi;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Since you know you overwrote one =
disk and
no hope of recovery on that, do a vgreduce to get the disk out of the =
volume
group and then try to mount your lvols. It may let you do it if enough =
extents
are available via your second disk.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of </span></b>p3tr0x@aol.com<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, March 16, =
2007 2:26
PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
linux-lvm@redhat.com<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> [linux-lvm] =
Mounting part
of a logical volume?</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Hi,<br>
<br>
I have a Fedora Core 6 system with a root volume group (VolGroup00) =
spanning 2
physical drives. Through my own negligence the first drive got =
overwritten when
the system was rebooted with a bootable cd in the drive. This =
effectively
reformated the primary drive but left the second drive intact. What I =
would
like to do is mount the second drive to see if there is any data worth
retrieving before rebuilding the system. <br>
<br>
I can boot onto a rescue CD so I can access the drive through lvm. =
lvdisplay
reports that it cannot find all of the physical volumes which makes =
sense as
the other drive was reformatted. pvscan also reports a missing drive. =
<br>
<br>
Can anyone give me a pointer on what might be my next step?<br>
<br>
Thanks!<br>
Pete <o:p></o:p></span></font></p>

</div>

<div>

<div class=3DMsoNormal align=3Dcenter =
style=3D'margin-top:7.5pt;text-align:center'><font
size=3D3 face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter>

</span></font></div>

<p class=3DMsoNormal style=3D'margin-top:7.5pt'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>AOL now offers free email to everyone. Find =
out more
about what's free from AOL at <a
href=3D"http://pr.atwola.com/promoclk/1615326657x4311227241x4298082137/ao=
l?redir=3Dhttp://www.aol.com"
target=3D"_blank"><b><span =
style=3D'font-weight:bold'>AOL.com</span></b></a>.<o:p></o:p></span></fon=
t></p>

</div>

</div>

</body>

</html>

------_=_NextPart_001_01C76AF5.2868D593--
