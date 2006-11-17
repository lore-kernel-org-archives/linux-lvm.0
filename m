Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAHLTJ5Q015822
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 16:29:19 -0500
Received: from mailgw2.homestead.com (mailgw2.homestead.com [209.157.70.22])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kAHLTA24013537
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 16:29:11 -0500
Received: from postal.ksi.homestead.com ([10.200.1.1])
	by mailgw2.homestead.com (SMSSMTP 4.1.9.35) with SMTP id
	M2006111713311215549
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 13:31:12 -0800
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C70A8F.687BF6D4"
Subject: RE: [linux-lvm] Rmove a faulty hard drive off LVM Group
Date: Fri, 17 Nov 2006 13:29:05 -0800
Message-ID: <6AE6EBBB14415241A64613CEE97F550A0278FE45@postal.ksi.homestead-corp.com>
From: "Joann Deng" <JDeng@homestead-inc.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C70A8F.687BF6D4
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am afraid it's striped. But is there a way that I can verify it.

And I was thinking about backing all the data on the faulty drive to an
external hard drive. But unfortunately, the faulty drive holds /boot and
/.  I will try to copy the data to the external hard drive, but not sure
if it works or not.

=20

Thanks

=20

  _____ =20

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of mghofran@caregroup.harvard.edu
Sent: Friday, November 17, 2006 1:11 PM
To: linux-lvm@redhat.com
Subject: RE: [linux-lvm] Rmove a faulty hard drive off LVM Group

=20

It really depends on how your logical volume is using the disks in the
volume group. If it is striped for using both disks, then your only
choice is to backup the data somewhere else, do vgreduce and then
rebuild the logical volume. But if you didn't strip your logical volume
(the default is to be truncated) then you should be able to just free
the disk from volume group.

=20

  _____ =20

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Joann Deng
Sent: Friday, November 17, 2006 3:52 PM
To: LVM general discussion and development
Subject: RE: [linux-lvm] Rmove a faulty hard drive off LVM Group

=20

Actually, what I want to do is to shrink the volume group such that it
only contains one pv which is hdb1. Can you please tell me how to do
that?

=20

Thanks

  _____ =20

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of mghofran@caregroup.harvard.edu
Sent: Friday, November 17, 2006 12:46 PM
To: linux-lvm@redhat.com
Subject: RE: [linux-lvm] Rmove a faulty hard drive off LVM Group

=20

You are confusing the 11% free with the "Free PE". They are not the same
thing. The 11% is showing you "used / allocated" in your logical volume.
Another words "15281032 / 151527604 =3D 11% " however the free PE which =
is
160 MB, is the total unallocated space in the free bank of the volume
group. You could use that to extend the existing one (151527604) or
create a new one.

=20

Hope that helped

=20

  _____ =20

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Joann Deng
Sent: Thursday, November 16, 2006 8:10 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Rmove a faulty hard drive off LVM Group

=20

=20

Hello,

=20

My system is a Sun Fire X 2100 with RHEL 4.0. It has two 80G ATA SCSI
disks. Right now, one of them is failing, and I need to remove it off
the LVM Group.

=20

Here is the LVM layout:

# df -k

Filesystem           1K-blocks      Used Available Use% Mounted on

/dev/mapper/VolGroup00-LogVol00                      151527604  15281032
128549372  11% /

/dev/sda1               101086     18896     76971  20% /boot

none                   1036912         0   1036912   0% /dev/shm

=20

But when I run vgdisplay, the system only have 160MB Free PE.

=20

# vgdisplay

  --- Volume group ---

  VG Name               VolGroup00

  System ID

  Format                lvm2

  Metadata Areas        2

  Metadata Sequence No  3

  VG Access             read/write

  VG Status             resizable

  MAX LV                0

  Cur LV                2

  Open LV               2

  Max PV                0

  Cur PV                2

  Act PV                2

  VG Size               148.91 GB

  PE Size               32.00 MB

  Total PE              4765

  Alloc PE / Size       4760 / 148.75 GB

  Free  PE / Size       5 / 160.00 MB

  VG UUID               P7GrJk-v55z-YHlz-xPYL-v0eJ-jL6V-Cdo5OO

=20

As the usage is only 11% for VolGroup00-LogVol00 as shown by "df -k", I
don't know why I only have 160MB PE free.=20

I tried "pvmove /dev/sdb1", got the error message "insufficient suitable
contiguous allocatable  extents for logical volume pvmove 0:2384 more
required, unable to allocate temporary LV for pvmove".

Can someone please help me out?

=20

Thanks a lot in advance,

=20

Joann

=20


------_=_NextPart_001_01C70A8F.687BF6D4
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><o:SmartTagType
 namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags" =
name=3D"State"/>
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
 /* Font Definitions */
 @font-face
	{font-family:Times;
	panose-1:2 2 6 3 5 4 5 2 3 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:Times;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:Arial;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:Arial;
	color:navy;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:Arial;
	color:navy;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:Arial;
	color:navy;}
