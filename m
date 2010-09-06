From: "Kirby Zhou" <kirbyzhou@sohu-rd.com>
Date: Tue, 7 Sep 2010 00:23:23 +0800
Message-ID: <001901cb4ddf$d3bff6d0$7b3fe470$@com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01CB4E22.E1E4BD70"
Content-Language: zh-cn
Subject: [linux-lvm] Does LVM-LV take system cache?
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
To: "'Red Hat Enterprise Linux 5 (Tikanga) discussion mailing-list'" <rhelv5-list@redhat.com>, 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_001A_01CB4E22.E1E4BD70
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Does LVM-LV take system cache?

In my test, it does not take system cache on a RHEL5 box, is it a bug or a
feature?

 

Test1, run dd with raw block device, it seems system cache can boost up
reread operation.

 

[@djt_18_69 ~]# dd if=/dev/sdc bs=1M of=/dev/null count=500

524288000 bytes (524 MB) copied, 1.88267 seconds, 278 MB/s

[@djt_18_69 ~]# dd if=/dev/sdc bs=1M of=/dev/null count=500

524288000 bytes (524 MB) copied, 0.13445 seconds, 3.9 GB/s

 

Test2, run dd with lv, it seems system cache CAN NOT boost up reread
operation.

 

[@djt_18_69 ~]# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500

524288000 bytes (524 MB) copied, 2.17848 seconds, 241 MB/s

[@djt_18_69 ~]# dd if=/dev/vgext/lvtest5 bs=1M of=/dev/null count=500

524288000 bytes (524 MB) copied, 2.17451 seconds, 241 MB/s

 

Both 2.6.18-164.15.1.el5 and 2.6.18-194.el5 do the same behavior.

 

 

  Regards

  Kirby Zhou

 


------=_NextPart_000_001A_01CB4E22.E1E4BD70
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
 /* Page Definitions */
 @page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
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

<div class=3DWordSection1>

<p class=3DMsoNormal><span lang=3DEN-US>Does LVM-LV take system =
cache?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>In my test, it does not take =
system cache
on a RHEL5 box, is it a bug or a feature?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Test1, run dd with raw block =
device, it
seems system cache can boost up reread operation.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>[@djt_18_69 ~]# dd if=3D/dev/sdc =
bs=3D1M
of=3D/dev/null count=3D500<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>524288000 bytes (524 MB) copied, =
1.88267
seconds, 278 MB/s<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>[@djt_18_69 ~]# dd if=3D/dev/sdc =
bs=3D1M
of=3D/dev/null count=3D500<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>524288000 bytes (524 MB) copied, =
0.13445
seconds, 3.9 GB/s<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Test2, run dd with lv, it seems =
system cache
CAN NOT boost up reread operation.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>[@djt_18_69 ~]# dd =
if=3D/dev/vgext/lvtest5
bs=3D1M of=3D/dev/null count=3D500<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>524288000 bytes (524 MB) copied, =
2.17848
seconds, 241 MB/s<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>[@djt_18_69 ~]# dd =
if=3D/dev/vgext/lvtest5
bs=3D1M of=3D/dev/null count=3D500<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>524288000 bytes (524 MB) copied, =
2.17451
seconds, 241 MB/s<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>Both 2.6.18-164.15.1.el5 and =
2.6.18-194.el5
do the same behavior.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>&nbsp; =
Regards<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>&nbsp; Kirby =
Zhou<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

</body>

</html>

------=_NextPart_000_001A_01CB4E22.E1E4BD70--
