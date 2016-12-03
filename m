Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB34081b024541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 2 Dec 2016 23:00:08 -0500
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9EC9C106584
	for <linux-lvm@redhat.com>; Sat,  3 Dec 2016 04:00:06 +0000 (UTC)
Received: from [192.168.1.173] (unknown [66.189.61.192])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id E0AEC5FF8F
	for <linux-lvm@redhat.com>; Fri,  2 Dec 2016 22:52:17 -0500 (EST)
From: John Stoffel <john@stoffel.org>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-E020B8EA-BB5E-4304-ADF5-96935AD1A3B5
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Message-Id: <185A398C-B166-4648-8973-3C5A29F10084@stoffel.org>
Date: Fri, 2 Dec 2016 22:52:16 -0500
References: <5386C99C33554A469B5039A08D6430D0116BA4A5@ottsvw202.gdcan.com>
In-Reply-To: <5386C99C33554A469B5039A08D6430D0116BA4A5@ottsvw202.gdcan.com>
Subject: Re: [linux-lvm] Writes to LV not updating the mapped PV's disk
	cache?
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-E020B8EA-BB5E-4304-ADF5-96935AD1A3B5
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I suspect you either need to flush the device at the end, or use direction f=
rom within your dd test run to force the data to disk.

It would help if you would show the actual commands you run so we can look t=
hem over as well. =20

Sent from my Amiga 1000

> On Dec 1, 2016, at 11:29 AM, Kipper, Matthew <Matthew.Kipper@gd-ms.ca> wro=
te:
>=20
> Hi,
> =20
> I ran into a strange (to me) issue while testing something in LVM =E2=80=93=
 I wanted to check that zeroing a Logical Volume would really zero the mappe=
d Physical Extents. My setup was simple =E2=80=93 I had a single Volume Grou=
p (vg0) containing a single Physical Volume (/dev/mmcblk0p2) and a few Logic=
al Volumes. Nothing fancy.
> =20
> The test itself was also simple:
> 1.       Write a test pattern to an LV using =E2=80=98dd=E2=80=99
> 2.      Check how the LV is mapped with =E2=80=98pvdisplay -m=E2=80=99
> 3.      Read back the mapped PEs from the PVs block device with =E2=80=98d=
d=E2=80=99, checking that they match the test pattern written to the LV
> =20
> It seems like Linux=E2=80=99s disk cache doesn=E2=80=99t like this test. I=
f I follow the steps, the readback from the PV=E2=80=99s block device return=
s stale data. But if I empty my cache (=E2=80=98echo 3 > /proc/sys/vm/drop_c=
aches=E2=80=99) and do the readback again, I can see the pattern that was wr=
itten to the LV.
> =20
> Is this the expected behavior? I don=E2=80=99t know much about Linux subsy=
stems, but I=E2=80=99d assume that when LVM maps LV -> PV and does a write, L=
inux would get the memo and update its disk cache accordingly. The results I=
=E2=80=99m seeing suggest that Linux doesn=E2=80=99t update the cache or fla=
g it as dirty, because I can repeatedly read back stale data prior to emptyi=
ng my cache.
> =20
> Here are a few details about my setup:
> =C2=B7         Platform: Zynq 7000 (Dual-Core ARM Cortex-A9)
> =C2=B7         Linux: 4.0.0 (built from Xilinx repo)
> =C2=B7         LVM Version: 2.02.162(2) (2016-07-28)
> =C2=B7         LVM Library Version: 1.02.132 (2016-07-28)
> =C2=B7         LVM Driver Version: 4.30.0
> =C2=B7         Test Media: eMMC device
> =20
> I don=E2=80=99t know if I=E2=80=99m misunderstanding how LVM/Linux are sup=
posed to mingle or if this is an actual issue.
> Matthew Kipper
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--Apple-Mail-E020B8EA-BB5E-4304-ADF5-96935AD1A3B5
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>I suspect you either need to flush the=
 device at the end, or use direction from within your dd test run to force t=
he data to disk.</div><div id=3D"AppleMailSignature"><br></div><div id=3D"Ap=
pleMailSignature">It would help if you would show the actual commands you ru=
n so we can look them over as well. &nbsp;</div><div id=3D"AppleMailSignatur=
e"><br>Sent from my Amiga 1000</div><div><br>On Dec 1, 2016, at 11:29 AM, Ki=
pper, Matthew &lt;<a href=3D"mailto:Matthew.Kipper@gd-ms.ca">Matthew.Kipper@=
gd-ms.ca</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div>

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">=

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
	mso-list-template-ids:-1187055088 -528862138 67698691 67698693 6769=
8689 67698691 67698693 67698689 67698691 67698693;}
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
	mso-list-template-ids:1966007880 -6124336 67698691 67698693 6769868=
9 67698691 67698693 67698689 67698691 67698693;}
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
	mso-list-template-ids:-229368186 1521904228 67698691 67698693 67698=
689 67698691 67698693 67698689 67698691 67698693;}
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
	mso-list-template-ids:986060630 -1777464236 67698691 67698693 67698=