span.EmailStyle21
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

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I am afraid it&#8217;s striped. But =
is
there a way that I can verify it.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>And I was thinking about backing =
all the
data on the faulty drive to an external hard drive. But unfortunately, =
the
faulty drive holds /boot and /. &nbsp;I will try to copy the data to the
external hard drive, but not sure if it works or =
not.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman"'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of =
</span></b>mghofran@caregroup.harvard.edu<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, November =
17, 2006
1:11 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
linux-lvm@redhat.com<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: [linux-lvm] =
Rmove a
faulty hard drive off LVM Group</span></font><font face=3D"Times New =
Roman"><span
style=3D'font-family:"Times New Roman"'><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3DTimes><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>It really depends on how your =
logical
volume is using the disks in the volume group. If it is striped for =
using both
disks, then your only choice is to backup the data somewhere else, do =
vgreduce
and then rebuild the logical volume. But if you didn&#8217;t strip your =
logical
volume (the default is to be truncated) then you should be able to just =
free
the disk from volume group.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman"'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of </span></b>Joann Deng<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, November =
17, 2006 3:52
PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> LVM general =
discussion and
development<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: [linux-lvm] =
Rmove a
faulty hard drive off LVM Group</span></font><font face=3D"Times New =
Roman"><span
style=3D'font-family:"Times New Roman"'><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3DTimes><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Actually, what I want to do is to =
shrink
the volume group such that it only contains one pv which is hdb1. Can =
you
please tell me how to do that?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks<o:p></o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman"'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of =
</span></b>mghofran@caregroup.harvard.edu<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, November =
17, 2006
12:46 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
linux-lvm@redhat.com<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: [linux-lvm] =
Rmove a
faulty hard drive off LVM Group</span></font><font face=3D"Times New =
Roman"><span
style=3D'font-family:"Times New Roman"'><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3DTimes><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>You are confusing the 11% free with =
the
&#8220;<st1:place w:st=3D"on"><st1:City w:st=3D"on">Free</st1:City> =
<st1:State
 w:st=3D"on">PE</st1:State></st1:place>&#8221;. They are not the same =
thing. The
11% is showing you &#8220;used / allocated&#8221; in your logical =
volume.
Another words &#8220;15281032 / 151527604 =3D 11% &#8220; however the =
free PE which
is 160 MB, is the total unallocated space in the free bank of the volume =
group.
You could use that to extend the existing one (151527604) or create a =
new one.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Hope that =
helped<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman"'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of </span></b>Joann Deng<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Thursday, November =
16, 2006
8:10 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
linux-lvm@redhat.com<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> [linux-lvm] =
Rmove a
faulty hard drive off LVM Group</span></font><font face=3D"Times New =
Roman"><span
style=3D'font-family:"Times New Roman"'><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3DTimes><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>My system is a Sun Fire X 2100 with RHEL 4.0. It has =
two 80G
ATA SCSI disks. Right now, one of them is failing, and I need to remove =
it off
the LVM Group.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Here is the LVM layout:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># df -k<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;
1K-blocks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Used Available Use% Mounted =
on<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/mapper/VolGroup00-LogVol00
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;151527604&nbsp;
15281032 128549372&nbsp; 11% /<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
101086&nbsp;&nbsp;&nbsp;&nbsp; 18896&nbsp;&nbsp;&nbsp;&nbsp; 76971&nbsp; =
20%
/boot<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;1036912&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp; 1036912&nbsp;&nbsp; 0% =
/dev/shm<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>But when I run vgdisplay, the system only have 160MB =
Free
PE.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># vgdisplay<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; --- Volume group =
---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; VG
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
VolGroup00<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; System ID<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
lvm2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Metadata
Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Metadata Sequence No&nbsp; =
3<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; VG
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
read/write<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; VG
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
resizable<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; MAX <st1:place w:st=3D"on"><st1:City =
w:st=3D"on">LV</st1:City></st1:place>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Cur <st1:place w:st=3D"on"><st1:City =
w:st=3D"on">LV</st1:City></st1:place>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Open <st1:place w:st=3D"on"><st1:City =
w:st=3D"on">LV</st1:City></st1:place>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Max
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Cur
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Act
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; VG
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
148.91 GB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; PE
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
32.00 MB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Total
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
4765<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; <st1:place w:st=3D"on"><st1:City =
w:st=3D"on">Alloc</st1:City>
 <st1:State w:st=3D"on">PE</st1:State></st1:place> /
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4760 / 148.75 =
GB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; Free&nbsp; PE /
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 / 160.00 =
MB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; VG
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
P7GrJk-v55z-YHlz-xPYL-v0eJ-jL6V-Cdo5OO<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>As the usage is only 11% for VolGroup00-LogVol00 as =
shown by
&#8220;df &#8211;k&#8221;, I don&#8217;t know why I only have 160MB PE =
free. <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I tried &#8220;pvmove /dev/sdb1&#8221;, got the error
message &#8220;insufficient suitable contiguous allocatable =
&nbsp;extents for
logical volume pvmove 0:2384 more required, unable to allocate temporary =
<st1:place
w:st=3D"on"><st1:City w:st=3D"on">LV</st1:City></st1:place> for =
pvmove&#8221;.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Can someone please help me =
out?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks a lot in advance,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Joann<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C70A8F.687BF6D4--
