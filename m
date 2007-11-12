Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACLuZOm023838
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:56:35 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACLuSmg003050
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:56:28 -0500
Received: from hop04-l1d11-si02.isus.emc.com (HOP04-L1D11-SI02.isus.emc.com
	[10.254.111.55])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lACLuNnW010221
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:56:23 -0500 (EST)
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.11]) by
	hop04-l1d11-si02.isus.emc.com (Tablus Interceptor) for
	<linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:56:22 -0500
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lACLtgDW017285
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:56:20 -0500 (EST)
From: pham_cuong@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C82576.C4755BEE"
Subject: RE: [linux-lvm] Beginner Questions
Date: Mon, 12 Nov 2007 16:55:41 -0500
Message-ID: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A2B9@CORPUSMX20A.corp.emc.com>
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
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

------_=_NextPart_001_01C82576.C4755BEE
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

When you format, unless you specify the block size, the default block
size is used.
The default block size is defined based on the size of the logical disk
(partition) size that you've created.
Any disk space left over from the format is listed as unusable (for the
block size that's being used) can not be used because it's not a
multiple of the block size used to format that logical drive/partition.
=20
The only way that you can make use of the remaining very small disk
space is to use the smaller block size when formatting.   However,
unless you know exactly what you're doing, it's not advisable for you to
do so since this will more likely impact the performance of your logical
drive/partition.  A lot of testing were done to determine the optimal
block size based on the size of the logical drive/partition that you've
created.
=20
Except for academic reason(s), you should not be concerned with such a
small left over.
=20
Regards,
=20

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Joseph L. Casale
Sent: Monday, November 12, 2007 4:34 PM
To: 'linux-lvm@redhat.com'
Subject: [linux-lvm] Beginner Questions



Hi,
I have Fedora Core 7 with  LVM version: 2.02.24 (2007-03-19), Library
version: 1.02.17 (2007-01-29) and  Driver version: 4.11.0 setup.

I have two hardware raid cards each with one array partitioned fully at
799.9GB and 1499.9GB. When I try run to pvcreate /dev/sdb1 /dev/sdc1 it
creates the pvs and when I run pvdisplay I get this:

=20

  --- Physical volume ---

  PV Name               /dev/sdb1

  VG Name               name

  PV Size               745.00 GB / not usable 3.67 MB

  Allocatable           yes

  PE Size (KByte)       4096

  Total PE              190718

  Free PE               190718

  Allocated PE          0

  PV UUID               yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk

=20

  --- Physical volume ---

  PV Name               /dev/sdc1

  VG Name               name

  PV Size               1024.00 GB / not usable 8192.00 EB

  Allocatable           yes

  PE Size (KByte)       4096

  Total PE              357626

  Free PE               357626

  Allocated PE          0

  PV UUID               PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm

=20

Why is some space "not usable"?

=20

Thanks!
jlc


------_=_NextPart_001_01C82576.C4755BEE
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:v =3D=20
"urn:schemas-microsoft-com:vml" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word" xmlns:m =3D=20
"http://schemas.microsoft.com/office/2004/12/omml"><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1601" name=3DGENERATOR>
<STYLE>@font-face {
	font-family: Cambria Math;
}
@font-face {
	font-family: Calibri;
}
@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.0in 1.0in 1.0in; }
P.MsoNormal {
	FONT-SIZE: 11pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: =
"Calibri","sans-serif"
}
LI.MsoNormal {
	FONT-SIZE: 11pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: =
"Calibri","sans-serif"
}
DIV.MsoNormal {
	FONT-SIZE: 11pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: =
"Calibri","sans-serif"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline; mso-style-priority: 99
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline; mso-style-priority: 99
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline; mso-style-priority: 99
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline; mso-style-priority: 99
}
SPAN.EmailStyle17 {
	COLOR: windowtext; FONT-FAMILY: "Calibri","sans-serif"; mso-style-type: =
personal-compose
}
.MsoChpDefault {
	mso-style-type: export-only
}
DIV.Section1 {
	page: Section1
}
</STYLE>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]--></HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007>When you format, unless you specify the block =
size, the=20
default block size is used.</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007>The default block size is defined based on =
the size of=20
the logical disk (partition) size that you've =
created.</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007>Any disk space left over from the format is =
listed as=20
unusable (for the block size that's being used) can not be used because =
it's not=20
a multiple of the block size used to format that logical=20
drive/partition.</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007></SPAN></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007>The only way that you can make use of the =
remaining=20
very small disk space is to use the smaller block size when=20
formatting.&nbsp;&nbsp; However, unless you know exactly what you're =
doing, it's=20
not advisable for you to do so since this will more likely impact the=20
performance of your logical drive/partition.&nbsp; A lot of testing were =
done to=20
determine the optimal block size based on the size of the logical=20
drive/partition that you've created.</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007></SPAN></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007>Except for academic reason(s), you should not =
be=20
concerned with such a small left over.</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007></SPAN></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007>Regards,</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D867144621-12112007></SPAN></FONT>&nbsp;</DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Joseph L.=20
Casale<BR><B>Sent:</B> Monday, November 12, 2007 4:34 PM<BR><B>To:</B>=20
'linux-lvm@redhat.com'<BR><B>Subject:</B> [linux-lvm] Beginner=20
Questions<BR></FONT><BR></DIV>
<DIV></DIV>
<DIV class=3DSection1>
<P class=3DMsoNormal>Hi,<BR>I have Fedora Core 7 with&nbsp; LVM version: =
2.02.24=20
(2007-03-19), Library version: 1.02.17 (2007-01-29) and &nbsp;Driver =
version:=20
4.11.0 setup.<BR><BR>I have two hardware raid cards each with one array=20
partitioned fully at 799.9GB and 1499.9GB. When I try run to pvcreate =
/dev/sdb1=20
/dev/sdc1 it creates the pvs and when I run pvdisplay I get =
this:<o:p></o:p></P>
<P class=3DMsoNormal><o:p>&nbsp;</o:p></P>
<P class=3DMsoNormal>&nbsp; --- Physical volume ---<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/sdb1<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
name<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
745.00 GB / not usable 3.67 MB<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
yes<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PE Size =
(KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4096<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;190718<o:p></o:p></=
P>
<P class=3DMsoNormal>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
190718<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; Allocated=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk<o:p></o:p></P>
<P class=3DMsoNormal><o:p>&nbsp;</o:p></P>
<P class=3DMsoNormal>&nbsp; --- Physical volume ---<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/sdc1<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
name<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
1024.00 GB / not usable 8192.00 EB<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
yes<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PE Size =
(KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4096<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
357626<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
357626<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; Allocated=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<o:p></o:p></P>
<P class=3DMsoNormal>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm<o:p></o:p></P>
<P class=3DMsoNormal><o:p>&nbsp;</o:p></P>
<P class=3DMsoNormal>Why is some space &#8220;not =
usable&#8221;?<o:p></o:p></P>
<P class=3DMsoNormal><o:p>&nbsp;</o:p></P>
<P class=3DMsoNormal>Thanks!<BR>jlc<o:p></o:p></P></DIV></BODY></HTML>

------_=_NextPart_001_01C82576.C4755BEE--
