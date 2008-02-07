Received: from [192.168.1.101] (vpn-248-90.boston.redhat.com [10.13.248.90])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m17Gxn79021069
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 11:59:50 -0500
Message-Id: <9BB520CB-6D8D-49A5-BF38-92BEB8875FDF@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC02AFC2E5@marsden.win.datacash.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-95-758089343
Mime-Version: 1.0 (Apple Message framework v915)
Subject: Re: [linux-lvm] Docs on clustererd option of vgcreate
Date: Thu, 7 Feb 2008 10:59:48 -0600
References: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com>
	<C8BC17D3-C468-4D0B-90D6-D0AB57918AF0@redhat.com>
	<A78DB34D00374344A0AB65B6523C05DC02AFC2E5@marsden.win.datacash.com>
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


--Apple-Mail-95-758089343
Content-Type: text/plain;
	charset=WINDOWS-1252;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

Clustering LVM (CLVM) provides a way to manage logical volumes in a =20
consistent way.

By analogy, if you connect the same disk to two machines, put a file =20
system on it (like ext3), and mount the file system on both machines, =20=

you can expect corruption.  Both machines will be attempting to create/=20=

modify/read metadata without the knowledge that someone else is doing =20=

the same...  You need a cluster aware file system in this type of =20
scenario - like GFS.  The same thing is true of LVM... you don't want =20=

to have two machines sharing the same volume group - extending/=20
shrinking/creating/deleting logical volumes without knowledge of the =20
other machine... it would lead to corruption of your volume group =20
layout.  This is what CLVM is all about.  It is especially useful when =20=

coupled with a cluster-aware file system, like GFS and others.  Active/=20=

Active setups are where CLVM is most useful.  Active/Passive setups =20
can get away with a little less =
(http://sourceware.org/cluster/wiki/LVMFailover=20
).

In active/active environments, the concept of CLVM becomes even more =20
important when dealing with more complex RAID.  For example, LVM =20
mirroring must be handled in a different way depending on whether a =20
logical volume is clustered or not.  (This is handled transparently by =20=

(C)LVM.)  This is because mirroring creates its own metadata to track =20=

the degree to which the component legs are in-sync... this status =20
tracking must be cluster-aware or the state will be corrupted.  This =20
is the reason why there is no snapshotting in CLVM yet.  The cluster-=20
coherent version has not yet been written.

  brassow

On Feb 7, 2008, at 10:36 AM, Gerrard Geldenhuis wrote:

> Thanks, the =93missing snapshotting=94 would be a problem. I am still =20=

> slightly unclear as to the goals of the clustering in LVM=85
>
> Regards
>
> From: linux-lvm-bounces@redhat.com =
[mailto:linux-lvm-bounces@redhat.com=20
> ] On Behalf Of Jonathan Brassow
> Sent: 07 February 2008 16:21
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Docs on clustererd option of vgcreate
>
> The reason the results are likely so sparse is because the two modes =20=

> of operation (single machine and cluster) are so similar.
>
> Once you've setup a cluster and installed the lvm2-cluster rpm*, new =20=

> volume groups that are created automatically receive the "clustered" =20=

> attribute.  [Toggle the cluster attribute by doing vgchange -c[ny] =20
> <vg>]  The lvm commands stay the same as if you were running them on =20=

> a single machine.**
>
>  brassow
>
> * Of course you could compile the sources or use another install =20
> method.
> ** Some targets (like snapshots) are not available when using LVM in =20=

> a clustered mode.
>
> On Feb 7, 2008, at 8:38 AM, Gerrard Geldenhuis wrote:
>
>
> Hi
> I am after a bit more documentation about the usage of the
> --clustered option in vgcreate.
>
> At the moment I don=92t have a spare san drive with which I can =20
> experiment. My understanding is that you would set this flag when =20
> different hosts(nodes) connect to the same storage area typically a =20=

> san with lvm configured.
>
> I am after a bit more information describing this =93clusterering=94 =20=

> functionality in lvm and how/where it is used. The man pages on lvm =20=

> and commands is a bit sparse and I am trawling through google =20
> results but not with great success at the moment.
>
> Regards
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-95-758089343
Content-Type: text/html;
	charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">Clustering LVM (CLVM) provides =
