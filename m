Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22FNhK04349
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 10:23:43 -0500
Received: from mail02.nemours.org (mail02.nemours.org [192.234.253.30])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22FNcSL001944
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 10:23:38 -0500
Message-ID: <FBBA14180DBE83499AC81277324251B0113174@jaxmsx01.nemours.org>
From: Amir Mistric <amistric@nemours.org>
Date: Wed, 2 Mar 2005 10:25:25 -0500 
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C51F3C.0E871600"
Subject: [linux-lvm] Recipe for hardware RAID
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C51F3C.0E871600
Content-Type: text/plain

Hi

 

We are contemplating to start using RHEL v4 in our enterprise.

Most of our servers have a hardware RAID.

 

The server we are using for a RHEL 4 trial install has 4x36GB SCSI drives
configured using RAID 5.

Of course, we also want to use LVM.

 

 

Can someone please suggest what would be the best "layout"/"recipe"
considering the configuration I described?

Using "automatically" partitioning during install RHEL suggests: 

/boot and swap outside LVM and the rest of space in LVM mounted under / file
system.

 

Is this sufficient layout for maximum flexibility? Should I create other
logical volumes and file systems?

 

 

Any tips are appreciated

 

 

Amir Mistric ( <mailto:amistric@nemours.org> amistric@nemours.org)
Web Developer
Nemours Foundation
Office: (904) 232-4223

Mobile: (904) 588-6691

 

NOTICE...This electronic transmission is intended only for the person(s)
named.  It may contain information that is (i) proprietary to the sender,
and/or (ii) privileged, confidential and/or otherwise exempt from disclosure
under applicable State and Federal law, including, but not limited to,
privacy standards imposed pursuant to the federal Health Insurance
Portability and Accountability Act of 1996 (HIPAA).  Receipt by anyone other
than the named recipient(s) is not a waiver of any applicable privilege.  If
you received this confidential communication in error, please notify the
sender immediately by reply e-mail message and permanently delete the
original message from your system.

 


------_=_NextPart_001_01C51F3C.0E871600
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
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
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
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
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hi<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>We are contemplating to start using RHEL v4 in our
enterprise.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Most of our servers have a hardware =
RAID.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>The server we are using for a RHEL 4 trial install =
has
4x36GB SCSI drives configured using RAID =
5.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Of course, we also want to use =
LVM.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Can someone please suggest what would be the best =
&#8220;layout&#8221;/&#8221;recipe&#8221;
considering the configuration I described?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Using &#8220;automatically&#8221; partitioning =
during install
RHEL suggests: <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/boot and swap outside LVM and the rest of space in =
LVM mounted
under / file system.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Is this sufficient layout for maximum flexibility? =
Should I
create other logical volumes and file =
systems?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Any tips are =
appreciated<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Lucida Console"><span =
style=3D'font-size:
10.0pt;font-family:"Lucida Console"'>Amir Mistric (</span></font><a
href=3D"mailto:amistric@nemours.org"><font size=3D2 face=3D"Lucida =
Console"><span
style=3D'font-size:10.0pt;font-family:"Lucida =
Console"'>amistric@nemours.org</span></font></a><font
size=3D2 face=3D"Lucida Console"><span =
style=3D'font-size:10.0pt;font-family:"Lucida Console"'>)<br>
Web Developer<br>
Nemours Foundation<br>
Office:&nbsp;(904) 232-4223</span></font><o:p></o:p></p>

<p class=3DMsoNormal><st1:City w:st=3D"on"><st1:place w:st=3D"on"><font =
size=3D2
  face=3D"Lucida Console"><span =
style=3D'font-size:10.0pt;font-family:"Lucida =
Console"'>Mobile</span></font></st1:place></st1:City><font
size=3D2 face=3D"Lucida Console"><span =
style=3D'font-size:10.0pt;font-family:"Lucida Console"'>:
(904) 588-6691</span></font><o:p></o:p></p>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D1 color=3Dsilver face=3D"Lucida =
Console"><span
style=3D'font-size:7.5pt;font-family:"Lucida =
Console";color:silver'>NOTICE&#8230;This
electronic transmission is intended only for the person(s) named.&nbsp; =
It may
contain information that is (i) proprietary to the sender, and/or (ii)
privileged, confidential and/or otherwise exempt from disclosure under
applicable State and Federal law, including, but not limited to, =
privacy
standards imposed pursuant to the federal Health Insurance Portability =
and
Accountability Act of 1996 (HIPAA).&nbsp; Receipt by anyone other than =
the
named recipient(s) is not a waiver of any applicable privilege.&nbsp; =
If you
received this confidential communication in error, please notify the =
sender
immediately by reply e-mail message and permanently delete the original =
message
from your system.</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C51F3C.0E871600--
