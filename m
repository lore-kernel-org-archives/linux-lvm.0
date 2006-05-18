Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4IJpWVV032436
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 15:51:32 -0400
Received: from sccrmhc11.comcast.net (sccrmhc11.comcast.net [204.127.200.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4IJpT4L004297
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 15:51:29 -0400
From: "Greg Hartzog" <glhartzog@comcast.net>
Subject: RE: [linux-lvm] "/boot" under LVM2 support in lilo or grub
Date: Thu, 18 May 2006 15:51:17 -0400
Message-ID: <000401c67ab4$6e188340$640a0a0a@laptopoptimus>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C67A92.E706E340"
In-Reply-To: <000001c679bb$6946ca10$640a0a0a@laptopoptimus>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C67A92.E706E340
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

My thanks to everyone for answering.

 

From the lilo author, I found that my choices are for "/boot" to either be
on RAID-1 or to be under LVM.  But both are not allowed.

 

So I am considering what to do next.

 

What is the state of the LVM mirroring code?  Could I create mirrored
logical volumes in LVM rather then putting LVM on top of RAID-1 md?

 

Thanks!

 

  _____  

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Greg Hartzog
Sent: Wednesday, May 17, 2006 10:09 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] "/boot" under LVM2 support in lilo or grub

 

Hello there everyone.

 

I found from poking around the web that lilo, in theory, supports having
"/boot" under LVM2 control rather then existing as its own partition.

 

I was wondering if anyone can confirm or deny this.  And if anyone has any
docs on how to configure or setup this up.

 

Thanks!

 


------=_NextPart_000_0005_01C67A92.E706E340
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
name=3D"PersonName"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
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
	font-family:Arial;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:Arial;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:blue;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
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

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'>My thanks to everyone for =
answering.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'>From the lilo author, I found that my choices are for =
&#8220;/boot&#8221;
to either be on RAID-1 or to be under LVM.&nbsp; But both are not =
allowed.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'>So I am considering what to do =
next.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'>What is the state of the LVM mirroring code?&nbsp; =
Could I
create mirrored logical volumes in LVM rather then putting LVM on top of =
RAID-1
md?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'>Thanks!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dblue face=3DArial><span =
style=3D'font-size:
12.0pt;color:blue'><o:p>&nbsp;</o:p></span></font></p>

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
style=3D'font-weight:bold'>On Behalf Of </span></b>Greg Hartzog<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Wednesday, May 17, =
2006
10:09 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> <st1:PersonName =
w:st=3D"on">linux-lvm@redhat.com</st1:PersonName><br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> [linux-lvm]
&quot;/boot&quot; under LVM2 support in lilo or grub</span></font><font
face=3D"Times New Roman"><span style=3D'font-family:"Times New =
Roman"'><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'>Hello
there everyone.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'>I
found from poking around the web that lilo, in theory, supports having
&#8220;/boot&#8221; under LVM2 control rather then existing as its own
partition.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'>I was
wondering if anyone can confirm or deny this.&nbsp; And if anyone has =
any docs
on how to configure or setup this up.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'>Thanks!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3DArial><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0005_01C67A92.E706E340--
