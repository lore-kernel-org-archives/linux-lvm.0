Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9GDH5CN006762
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 09:17:05 -0400
Received: from emroute3.ornl.gov (emroute3.ornl.gov [160.91.4.110])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9GDGvU6029481
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 09:16:57 -0400
Received: from emroute3.ornl.gov ([127.0.0.1])
	by emroute3.ornl.gov (PMDF V6.3-x11 #31501)
	with ESMTP id <0JQ0001NLA89B4@emroute3.ornl.gov> for
	linux-lvm@redhat.com; Tue, 16 Oct 2007 09:16:57 -0400 (EDT)
Received: from CONVERSION-DAEMON.emroute3.ornl.gov by emroute3.ornl.gov
	(PMDF V6.3-x11 #31501) id <0JQ000501A8987@emroute3.ornl.gov> for
	linux-lvm@redhat.com; Tue, 16 Oct 2007 09:16:57 -0400 (EDT)
Received: from ORNLEXCHANGE.ornl.gov (ornlexchange1.ornl.gov [160.91.1.20])
	by emroute3.ornl.gov (PMDF V6.3-x11 #31501)
	with ESMTP id <0JQ0003HYA89CD@emroute3.ornl.gov> for
	linux-lvm@redhat.com; Tue, 16 Oct 2007 09:16:57 -0400 (EDT)
Date: Tue, 16 Oct 2007 09:16:55 -0400
From: "Thomas, Charles Norton" <thomascn@ornl.gov>
Message-id: <43C68785C2728049AF86B0ECB240A151059506D403@EXCHMB.ornl.gov>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary="Boundary_(ID_vPjOCFFhyfve8TiYvHResQ)"
Content-language: en-US
Subject: [linux-lvm] Maximum Physical volume size?
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


--Boundary_(ID_vPjOCFFhyfve8TiYvHResQ)
Content-type: text/plain; charset="us-ascii"
Content-transfer-encoding: quoted-printable

I seem to be exceeding a limit somewhere when I attempt to install a RedHat=
 Linux Client release 5 O/S on a 2.8 Terabyte Physical disk.  The install g=
oes without error and creates a Volume group and logical volumes for the O/=
S partitions and the balance of the space as a 2.6 Terabyte logical volume.=
 When I reviewed the "partitioning" I attempted to reduce the size of the o=
f the 2.6 Terabyte Logical Volume a little so I could add a little to the r=
oot Logical Volume. It refused to change the size and claimed that the redu=
ced size exceeded the maximum size limit of 2 Terabytes. I decided to press=
 on without making the change. When I booted up the new O/S the VolumeGroup=
00 was discovered but device-mapper reported:

"device-mapper: table 253:0: linear: dm-linear: Device lookup failed"
"device-mapper: table 253:1: linear: dm-linear: Device lookup failed"

Then it crashed with a "nash received SIGSEGV"

What is the Maximum Physical Volume size on a "Red Hat Enterprise Linux Cli=
ent release 5"?
Is the  Maximum Physical Volume size different in the 32 it  Advanced serve=
r version?

--Boundary_(ID_vPjOCFFhyfve8TiYvHResQ)
Content-type: text/html; charset="us-ascii"
Content-transfer-encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
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

<p class=3DMsoNormal>I seem to be exceeding a limit somewhere when I attemp=
t to
install a RedHat Linux Client release 5 O/S on a 2.8 Terabyte Physical disk=
. &nbsp;The
install goes without error and creates a Volume group and logical volumes f=
or
the O/S partitions and the balance of the space as a 2.6 Terabyte logical
volume. When I reviewed the &#8220;partitioning&#8221; I attempted to reduc=
e
the size of the of the 2.6 Terabyte Logical Volume a little so I could add =
a
little to the root Logical Volume. It refused to change the size and claime=
d
that the reduced size exceeded the maximum size limit of 2 Terabytes. I dec=
ided
to press on without making the change. When I booted up the new O/S the
VolumeGroup00 was discovered but device-mapper reported:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&#8220;device-mapper: table 253:0: linear: dm-linear: =
Device
lookup failed&#8221; &nbsp;&nbsp;<o:p></o:p></p>

<p class=3DMsoNormal>&#8220;device-mapper: table 253:1: linear: dm-linear: =
Device
lookup failed&#8221;<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Then it crashed with a &#8220;nash received SIGSEGV&#8=
221;<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>What is the Maximum Physical Volume size on a &#8220;R=
ed Hat
Enterprise Linux Client release 5&#8221;?<o:p></o:p></p>

<p class=3DMsoNormal>Is the &nbsp;Maximum Physical Volume size different in=
 the
32 it &nbsp;Advanced server version?<o:p></o:p></p>

</div>

</body>

</html>

--Boundary_(ID_vPjOCFFhyfve8TiYvHResQ)--
