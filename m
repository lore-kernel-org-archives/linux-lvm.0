From: "Anything" <anything@starstrike.net>
Message-ID: <000301c3741a$64dd6af0$3201a8c0@anythings>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0004_01C3746E.36897AF0"
Subject: [linux-lvm] vgimport problem -  wrong number of physical volumes to import volume group
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
Date: Mon Sep  8 08:56:03 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0004_01C3746E.36897AF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all.
 
Ive got a bit of a problem with re-importing my volume group on this
system.
 
I was removing a few hard drives and moved it to a new system. I
vgreduced and everything to remove drives, it seemed working okay, so I
exported in preparation to move to another box.
Now, I am unable to import it again. I have plugged the drives I removed
back in, just in case, however they seem to be not related.
 
 
Im pretty new to lvm, so maybe ive missed something obvious?
Ive been googling and reading howto for a couple of hours, ive still no
solution (maybe im a noob?). Ive seen some other vgimport related stuff,
but not as seemingly simple as this?!?
 
 
Does anybody know why vgimport is saying I have the wrong number of
drives?
Im 99% sure its wanting 4 drives, but it still isn't liking me very
much.
 
Alternatively, does anybody know how to get data off this exported vg,
so I can at least not loose everything?
 
 
I noticed people were posting lots of info, so I thought I might do the
same, just to give a good idea on whats going on
 
Pvscan results:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg"   is in EXPORTED VG "storage_group"
[93.12 GB / 0 free]
pvscan -- inactive PV "/dev/hdh"   is in EXPORTED VG "storage_group"
[111.75 GB / 3.16 GB free]
pvscan -- inactive PV "/dev/hde"  is in no VG  [37.27 GB]
pvscan -- inactive PV "/dev/hdf"  is in no VG  [38.35 GB]
pvscan -- inactive PV "/dev/hdc"   is in EXPORTED VG "storage_group"
[111.75 GB / 0 free]
pvscan -- inactive PV "/dev/hda3"  is in EXPORTED VG "storage_group"
[70.88 GB / 0 free]
pvscan -- inactive PV "/dev/hdb"  is in no VG  [38.35 GB]
pvscan -- total: 7 [501.64 GB] / in use: 4 [387.67 GB] / in no VG: 3
[113.96 GB]
 
