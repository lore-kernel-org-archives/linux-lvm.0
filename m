Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m17HQqf6013124
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 12:26:52 -0500
Received: from mail148.messagelabs.com (mail148.messagelabs.com
	[85.158.137.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m17HQI6V007157
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 12:26:19 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C869AE.88574BCF"
Subject: RE: [linux-lvm] Docs on clustered option of vgcreate
Date: Thu, 7 Feb 2008 17:26:10 -0000
Message-ID: <A78DB34D00374344A0AB65B6523C05DC02AFC31C@marsden.win.datacash.com>
In-Reply-To: <9BB520CB-6D8D-49A5-BF38-92BEB8875FDF@redhat.com>
References: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com><C8BC17D3-C468-4D0B-90D6-D0AB57918AF0@redhat.com><A78DB34D00374344A0AB65B6523C05DC02AFC2E5@marsden.win.datacash.com>
	<9BB520CB-6D8D-49A5-BF38-92BEB8875FDF@redhat.com>
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

------_=_NextPart_001_01C869AE.88574BCF
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Excellent, thanks for the answer, that makes it a lot clearer.

=20

So coupled with exclusion lists etc.. I could have multiple machines
connect to one LUN and each have its own logical volume. Is there a
concept of a "master" in the cluster or does it work in the same way as
tcp with an exponential backoff when the metadata is locked by a host
for changing. I am assuming that cluster aware locking would allow
server-a to create a new lv but not simalteneosly allowing server-b to
create a new lv too.

=20

I know should be experimenting with this but will ask in the mean time
while I wait for my "test lun".

=20

If host A creates a lv on a shared storage will it automatically be
marked as only belonging to host A or is that something you have to do
by hand. I read somewhere in the man pages about tags that you need to
add to achieve such things.

=20

Regards

=20

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Jonathan Brassow
Sent: 07 February 2008 17:00
To: LVM general discussion and development
Subject: Re: [linux-lvm] Docs on clustered option of vgcreate

=20

Clustering LVM (CLVM) provides a way to manage logical volumes in a
consistent way.

=20

By analogy, if you connect the same disk to two machines, put a file
system on it (like ext3), and mount the file system on both machines,
you can expect corruption.  Both machines will be attempting to
create/modify/read metadata without the knowledge that someone else is
doing the same...  You need a cluster aware file system in this type of
scenario - like GFS.  The same thing is true of LVM... you don't want to
have two machines sharing the same volume group -
extending/shrinking/creating/deleting logical volumes without knowledge
of the other machine... it would lead to corruption of your volume group
layout.  This is what CLVM is all about.  It is especially useful when
coupled with a cluster-aware file system, like GFS and others.
Active/Active setups are where CLVM is most useful.  Active/Passive
setups can get away with a little less
(http://sourceware.org/cluster/wiki/LVMFailover).

=20

In active/active environments, the concept of CLVM becomes even more
important when dealing with more complex RAID.  For example, LVM
mirroring must be handled in a different way depending on whether a
logical volume is clustered or not.  (This is handled transparently by
(C)LVM.)  This is because mirroring creates its own metadata to track
the degree to which the component legs are in-sync... this status
tracking must be cluster-aware or the state will be corrupted.  This is
the reason why there is no snapshotting in CLVM yet.  The
cluster-coherent version has not yet been written.

=20

 brassow

=20

On Feb 7, 2008, at 10:36 AM, Gerrard Geldenhuis wrote:





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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=20


------_=_NextPart_001_01C869AE.88574BCF
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
10.0pt;font-family:Arial;color:navy'>Excellent, thanks for the answer, =
that
makes it a lot clearer.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>So coupled with exclusion lists =
etc.. I
could have multiple machines connect to one LUN and each have its own =
logical
volume. Is there a concept of a &#8220;master&#8221; in the cluster or =
does it work in the
same way as tcp with an exponential backoff when the metadata is locked =
by a
host for changing. I am assuming that cluster aware locking would allow
server-a to create a new lv but not simalteneosly allowing server-b to =
create a
new lv too.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I know should be experimenting with =
this
but will ask in the mean time while I wait for my &#8220;test =
lun&#8221;.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>If host A creates a lv on a shared =
storage
will it automatically be marked as only belonging to host A or is that
something you have to do by hand. I read somewhere in the man pages =
about tags
that you need to add to achieve such =
things.<o:p></o:p></span></font></p>

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
17:00<br>
<b><span style=3D'font-weight:bold'>To:</span></b> LVM general =
discussion and
development<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: [linux-lvm] =
Docs on clustered
option of vgcreate</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Clustering LVM (CLVM) provides a way to manage logical volumes =
in a
consistent way.<o:p></o:p></span></font></p>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>By analogy, if you connect the same disk to two machines, put a =
file system
on it (like ext3), and mount the file system on both machines, you can =
expect
corruption. &nbsp;Both machines will be attempting to create/modify/read
metadata without the knowledge that someone else is doing the same... =
&nbsp;You
need a cluster aware file system in this type of scenario - like GFS. =
&nbsp;The
same thing is true of LVM... you don't want to have two machines sharing =
the
same volume group - extending/shrinking/creating/deleting logical =
volumes
without knowledge of the other machine... it would lead to corruption of =
your
volume group layout. &nbsp;This is what CLVM is all about. &nbsp;It is
especially useful when coupled with a cluster-aware file system, like =
GFS and
others. &nbsp;Active/Active setups are where CLVM is most useful.
&nbsp;Active/Passive setups can get away with a little less (<a
href=3D"http://sourceware.org/cluster/wiki/LVMFailover)">http://sourcewar=
e.org/cluster/wiki/LVMFailover)</a>.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>In active/active environments, the concept of CLVM becomes even =
more
important when dealing with more complex RAID. &nbsp;For example, LVM =
mirroring
must be handled in a different way depending on whether a logical volume =
is
clustered or not. &nbsp;(This is handled transparently by (C)LVM.) =
&nbsp;This
is because mirroring creates its own metadata to track the degree to =
which the component
legs are in-sync... this status tracking must be cluster-aware or the =
state
will be corrupted. &nbsp;This is the reason why there is no snapshotting =
in
CLVM yet. &nbsp;The cluster-coherent version has not yet been =
written.<o:p></o:p></span></font></p>

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

<div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>On Feb 7, 2008, at 10:36 AM, Gerrard Geldenhuis =
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

<div link=3Dblue vlink=3Dblue style=3D'word-wrap: =
break-word;-webkit-nbsp-mode: space;
-webkit-line-break: after-white-space'>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks, the &#8220;missing =
snapshotting&#8221; would
be a problem. I am still slightly unclear as to the goals of the =
clustering in
LVM&#8230;<u1:p></u1:p></span></font><font color=3Dblack><span =
style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><u1:p>&nbsp;</u1:p></span></font><fo=
nt
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Regards<u1:p></u1:p></span></font><f=
ont
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><u1:p>&nbsp;</u1:p></span></font><fo=
nt
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

<div style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm =
0cm 4.0pt;
border-width:initial;border-color:initial'>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
color=3Dblack face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<div>

<p class=3DMsoNormal><b><font size=3D2 color=3Dblack face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma;color:black;font-weight:bold=
'>From:</span></font></b><span
class=3Dapple-converted-space><font size=3D2 color=3Dblack =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma;color:black'>&nbsp;</span></=
font></span><font
size=3D2 color=3Dblack face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma;
color:black'><a =
href=3D"mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redhat.com=
</a>
[<a =
href=3D"mailto:linux-lvm-bounces@redhat.com">mailto:linux-lvm-bounces@red=
hat.com</a>]<span
class=3Dapple-converted-space>&nbsp;</span><b><span =
style=3D'font-weight:bold'>On
Behalf Of<span =
class=3Dapple-converted-space>&nbsp;</span></span></b>Jonathan
Brassow<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b><span
class=3Dapple-converted-space>&nbsp;</span>07 February 2008 16:21<br>
<b><span style=3D'font-weight:bold'>To:</span></b><span
class=3Dapple-converted-space>&nbsp;</span>LVM general discussion and =
development<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b><span
class=3Dapple-converted-space>&nbsp;</span>Re: [linux-lvm] Docs on =
clustererd
option of vgcreate</span></font><font color=3Dblack><span =
style=3D'color:black'><o:p></o:p></span></font></p>

<u1:p></u1:p></div>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><u1:p>&nbsp;</u1:p><o:p></o:p></sp=
an></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>The reason the results are likely =
so
sparse is because the two modes of operation (single machine and =
cluster) are
so similar.<u1:p></u1:p><o:p></o:p></span></font></p>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><u1:p>&nbsp;</u1:p><o:p></o:p></sp=
an></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>Once you've setup a cluster and =
installed
the lvm2-cluster rpm*, new volume groups that are created automatically =
receive
the &quot;clustered&quot; attribute. &nbsp;[Toggle the cluster attribute =
by
doing vgchange -c[ny] &lt;vg&gt;] &nbsp;The lvm commands stay the same =
as if
you were running them on a single =
machine.**<u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><u1:p>&nbsp;</u1:p><o:p></o:p></sp=
an></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>&nbsp;brassow<u1:p></u1:p><o:p></o=
:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><u1:p>&nbsp;</u1:p><o:p></o:p></sp=
an></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>* Of course you could compile the =
sources
or use another install method.<u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>** Some targets (like snapshots) =
are not
available when using LVM in a clustered =
mode.<u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><u1:p>&nbsp;</u1:p><o:p></o:p></sp=
an></font></p>

</div>

<div>

<div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'>On Feb 7, 2008, at 8:38 AM, =
Gerrard
Geldenhuis wrote:<u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><br>
<br>
<br>
<o:p></o:p></span></font></p>

</div>

<u1:p></u1:p><span style=3D'orphans: 2;widows: =
2;-webkit-border-horizontal-spacing: 0px;
-webkit-border-vertical-spacing: 0px;-webkit-text-decorations-in-effect: =
none;
-webkit-text-size-adjust: auto;-webkit-text-stroke-width: =
0px;word-spacing:
0px'>

<div link=3Dblue vlink=3Dpurple>

<div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Hi<u2:p></u2:p><=
/span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>I am after a =
bit more
documentation about the usage of the<u2:p></u2:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>--clustered =
option in
vgcreate.<u2:p></u2:p></span></font><font color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'><u2:p>&nbsp;</u2=
:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

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
configured.<u2:p></u2:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'><u2:p>&nbsp;</u2=
:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

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
moment.<u2:p></u2:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'><u2:p>&nbsp;</u2=
:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Regards<u2:p></u=
2:p></span></font><font
color=3Dblack><span =
style=3D'color:black'><u1:p></u1:p><o:p></o:p></span></font></p>

</div>

</div>

</div>

<div>

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
/</a><u1:p></u1:p></span></font><font
color=3Dblack><span style=3D'color:black'><o:p></o:p></span></font></p>

</div>

</div>

</div>

</span>

<div>

<p class=3DMsoNormal><font size=3D3 color=3Dblack face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:black'><u1:p>&nbsp;</u1:p><o:p></o:p></sp=
an></font></p>

</div>

</div>

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

------_=_NextPart_001_01C869AE.88574BCF--
