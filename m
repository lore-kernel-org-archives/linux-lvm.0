Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACLYHqq012025
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:34:17 -0500
Received: from pd4mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACLYABh020856
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 16:34:10 -0500
Received: from pd2mr5so.prod.shaw.ca (pd2mr5so-qfe3.prod.shaw.ca [10.0.141.8])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JRE00942X8P9R40@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 14:34:01 -0700 (MST)
Received: from pn2ml4so.prod.shaw.ca ([10.0.121.148])
	by pd2mr5so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JRE0078FX8PCG60@pd2mr5so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 12 Nov 2007 14:34:02 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JRE00E59X8ONM40@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 14:34:00 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])	by mail.activenetwerx.com
	(Postfix) with ESMTP id 4AE4CFD310	for <linux-lvm@redhat.com>; Mon,
	12 Nov 2007 14:34:00 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int (unknown [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id 9A1CDFD2DD	for
	<linux-lvm@redhat.com>; Mon, 12 Nov 2007 14:33:59 -0700 (MST)
Date: Mon, 12 Nov 2007 14:33:58 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary=_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88AanexActiveNet_
Content-language: en-US
Subject: [linux-lvm] Beginner Questions
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88AanexActiveNet_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I have Fedora Core 7 with  LVM version: 2.02.24 (2007-03-19), Library versi=
on: 1.02.17 (2007-01-29) and  Driver version: 4.11.0 setup.

I have two hardware raid cards each with one array partitioned fully at 799=
.9GB and 1499.9GB. When I try run to pvcreate /dev/sdb1 /dev/sdc1 it create=
s the pvs and when I run pvdisplay I get this:

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

Why is some space "not usable"?

Thanks!
jlc

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88AanexActiveNet_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
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

<p class=3DMsoNormal>Hi,<br>
I have Fedora Core 7 with&nbsp; LVM version: 2.02.24 (2007-03-19), Library
version: 1.02.17 (2007-01-29) and &nbsp;Driver version: 4.11.0 setup.<br>
<br>
I have two hardware raid cards each with one array partitioned fully at 799=
.9GB
and 1499.9GB. When I try run to pvcreate /dev/sdb1 /dev/sdc1 it creates the=
 pvs
and when I run pvdisplay I get this:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp; --- Physical volume ---<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
/dev/sdb1<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; VG
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
name<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
745.00 GB / not usable 3.67 MB<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes=
<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
4096<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;190718<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Free
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
190718<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Allocated
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp; --- Physical volume ---<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
/dev/sdc1<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; VG
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
name<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
1024.00 GB / not usable 8192.00 EB<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes=
<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
4096<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Total
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
357626<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Free
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
357626<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; Allocated
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp; PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Why is some space &#8220;not usable&#8221;?<o:p></o:p>=
</p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks!<br>
jlc<o:p></o:p></p>

</div>

</body>

</html>

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88AanexActiveNet_--
