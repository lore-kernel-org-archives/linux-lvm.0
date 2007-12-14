Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBEEcvGV024728
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2007 09:38:57 -0500
Received: from f7.net (server1.f7.net [64.34.169.74])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBEEcOWR007294
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2007 09:38:24 -0500
Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBEEMbHW015131
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2007 09:22:37 -0500
Received: from cluster-f.mailcontrol.com (cluster-f.mailcontrol.com
	[85.119.2.190])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBEEM1wg028006
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2007 09:22:04 -0500
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly19f.srv.mailcontrol.com (MailControl) with ESMTP id
	lBEELrw3013761
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2007 14:21:54 GMT
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id OAA17064
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2007 14:25:36 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C83E5C.AB6AAB08"
Date: Fri, 14 Dec 2007 14:21:50 -0000
Message-ID: <A374F37068535C46BFCF8D48CF29AA7F8393B0@zen.zetex.local>
From: "Karl Wagner" <kwagner@zetex.com>
Subject: [linux-lvm] Dropped LVM2 snapshot
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C83E5C.AB6AAB08
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

I have a problem...

=20

I run several Xen VM's, all based on Suse 10.2. In order to save space,
and to simplify adding a new VM in future, I built a base system in a
logical volume, then made writable snapshots for each. However, I made a
mistake with one, and it filled the snapshot. Now it is marked as
invalid and is inaccessible.

=20

Is there any way to force reactivation of the snapshot? The base image
hasn't changed, so it should still contain the exact state of the system
at the point at which it failed.

=20

Thanks

Karl



_________________________________________________________

Zetex Semiconductors - Solutions for an analog world.

http://www.zetex.com
http://www.zetex.cn

E-MAILS are susceptible to interference.  You should not assume that
the contents originated from the sender or the Zetex Group or that they=20
have been accurately reproduced from their original form.
Zetex accepts no responsibility for information, errors or omissions in
this e-mail nor for its use or misuse nor for any act committed or
omitted in connection with this communication.
If in doubt, please verify the authenticity with the sender.
_________________________________________________________

=20

------_=_NextPart_001_01C83E5C.AB6AAB08
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
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
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'>I have a problem&#8230;<o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'>I run several Xen VM&#8217;s, all based on Suse 1=
0.2.
In order to save space, and to simplify adding a new VM in future, I built a
base system in a logical volume, then made writable snapshots for each.
However, I made a mistake with one, and it filled the snapshot. Now it is
marked as invalid and is inaccessible.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'>Is there any way to force reactivation of the
snapshot? The base image hasn&#8217;t changed, so it should still contain t=
he
exact state of the system at the point at which it failed.<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'>Thanks<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB style=
=3D'font-size:
10.0pt;font-family:Arial'>Karl<o:p></o:p></span></font></p>

</div>

<br><br>
<FONT face=3D"Times New Roman" size=3D3><SPAN style=3D"FONT-SIZE: 12pt; FON=
T-FAMILY: 'Times New Roman'">______________________________________________=
________________________</SPAN></FONT>=20
<P></P>
<P><FONT face=3DArial size=3D4><SPAN style=3D"FONT-SIZE: 12pt; FONT-FAMILY:=
 'Arial'"><STRONG><A href=3D"http://www.zetex.com/"><FONT color=3D#000000>Z=
etex Semiconductors</FONT></A></STRONG></SPAN></FONT></P>
<P><FONT face=3DArial size=3D4><SPAN style=3D"FONT-SIZE: 12pt; FONT-FAMILY:=
 'Arial'"><STRONG>Solutions for an analog world</STRONG></SPAN></FONT>=20
<P><FONT face=3DArial size=3D4><SPAN style=3D"FONT-SIZE: 12pt; FONT-FAMILY:=
 'Arial'"><A href=3D"http://www.zetex.com/"><FONT color=3D#000000>www.zetex=
.com</FONT></A><BR><A href=3D"http://www.zetex.cn/"><FONT color=3D#000000>w=
ww.zetex.cn</FONT></A></SPAN></FONT></P>
<P><FONT face=3DArial size=3D4><SPAN style=3D"FONT-SIZE: 12pt; FONT-FAMILY:=
 'Arial'"><FONT size=3D2>E-MAILS are susceptible to interference. You shoul=
d not assume that<BR>the contents originated from the sender or the Zetex G=
roup or that they <BR>have been accurately reproduced from their original f=
orm.<BR>Zetex accepts no responsibility for information, errors or omission=
s in<BR>this e-mail nor for its use or misuse nor for any act committed or<=
BR>omitted in connection with this communication.<BR>If in doubt, please ve=
rify the authenticity with the sender</FONT>.<BR>__________________________=
_______________________________</SPAN></FONT></P></SPAN></FONT></SPAN></FON=
T>
</body>

</html>

------_=_NextPart_001_01C83E5C.AB6AAB08--
