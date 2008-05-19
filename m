Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JF2vnL002732
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 11:02:57 -0400
Received: from mail125.messagelabs.com (mail125.messagelabs.com
	[85.158.136.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4JF2HXj006330
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 11:02:20 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C8B9C1.2913ABEE"
Subject: RE: [linux-lvm] lvm partition on ramdisk
Date: Mon, 19 May 2008 16:01:08 +0100
Message-ID: <A78DB34D00374344A0AB65B6523C05DC02FA9324@marsden.win.datacash.com>
In-Reply-To: <1c748a490805190737h35a11073le7dede4a98ae78c0@mail.gmail.com>
References: <1c748a490805130716y558520d7i7b2781816bd743e1@mail.gmail.com><Pine.LNX.4.44.0805131309330.29266-100000@bmsred.bmsi.com>
	<1c748a490805190737h35a11073le7dede4a98ae78c0@mail.gmail.com>
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

------_=_NextPart_001_01C8B9C1.2913ABEE
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the update. I have not followed the thread closely... did you
see any significant measured peformance increase in using lvm on a
ramdisk?

=20

Regards

=20

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Larry Dickson
Sent: 19 May 2008 15:37
To: LVM general discussion and development
Subject: Re: [linux-lvm] lvm partition on ramdisk

=20

Final results FYI in this investigation: A recent Ubuntu release gets
past the 1TB limit. I found binaries for dosfstools_2.11-2.1ubuntu3 at
=20
http://packages.ubuntu.com/feisty/otherosfs/dosfstools=20
=20
and unpacked them with ar -x. The source is in
=20
https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3
=20

With 4KB sectors, it defaults to 128KB clusters and reaches over 97%
write speed on an 8TB volume. The ramdisk area needed is a little over
512MB, so if you use 768MB you get quite a bit of room for directories
also on ramdisk, and with a little finesse you can even make the
subdirectories lay themselves down on ramdisk. To be "Windows-legal" you
could use 32KB clusters and a little over 2GB ramdisk (or a little over
1GB with one FAT). Linux is happy with the big clusters, and according
to the design should actually be willing to go to 16TB.

Larry

=20

On 5/13/08, Stuart D. Gathman <stuart@bmsi.com> wrote:=20

On Tue, 13 May 2008, Larry Dickson wrote:

> on the full, unpartitioned lv. Then it mounted, with the entire FAT on
> ramdisk, and wrote very fast because FAT32 (like DOS) lays down data
in
> order from the start of a disk and does not skip around (I'd be
interested
> if anyone knows any other file systems with that property).

The SysV filesystem put a fixed size inode table at the beginning of a
partition.  More modern filesystems from ext to reiser try to distribute
the meta-data to keep it closer to the data.  This is, of course,
counter
productive when the beginning of a disk is significantly faster and
seek-free
as in your setup.

Since ext3 inode placement is table driven (with the table in a magic
inode),
there is probably a simple patch to mke2fs to create only one inode
table at
the beginning of a drive.  In fact, I wonder if there is already an
option...
looks like -g blocks_per_group might do the trick - assuming inodes are
at the beginning of a block group, rather than the middle.  If not,
a patch to mke2fs is needed to do what you want.

--
             Stuart D. Gathman <stuart@bmsi.com>
   Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=20


------_=_NextPart_001_01C8B9C1.2913ABEE
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
span.EmailStyle18
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

<body lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks for the update. I have not =
followed
the thread closely&#8230; did you see any significant measured =
peformance
increase in using lvm on a ramdisk?<o:p></o:p></span></font></p>

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
style=3D'font-weight:bold'>On Behalf Of </span></b>Larry Dickson<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> 19 May 2008 =
15:37<br>
<b><span style=3D'font-weight:bold'>To:</span></b> LVM general =
discussion and
development<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: [linux-lvm] =
lvm
partition on ramdisk</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Final results FYI&nbsp;in this investigation: A recent Ubuntu =
release
gets past the 1TB limit. I found binaries for dosfstools_2.11-2.1ubuntu3 =
at<br>
&nbsp;<br>
<a =
href=3D"http://packages.ubuntu.com/feisty/otherosfs/dosfstools">http://pa=
ckages.ubuntu.com/feisty/otherosfs/dosfstools</a>
<br>
&nbsp;<br>
and unpacked them with ar -x. The source is in<br>
&nbsp;<br>
<a =
href=3D"https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3">=
https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3</a><br>
&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>With 4KB sectors, it defaults to 128KB clusters and reaches over =
97%
write speed on an 8TB volume. The ramdisk area needed is a little over =
512MB,
so if you use 768MB&nbsp;you get quite a bit of room for directories =
also on
ramdisk, and with a little finesse you can even make the subdirectories =
lay
themselves down on ramdisk. To be &quot;Windows-legal&quot; you could =
use 32KB
clusters and a little over 2GB ramdisk (or a little over 1GB with one =
FAT).
Linux is happy with the big clusters, and according to the design should
actually be willing to go to 16TB.<br>
<br>
Larry<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><span class=3Dgmailquote><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>On 5/13/08, <b><span =
style=3D'font-weight:bold'>Stuart
D. Gathman</span></b> &lt;<a =
href=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;
wrote:</span></font></span> <o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>On Tue, 13 May 2008, Larry Dickson wrote:<br>
<br>
&gt; on the full, unpartitioned lv. Then it mounted, with the entire FAT =
on<br>
&gt; ramdisk, and wrote very fast because FAT32 (like DOS) lays down =
data in<br>
&gt; order from the start of a disk and does not skip around (I'd be =
interested<br>
&gt; if anyone knows any other file systems with that property).<br>
<br>
The SysV filesystem put a fixed size inode table at the beginning of =
a<br>
partition.&nbsp;&nbsp;More modern filesystems from ext to reiser try to
distribute<br>
the meta-data to keep it closer to the data.&nbsp;&nbsp;This is, of =
course,
counter<br>
productive when the beginning of a disk is significantly faster and =
seek-free<br>
as in your setup.<br>
<br>
Since ext3 inode placement is table driven (with the table in a magic =
inode),<br>
there is probably a simple patch to mke2fs to create only one inode =
table at<br>
the beginning of a drive.&nbsp;&nbsp;In fact, I wonder if there is =
already an
option...<br>
looks like -g blocks_per_group might do the trick - assuming inodes =
are<br>
at the beginning of a block group, rather than the middle.&nbsp;&nbsp;If =
not,<br>
a patch to mke2fs is needed to do what you want.<br>
<br>
--<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Stuart
D. Gathman &lt;<a =
href=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>
&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 =
591-0911
Fax: 703 591-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background =
song
for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot;
commercial.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.re=
dhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO=
/</a><o:p></o:p></span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</div>

</body>

</html>

------_=_NextPart_001_01C8B9C1.2913ABEE--
