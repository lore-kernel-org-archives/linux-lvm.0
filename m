Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2REEo88024517
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 09:14:50 -0500
Received: from amsfep20-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2REEgT5011636
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 09:14:43 -0500
Received: from server-dc1.intern.nl ([62.194.79.63]) by amsfep20-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20060327141436.HFHJ23728.amsfep20-int.chello.nl@server-dc1.intern.nl>
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 16:14:36 +0200
Received: from Sleepy ([192.168.100.236])
	by server-dc1.intern.nl (8.13.1/8.13.1) with ESMTP id k2REEaJK022881
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 16:14:36 +0200
From: "Joaster" <xxx@havers.nl>
Date: Mon, 27 Mar 2006 16:14:30 +0200
Message-ID: <000401c651a8$c389ee70$ec64a8c0@Sleepy>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C651B9.8712BE70"
Subject: [linux-lvm] Remove LVM2 from system
Reply-To: xxx@havers.nl,
	LVM general discussion and development <linux-lvm@redhat.com>
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

------=_NextPart_000_0005_01C651B9.8712BE70
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: 7bit

Hi all,

When I installed my first FC3 server about a year ago, I used the
automatic partitioning option. As a result my root and swap partition
are now managed by LVM. All works fine, but I want to make images with
PartImage which doesn't recognize the volumes.

Is there a way to make at least my root partition a standard ext3
partition again?

Below I have given some disk information (i hope it will be helpful)

Bye,
Joost.


[root@server-dc1 ~]# cat /etc/fstab
# This file is edited by fstab-sync - see 'man fstab-sync' for details
/dev/hda3 /home ext3 defaults 1 1
/dev/VolGroup00/LogVol00 / ext3 defaults 1 1
LABEL=/boot /boot ext3 defaults 1 2
none /dev/pts devpts gid=5,mode=620 0 0
none /dev/shm tmpfs defaults 0 0
none /proc proc defaults 0 0
none /sys sysfs defaults 0 0
/dev/VolGroup00/LogVol01 swap swap defaults 0 0
/dev/sda1 /home/samba/backup ext3 defaults 1 2
/dev/hdc /media/cdrecorder auto pamconsole,exec,noauto,managed 0 0
/dev/fd0 /media/floppy auto pamconsole,exec,noauto,managed 0 0

[root@server-dc1 ~]# df
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
37285432 4133568 31257876 12% /
/dev/hda3 119101296 41825380 71225840 37% /home
/dev/hda1 101086 15511 80356 17% /boot
none 383400 0 383400 0% /dev/shm
/dev/sda1 240362656 179831788 48321068 79% /home/samba/backup

lvm> vgscan
Reading all physical volumes. This may take a while...
Found volume group "VolGroup00" using metadata type lvm2

lvm> lvmdiskscan
/dev/hda [ 152.67 GB]
/dev/sda [ 232.89 GB]
/dev/hda1 [ 101.94 MB]
/dev/sda1 [ 232.88 GB]
/dev/hda2 [ 37.17 GB] LVM physical volume
/dev/hda3 [ 115.40 GB]
2 disks
3 partitions
0 LVM physical volume whole disks
1 LVM physical volume
 

-- 
No virus found in this outgoing message.
Checked by AVG Free Edition.
Version: 7.1.385 / Virus Database: 268.3.0/290 - Release Date: 23-3-2006
 

