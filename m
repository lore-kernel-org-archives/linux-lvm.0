Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3U6V6v17622
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 02:31:06 -0400
Received: from mail.ict.ac.cn (mail.ict.ac.cn [159.226.39.4])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3U6V2KG029900
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 02:31:03 -0400
From: "zhangjg" <zhangjg@ict.ac.cn>
Date: Tue, 4 May 2004 14:30:10 +0800
Message-ID: <000001c431a1$408acb30$060f0a0a@zhangjg>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C431E4.4EAF91D0"
Subject: [linux-lvm] lvm bug report
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01C431E4.4EAF91D0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

When I running redhat 8.0(2.4.18-14 kernel), read/write a big file on a
raid0 device(3ware, ide disk), the kernel panic as next, and the total
disk io is about 5-10MB.
Sep 18 18:04:29 xxxx kernel:EIP is at_make_request [kernel] 0xa2
Sep 18 18:04:29 xxxx kernel:Eax: 000020000 ebx: 00000001 ecx: f0515200
edx: 00004000 esi: 00000008 edi: 2b23aboo ebp: 00000001: esp: c36b5e78
Sep 18 18:04:29 xxxx kernel:Process kupdated (pid: 6) stackpage:
c36b5000
Sep 18 18:04:29 xxxx kernel: Stack: c022d850 c022db02 000002b4 00000008
f2404720 031d9000 00000000 ca1196c0 
Sep 18 18:04:29 xxxx kernel:        00000001 00000008 f7144970 f7144800
f70a0000 00000000 00004000 ca11ae48 
Sep 18 18:04:29 xxxx kernel:        ca1189e0 0841ae40 002007d0 00000000
00000000 002007d0 00000202 c017f2c0 
Sep 18 18:04:29 xxxx kernel: Call Trace: [submit_bh+88/116]
[write_locked_buffers+30/40] [sync_old_buffers+112/168] 
Sep 18 18:04:29 xxxx kernel: Call Trace: [<c017f2c0>] [<c017f378>]
[<c013680a>] [<c0136936>] [<c0139e1c>] 
Sep 18 18:04:29 xxxx kernel:    [kupdate+309/316] [stext+0/100]
[stext+0/100] [kernel_thread+26/48] 
Sep 18 18:04:29 xxxx kernel:    [<c013a125>] [<c0105000>] [<c010575a>]
[<c0105763>] 
Sep 18 18:04:29 xxxx kernel: 
Sep 18 18:04:29 xxxx kernel: Code: 0f 0b 83 c4 0c 8d b4 26 00 00 00 00
8b 74 24 5c 56 8b 7c 24

------=_NextPart_000_0001_01C431E4.4EAF91D0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dgb2312">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C431CA.0C474A50">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"time"/>
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
  <w:PunctuationKerning/>
  <w:DrawingGridVerticalSpacing>7.8 =
=B0=F5</w:DrawingGridVerticalSpacing>
  =
<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEve=
ry>
  =
<w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:Compatibility>
   <w:SpaceForUL/>
   <w:BalanceSingleByteDoubleByteWidth/>
   <w:DoNotLeaveBackslashAlone/>
   <w:ULTrailSpace/>
   <w:DoNotExpandShiftReturn/>
   <w:AdjustLineHeightInTable/>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:UseFELayout/>
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
 /* Font Definitions */
 @font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-alt:SimSun;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 135135232 16 0 262145 0;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 135135232 16 0 262145 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-pagination:none;
	font-size:10.5pt;
	mso-bidi-font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:=CB=CE=CC=E5;
	mso-font-kerning:1.0pt;}
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
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-fareast-font-family:=CB=CE=CC=E5;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
 /* Page Definitions */
 @page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:42.55pt;
	mso-footer-margin:49.6pt;
	mso-paper-source:0;
	layout-grid:15.6pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:=C6=D5=CD=A8=B1=ED=B8=F1;
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

