Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3R1ijrO009305
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 21:44:46 -0400
Received: from mail.antypas.net (74-93-0-53-SFBA.hfc.comcastbusiness.net
	[74.93.0.53] (may be forged))
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3R1ih4C031313
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 21:44:44 -0400
Received: from blucher (unknown [10.0.1.1])
	by mail.antypas.net (Postfix) with ESMTP id E83B9F489
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 18:44:34 -0700 (PDT)
From: "John Antypas" <ja@s21.com>
Date: Thu, 26 Apr 2007 18:44:32 -0700
Message-ID: <000001c7886d$a041fb40$e0c5f1c0$@com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C78832.F3E32340"
Content-Language: en-us
Subject: [linux-lvm] New developer question -- API
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

This is a multipart message in MIME format.

------=_NextPart_000_0001_01C78832.F3E32340
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

This has probably been asked thousands of times before, but I'll try to be a
good 1001 J

 

I'm trying to write some userspace code which can determine what  LV, VG and
PV a givne file mout belongs to.  Yes, I can process the output of a few
command lines tools like this:

 

1.       Get the mount from /proc/mounts

2.       Run lvs and map that into the LVM

3.       Using the LVM, run vgs and get the VG

4.       Using VG, use pvs and get the PV

5.       Using PV, now some knowledge about how I set things up and get the
md

6.       Run around proc some more and figure out which disks this md is on

 

These utilities do it - is there an API I can call to do all of this tracing
down rather than processing shell processes?


------=_NextPart_000_0001_01C78832.F3E32340
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
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
 /* List Definitions */
 @list l0
	{mso-list-id:1697659450;
	mso-list-type:hybrid;
	mso-list-template-ids:23076274 67698703 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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

<p class=3DMsoNormal>This has probably been asked thousands of times =
before, but
I&#8217;ll try to be a good 1001 <span =
style=3D'font-family:Wingdings'>J</span><o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I&#8217;m trying to write some userspace code which =
can
determine what&nbsp; LV, VG and PV a givne file mout belongs to.&nbsp; =
Yes, I can process
the output of a few command lines tools like this:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>1.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Get the mount from /proc/mounts<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>2.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Run lvs and map that into the LVM<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>3.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Using the LVM, run vgs and get the =
VG<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>4.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Using VG, use pvs and get the PV<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>5.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Using PV, now some knowledge about how I set =
things up
and get the md<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>6.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Run around proc some more and figure out which =
disks
this md is on<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>These utilities do it &#8211; is there an API I can =
call to
do all of this tracing down rather than processing shell =
processes?<o:p></o:p></p>

</div>

</body>

</html>

------=_NextPart_000_0001_01C78832.F3E32340--
