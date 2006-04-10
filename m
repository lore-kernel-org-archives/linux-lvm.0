Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3AKrCBB016642
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 16:53:12 -0400
Received: from ofgate.hill.af.mil (ofgate.hill.af.mil [137.241.250.11])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3AKrAZ4004249
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 16:53:10 -0400
Received: from ap-hill-tm2.hill.afmc.ds.af.mil (ap-hill-tm2.hill.af.mil
	[137.241.230.81]) by ofgate.hill.af.mil with SMTP id k3AKvwLd010114
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 14:58:08 -0600 (MDT)
Received: from fskrsm12.hill.af.mil ([137.241.230.92])
	by ap-hill-tm2.hill.afmc.ds.af.mil (SMSSMTP 4.1.11.41) with SMTP id
	M2006041014525713821
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 14:52:57 -0600
Message-ID: <6605BF32C6D0604EAE71CB60D8E6003D05ABC46E@fskrsm31.hill.afmc.ds.af.mil>
From: Humpherys Philip D Contr 309 CMXG/MXCD <Phil.Humpherys@HILL.af.mil>
Date: Mon, 10 Apr 2006 14:52:56 -0600
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C65CE0.73AD1938"
Subject: [linux-lvm] moving a volume group from one SAN host to another
	(using powerpa th)
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C65CE0.73AD1938
Content-Type: text/plain

I have a volume group built on one host.  I vgchange -an on it to
de-activate it, then I vgexport it.  The devices are presented to another
host.  I run a pvscan (and pvscan -e) on it and I don't see the devices, I
don't see an exported volume group.

 

No matching physical volumes found

 

Help?

 

-pdh


------_=_NextPart_001_01C65CE0.73AD1938
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
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
font-family:Arial'>I have a volume group built on one host.&nbsp; I =
vgchange -an
on it to de-activate it, then I vgexport it.&nbsp; The devices are =
presented to
another host.&nbsp; I run a pvscan (and pvscan -e) on it and I don't =
see
the devices, I don't see an exported volume =
group.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>No matching physical volumes =
found<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Help?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-pdh<o:p></o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C65CE0.73AD1938--