<body lang=3DZH-CN link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:21.0pt;text-justify-trim:
punctuation'>

<div class=3DSection1 style=3D'layout-grid:15.6pt'>

<p class=3DMsoNormal><font size=3D2 face=3D"Times New Roman"><span =
lang=3DEN-US
style=3D'font-size:10.5pt'><span =
style=3D'mso-bidi-font-size:12.0pt'>When I running
<span class=3DSpellE>redhat</span> 8.0(2.4.18-14 kernel), read/write a =
big file
on a raid0 device(3ware, <span class=3DSpellE>ide</span> disk), the =
kernel panic
as next, and the total disk <span class=3DSpellE>io</span> is about =
5-10MB.<o:p></o:p></span></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span> <span
class=3DSpellE>kernel<span class=3DGramE>:EIP</span></span> is <span =
class=3DSpellE>at_make_request</span>
[kernel] 0xa2<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span> <span
class=3DSpellE>kernel<span class=3DGramE>:Eax</span></span>: 000020000 =
<span
class=3DSpellE>ebx</span>: 00000001 <span class=3DSpellE>ecx</span>: =
f0515200 <span
class=3DSpellE>edx</span>: 00004000 <span class=3DSpellE>esi</span>: =
00000008 <span
class=3DSpellE>edi</span>: 2b23aboo <span class=3DSpellE>ebp</span>: =
00000001: <span
class=3DSpellE>esp</span>: c36b5e78<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span> <span
class=3DSpellE>kernel<span class=3DGramE>:Process</span></span> <span =
class=3DSpellE>kupdated</span>
(<span class=3DSpellE>pid</span>: 6) <span =
class=3DSpellE>stackpage</span>: c36b5000<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel: Stack: c022d850 c022db02 000002b4 00000008 f2404720 031d9000 =
00000000
ca1196c0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel:<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>00000001 00000008 f7144970 f7144800 f70a0000 00000000 00004000 =
ca11ae48 <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel:<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>ca1189e0 0841ae40 002007d0 00000000 <span =
class=3DSpellE>00000000</span>
002007d0 00000202 c017f2c0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel: Call Trace: [submit_bh+88/116] [write_locked_buffers+30/40] =
[sync_old_buffers+112/168]
<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel: Call Trace: [&lt;c017f2c0&gt;] [&lt;c017f378&gt;] =
[&lt;c013680a&gt;]
[&lt;c0136936&gt;] [&lt;c0139e1c&gt;] <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel:<span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;
</span>[kupdate+309/316] [stext+0/100] [stext+0/100] =
[kernel_thread+26/48] <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel:<span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;
</span>[&lt;c013a125&gt;] [&lt;c0105000&gt;] [&lt;c010575a&gt;]
[&lt;c0105763&gt;] <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;mso-pagination:widow-orphan;
tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt =
412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt'><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'>Sep 18 =
</span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel: <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:12.0pt;
font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerni=
ng:0pt'>Sep 18 </span></font><st1:time
Hour=3D"18" Minute=3D"4"><font size=3D3 face=3D=CB=CE=CC=E5><span =
lang=3DEN-US style=3D'font-size:
 =
12.0pt;font-family:=CB=CE=CC=E5;mso-bidi-font-family:=CB=CE=CC=E5;mso-fon=
t-kerning:0pt'>18:04:29</span></font></st1:time><font
size=3D3 face=3D=CB=CE=CC=E5><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:=CB=CE=CC=E5;
mso-bidi-font-family:=CB=CE=CC=E5;mso-font-kerning:0pt'> <span =
class=3DSpellE>xxxx</span>
kernel: Code: 0f 0b 83 c4 0c 8d b4 26 00 <span class=3DSpellE>00</span> =
<span
class=3DSpellE>00</span> <span class=3DSpellE>00</span> 8b 74 24 5c 56 =
8b 7c 24</span></font><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:Arial'><o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0001_01C431E4.4EAF91D0--
