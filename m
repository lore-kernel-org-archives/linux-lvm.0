Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i999war02550
	for <linux-lvm@redhat.com>; Sat, 9 Oct 2004 05:58:36 -0400
Received: from 21cn.com (send.forptr.21cn.com [202.105.45.51])
	by mx3.redhat.com (8.12.11/8.12.10) with SMTP id i999wOhO022476
	for <linux-lvm@redhat.com>; Sat, 9 Oct 2004 05:58:27 -0400
From: "Rocty Wang" <rocty@21cn.com>
Date: Sat, 9 Oct 2004 17:58:12 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01C4AE29.8B1D4560"
Message-ID: <i1958990824043.04841@send4.inner-21cn.com>
Subject: [linux-lvm] How to extend the file system online?
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

------=_NextPart_000_0017_01C4AE29.8B1D4560
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi, all,

 

    After I used LVM2 to create PV, VG, LV on the attached storage

disks, I want to format logical volume as a file system and 

possibly extend the file system of LV online. But when I prefer to 

"ext3" file system, I find the tool "resize2fs" only can resize 

ext3 file system offline.

 

    OS: Linux Fedora Core2(kernel 2.6.7-1.494.2.2smp)

    LVM version: 2.00.15(2004-04-19)

    Library version: 1.00.14-ioctl(2004-04-06)

    Driver version: 4.1.0

 

    Operations:

    pvcreate /dev/sda

    pvcreate /dev/sdb

 

    vgcreate vg1 /dev/sda /dev/sdb

    lvcreate -L 100G -n lv1 vg1

 

    mke2fs /dev/vg1/lv1

    mount /dev/vg1/lv1 /mnt

    lvextend -L +50G /dev/vg1/lv1

 

    Then I used "resize2fs" tool to extend file system, but failed.

I know it must be done when "umount" the lv1.

    If another tool can finish that running under Linux?

 

    Or if any other file system can be mounted and resized online under
Linux? 

XFS? I don't know. 

 

Anyone can help me? Thanks!

 

Rocty Wang

2004-10-09

 

 

 


