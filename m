Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JFhSxh003528
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 11:43:28 -0400
Received: from mail-qy0-f198.google.com (mail-qy0-f198.google.com
	[209.85.221.198])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JFhHgI008290
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 11:43:17 -0400
Received: by qyk36 with SMTP id 36so4978497qyk.19
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 08:43:17 -0700 (PDT)
From: "kevin" <k@kevinkevin.com>
Date: Wed, 19 May 2010 11:43:09 -0400
Message-ID: <059801caf769$fc848350$f58d89f0$@com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0599_01CAF748.7572E350"
Content-Language: en-us
Subject: [linux-lvm] Adding a disk to expand an existing logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_0599_01CAF748.7572E350
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Howdy,

 

 

I have a live production system w/ logical volume that i want to add a drive
to. I just wanted to confirm that adding a drive
(fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding
a disk to logical volumes? I want to ensure that the existing data on the
logical volume isn't compromised and have never done this before.

 

If theres something I should be aware of or if my process is incorrect,
please let me know. Any help is extremely appreciated J 

 

 

Thanks,

 

Kevin

 


------=_NextPart_000_0599_01CAF748.7572E350
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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

<p class=3DMsoNormal>Howdy,<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I have a live production system w/ logical volume =
that i want
to add a drive to. I just wanted to confirm that adding a drive
(fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about =
adding a
disk to logical volumes? I want to ensure that the existing data on the =
logical
volume isn&#8217;t compromised and have never done this =
before.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>If theres something I should be aware of or if my =
process is
incorrect, please let me know. Any help is extremely appreciated <span
style=3D'font-family:Wingdings'>J</span> <o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks,<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Kevin<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

------=_NextPart_000_0599_01CAF748.7572E350--
