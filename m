Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2IEhSxk014797
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 10:43:28 -0400
Received: from mx2.netapp.com (mx2.netapp.com [216.240.18.37])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2IEhEih010205
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 10:43:14 -0400
Received: from sacrsexc1-prd.hq.netapp.com (sacrsexc1-prd.hq.netapp.com
	[10.99.115.27])
	by smtp2.corp.netapp.com (8.13.1/8.13.1/NTAP-1.6) with ESMTP id
	o2IEhDKY020415
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 07:43:14 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CAC6A9.548E8D70"
Date: Thu, 18 Mar 2010 20:13:10 +0530
Message-ID: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
From: "Sarkar, Kaushik" <Kaushik.Sarkar@netapp.com>
Subject: [linux-lvm] how to change the volume group name of the attached
	backup
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

------_=_NextPart_001_01CAC6A9.548E8D70
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

I have a 2 Linux(RHL) machines (L1 and L2).  One is clone of other. I
have taken the backup of a L1. Now I have attached that backup to L2.

=20

Before attaching L2 has /dev/sda and after attatchement it has /dev/sdb

But I cant mount /dev/sdb as it is on LVM. As both are having same VG
NAME I can't even mount logical volume.

So I thought to change the volume group name of the second but not able
to do that.

=20

My intention is to mount the backup of L1 in L2 to check all data are
correct.

=20

Need your help to solve it.

=20

Thanks in advance.

-kaushik

=20


------_=_NextPart_001_01CAC6A9.548E8D70
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
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

<p class=3DMsoNormal>Hi,<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I have a 2 Linux(RHL) machines (L1 and L2).&nbsp; =
One is clone of
other. I have taken the backup of a L1. Now I have attached that backup =
to L2.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Before attaching L2 has /dev/sda and after =
attatchement it
has /dev/sdb<o:p></o:p></p>

<p class=3DMsoNormal>But I cant mount /dev/sdb as it is on LVM. As both =
are
having same VG NAME I can&#8217;t even mount logical =
volume.<o:p></o:p></p>

<p class=3DMsoNormal>So I thought to change the volume group name of the =
second
but not able to do that.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>My intention is to mount the backup of L1 in L2 to =
check all
data are correct.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Need your help to solve it.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks in advance.<o:p></o:p></p>

<p class=3DMsoNormal>-kaushik<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

------_=_NextPart_001_01CAC6A9.548E8D70--
