Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4VINN002135
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 14:23:23 -0400
From: "David Spear" <dspear@telus.net>
Date: Mon, 31 May 2004 11:23:00 -0700
Message-ID: <000401c4473c$5087e670$6401a8c0@downstairs>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C44701.A4290E70"
Subject: [linux-lvm] root restore onto a logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C44701.A4290E70
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Heinz:
 
I've posted to various newsgroups, combed through FAQ's, and can't find
an answer to my problem.  
 
I have my root "/" on a logical volume /dev/Volume00/RootVol, which is
in turn mounted on a software RAID-5 volume, /dev/md1.  I wanted to test
my crash recovery, i.e. see if my backups were working.  So rather than
test it on my working system, I decided to create a new logical volume,
/dev/Volume00/TestRoot.  I did the following:
 
1.	Boot from cd to shell
2.	Manually start my raid volumes via raidstart
3.	Manually activate my logical volumes via pvscan, vgscan, lvscan,
lvchange.
4.	Create a new logical volume, /dev/Volume00/TempRoot.
5.	Mount /dev/Volume00/TempRoot
6.	Restore from tape to TempRoot
7.	Change /tmp/TempRoot/etc/fstab to reflect new root location
"/dev/Volume00/TempRoot" instead of /dev/Volume00/RootVol
8.	Create a test entry in /tmp/TempRoot/etc/lilo.conf with the new
root location "/dev/Volume00/TempRoot" and run lilo.
9.	Reboot
 
When my kernel gets to the point where it need to access "/" I get an
error, "cannot mount /dev/Volume00/TempRoot, bad superblock, try e2fsck
-b 8193, etc. etc. etc.".  When it dumps me to a shell and I run
"vgscan" I get "no volumes found" yet, when I run "pvscan" it lists one
volume found "Volume00" on /dev/md1.
 
Did I miss something in my restore?  Do I need to restore a
configuration of some sort?  I have read through the manpages on
vgcfgbackup and vgcfgrestore and believe that these write out
configurations to the physical volumes.  As I can boot my old root (or
boot from cd) and both see and mount /dev/Volume00/TempVol I'm sure
there's nothing wrong with my volume group configuration on the disks.
 
Sorry to ask such a question, but as I said I've looked and looked and
looked for answers elsewhere to no avail.
 
Any answer greatly appreciated.
 
Thanks
 
Dave

------=_NextPart_000_0005_01C44701.A4290E70
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C44701.A18D7C00">
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
  =
<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEve=
ry>
  =
<w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>
  <w:UseMarginsForDrawingGridOrigin/>
  <w:Compatibility>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:DoNotUseHTMLParagraphAutoSpacing/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
   <w:UseWord97LineBreakingRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
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
 /* List Definitions */
 @list l0
	{mso-list-id:2027754501;
	mso-list-type:hybrid;
	mso-list-template-ids:1133388246 67698703 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
font-family:Arial'>Heinz:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;ve posted to various newsgroups, combed =
through FAQ&#8217;s,
and can&#8217;t find an answer to my problem.<span
style=3D'mso-spacerun:yes'>&nbsp; </span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have my root &#8220;/&#8221; on a logical volume
/dev/Volume00/RootVol, which is in turn mounted on a software RAID-5 =
volume,
/dev/md1.<span style=3D'mso-spacerun:yes'>&nbsp; </span>I wanted to test =
my crash
recovery, i.e. see if my backups were working.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>So rather than test it on my =
working
system, I decided to create a new logical volume, =
/dev/Volume00/TestRoot.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>I did the =
following:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<ol style=3D'mso-margin-top-alt:0in' start=3D1 type=3D1>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Boot
     from <span class=3DSpellE>cd</span> to =
shell<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Manually
     start my raid volumes via <span =
class=3DSpellE>raidstart</span><o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Manually
     activate my logical volumes via <span class=3DSpellE>pvscan</span>, =
<span
     class=3DSpellE>vgscan</span>, <span class=3DSpellE>lvscan</span>, =
<span
     class=3DSpellE>lvchange</span>.<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Create
     a new logical volume, =
/dev/Volume00/TempRoot.<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Mount
     /dev/Volume00/TempRoot<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Restore
     from tape to <span =
class=3DSpellE>TempRoot</span><o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Change /<span
     class=3DSpellE>tmp/TempRoot/etc/fstab</span> to reflect new root =
location &#8220;/dev/Volume00/TempRoot&#8221;
     instead of /dev/Volume00/RootVol<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Create
     a test entry in /<span =
class=3DSpellE>tmp/TempRoot/etc/lilo.conf</span> with
     the new root location &#8220;/dev/Volume00/TempRoot&#8221; and run =
<span
     class=3DSpellE>lilo</span>.<o:p></o:p></span></font></li>
 <li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1;tab-stops:list =
.5in'><font
     size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Reboot<o:p></o:p></span></fo=
nt></li>
</ol>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>When my kernel gets to the point where it need to =
access &#8220;/&#8221;
I get an error, &#8220;cannot mount /dev/Volume00/TempRoot, bad <span
class=3DSpellE>superblock</span>, try e2fsck &#8211;b 8193, etc. etc. =
etc.<span
class=3DGramE>&#8221;.</span><span style=3D'mso-spacerun:yes'>&nbsp; =
</span>When it
dumps me to a shell and <span class=3DGramE>I</span> run &#8220;<span
class=3DSpellE>vgscan</span>&#8221; I get &#8220;no volumes found&#8221; =
yet,
when I run &#8220;<span class=3DSpellE>pvscan</span>&#8221; it lists one =
volume
found &#8220;Volume00&#8221; on /dev/md1.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Did I miss something in my restore?<span
style=3D'mso-spacerun:yes'>&nbsp; </span>Do I need to restore a =
configuration of
some sort?<span style=3D'mso-spacerun:yes'>&nbsp; </span>I have read =
through the <span
class=3DSpellE>manpages</span> on <span =
class=3DSpellE>vgcfgbackup</span> and <span
class=3DSpellE>vgcfgrestore</span> and believe that these write out
configurations to the physical volumes.<span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>As I can boot my old root (or boot from <span =
class=3DSpellE>cd</span>)
and both see and mount /dev/Volume00/TempVol I&#8217;m sure =
there&#8217;s
nothing wrong with my volume group configuration on the =
disks&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Sorry to ask such a question, but as I said =
I&#8217;ve
looked and looked and looked for answers elsewhere to no =
avail.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Any answer greatly =
appreciated.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Dave<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0005_01C44701.A4290E70--
