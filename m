From: "Dzevad Hadzic" <zex@zex.biz>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C3C6AF.1E7E5C80"
Message-Id: <E1AXXUt-0004RA-ES@adult.hosthr.net>
Subject: [linux-lvm] ERROR vg_read
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Dec 21 15:47:16 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C3C6AF.1E7E5C80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

 

Hello I have this problem, after the main disk in server wich was not part
of LVM crashed I put new disk

and reinstall Debian 3.0 r2. I got error ERROR "vg_read_with_pv_and_lv():
current PV" can't get data of volume group "ata" from physical volume(s)

vgscan and pvscan  say's this:

 

vgscan

vgscan -- reading all physical volumes (this may take a while...)

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "ata" from physical volume(s)

vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

 

pvscan

pvscan -- reading all physical volumes (this may take a while...)

pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "ata" (run
vgscan)

pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "ata" (run
vgscan)

pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "ata" (run
vgscan)

pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "ata" (run
vgscan)

pvscan -- total: 4 [414.41 GB] / in use: 4 [414.41 GB] / in no VG: 0 [0]

 

pvscan -d and vgscan -d are avaliable on request.

 

I'm very grateful for any help on this issue.

 


------=_NextPart_000_0000_01C3C6AF.1E7E5C80
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
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{mso-style-type:personal;
	font-family:Arial;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:Arial;
	color:navy;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
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

<body lang=3DHR link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello I have this problem, after the main disk in =
server wich
was not part of LVM crashed I put new disk<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>and reinstall Debian 3.0 r2. I got error ERROR
&quot;vg_read_with_pv_and_lv(): current PV&quot; can't get data of =
volume group
&quot;ata&quot; from physical volume(s)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>vgscan and pvscan &nbsp;say's =
this:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>vgscan<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>vgscan -- reading all physical volumes (this may take =
a
while...)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>vgscan -- ERROR &quot;vg_read_with_pv_and_lv(): =
current
PV&quot; can't get data of volume group &quot;ata&quot; from physical =
volume(s)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>vgscan -- &quot;/etc/lvmtab&quot; and
&quot;/etc/lvmtab.d&quot; successfully =
created<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>vgscan -- WARNING: This program does not do a VGDA =
backup of
your volume group<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan -- reading all physical volumes (this may take =
a
while...)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan -- inactive PV &quot;/dev/hde1&quot;&nbsp; is
associated to unknown VG &quot;ata&quot; (run =
vgscan)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan -- inactive PV &quot;/dev/hdc1&quot;&nbsp; is
associated to unknown VG &quot;ata&quot; (run =
vgscan)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan -- inactive PV &quot;/dev/hdd1&quot;&nbsp; is
associated to unknown VG &quot;ata&quot; (run =
vgscan)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan -- inactive PV &quot;/dev/hdb1&quot;&nbsp; is
associated to unknown VG &quot;ata&quot; (run =
vgscan)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan -- total: 4 [414.41 GB] / in use: 4 [414.41 =
GB] / in
no VG: 0 [0]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>pvscan &#8211;d and vgscan &#8211;d are avaliable on
request.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I'm very grateful for any help on this =
issue.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0000_01C3C6AF.1E7E5C80--
