Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8PBAWfR024915
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2006 07:10:32 -0400
Received: from zh.plasmon.cn ([211.97.48.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8PBAINQ017628
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2006 07:10:19 -0400
Message-Id: <200609251110.k8PBAINQ017628@mx3.redhat.com>
From: "more.zeng" <mzeng@plasmon.cn>
Date: Mon, 25 Sep 2006 18:12:12 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0123_01C6E0CE.1FAB90A0"
Subject: [linux-lvm] A problem in LVM1 kernel code lvm.c::lvm_do_vg_create()
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: lvm-cvs@sources.redhat.com
Cc: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_0123_01C6E0CE.1FAB90A0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear LVM guys,

=20

I find an issue in the LVM1 kernel code for function =
lvm.c::lvm_do_vg_create():

In the original code, the vg_count will be increased only when this =
function is executed successfully. But I think the vg_count should be =
increased after the variable vg[VG_CHR(minor)] is updated. Given the =
reason that after the variable vg[VG_CHR(minor)] is updated, for any =
failure case, lvm_do_vg_create() will always call lvm_do_vg_remove() =
that will decrease the vg_count. So the vg_count should be increased =
first before any call for lvm_do_vg_remove().

=20

This issue did exist for our product for our LV sometimes will fail to =
start (corrupt snapshot). Please give me the confirmation that the above =
is really an issue and the following diff can resolve this issue (from =
the latest LVM1 CVS code), thanks.

=20

=20

Best regards,

More

=20

Index: lvm.c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

RCS file: /cvs/lvm/LVM/kernel/lvm.c,v

retrieving revision 1.81

diff -c -r1.81 lvm.c

*** lvm.c       5 Mar 2003 11:37:16 -0000       1.81

--- lvm.c       25 Sep 2006 09:57:26 -0000

***************

*** 1802,1807 ****

--- 1802,1809 ----

 =20

        vg[VG_CHR(minor)] =3D vg_ptr;

 =20

+       vg_count++;

+=20

        /* get the physical volume structures */

        vg_ptr->pv_act =3D vg_ptr->pv_cur =3D 0;

        for (p =3D 0; p < vg_ptr->pv_max; p++) {

***************

*** 1870,1877 ****

 =20

        vfree(snap_lv_ptr);

 =20

-       vg_count++;

-=20

 =20

        MOD_INC_USE_COUNT;

 =20

--- 1872,1877 ----


------=_NextPart_000_0123_01C6E0CE.1FAB90A0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City" =
downloadurl=3D"http://www.5iamas-microsoft-com:office:smarttags"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place" downloadurl=3D"http://www.5iantlavalamp.com/"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
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

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>Dear LVM guys,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>I find an issue in the LVM1 kernel code for =
function
lvm.c::lvm_do_vg_create():<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>In the original code, the vg_count will be =
increased
only when this function is executed successfully. But I think the =
vg_count
should be increased after the variable vg[VG_CHR(minor)] is updated. =
Given the
reason that after the variable vg[VG_CHR(minor)] is updated, for any =
failure
case, lvm_do_vg_create() will always call lvm_do_vg_remove() that will =
decrease
the vg_count. So the vg_count should be increased first before any call =
for
lvm_do_vg_remove().<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>This issue did exist for our product for our =
<st1:City
w:st=3D"on"><st1:place w:st=3D"on">LV</st1:place></st1:City> sometimes =
will fail to
start (corrupt snapshot). Please give me the confirmation that the above =
is
really an issue and the following diff can resolve this issue (from the =
latest
LVM1 CVS code), thanks.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>Best regards,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>More<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>Index: lvm.c<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>RCS file: =
/cvs/lvm/LVM/kernel/lvm.c,v<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>retrieving revision =
1.81<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>diff -c -r1.81 =
lvm.c<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>*** lvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 =
Mar 2003 11:37:16 -0000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.81<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>--- lvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
25 Sep 2006 09:57:26 -0000<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>***************<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>*** 1802,1807 ****<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>--- 1802,1809 ----<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
vg[VG_CHR(minor)] =3D vg_ptr;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
vg_count++;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>+ <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
get the physical volume structures */<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
vg_ptr-&gt;pv_act =3D vg_ptr-&gt;pv_cur =3D =
0;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for =
(p =3D 0; p &lt; vg_ptr-&gt;pv_max; p++) {<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>***************<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>*** 1870,1877 ****<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
vfree(snap_lv_ptr);<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
vg_count++;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>- <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
MOD_INC_USE_COUNT;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>=C2=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>--- 1872,1877 ----<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0123_01C6E0CE.1FAB90A0--
