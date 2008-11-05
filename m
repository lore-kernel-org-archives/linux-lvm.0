Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA5M7kHc011861
	for <linux-lvm@redhat.com>; Wed, 5 Nov 2008 17:07:46 -0500
Received: from proofpoint-gb.la-z-boy.com (mailgb.la-z-boy.com [12.26.126.64])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA5M7Jhm012532
	for <linux-lvm@redhat.com>; Wed, 5 Nov 2008 17:07:25 -0500
Received: from lzbv6104.na.lzb.hq ([192.168.5.1])
	by proofpoint-gb.la-z-boy.com (8.14.1/8.14.1) with ESMTP id
	mA5M6wOc018385
	for <linux-lvm@redhat.com>; Wed, 5 Nov 2008 17:06:59 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C93F92.B3230F1D"
Date: Wed, 5 Nov 2008 17:06:05 -0500
Message-ID: <37752EAC00ED92488874A27A4554C2F301849FAE@lzbs6301.na.lzb.hq>
From: "Scot Kreienkamp" <SKreien@la-z-boy.com>
Subject: [linux-lvm] LVM Mirror question
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

------_=_NextPart_001_01C93F92.B3230F1D
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone...

=20

I have a difficult LVM question that I'm wrestling with.  Hopefully
someone can help.

=20

I have two hosts with 50 gigs of local RAID5 storage.  (I am using only
local storage due to performance problems with our SAN, so shared
storage is out of the picture.)  I have that divided into three LVM
partitions on each host, 5 gigs for /, 5 gigs for swap, and 40 gigs
mounted on /var/lib/pgsql.  I need to do a real-time mirror of
/var/lib/pgsql (LogVol02) to the second host.  I was trying to use LVM
to do that via Network Block Device.  So on host2 I exported LogVol02
via NBD, and imported it into host1.  I then added that to VolGroup00
and used lvconvert to establish the mirror.  That all worked great.  The
problem is that I don't know how to reverse that process then and mount
LogVol02 in host2 without destroying the partition, with or without NBD;
the second host doesn't have any information on the LVM partition so it
wouldn't know how to do anything with it.  That's where I'm stuck.

=20

Basically what I'm after is I need to do a real-time mirror of the
postgres database volume to a second host for recovery in case of an
emergency.  If there's a way I can use LVM to do this, or if someone can
suggest a better way, I'm all ears. =20

=20

Thanks,

=20

Scot Kreienkamp

La-Z-Boy Inc.

=20


------_=_NextPart_001_01C93F92.B3230F1D
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceName"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceType"/>
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
font-family:Arial'>Hi Everyone&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have a difficult LVM question that I&#8217;m =
wrestling
with.&nbsp; Hopefully someone can help.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have two hosts with 50 gigs of local RAID5 =
storage.&nbsp; (I
am using only local storage due to performance problems with our SAN, so =
shared
storage is out of the picture.)&nbsp; I have that divided into three LVM
partitions on each host, 5 gigs for /, 5 gigs for swap, and 40 gigs =
mounted on
/var/lib/pgsql.&nbsp; I need to do a real-time mirror of /var/lib/pgsql
(LogVol02) to the second host.&nbsp; I was trying to use LVM to do that =
via Network
Block Device.&nbsp; So on host2 I exported LogVol02 via NBD, and =
imported it
into host1.&nbsp; I then added that to VolGroup00 and used lvconvert to =
establish
the mirror.&nbsp; That all worked great.&nbsp; The problem is that I =
don&#8217;t
know how to reverse that process then and <st1:place =
w:st=3D"on"><st1:PlaceType
 w:st=3D"on">mount</st1:PlaceType> <st1:PlaceName =
w:st=3D"on">LogVol02</st1:PlaceName></st1:place>
in host2 without destroying the partition, with or without NBD; the =
second host
doesn&#8217;t have any information on the LVM partition so it =
wouldn&#8217;t
know how to do anything with it.&nbsp; That&#8217;s where I&#8217;m =
stuck.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Basically what I&#8217;m after is I need to do a =
real-time
mirror of the postgres database volume to a second host for recovery in =
case of
an emergency.&nbsp; If there&#8217;s a way I can use LVM to do this, or =
if someone
can suggest a better way, I&#8217;m all ears.&nbsp; =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Scot Kreienkamp</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>La-Z-Boy Inc.</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C93F92.B3230F1D--