a way to manage logical volumes in a consistent way.<div><br =
class=3D"webkit-block-placeholder"></div><div>By analogy, if you connect =
the same disk to two machines, put a file system on it (like ext3), and =
mount the file system on both machines, you can expect corruption. =
&nbsp;Both machines will be attempting to create/modify/read metadata =
without the knowledge that someone else is doing the same... &nbsp;You =
need a cluster aware file system in this type of scenario - like GFS. =
&nbsp;The same thing is true of LVM... you don't want to have two =
machines sharing the same volume group - =
extending/shrinking/creating/deleting logical volumes without knowledge =
of the other machine... it would lead to corruption of your volume group =
layout. &nbsp;This is what CLVM is all about. &nbsp;It is especially =
useful when coupled with a cluster-aware file system, like GFS and =
others. &nbsp;Active/Active setups are where CLVM is most useful. =
&nbsp;Active/Passive setups can get away with a little less (<a =
href=3D"http://sourceware.org/cluster/wiki/LVMFailover)">http://sourceware=
.org/cluster/wiki/LVMFailover)</a>.</div><div><br =
class=3D"webkit-block-placeholder"></div><div>In active/active =
environments, the concept of CLVM becomes even more important when =
dealing with more complex RAID. &nbsp;For example, LVM mirroring must be =
handled in a different way depending on whether a logical volume is =
clustered or not. &nbsp;(This is handled transparently by (C)LVM.) =
&nbsp;This is because mirroring creates its own metadata to track the =
degree to which the component legs are in-sync... this status tracking =
must be cluster-aware or the state will be corrupted. &nbsp;This is the =
reason why there is no snapshotting in CLVM yet. &nbsp;The =
cluster-coherent version has not yet been written.</div><div><br =
class=3D"webkit-block-placeholder"></div><div>&nbsp;brassow</div><div><br>=
<div><div>On Feb 7, 2008, at 10:36 AM, Gerrard Geldenhuis =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><span class=3D"Apple-style-span" style=3D"border-collapse: =
separate; color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
auto; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div lang=3D"EN-US" link=3D"blue" =
vlink=3D"blue" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div class=3D"Section1"><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"navy" face=3D"Arial"><span =
style=3D"font-size: 10pt; font-family: Arial; color: navy; ">Thanks, the =
=93missing snapshotting=94 would be a problem. I am still slightly =
unclear as to the goals of the clustering in =
LVM=85<o:p></o:p></span></font></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" color=3D"navy" =
face=3D"Arial"><span style=3D"font-size: 10pt; font-family: Arial; =
color: navy; "><o:p>&nbsp;</o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"navy" face=3D"Arial"><span =
style=3D"font-size: 10pt; font-family: Arial; color: navy; =
">Regards<o:p></o:p></span></font></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" color=3D"navy" =
face=3D"Arial"><span style=3D"font-size: 10pt; font-family: Arial; =
color: navy; "><o:p>&nbsp;</o:p></span></font></div><div =
style=3D"border-top-style: none; border-right-style: none; =
border-bottom-style: none; border-width: initial; border-color: initial; =
border-left-style: solid; border-left-color: blue; border-left-width: =
1.5pt; padding-top: 0cm; padding-right: 0cm; padding-bottom: 0cm; =
padding-left: 4pt; "><div><div class=3D"MsoNormal" align=3D"center" =
style=3D"text-align: center; margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 12pt; font-family: =
'Times New Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; "><hr size=3D"2" width=3D"100%" align=3D"center"=
 tabindex=3D"-1"></span></font></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><b><font size=3D"2" =
