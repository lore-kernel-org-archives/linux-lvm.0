Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7LFMLfw000847
	for <linux-lvm@redhat.com>; Mon, 21 Aug 2006 11:22:21 -0400
Received: from mis011.exch011.intermedia.net (mis011.exch011.intermedia.net
	[64.78.21.10])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7LFMKBt031117
	for <linux-lvm@redhat.com>; Mon, 21 Aug 2006 11:22:20 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6C535.1C33A673"
Date: Mon, 21 Aug 2006 08:22:10 -0700
Message-ID: <64F9B87B6B770947A9F8391472E0321607C9AC0D@ehost011-8.exch011.intermedia.net>
From: "Efri Nattel-Shay" <efri@qumranet.com>
Subject: [linux-lvm] Compilation error (missing 'is_static') in
	daemons/clvmd/lvm_functions.c ?
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

------_=_NextPart_001_01C6C535.1C33A673
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20

I'm trying to build LVM2 from the CVS tree.

I'm using the 'configure' from the cluster project instructions
(http://sources.redhat.com/cluster/doc/usage.txt - ./configure
--with-clvmd --with-cluster=3Dshared)=20

=20

I'm getting a compilation error in daemons/clvmd/lvm_functions.c :
create_toolcontext() has [now] two arguments (is_static is the second
one), but this file calls the function with only one arg.

=20

True/False?

=20

--

Efri Nattel-Shay

=20

=20


------_=_NextPart_001_01C6C535.1C33A673
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:right;
	direction:rtl;
	unicode-bidi:embed;
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
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1 dir=3DRTL>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I'm
trying to build LVM2 from the CVS tree.<o:p></o:p></span></font></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I'm
using the 'configure' from the cluster project instructions (<a
href=3D"http://sources.redhat.com/cluster/doc/usage.txt">http://sources.r=
edhat.com/cluster/doc/usage.txt</a>
- </span></font>./configure --with-clvmd --with-cluster=3Dshared<font =
size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>) =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I'm
getting a compilation error in daemons/clvmd/lvm_functions.c :
create_toolcontext() has [now] two arguments (is_static is the second =
one), but
this file calls the function with only one =
arg.<o:p></o:p></span></font></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>True/False?<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>--<o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Efri
Nattel-Shay<o:p></o:p></span></font></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal dir=3DLTR =
style=3D'text-align:left;direction:ltr;unicode-bidi:
embed'><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

</div>

</body>

</html>

------_=_NextPart_001_01C6C535.1C33A673--