------=_NextPart_000_0017_01C4AE29.8B1D4560
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"chsdate" downloadurl=3D""/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"chmetcnv" downloadurl=3D""/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
h3
	{margin-top:13.0pt;
	margin-right:0cm;
	margin-bottom:13.0pt;
	margin-left:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:173%;
	page-break-after:avoid;
	font-size:14.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:SimSun;
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

</head>

<body lang=3DZH-CN link=3Dblue vlink=3Dpurple =
style=3D'text-justify-trim:punctuation'>

<div class=3DSection1 style=3D'layout-grid:15.6pt'>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>Hi, =
all,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; After I =
used
LVM2 to create PV, VG, <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">LV</st1:place></st1:City>
on the attached storage<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>disks, I want to format =
logical
volume as a file system and <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>possibly extend the file =
system of <st1:City
w:st=3D"on"><st1:place w:st=3D"on">LV</st1:place></st1:City> online. But =
when I prefer
to <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-US
style=3D'font-size:12.0pt'>&#8220;</span></font><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:SimSun'>ext<st1:chmetcnv =
TCSC=3D"0"
NumberType=3D"1" Negative=3D"False" HasSpace=3D"False" SourceValue=3D"3" =
UnitName=3D"&#8221;"
w:st=3D"on">3<font face=3D"Times New Roman"><span =
style=3D'font-family:"Times New =
Roman"'>&#8221;</span></font></st1:chmetcnv>
file system, I find the tool </span></font><font size=3D3><span =
lang=3DEN-US
style=3D'font-size:12.0pt'>&#8220;</span></font><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:SimSun'>resize2fs</span></font><fon=
t
size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8221;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'> only can resize <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>ext3 file system =
offline.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; OS: =
Linux Fedora
Core2(kernel <st1:chsdate IsROCDate=3D"False" IsLunarDate=3D"False" =
Day=3D"30"
Month=3D"12" Year=3D"1899" =
w:st=3D"on">2.6.7</st1:chsdate>-1.494.2.2smp)<o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; LVM =
version: <st1:chsdate
IsROCDate=3D"False" IsLunarDate=3D"False" Day=3D"30" Month=3D"12" =
Year=3D"1899" w:st=3D"on">2.00.15</st1:chsdate>(<st1:chsdate
IsROCDate=3D"False" IsLunarDate=3D"False" Day=3D"19" Month=3D"4" =
Year=3D"2004" =
w:st=3D"on">2004-04-19</st1:chsdate>)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; Library =
version:
<st1:chsdate IsROCDate=3D"False" IsLunarDate=3D"False" Day=3D"30" =
Month=3D"12"
Year=3D"1899" w:st=3D"on">1.00.14</st1:chsdate>-ioctl(<st1:chsdate =
IsROCDate=3D"False"
IsLunarDate=3D"False" Day=3D"6" Month=3D"4" Year=3D"2004" =
w:st=3D"on">2004-04-06</st1:chsdate>)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; Driver =
version: <st1:chsdate
IsROCDate=3D"False" IsLunarDate=3D"False" Day=3D"30" Month=3D"12" =
Year=3D"1899" =
w:st=3D"on">4.1.0</st1:chsdate><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; =
Operations:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; =
pvcreate /dev/sda<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; =
pvcreate /dev/sdb<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; =
vgcreate vg1
/dev/sda /dev/sdb<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; =
lvcreate </span></font><font
size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8211;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'>L <st1:chmetcnv TCSC=3D"0" NumberType=3D"1" =
Negative=3D"False"
HasSpace=3D"False" SourceValue=3D"100" UnitName=3D"g" =
w:st=3D"on">100G</st1:chmetcnv> </span></font><font
size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8211;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'>n lv1 vg1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; mke2fs
/dev/vg1/lv1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; mount
/dev/vg1/lv1 /mnt<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; =
lvextend </span></font><font
size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8211;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'>L +<st1:chmetcnv TCSC=3D"0" NumberType=3D"1" =
Negative=3D"False"
HasSpace=3D"False" SourceValue=3D"50" UnitName=3D"g" =
w:st=3D"on">50G</st1:chmetcnv>
/dev/vg1/lv1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; Then I =
used </span></font><font
size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8220;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'>resize2fs</span></font><font size=3D3><span =
lang=3DEN-US
style=3D'font-size:12.0pt'>&#8221;</span></font><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'> tool to =
extend file
system, but failed.<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'>I know it =
must be done
when </span></font><font size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8220;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'>umount</span></font><font size=3D3><span =
lang=3DEN-US
style=3D'font-size:12.0pt'>&#8221;</span></font><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'> the =
lv1.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; If =
another tool
can finish that running under Linux?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'>&nbsp;&nbsp;&nbsp; Or if =
any other
file system can be mounted and resized online under Linux? =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'>XFS? I =
don</span></font><font
size=3D3><span lang=3DEN-US =
style=3D'font-size:12.0pt'>&#8217;</span></font><font
size=3D3 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;
font-family:SimSun'>t know. <o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'>Anyone can =
help me? Thanks!<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US style=3D'font-size:12.0pt;font-family:SimSun'>Rocty =
Wang<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:21.0pt'><st1:chsdate =
IsROCDate=3D"False"
IsLunarDate=3D"False" Day=3D"9" Month=3D"10" Year=3D"2004" =
w:st=3D"on"><font size=3D3
 face=3D&#23435;&#20307;><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:
 SimSun'>2004-10-09</span></font></st1:chsdate><font size=3D3 =
face=3D&#23435;&#20307;><span
lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:SimSun'><o:p></o:p></span></font></=
p>

<p class=3DMsoNormal><font size=3D3 face=3D&#23435;&#20307;><span =
lang=3DEN-US
style=3D'font-size:12.0pt;font-family:SimSun'><o:p>&nbsp;</o:p></span></f=
ont></p>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Times New Roman"><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D2 face=3D"Times New Roman"><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0017_01C4AE29.8B1D4560--