face=3D"Tahoma"><span style=3D"font-size: 10pt; font-family: Tahoma; =
font-weight: bold; ">From:</span></font></b><font size=3D"2" =
face=3D"Tahoma"><span style=3D"font-size: 10pt; font-family: Tahoma; =
"><span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redhat.com<=
/a> [<a href=3D"mailto:linux-lvm-bounces@redhat.com" style=3D"color: =
blue; text-decoration: underline; =
">mailto:linux-lvm-bounces@redhat.com</a>]<span =
class=3D"Apple-converted-space">&nbsp;</span><b><span =
style=3D"font-weight: bold; ">On Behalf Of<span =
class=3D"Apple-converted-space">&nbsp;</span></span></b>Jonathan =
Brassow<br><b><span style=3D"font-weight: bold; ">Sent:</span></b><span =
class=3D"Apple-converted-space">&nbsp;</span>07 February 2008 =
16:21<br><b><span style=3D"font-weight: bold; ">To:</span></b><span =
class=3D"Apple-converted-space">&nbsp;</span>LVM general discussion and =
development<br><b><span style=3D"font-weight: bold; =
">Subject:</span></b><span =
class=3D"Apple-converted-space">&nbsp;</span>Re: [linux-lvm] Docs on =
clustererd option of vgcreate</span></font><o:p></o:p></div></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; "><o:p>&nbsp;</o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; ">The reason the results are likely so sparse =
is because the two modes of operation (single machine and cluster) are =
so similar.<o:p></o:p></span></font></div><div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"3" =
face=3D"Times New Roman"><span style=3D"font-size: 12pt; =
"><o:p>&nbsp;</o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; ">Once you've setup a cluster and installed =
the lvm2-cluster rpm*, new volume groups that are created automatically =
receive the "clustered" attribute. &nbsp;[Toggle the cluster attribute =
by doing vgchange -c[ny] &lt;vg&gt;] &nbsp;The lvm commands stay the =
same as if you were running them on a single =
machine.**<o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; =
"><o:p>&nbsp;</o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; =
">&nbsp;brassow<o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; =
"><o:p>&nbsp;</o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; ">* Of course you could compile the sources or =
use another install =
method.<o:p></o:p></span></font></div></div><div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"3" =
face=3D"Times New Roman"><span style=3D"font-size: 12pt; ">** Some =
targets (like snapshots) are not available when using LVM in a clustered =
mode.<o:p></o:p></span></font></div></div><div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"3" =
face=3D"Times New Roman"><span style=3D"font-size: 12pt; =
"><o:p>&nbsp;</o:p></span></font></div><div><div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"3" =
face=3D"Times New Roman"><span style=3D"font-size: 12pt; ">On Feb 7, =
2008, at 8:38 AM, Gerrard Geldenhuis =
wrote:<o:p></o:p></span></font></div></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"3" =
face=3D"Times New Roman"><span style=3D"font-size: 12pt; =
"><br><br><o:p></o:p></span></font></div><span style=3D"orphans: 2; =
widows: 2; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; word-spacing: 0px; "><div =
link=3D"blue" vlink=3D"purple"><div><div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" color=3D"black" =
face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: 10pt; =
font-family: Arial; color: black; ">Hi<u1:p></u1:p></span></font><font =
color=3D"black"><span style=3D"color: black; =
"><o:p></o:p></span></font></div></div><div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"2" =
color=3D"black" face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: =
10pt; font-family: Arial; color: black; ">I am after a bit more =
documentation about the usage of the<u1:p></u1:p></span></font><font =
color=3D"black"><span style=3D"color: black; =
"><o:p></o:p></span></font></div></div><div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman'; "><font size=3D"2" =
color=3D"black" face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: =
10pt; font-family: Arial; color: black; ">--clustered option in =
vgcreate.<u1:p></u1:p></span></font><font color=3D"black"><span =
style=3D"color: black; "><o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"black" face=3D"Arial"><span =
lang=3D"EN-GB" style=3D"font-size: 10pt; font-family: Arial; color: =
black; "><u1:p>&nbsp;</u1:p></span></font><font color=3D"black"><span =
style=3D"color: black; "><o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"black" face=3D"Arial"><span =
lang=3D"EN-GB" style=3D"font-size: 10pt; font-family: Arial; color: =
black; ">At the moment I don=92t have a spare san drive with which I can =
experiment. My understanding is that you would set this flag when =
different hosts(nodes) connect to the same storage area typically a san =
with lvm configured.<u1:p></u1:p></span></font><font color=3D"black"><span=
 style=3D"color: black; "><o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"black" face=3D"Arial"><span =
lang=3D"EN-GB" style=3D"font-size: 10pt; font-family: Arial; color: =
black; "><u1:p>&nbsp;</u1:p></span></font><font color=3D"black"><span =
style=3D"color: black; "><o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"black" face=3D"Arial"><span =
lang=3D"EN-GB" style=3D"font-size: 10pt; font-family: Arial; color: =
black; ">I am after a bit more information describing this =
=93clusterering=94 functionality in lvm and how/where it is used. The =
man pages on lvm and commands is a bit sparse and I am trawling through =
google results but not with great success at the =
moment.<u1:p></u1:p></span></font><font color=3D"black"><span =
style=3D"color: black; "><o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"black" face=3D"Arial"><span =
lang=3D"EN-GB" style=3D"font-size: 10pt; font-family: Arial; color: =
black; "><u1:p>&nbsp;</u1:p></span></font><font color=3D"black"><span =
style=3D"color: black; "><o:p></o:p></span></font></div></div><div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" color=3D"black" face=3D"Arial"><span =
lang=3D"EN-GB" style=3D"font-size: 10pt; font-family: Arial; color: =
black; ">Regards<u1:p></u1:p></span></font><font color=3D"black"><span =
style=3D"color: black; "><o:p></o:p></span></font></div></div></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"1" color=3D"black" face=3D"Helvetica"><span =
style=3D"font-size: 9pt; font-family: Helvetica; color: black; =
">_______________________________________________<br>linux-lvm mailing =
list<br><a href=3D"mailto:linux-lvm@redhat.com" style=3D"color: blue; =
text-decoration: underline; ">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" style=3D"color:=
 blue; text-decoration: underline; =
">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM =
HOW-TO at<span class=3D"apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" style=3D"color: blue; =
text-decoration: underline; =
">http://tldp.org/HOWTO/LVM-HOWTO/</a><o:p></o:p></span></font></div></div=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 12pt; font-family: =
'Times New Roman'; "><font size=3D"3" face=3D"Times New Roman"><span =
style=3D"font-size: 12pt; =
"><o:p>&nbsp;</o:p></span></font></div></div></div></div>_________________=
______________________________<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com" style=3D"color: blue; =
text-decoration: underline; ">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" style=3D"color:=
 blue; text-decoration: underline; =
">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM =
HOW-TO at<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" style=3D"color: blue; =
text-decoration: underline; =
">http://tldp.org/HOWTO/LVM-HOWTO/</a></div></span></blockquote></div><br>=
</div></body></html>=

--Apple-Mail-95-758089343--