689 67698691 67698693 67698689 67698691 67698693;}
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
	mso-list-template-ids:2023369814 1715098328 67698691 67698693 67698=
689 67698691 67698693 67698689 67698691 67698693;}
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
	mso-list-template-ids:-374987846 67698703 67698713 67698715 6769870=
3 67698713 67698715 67698703 67698713 67698715;}
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


<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">I ran into a strange (to me) issue while testing s=
omething in LVM =E2=80=93 I wanted to check that zeroing a Logical Volume wo=
uld really zero the mapped Physical Extents. My setup was simple
 =E2=80=93 I had a single Volume Group (vg0) containing a single Physical Vo=
lume (/dev/mmcblk0p2) and a few Logical Volumes. Nothing fancy.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">The test itself was also simple:<o:p></o:p></span=
></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l5 level1=
 lfo1"><!--[if !supportLists]--><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111"><span style=3D"mso-list:Ignore">1.<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">Write a test pattern to an LV using =E2=
=80=98dd=E2=80=99<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l5 level1=
 lfo1"><!--[if !supportLists]--><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111"><span style=3D"mso-list:Ignore">2.<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">Check how the LV is mapped with =E2=80=
=98pvdisplay -m=E2=80=99<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l5 level1=
 lfo1"><!--[if !supportLists]--><span style=3D"font-family:&quot;Georgia&quo=
t;,&quot;serif&quot;;color:#111111"><span style=3D"mso-list:Ignore">3.<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">Read back the mapped PEs from the PVs=
 block device with =E2=80=98dd=E2=80=99, checking that they match the test p=
attern written to the LV<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">It seems like Linux=E2=80=99s disk cache doesn=E2=
=80=99t like this test. If I follow the steps, the readback from the PV=E2=80=
=99s block device returns stale data. But if I empty my cache (=E2=80=98echo=
 3 &gt; /proc/sys/vm/drop_caches=E2=80=99)
 and do the readback again, I can see the pattern that was written to the LV=
. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">Is this the expected behavior? I don=E2=80=99t kn=
ow much about Linux subsystems, but I=E2=80=99d assume that when LVM maps LV=
 -&gt; PV and does a write, Linux would get the memo and update its disk
 cache accordingly. The results I=E2=80=99m seeing suggest that Linux doesn=E2=
=80=99t update the cache or flag it as dirty, because I can repeatedly read b=
ack stale data prior to emptying my cache.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">Here are a few details about my setup:<o:p></o:p>=
</span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level1=
 lfo6"><!--[if !supportLists]--><span style=3D"font-family:Symbol;color:#111=
111"><span style=3D"mso-list:Ignore">=C2=B7<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">Platform: Zynq 7000 (Dual-Core ARM Co=
rtex-A9)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level1=
 lfo6"><!--[if !supportLists]--><span style=3D"font-family:Symbol;color:#111=
111"><span style=3D"mso-list:Ignore">=C2=B7<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">Linux: 4.0.0 (built from Xilinx repo)=
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level1=
 lfo6"><!--[if !supportLists]--><span style=3D"font-family:Symbol;color:#111=
111"><span style=3D"mso-list:Ignore">=C2=B7<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">LVM Version: 2.02.162(2) (2016-07-28)=
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level1=
 lfo6"><!--[if !supportLists]--><span style=3D"font-family:Symbol;color:#111=
111"><span style=3D"mso-list:Ignore">=C2=B7<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">LVM Library Version: 1.02.132 (2016-0=
7-28)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level1=
 lfo6"><!--[if !supportLists]--><span style=3D"font-family:Symbol;color:#111=
111"><span style=3D"mso-list:Ignore">=C2=B7<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">LVM Driver Version: 4.30.0<o:p></o:p>=
</span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level1=
 lfo6"><!--[if !supportLists]--><span style=3D"font-family:Symbol;color:#111=
111"><span style=3D"mso-list:Ignore">=C2=B7<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><!--[endif]--><span style=3D"font-family:&quot;Georgia&=
quot;,&quot;serif&quot;;color:#111111">Test Media: eMMC device<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111">I don=E2=80=99t know if I=E2=80=99m misunderstand=
ing how LVM/Linux are supposed to mingle or if this is an actual issue.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Georgia&quot;,&quot;=
serif&quot;;color:#111111"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Georgia&quot;,&qu=
ot;serif&quot;;color:#111111">Matthew Kipper</span></b><o:p></o:p></p>
</div>


</div></blockquote><blockquote type=3D"cite"><div><span>____________________=
___________________________</span><br><span>linux-lvm mailing list</span><br=
><span><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a></spa=
n><br><span><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">ht=
tps://www.redhat.com/mailman/listinfo/linux-lvm</a></span><br><span>read the=
 LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/=
HOWTO/LVM-HOWTO/</a></span></div></blockquote></body></html>=

--Apple-Mail-E020B8EA-BB5E-4304-ADF5-96935AD1A3B5--
