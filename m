Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBHFhSqf001924
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 10:43:29 -0500
Received: from NIHCESSMTP.hub.nih.gov (nihcessmtp.hub.nih.gov [128.231.90.115])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBHFgmZ1009077
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 10:42:53 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C840C3.76699C1B"
Date: Mon, 17 Dec 2007 10:42:42 -0500
Message-ID: <86C31097FBD0B549855F1209D0C2183E03D751CA@NIHCESMLBX11.nih.gov>
From: "Smith, Troy (NIH/NCI) [C]" <trsmith@mail.nih.gov>
Subject: [linux-lvm] LV, VG,
	and PV information not available after vgcfgrestore
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

------_=_NextPart_001_01C840C3.76699C1B
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hello all.

=20

I recently migrated a logical volume from a failing host to a new host,
and although I am able to mount and access the volume, I cannot view any
of the LV information using lvdisplay, vgdisplay, or pvdisplay.

=20

The physical volume is SAN mounted.  The /etc/lvm/backup/file was copied
from the failing host to the new host, and using vgcfgrestore and
vgchange, the LV's are now mounted on the new host and completely
accessible.  However, when I run any of the display or scan commands,
information regarding these volumes does not appear.  I'm wondering if I
missed a step in recovery.  Following are the steps I followed:

=20

-on source host, unmounted the file system using the LV in question

-presented LUN the LV is on to the new host, and discovered

-coped /etc/lvm/backup/file from source to target

-on target host, vgcfgrestore on the copied backup file

-on target host, lvscan.  The LV was recognized, but not active.

-vgchange to activate the LV

-another lvscan showed the LV active

-modifed target host:/etc/fstab=20

-mounted the LV on the target host without issue. =20

=20

Is there another step or two (or more) that I should have executed prior
to mounting or even recovering the LV?

=20

Any and all assistance is greatly appreciated.

=20

Thanks

Troy

=20

=20


------_=_NextPart_001_01C840C3.76699C1B
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
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

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal>Hello all.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I recently migrated a logical volume from a failing =
host to
a new host, and although I am able to mount and access the volume, I =
cannot
view any of the LV information using lvdisplay, vgdisplay, or =
pvdisplay.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>The physical volume is SAN mounted.&nbsp; The
/etc/lvm/backup/file was copied from the failing host to the new host, =
and
using vgcfgrestore and vgchange, the LV&#8217;s are now mounted on the =
new host
and completely accessible.&nbsp; However, when I run any of the display =
or scan
commands, information regarding these volumes does not appear.&nbsp; =
I&#8217;m
wondering if I missed a step in recovery.&nbsp; Following are the steps =
I
followed:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>-on source host, unmounted the file system using =
the LV in
question<o:p></o:p></p>

<p class=3DMsoNormal>-presented LUN the LV is on to the new host, and =
discovered<o:p></o:p></p>

<p class=3DMsoNormal>-coped /etc/lvm/backup/file from source to =
target<o:p></o:p></p>

<p class=3DMsoNormal>-on target host, vgcfgrestore on the copied backup =
file<o:p></o:p></p>

<p class=3DMsoNormal>-on target host, lvscan.&nbsp; The LV was =
recognized, but
not active.<o:p></o:p></p>

<p class=3DMsoNormal>-vgchange to activate the LV<o:p></o:p></p>

<p class=3DMsoNormal>-another lvscan showed the LV active<o:p></o:p></p>

<p class=3DMsoNormal>-modifed target host:/etc/fstab <o:p></o:p></p>

<p class=3DMsoNormal>-mounted the LV on the target host without =
issue.&nbsp; <o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Is there another step or two (or more) that I =
should have
executed prior to mounting or even recovering the LV?<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Any and all assistance is greatly =
appreciated.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks<o:p></o:p></p>

<p class=3DMsoNormal>Troy<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

------_=_NextPart_001_01C840C3.76699C1B--
