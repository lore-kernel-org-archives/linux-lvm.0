From: "Christoph Berger" <chberger@pool.informatik.rwth-aachen.de>
Date: Tue, 16 Oct 2001 18:19:38 +0200
Message-ID: <000201c1565e$5affe980$6c88e289@tweety>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01C1566F.1E8A4020"
Subject: [linux-lvm] Remount a LVM Vol after a system crash
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0003_01C1566F.1E8A4020
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
A few days ago my system crashes and i=92ve used LVM v 0.8 with one =
volume
group(server), two physical volumes(hda6, hdb6) and one logical
volume(dev/server/ftp)
Now i=92ve installed Suse 7.2 with LVM v 0.9 Beta7, but i can=92t mount =
the
logical volume.
The error message is:
# mount /dev/server/ftp /mnt
mount: wrong fs type, bad option, bad superblock on /dev/server/ftp,
       or too many mounted file systems
=20
I get the following outputs from my system:
=20
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "server"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group
=20
# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda6" of VG "server" [37.78 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb5" of VG "server" [41.92 GB / 0 free]
pvscan -- total: 2 [79.71 GB] / in use: 2 [79.71 GB] / in no VG: 0 [0]
=20
# pvdisplay /dev/hda6
--- Physical volume ---
PV Name               /dev/hda6
VG Name               server
PV Size               37.78 GB / NOT usable 3.75 MB [LVM: 267 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              9671
Free PE               0
Allocated PE          9671
PV UUID               /dev/h-da6
=20
# pvdisplay /dev/hdb5
--- Physical volume ---
PV Name               /dev/hdb5
VG Name               server
PV Size               41.93 GB / NOT usable 3.45 MB [LVM: 271 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              10732
Free PE               0
Allocated PE          10732
PV UUID               /dev/h-db5
=20
# vgchange -ay
vgchange -- volume group "server" already active
=20
# lvchange -ay /dev/server/ftp
lvchange -- logical volume "/dev/server/ftp" is already active
lvchange -- availability of logical volume "/dev/server/ftp" doesn't
have to be changed
lvchange -- logical volume "/dev/server/ftp" didn't have to be changed
=20
=20
I=92ve tried to follow the instructions of the mailing list article, =
i=92ve
found at http://www.geocrawler.com/archives/3/3500/2001/4/0/5655568/
But it doesn=92t work, After vgchange =96ay I get an error message, too,
like
=20
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/export.conf"
than expected in file vg_cfgrestore.c [line=20
> 120]
> vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"export"
=20
I hope you can help me,
Thanks=20
Christoph=20

------=_NextPart_000_0003_01C1566F.1E8A4020
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C1566F.1DC828A0">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:HyphenationZone>21</w:HyphenationZone>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Courier;
	panose-1:2 7 4 9 2 2 5 2 4 4;
	mso-font-alt:"Courier New";
	mso-font-charset:0;
	mso-generic-font-family:modern;
	mso-font-format:other;
	mso-font-pitch:fixed;
	mso-font-signature:3 0 0 0 1 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
pre
	{margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:Courier;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Courier New";}
span.EmailFormatvorlage17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;
	mso-header-margin:35.4pt;
	mso-footer-margin:35.4pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Normale Tabelle";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DDE link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:35.4pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Hello,<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>A few days ago my =
system
crashes and i&#8217;ve used LVM v 0.8 with one volume group(server), two =
physical
volumes(hda6, hdb6) and one logical =
volume(dev/server/ftp)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Now i&#8217;ve =
installed Suse
7.2 with LVM v 0.9 Beta7, but i can&#8217;t mount the logical =
volume.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>The error message =
is:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># mount =
/dev/server/ftp /mnt<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>mount: wrong fs type, =
bad
option, bad superblock on /dev/server/ftp,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0 </span>or too many mounted =
file systems<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I get the following =
outputs from
my system:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># =
vgscan<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>vgscan -- reading all
physical volumes (this may take a while...)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>vgscan -- found active =
volume
group &quot;server&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>vgscan --
&quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot; successfully =
created<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>vgscan -- WARNING: =
This
program does not do a VGDA backup of your volume =
group<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># =
pvscan<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>pvscan -- reading all
physical volumes (this may take a while...)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>pvscan -- ACTIVE<span
style=3D'mso-spacerun:yes'>=A0=A0 </span>PV &quot;/dev/hda6&quot; of VG
&quot;server&quot; [37.78 GB / 0 free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>pvscan -- ACTIVE<span
style=3D'mso-spacerun:yes'>=A0=A0 </span>PV &quot;/dev/hdb5&quot; of VG
&quot;server&quot; [41.92 GB / 0 free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>pvscan -- total: 2 =
[79.71 GB]
/ in use: 2 [79.71 GB] / in no VG: 0 [0]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># pvdisplay =
/dev/hda6<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>--- Physical volume =
---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV Name<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>/dev/hda6<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>VG Name<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>server<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV Size<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>37.78 GB / NOT usable 3.75 MB
[LVM: 267 KB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV#<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 </span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV Status<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>available<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Allocatable<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span>yes =
(but full)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Cur LV<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PE Size (KByte)<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0 =
</span>4096<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Total PE<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>9671<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Free PE<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Allocated PE<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>9671<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV UUID<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>/dev/h-da6<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># pvdisplay =
/dev/hdb5<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>--- Physical volume =
---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV Name<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>/dev/hdb5<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>VG Name<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>server<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV Size<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>41.93 GB / NOT usable 3.45 MB
[LVM: 271 KB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV#<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 </span>2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV Status<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>available<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Allocatable<span
style=3D'mso-spacerun:yes'>=A0=A0=A0 </span><span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0</span>yes (but =
full)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Cur LV<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PE Size (KByte)<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0 =
</span>4096<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Total PE<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>10732<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Free PE<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Allocated PE<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>10732<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>PV UUID<span
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>/dev/h-db5<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># vgchange =
-ay<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>vgchange -- volume =
group
&quot;server&quot; already active<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'># lvchange -ay
/dev/server/ftp<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>lvchange -- logical =
volume
&quot;/dev/server/ftp&quot; is already =
active<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>lvchange -- =
availability of
logical volume &quot;/dev/server/ftp&quot; doesn't have to be =
changed<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>lvchange -- logical =
volume
&quot;/dev/server/ftp&quot; didn't have to be =
changed<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I&#8217;ve tried to =
follow
the instructions of the mailing list article, i&#8217;ve found at <a
href=3D"http://www.geocrawler.com/archives/3/3500/2001/4/0/5655568/">http=
://www.geocrawler.com/archives/3/3500/2001/4/0/5655568/</a><o:p></o:p></s=
pan></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>But it doesn&#8217;t =
work,
After vgchange &#8211;ay I get an error message, too, =
like<o:p></o:p></span></font></p>

<pre><font size=3D2 face=3DCourier><span lang=3DEN-GB =
style=3D'font-size:10.0pt;
mso-ansi-language:EN-GB'><span =
style=3D'mso-spacerun:yes'>=A0</span><o:p></o:p></span></font></pre><pre>=
<font
size=3D2 face=3DCourier><span lang=3DEN-GB =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-GB'>vgcfgrestore -- ERROR: different structure size stored in =
&quot;/etc/lvmconf/export.conf&quot;<o:p></o:p></span></font></pre><pre><=
font
size=3D2 face=3DCourier><span lang=3DEN-GB =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-GB'>than expected in file vg_cfgrestore.c [line =
<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3DCourier><span lang=3DEN-GB =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-GB'>&gt; 120]<o:p></o:p></span></font></pre><pre><font size=3D2 =
face=3DCourier><span
lang=3DEN-GB style=3D'font-size:10.0pt;mso-ansi-language:EN-GB'>&gt; =
vgcfgrestore -- ERROR &quot;vg_cfgrestore(): read&quot; restoring volume =
group &quot;export&quot;<o:p></o:p></span></font></pre>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I hope you can help =
me,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Thanks =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Christoph =
<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0003_01C1566F.1E8A4020--