hde, hdf and hdb were going to be removed. As you can see there they
seem pretty much unrelated to the problem, but I have plugged them back
in just in case
 
 
Pvdata /dev/hda3 shows:
--- Physical volume ---
PV Name               /dev/hda3
VG Name               storage_groupPV_EXP
PV Size               70.93 GB [148751858 secs] / NOT usable 32.19 MB
[LVM: 136 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              2268
Free PE               0
Allocated PE          2268
PV UUID               5lk3Ei-MLat-sXFg-xCv3-HGll-W5lC-fkXYZq
 
--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/exported/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                4
Act PV                4
VG Size               387.50 GB
PE Size               32 MB
Total PE              12400
Alloc PE / Size       12299 / 384.34 GB
Free  PE / Size       101 / 3.16 GB
VG UUID               1wczAS-BPIW-NdcH-VCRL-DoB5-1fnJ-8yTw97
 
Plus a heap of other stuff.
The "Cur PV" amount to me says my vgremoves were successful, and all I
should be importing is the 4 drives that are still active.
 
 
 
"vgimport storage_group /dev/hdg /dev/hdc /dev/hda3 /dev/hdh" shows:
vgimport -- ERROR: wrong number of physical volumes to import volume
group "storage_group"
 
but:
 
"vgimport storage_group /dev/hdg /dev/hdc /dev/hda3" shows:
vgimport -- ERROR: only 3 physical volumes of 4 given for volume group
"storage_group"
 
and this is a bit weird (notice the ordering of drives)
"vgimport storage_group /dev/hdg /dev/hdc /dev/hdh"
vgimport -- ERROR: wrong number of physical volumes to import volume
group "storage_group"
 
I didn't think the ordering of the import command was important?
 
 
 
 
any ideas anyone on how to get my group imported>
 
Andrew..

------=_NextPart_000_0004_01C3746E.36897AF0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C3746E.355D2FF0">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"State"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hi all.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Ive</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> got a bit
of a problem with re-importing my volume group on this =
system.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I was removing a few hard drives and moved it to a =
new
system. I <span class=3DSpellE>vgreduced</span> and everything to remove =
drives,
it seemed working okay, so I exported in preparation to move to another =
box.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Now, I am unable to import it again. I have plugged =
the
drives I removed back in, just in case, however they seem to be not =
related.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Im</span></font></span></spa=
n><span
class=3DGramE><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:
Arial'> pretty new to <span class=3DSpellE>lvm</span>, so maybe <span
class=3DSpellE>ive</span> missed something =
obvious?</span></font></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Ive</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> been <span
class=3DSpellE>googling</span> and reading <span =
class=3DSpellE>howto</span> for a
couple of hours, <span class=3DSpellE>ive</span> still no solution =
(maybe <span
class=3DSpellE>im</span> a <span class=3DSpellE>noob</span>?). <span =
class=3DSpellE>Ive</span>
seen some other <span class=3DSpellE>vgimport</span> related stuff, but =
not as
seemingly simple as this?!?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Does anybody know why <span =
class=3DSpellE>vgimport</span> is
saying I have the wrong number of drives?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Im</span></font></span><font=
 size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'> 99% =
sure <span
class=3DGramE>its</span> wanting 4 drives, but it still isn&#8217;t =
liking me very
much.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Alternatively, does anybody know how to get data off =
this exported
vg, so I can at least not loose everything?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I noticed people were posting lots of info, so I =
thought I might
do the same, just to give a good idea on <span =
class=3DSpellE>whats</span> going
on<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Pvscan</span></font></span><=
font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> =
results:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- reading
all physical volumes (this may take a =
while...)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/<span class=3DSpellE>hdg</span>&quot;<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>is in EXPORTED VG =
&quot;<span
class=3DSpellE>storage_group</span>&quot; [93.12 GB / 0 =
free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/<span class=3DSpellE>hdh</span>&quot;<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>is in EXPORTED VG =
&quot;<span
class=3DSpellE>storage_group</span>&quot; [111.75 GB / 3.16 GB =
free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/<span class=3DSpellE>hde</span>&quot;<span
style=3D'mso-spacerun:yes'>&nbsp; </span>is in no VG<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[37.27 =
GB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/<span class=3DSpellE>hdf</span>&quot;<span
style=3D'mso-spacerun:yes'>&nbsp; </span>is in no VG<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[38.35 =
GB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/<span class=3DSpellE>hdc</span>&quot;<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>is in EXPORTED VG =
&quot;<span
class=3DSpellE>storage_group</span>&quot; [111.75 GB / 0 =
free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/hda3&quot;<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>is in
EXPORTED VG &quot;<span class=3DSpellE>storage_group</span>&quot; [70.88 =
GB / 0
free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- inactive
PV &quot;/dev/<span class=3DSpellE>hdb</span>&quot;<span
style=3D'mso-spacerun:yes'>&nbsp; </span>is in no VG<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[38.35 =
GB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>pvscan</span></font></span><=
/span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- total: 7
[501.64 GB] / in use: 4 [387.67 GB] / in no VG: 3 [113.96 =
GB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>hde</span></font></span></sp=
an><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>, <span
class=3DSpellE>hdf</span> and <span class=3DSpellE>hdb</span> were going =
to be
removed. As you can see there they seem pretty much unrelated to the =
problem,
but I have plugged them back in just in =
case<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Pvdata</span></font></span><=
font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> /dev/hda3
shows:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>--- Physical volume ---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PV Name<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>/dev/hda3<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG Name<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span =
class=3DSpellE>storage_groupPV_EXP</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PV Size<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>70.93 GB [148751858 <span class=3DSpellE>secs</span>] / NOT =
usable 32.19
MB [LVM: 136 KB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PV#<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
</span><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;</span>3<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PV Status<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span>available<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Allocatable</span></font></s=
pan><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;
</span>yes (but full)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Cur </span></font><st1:City><st1:place><font size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>LV</span></font></st1:place>=
</st1:City><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PE Size (<span class=3DSpellE>KByte</span>)<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>32768<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Total PE<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>2268<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Free PE<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Allocated PE<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
</span>2268<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PV UUID<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>5lk3Ei-MLat-sXFg-xCv3-HGll-W5lC-fkXYZq<o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>--- Volume group ---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG Name<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG Access<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span>read/write<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG Status<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span>NOT available/exported/resizable<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG #<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>MAX </span></font><st1:City><st1:place><font size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>LV</span></font></st1:place>=
</st1:City><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>256<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Cur </span></font><st1:City><st1:place><font size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>LV</span></font></st1:place>=
</st1:City><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Open </span></font><st1:City><st1:place><font =
size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>LV</span></font></st1:place>=
</st1:City><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>MAX </span></font><st1:City><st1:place><font size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>LV</span></font></st1:place>=
</st1:City><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> Size<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;
</span>2 TB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Max PV<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>256<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Cur PV<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Act PV<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG Size<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>387.50 GB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PE Size<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>32 MB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Total PE<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>12400<o:p></o:p></span></font></p>

<p class=3DMsoNormal><st1:place><st1:City><span class=3DSpellE><font =
size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Alloc</span></font></span></=
st1:City><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> =
</span></font><st1:State><font
  size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>PE</span></font></st1:State>=
</st1:place><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> / Size<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>12299 /
384.34 GB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Free<span
style=3D'mso-spacerun:yes'>&nbsp; </span>PE</span></font></span><font =
size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'> / =
Size<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>101 / 3.16
GB<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VG UUID<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>1wczAS-BPIW-NdcH-VCRL-DoB5-1fnJ-8yTw97<o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Plus a heap of other =
stuff.</span></font></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>The &#8220;Cur PV&#8221; amount to me says my <span
class=3DSpellE>vgremoves</span> were successful, and all I should be =
importing is
the 4 drives that are still active.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&#8220;<span class=3DSpellE><span =
class=3DGramE>vgimport</span></span>
<span class=3DSpellE>storage_group</span> /dev/<span =
class=3DSpellE>hdg</span>
/dev/<span class=3DSpellE>hdc</span> /dev/hda3 /dev/<span =
class=3DSpellE>hdh</span>&#8221;
shows:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>vgimport</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- ERROR:
wrong number of physical volumes to import volume group &quot;<span
class=3DSpellE>storage_group</span>&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>but</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>:<o:p></o:p></span></font></=
p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&#8220;<span class=3DSpellE><span =
class=3DGramE>vgimport</span></span>
<span class=3DSpellE>storage_group</span> /dev/<span =
class=3DSpellE>hdg</span>
/dev/<span class=3DSpellE>hdc</span> /dev/hda3&#8221; =
shows:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>vgimport</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- ERROR:
only 3 physical volumes of 4 given for volume group &quot;<span =
class=3DSpellE>storage_group</span>&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>and</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> this is a bit
weird (notice the ordering of drives)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&#8220;<span class=3DSpellE><span =
class=3DGramE>vgimport</span></span>
<span class=3DSpellE>storage_group</span> /dev/<span =
class=3DSpellE>hdg</span>
/dev/<span class=3DSpellE>hdc</span> /dev/<span =
class=3DSpellE>hdh</span>&#8221;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>vgimport</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -- ERROR:
wrong number of physical volumes to import volume group &quot;<span
class=3DSpellE>storage_group</span>&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I didn&#8217;t think the ordering of the import =
command was
important?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>any</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> ideas
anyone on how to get my group imported&gt;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Andrew<span =
class=3DGramE>..</span><o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0004_01C3746E.36897AF0--
