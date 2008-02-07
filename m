Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m17GbPjE024754
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 11:37:25 -0500
Received: from mail176.messagelabs.com (mail176.messagelabs.com
	[85.158.138.83])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m17Gaf13003472
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 11:36:42 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C869A7.9A2B615E"
Subject: RE: [linux-lvm] Docs on clustererd option of vgcreate
Date: Thu, 7 Feb 2008 16:36:34 -0000
Message-ID: <A78DB34D00374344A0AB65B6523C05DC02AFC2E5@marsden.win.datacash.com>
In-Reply-To: <C8BC17D3-C468-4D0B-90D6-D0AB57918AF0@redhat.com>
References: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com>
	<C8BC17D3-C468-4D0B-90D6-D0AB57918AF0@redhat.com>
From: "Gerrard Geldenhuis" <Gerrard.Geldenhuis@datacash.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C869A7.9A2B615E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, the "missing snapshotting" would be a problem. I am still
slightly unclear as to the goals of the clustering in LVM...

=20

Regards

=20

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Jonathan Brassow
Sent: 07 February 2008 16:21
To: LVM general discussion and development
Subject: Re: [linux-lvm] Docs on clustererd option of vgcreate

=20

The reason the results are likely so sparse is because the two modes of
operation (single machine and cluster) are so similar.

=20

Once you've setup a cluster and installed the lvm2-cluster rpm*, new
volume groups that are created automatically receive the "clustered"
attribute.  [Toggle the cluster attribute by doing vgchange -c[ny] <vg>]
The lvm commands stay the same as if you were running them on a single
machine.**

=20

 brassow

=20

* Of course you could compile the sources or use another install method.

** Some targets (like snapshots) are not available when using LVM in a
clustered mode.

=20

On Feb 7, 2008, at 8:38 AM, Gerrard Geldenhuis wrote:





Hi

I am after a bit more documentation about the usage of the

--clustered option in vgcreate.

=20

At the moment I don't have a spare san drive with which I can
experiment. My understanding is that you would set this flag when
different hosts(nodes) connect to the same storage area typically a san
with lvm configured.

=20

I am after a bit more information describing this "clusterering"
functionality in lvm and how/where it is used. The man pages on lvm and
commands is a bit sparse and I am trawling through google results but
not with great success at the moment.

=20

Regards

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=20


------_=_NextPart_001_01C869A7.9A2B615E
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue style=3D'word-wrap: =
break-word;-webkit-nbsp-mode: space;
-webkit-line-break: after-white-space'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks, the &#8220;missing =
snapshotting&#8221; would
be a problem. I am still slightly unclear as to the goals of the =
clustering in
LVM&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Regards<o:p></o:p></span></font></p>=


<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm =
0cm 4.0pt'>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<b><span
style=3D'font-weight:bold'>On Behalf Of </span></b>Jonathan Brassow<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> 07 February 2008 =
16:21<br>
<b><span style=3D'font-weight:bold'>To:</span></b> LVM general =
discussion and
development<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: [linux-lvm] =
Docs on
clustererd option of vgcreate</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>The reason the results are likely so sparse is because the two =
modes of
operation (single machine and cluster) are so =
similar.<o:p></o:p></span></font></p>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Once you've setup a cluster and installed the lvm2-cluster rpm*, =
new
volume groups that are created automatically receive the =
&quot;clustered&quot;
attribute. &nbsp;[Toggle the cluster attribute by doing vgchange -c[ny]
&lt;vg&gt;] &nbsp;The lvm commands stay the same as if you were running =
them on
a single machine.**<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;brassow<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>* Of course you could compile the sources or use another install
method.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>** Some targets (like snapshots) are not available when using =
LVM in a
clustered mode.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>On Feb 7, 2008, at 8:38 AM, Gerrard Geldenhuis =
wrote:<o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><br>
<br>
<o:p></o:p></span></font></p>

<span style=3D'orphans: 2;text-align:auto;widows: =
2;-webkit-border-horizontal-spacing: 0px;
-webkit-border-vertical-spacing: 0px;-webkit-text-decorations-in-effect: =
none;
-webkit-text-size-adjust: auto;-webkit-text-stroke-width: =
0;word-spacing:0px'>

<div link=3Dblue vlink=3Dpurple>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Hi<u1:p></u1:p><=
/span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>I am after a =
bit more
documentation about the usage of the<u1:p></u1:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>--clustered =
option in
vgcreate.<u1:p></u1:p></span></font><font color=3Dblack><span =
style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'><u1:p>&nbsp;</u1=
:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>At the moment I =
don&#8217;t
have a spare san drive with which I can experiment. My understanding is =
that
you would set this flag when different hosts(nodes) connect to the same =
storage
area typically a san with lvm =
configured.<u1:p></u1:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'><u1:p>&nbsp;</u1=
:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>I am after a =
bit more
information describing this &#8220;clusterering&#8221; functionality in =
lvm and how/where
it is used. The man pages on lvm and commands is a bit sparse and I am =
trawling
through google results but not with great success at the =
moment.<u1:p></u1:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'><u1:p>&nbsp;</u1=
:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Regards<u1:p></u=
1:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

</div>

<p class=3DMsoNormal><font size=3D1 color=3Dblack face=3DHelvetica><span
style=3D'font-size:9.0pt;font-family:Helvetica;color:black'>_____________=
__________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.re=
dhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at<span =
class=3Dapple-converted-space>&nbsp;</span><a
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO=
/</a><o:p></o:p></span></font></p>

</div>

</div>

</span>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</div>

</div>

</body>

</html>

------_=_NextPart_001_01C869A7.9A2B615E--
