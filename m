Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB1Gd3KY025932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 1 Dec 2016 11:39:04 -0500
Received: from OTTMGC002.GDCAN.COM (smtp5.gdcanada.com [209.29.4.48])
	(using TLSv1.2 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D3E98FCE7
	for <linux-lvm@redhat.com>; Thu,  1 Dec 2016 16:39:02 +0000 (UTC)
From: "Kipper, Matthew" <Matthew.Kipper@gd-ms.ca>
Date: Thu, 1 Dec 2016 16:29:09 +0000
Message-ID: <5386C99C33554A469B5039A08D6430D0116BA4A5@ottsvw202.gdcan.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5386C99C33554A469B5039A08D6430D0116BA4A5ottsvw202gdcanc_"
MIME-Version: 1.0
Subject: [linux-lvm] Writes to LV not updating the mapped PV's disk cache?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_5386C99C33554A469B5039A08D6430D0116BA4A5ottsvw202gdcanc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I ran into a strange (to me) issue while testing something in LVM - I wante=
d to check that zeroing a Logical Volume would really zero the mapped Physi=
cal Extents. My setup was simple - I had a single Volume Group (vg0) contai=
ning a single Physical Volume (/dev/mmcblk0p2) and a few Logical Volumes. N=
othing fancy.

The test itself was also simple:

1.       Write a test pattern to an LV using 'dd'

2.      Check how the LV is mapped with 'pvdisplay -m'

3.      Read back the mapped PEs from the PVs block device with 'dd', check=
ing that they match the test pattern written to the LV

It seems like Linux's disk cache doesn't like this test. If I follow the st=
eps, the readback from the PV's block device returns stale data. But if I e=
mpty my cache ('echo 3 > /proc/sys/vm/drop_caches') and do the readback aga=
in, I can see the pattern that was written to the LV.

Is this the expected behavior? I don't know much about Linux subsystems, bu=
t I'd assume that when LVM maps LV -> PV and does a write, Linux would get =
the memo and update its disk cache accordingly. The results I'm seeing sugg=
est that Linux doesn't update the cache or flag it as dirty, because I can =
repeatedly read back stale data prior to emptying my cache.

Here are a few details about my setup:

*         Platform: Zynq 7000 (Dual-Core ARM Cortex-A9)

*         Linux: 4.0.0 (built from Xilinx repo)

*         LVM Version: 2.02.162(2) (2016-07-28)

*         LVM Library Version: 1.02.132 (2016-07-28)

*         LVM Driver Version: 4.30.0

*         Test Media: eMMC device

I don't know if I'm misunderstanding how LVM/Linux are supposed to mingle o=
r if this is an actual issue.
Matthew Kipper

--_000_5386C99C33554A469B5039A08D6430D0116BA4A5ottsvw202gdcanc_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Georgia;
	panose-1:2 4 5 2 5 4 5 2 3 3;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Georgia","serif";
	color:#111111;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:229654596;
	mso-list-type:hybrid;
	mso-list-template-ids:-1187055088 -528862138 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:478115223;
	mso-list-type:hybrid;
	mso-list-template-ids:1966007880 -6124336 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l2
	{mso-list-id:1104035224;
	mso-list-type:hybrid;
	mso-list-template-ids:-229368186 1521904228 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1502699153;
	mso-list-type:hybrid;
	mso-list-template-ids:986060630 -1777464236 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Georgia","serif";
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l4
	{mso-list-id:1987972520;
	mso-list-type:hybrid;
	mso-list-template-ids:2023369814 1715098328 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l5
	{mso-list-id:2147308923;
	mso-list-type:hybrid;
	mso-list-template-ids:-374987846 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l5:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">I ran into a strange (to me) issue while testin=
g something in LVM &#8211; I wanted to check that zeroing a Logical Volume =
would really zero the mapped Physical Extents. My setup was simple
 &#8211; I had a single Volume Group (vg0) containing a single Physical Vol=
ume (/dev/mmcblk0p2) and a few Logical Volumes. Nothing fancy.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">The test itself was also simple:<o:p></o:p></sp=
an></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l5 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:&quot;Georgia&quot;=
,&quot;serif&quot;;color:#111111"><span style=3D"mso-list:Ignore">1.<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">Write a test pattern to an LV using &#8=
216;dd&#8217;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l5 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:&quot;Georgia&quot;=
,&quot;serif&quot;;color:#111111"><span style=3D"mso-list:Ignore">2.<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">Check how the LV is mapped with &#8216;=
pvdisplay -m&#8217;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l5 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:&quot;Georgia&quot;=
,&quot;serif&quot;;color:#111111"><span style=3D"mso-list:Ignore">3.<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">Read back the mapped PEs from the PVs b=
lock device with &#8216;dd&#8217;, checking that they match the test patter=
n written to the LV<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">It seems like Linux&#8217;s disk cache doesn&#8=
217;t like this test. If I follow the steps, the readback from the PV&#8217=
;s block device returns stale data. But if I empty my cache (&#8216;echo 3 =
&gt; /proc/sys/vm/drop_caches&#8217;)
 and do the readback again, I can see the pattern that was written to the L=
V. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">Is this the expected behavior? I don&#8217;t kn=
ow much about Linux subsystems, but I&#8217;d assume that when LVM maps LV =
-&gt; PV and does a write, Linux would get the memo and update its disk
 cache accordingly. The results I&#8217;m seeing suggest that Linux doesn&#=
8217;t update the cache or flag it as dirty, because I can repeatedly read =
back stale data prior to emptying my cache.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">Here are a few details about my setup:<o:p></o:=
p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo6"><![if !supportLists]><span style=3D"font-family:Symbol;color:#11111=
1"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">Platform: Zynq 7000 (Dual-Core ARM Cort=
ex-A9)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo6"><![if !supportLists]><span style=3D"font-family:Symbol;color:#11111=
1"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">Linux: 4.0.0 (built from Xilinx repo)<o=
:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo6"><![if !supportLists]><span style=3D"font-family:Symbol;color:#11111=
1"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">LVM Version: 2.02.162(2) (2016-07-28)<o=
:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo6"><![if !supportLists]><span style=3D"font-family:Symbol;color:#11111=
1"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">LVM Library Version: 1.02.132 (2016-07-=
28)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo6"><![if !supportLists]><span style=3D"font-family:Symbol;color:#11111=
1"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">LVM Driver Version: 4.30.0<o:p></o:p></=
span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo6"><![if !supportLists]><span style=3D"font-family:Symbol;color:#11111=
1"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;=
Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111">Test Media: eMMC device<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111">I don&#8217;t know if I&#8217;m misunderstandin=
g how LVM/Linux are supposed to mingle or if this is an actual issue.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot=
;serif&quot;;color:#111111"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Georgia&quot;,&q=
uot;serif&quot;;color:#111111">Matthew Kipper</span></b><o:p></o:p></p>
</div>
</body>
</html>

--_000_5386C99C33554A469B5039A08D6430D0116BA4A5ottsvw202gdcanc_--
