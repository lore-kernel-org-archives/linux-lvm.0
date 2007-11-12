Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACM1oVH026463
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:01:50 -0500
Received: from pd4mo1so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACM1hgh007111
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:01:43 -0500
Received: from pd4mr3so.prod.shaw.ca
	(pd4mr3so-qfe3.prod.shaw.ca [10.0.141.214]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JRE0078EYHJXJ90@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 15:00:55 -0700 (MST)
Received: from pn2ml6so.prod.shaw.ca ([10.0.121.150])
	by pd4mr3so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JRE00EQ6YHHQL50@pd4mr3so.prod.shaw.ca> for
	linux-lvm@redhat.com; Mon, 12 Nov 2007 15:00:55 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JRE00174YHG0I30@l-daemon> for linux-lvm@redhat.com; Mon,
	12 Nov 2007 15:00:53 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])	by mail.activenetwerx.com
	(Postfix) with ESMTP id 926C2FD310	for <linux-lvm@redhat.com>; Mon,
	12 Nov 2007 15:00:52 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int (unknown [192.168.5.3])
	by mail.activenetwerx.com (Postfix) with ESMTP id A4DA2FD30F	for
	<linux-lvm@redhat.com>; Mon, 12 Nov 2007 15:00:51 -0700 (MST)
Date: Mon, 12 Nov 2007 15:00:50 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] Beginner Questions
In-reply-to: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A2B9@CORPUSMX20A.corp.emc.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88B@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary=_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88BanexActiveNet_
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A2B9@CORPUSMX20A.corp.emc.com>
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88BanexActiveNet_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you for the response. The first is insignificant, but there is =BD a =
terabyte missing on the second which is listed as 8192 EB? It should be ~50=
0 GB free?

Thanks!
jlc

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of pham_cuong@emc.com
Sent: Monday, November 12, 2007 2:56 PM
To: linux-lvm@redhat.com
Subject: RE: [linux-lvm] Beginner Questions

When you format, unless you specify the block size, the default block size =
is used.
The default block size is defined based on the size of the logical disk (pa=
rtition) size that you've created.
Any disk space left over from the format is listed as unusable (for the blo=
ck size that's being used) can not be used because it's not a multiple of t=
he block size used to format that logical drive/partition.

The only way that you can make use of the remaining very small disk space i=
s to use the smaller block size when formatting.   However, unless you know=
 exactly what you're doing, it's not advisable for you to do so since this =
will more likely impact the performance of your logical drive/partition.  A=
 lot of testing were done to determine the optimal block size based on the =
size of the logical drive/partition that you've created.

Except for academic reason(s), you should not be concerned with such a smal=
l left over.

Regards,


________________________________
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of Joseph L. Casale
Sent: Monday, November 12, 2007 4:34 PM
To: 'linux-lvm@redhat.com'
Subject: [linux-lvm] Beginner Questions
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

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88BanexActiveNet_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Diso-8859-=
1">
<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">

<head>

<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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

<p class=3DMsoNormal><span style=3D'color:#1F497D'>Thank you for the respon=
se. The first
is insignificant, but there is =BD a terabyte missing on the second which i=
s
listed as 8192 EB? It should be ~500 GB free?<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span>=
</p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'>Thanks!<br>
jlc<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span>=
</p>

<div>

<div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in'>

<p class=3DMsoNormal><b><span style=3D'font-size:10.0pt;font-family:"Tahoma=
","sans-serif"'>From:</span></b><span
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] <b>On Be=
half
Of </b>pham_cuong@emc.com<br>
<b>Sent:</b> Monday, November 12, 2007 2:56 PM<br>
<b>To:</b> linux-lvm@redhat.com<br>
<b>Subject:</b> RE: [linux-lvm] Beginner Questions<o:p></o:p></span></p>

</div>

</div>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Arial","s=
ans-serif";
color:blue'>When you format, unless you specify the block size, the default
block size is used.</span><span style=3D'font-size:12.0pt;font-family:"Time=
s New Roman","serif"'><o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Arial","s=
ans-serif";
color:blue'>The default block size is defined based on the size of the logi=
cal
disk (partition) size that you've created.</span><span style=3D'font-size:1=
2.0pt;
font-family:"Times New Roman","serif"'><o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Arial","s=
ans-serif";
color:blue'>Any disk space left over from the format is listed as unusable =
(for
the block size that's being used) can not be used because it's not a multip=
le
of the block size used to format that logical drive/partition.</span><span
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'><o:p></o:p=
></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New=
 Roman","serif"'>&nbsp;<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Arial","s=
ans-serif";
color:blue'>The only way that you can make use of the remaining very small =
disk
space is to use the smaller block size when formatting.&nbsp;&nbsp; However=
,
unless you know exactly what you're doing, it's not advisable for you to do=
 so
since this will more likely impact the performance of your logical
drive/partition.&nbsp; A lot of testing were done to determine the optimal
block size based on the size of the logical drive/partition that you've
created.</span><span style=3D'font-size:12.0pt;font-family:"Times New Roman=
","serif"'><o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New=
 Roman","serif"'>&nbsp;<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Arial","s=
ans-serif";
color:blue'>Except for academic reason(s), you should not be concerned with
such a small left over.</span><span style=3D'font-size:12.0pt;font-family:"=
Times New Roman","serif"'><o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New=
 Roman","serif"'>&nbsp;<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.0pt;font-family:"Arial","s=
ans-serif";
color:blue'>Regards,</span><span style=3D'font-size:12.0pt;font-family:"Tim=
es New Roman","serif"'><o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New=
 Roman","serif"'>&nbsp;<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New=
 Roman","serif"'><o:p>&nbsp;</o:p></span></p>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><span
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>

<hr size=3D2 width=3D"100%" align=3Dcenter>

</span></div>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><b><span style=3D'font-=
size:10.0pt;
font-family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-size=
:10.0pt;
font-family:"Tahoma","sans-serif"'> linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>Joseph L. Casale<=
br>
<b>Sent:</b> Monday, November 12, 2007 4:34 PM<br>
<b>To:</b> 'linux-lvm@redhat.com'<br>
<b>Subject:</b> [linux-lvm] Beginner Questions</span><span style=3D'font-si=
ze:
12.0pt;font-family:"Times New Roman","serif"'><o:p></o:p></span></p>

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

<p class=3DMsoNormal>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;190718<o:p></o:p></p>

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

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88BanexActiveNet_--
