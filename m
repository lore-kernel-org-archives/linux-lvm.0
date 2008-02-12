Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1CLQwNK024453
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 16:26:58 -0500
Received: from pd2mo2so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1CLQGsb027864
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2008 16:26:25 -0500
Received: from pd2mr1so.prod.shaw.ca
	(pd2mr1so-qfe3.prod.shaw.ca [10.0.141.110]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JW5002ADA6B1740@l-daemon> for linux-lvm@redhat.com; Tue,
	12 Feb 2008 14:25:23 -0700 (MST)
Received: from pn2ml1so.prod.shaw.ca ([10.0.121.145])
	by pd2mr1so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JW5005V0A6A6SD0@pd2mr1so.prod.shaw.ca> for
	linux-lvm@redhat.com; Tue, 12 Feb 2008 14:25:23 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006))
	with ESMTP id <0JW5000RDA68K0F0@l-daemon> for linux-lvm@redhat.com; Tue,
	12 Feb 2008 14:25:21 -0700 (MST)
Received: from exchange.activenetwerx.com (localhost.localdomain [127.0.0.1])
	by mail.activenetwerx.com (Postfix) with ESMTP id 2F90F17805C	for
	<linux-lvm@redhat.com>; Tue, 12 Feb 2008 13:26:19 -0700 (MST)
Date: Tue, 12 Feb 2008 14:25:18 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary=_000_1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1anexActiveNet_
Content-language: en-US
Subject: [linux-lvm] pvmove safety
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

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1anexActiveNet_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How safe is pvmove in LVM2 when being operated on live volumes? I understan=
d a backup is always a good policy as nothing can be 100% safe, but is the =
command known to produce unreliable results when used on a live filesystem?=
 I am reading http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html and the warn=
ing up top is hard to miss, but I wonder if it's a bit outdated?

Thanks!
jlc

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1anexActiveNet_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-ascii"=
>
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

<p class=3DMsoNormal>How safe is pvmove in LVM2 when being operated on live
volumes? I understand a backup is always a good policy as nothing can be 10=
0%
safe, but is the command known to produce unreliable results when used on a
live filesystem? I am reading <a
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html">http://tldp.org/H=
OWTO/LVM-HOWTO/removeadisk.html</a>
and the warning up top is hard to miss, but I wonder if it&#8217;s a bit
outdated?<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks!<br>
jlc<o:p></o:p></p>

</div>

</body>

</html>

--_000_1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1anexActiveNet_--
