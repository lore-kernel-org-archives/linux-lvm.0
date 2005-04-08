Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j38B6kO16315
	for <linux-lvm@redhat.com>; Fri, 8 Apr 2005 07:06:46 -0400
Received: from beijing.plasmon.cn ([61.145.231.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j38B6ahu016195
	for <linux-lvm@redhat.com>; Fri, 8 Apr 2005 07:06:37 -0400
From: <cfeng@plasmon.cn>
Date: Fri, 8 Apr 2005 17:01:12 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_06D5_01C53C5C.9A9E4A90"
Message-Id: <20050408085933.1B9A648F2C@beijing.plasmon.cn>
Subject: [linux-lvm] Cannot create more than 3 snapshots when system is busy
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

------=_NextPart_000_06D5_01C53C5C.9A9E4A90
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear all,

       I have a problem with creating snapshots on the vanilla Linux2.6.11.5
kernel. I cannot create more than 3 snapshots on a logical volume when the
system is busy writing to the logical volume. When creating the fourth
snapshot the lvm.static just hangs there, and the process that writes data
to the logical volume also hangs. The system is still running though, and I
can access the system through ssh and do other things, but LVM subsystem is
hung. The filesystem on the logical volume is XFS and the physical volume
underneath is a RAID5. The following lines are from /proc/slabinfo which may
be useful:

 

dm-snapshot-in       128    140     56   70    1 : tunables  120   60    0 :
slabdata      2      2      0

dm-snapshot-ex    498095 498108     24  156    1 : tunables  120   60    0 :
slabdata   3193   3193      0

dm_tio             23549  52206     16  226    1 : tunables  120   60    0 :
slabdata    231    231      0

dm_io              23548  51754     16  226    1 : tunables  120   60    0 :
slabdata    229    229      0

 

       Has anybody seen similar problem? Any suggestion would be greatly
appreciated!

 

Regards.

Charles


------=_NextPart_000_06D5_01C53C5C.9A9E4A90
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Tahoma;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
 /* Page Definitions */
 @page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	layout-grid:15.6pt;}
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

<body lang=3DZH-CN link=3Dblue vlink=3Dpurple =
style=3D'text-justify-trim:punctuation'>

<div class=3DSection1 style=3D'layout-grid:15.6pt'>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>Dear all,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a
problem with creating snapshots on the vanilla Linux2.6.11.5 kernel. I =
cannot
create more than 3 snapshots on a logical volume when the system is busy
writing to the logical volume. When creating the fourth snapshot the =
lvm.static
just hangs there, and the process that writes data to the logical volume =
also
hangs. The system is still running though, and I can access the system =
through
ssh and do other things, but LVM subsystem is hung. The filesystem on =
the
logical volume is XFS and the physical volume underneath is a RAID5. The
following lines are from /proc/slabinfo which may be =
useful:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>dm-snapshot-in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 128&nbsp;&nbsp;&nbsp;
140&nbsp;&nbsp;&nbsp;&nbsp; 56&nbsp;&nbsp; 70&nbsp;&nbsp;&nbsp; 1 : =
tunables&nbsp;
120&nbsp;&nbsp; 60&nbsp;&nbsp;&nbsp; 0 : =
slabdata&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>dm-snapshot-ex&nbsp;&nbsp;&nbsp; 498095 =
498108&nbsp;&nbsp;&nbsp;&nbsp;
24&nbsp; 156&nbsp;&nbsp;&nbsp; 1 : tunables&nbsp; 120&nbsp;&nbsp; =
60&nbsp;&nbsp;&nbsp;
0 : slabdata&nbsp;&nbsp; 3193&nbsp;&nbsp; =
3193&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>dm_tio&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
23549&nbsp; 52206&nbsp;&nbsp;&nbsp;&nbsp; 16 &nbsp;226&nbsp;&nbsp;&nbsp; =
1 : tunables&nbsp;
120&nbsp;&nbsp; 60&nbsp;&nbsp;&nbsp; 0 : slabdata&nbsp;&nbsp;&nbsp; =
231&nbsp;&nbsp;&nbsp;
231&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>dm_io&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
23548&nbsp; 51754&nbsp;&nbsp;&nbsp;&nbsp; 16&nbsp; 226&nbsp;&nbsp;&nbsp; =
1 : tunables&nbsp;
120&nbsp;&nbsp; 60&nbsp;&nbsp;&nbsp; 0 : slabdata&nbsp;&nbsp;&nbsp; =
229&nbsp;&nbsp;&nbsp;
229&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Has =
anybody
seen similar problem? Any suggestion would be greatly =
appreciated!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>Regards.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Tahoma'>Charles<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_06D5_01C53C5C.9A9E4A90--