------=_NextPart_000_0005_01C651B9.8712BE70
Content-Type: text/html;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dwindows-1250">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C651B9.86B38770">
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
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:536871559 0 0 0 415 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:NL;}
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
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
	{mso-style-name:"Table Normal";
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
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:36.0pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D1 color=3Dblack face=3DVerdana><span
style=3D'font-size:8.5pt;font-family:Verdana;color:black;mso-ansi-languag=
e:EN-US'>Hi
all,<br>
<br>
When I installed my first FC3 server about a year ago, I used the =
automatic
partitioning option. As a result my root and swap partition are now =
managed by
LVM. All works fine, but I want to make images with <span =
class=3DSpellE>PartImage</span>
which doesn't recognize the volumes.<br>
<br>
Is there a way to make at least my root partition a standard ext3 =
partition
again?<br>
<br>
Below I have given some disk information (<span class=3DSpellE>i</span> =
hope it
will be helpful)<br>
<br>
Bye,<br>
<span class=3DSpellE><span class=3DGramE>Joost</span></span><span =
class=3DGramE>.</span><br>
<br>
<br>
[root@server-dc1 ~]# <span class=3DGramE>cat</span> /etc/<span =
class=3DSpellE>fstab</span><br>
# <span class=3DGramE>This</span> file is edited by <span =
class=3DSpellE>fstab</span>-sync
- see 'man <span class=3DSpellE>fstab</span>-sync' for details<br>
/dev/hda3 /home ext3 defaults 1 <span class=3DSpellE>1</span><br>
/dev/VolGroup00/LogVol00 / ext3 defaults 1 <span =
class=3DSpellE>1</span><br>
LABEL=3D/boot /boot ext3 defaults 1 2<br>
<span class=3DGramE>none</span> /dev/pts <span =
class=3DSpellE>devpts</span> <span
class=3DSpellE>gid</span>=3D5,mode=3D620 0 <span =
class=3DSpellE>0</span><br>
<span class=3DGramE>none</span> /dev/<span class=3DSpellE>shm</span> =
<span
class=3DSpellE>tmpfs</span> defaults 0 <span class=3DSpellE>0</span><br>
<span class=3DGramE>none</span> /proc <span class=3DSpellE>proc</span> =
defaults 0 <span
class=3DSpellE>0</span><br>
<span class=3DGramE>none</span> /sys <span class=3DSpellE>sysfs</span> =
defaults 0 <span
class=3DSpellE>0</span><br>
/dev/VolGroup00/LogVol01 swap <span class=3DSpellE>swap</span> defaults =
0 <span
class=3DSpellE>0</span><br>
/dev/sda1 /home/samba/backup ext3 defaults 1 2<br>
/dev/<span class=3DSpellE>hdc</span> /media/<span =
class=3DSpellE>cdrecorder</span>
auto <span class=3DSpellE>pamconsole<span =
class=3DGramE>,exec,noauto,managed</span></span>
0 <span class=3DSpellE>0</span><br>
/dev/fd0 /media/floppy auto <span class=3DSpellE>pamconsole<span =
class=3DGramE>,exec,noauto,managed</span></span>
0 <span class=3DSpellE>0</span><br>
<br>
[root@server-dc1 ~]# <span class=3DSpellE><span =
class=3DGramE>df</span></span><br>
<span class=3DSpellE>Filesystem</span> 1K-blocks Used Available Use% =
Mounted on<br>
/dev/mapper/VolGroup00-LogVol00<br>
37285432 4133568 31257876 12% /<br>
/dev/hda3 119101296 41825380 71225840 37% /home<br>
/dev/hda1 101086 15511 80356 17% /boot<br>
<span class=3DGramE>none</span> 383400 0 383400 0% /dev/<span =
class=3DSpellE>shm</span><br>
/dev/sda1 240362656 179831788 48321068 79% /home/samba/backup<br>
<br>
<span class=3DSpellE><span class=3DGramE>lvm</span></span>&gt; <span =
class=3DSpellE>vgscan</span><br>
<span class=3DGramE>Reading all physical volumes.</span> This may take a =
while...<br>
Found volume group &quot;VolGroup00&quot; using metadata type lvm2<br>
<br>
<span class=3DSpellE><span class=3DGramE>lvm</span></span>&gt; <span =
class=3DSpellE>lvmdiskscan</span><br>
/dev/<span class=3DSpellE>hda</span> <span class=3DGramE>[ 152.67</span> =
GB]<br>
/dev/<span class=3DSpellE>sda</span> <span class=3DGramE>[ 232.89</span> =
GB]<br>
/dev/hda1 <span class=3DGramE>[ 101.94</span> MB]<br>
/dev/sda1 <span class=3DGramE>[ 232.88</span> GB]<br>
/dev/hda2 <span class=3DGramE>[ 37.17</span> GB] LVM physical volume<br>
/dev/hda3 <span class=3DGramE>[ 115.40</span> GB]<br>
2 disks<br>
3 partitions<br>
0 LVM physical volume whole disks<br>
1 LVM physical volume<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<!-- / message --></div>

</body>

</html>
<BR>

<P><FONT SIZE=3D2>--<BR>
No virus found in this outgoing message.<BR>
Checked by AVG Free Edition.<BR>
Version: 7.1.385 / Virus Database: 268.3.0/290 - Release Date: =
23-3-2006<BR>
</FONT> </P>

------=_NextPart_000_0005_01C651B9.8712BE70--
