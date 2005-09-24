Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8OLnPV02730
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 17:49:25 -0400
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8OLnHuE017605
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 17:49:17 -0400
Received: by xproxy.gmail.com with SMTP id s13so72811wxc
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2005 14:49:12 -0700 (PDT)
Message-ID: <89f9efee05092414492ec70ed@mail.gmail.com>
Date: Sat, 24 Sep 2005 16:49:12 -0500
From: Leonard Smith <lrsmith@gmail.com>
Subject: Re: [linux-lvm] Recover Partition Table - vgdisplay/vgscan fails
In-Reply-To: <64A66E9DBE859F4993DBE06DECD4F95301B2D8E4@TLRUSMNEAGMBX21.ERF.THOMSON.COM>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_12184_28659489.1127598552127"
References: <64A66E9DBE859F4993DBE06DECD4F95301B2D8E4@TLRUSMNEAGMBX21.ERF.THOMSON.COM>
Reply-To: Leonard Smith <lrsmith@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

------=_Part_12184_28659489.1127598552127
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

We tested out the below steps and they appeared to work.

First you need to remove the partition table on /dev/sd01. So issue the
"fdisk /dev/sdo1" then delete the partition table and write out the changes=
.

A reboot is required since most of the lvm command fail due to the VDGA
being inconsistent with what is in the kernel. All of the filesystems, that
are in datavg, need to be commented out of /etc/fstab to avoid having the O=
S
try and mount them on reboot. When the system comes back up all the volume
groups, logical volumes and filesystem should be up except for datavg, and
its logical volumes and file-systems. The LVM commands no longer will error
out.

Once the system is back up a VGDA needs to be created on /dev/sdo1.
"pvcreate -v /dev/sdo1"
Recover the old VGDA data, for /dev/sdo1. "vgcfgrestore -v -n datavg
/dev/sdo1"

Scan for volume groups, "vgscan"
Activate the "newly" found datavg volume group, "vgchange -a y datavg"

At this point we were able to see datavg, all of the logical volumes, under
datavg, and mount the filesystems. We un-commented the filesystems entries,
in /etc/fstab, rebooted a few times and verified that the filesystem
were available on the reboot.

Len Smith


On 9/23/05, paul.stein@thomson.com <paul.stein@thomson.com> wrote:
>
> Additional information explaining what caused the below errors:
>  +++++++++++++++ start +++++++++++++++++++++++++++++++++++++++++++++
>  <root@paxton:~># fdisk /dev/sdo1
> Device contains neither a valid DOS partition table, nor Sun, SGI or OSF
> disklabel
> Building a new DOS disklabel. Changes will remain in memory only,
> until you decide to write them. After that, of course, the previous
> content won't be recoverable.
>
> The number of cylinders for this disk is set to 3541.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., old versions of LILO)
> 2) booting and partitioning software from other OSs
> (e.g., DOS FDISK, OS/2 FDISK)
> Warning: invalid flag 0x0000 of partition table 4 will be corrected by
> w(rite)
>  Command (m for help): o
> Building a new DOS disklabel. Changes will remain in memory only,
> until you decide to write them. After that, of course, the previous
> content won't be recoverable.
>
> The number of cylinders for this disk is set to 3541.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., old versions of LILO)
> 2) booting and partitioning software from other OSs
> (e.g., DOS FDISK, OS/2 FDISK)
> Warning: invalid flag 0x0000 of partition table 4 will be corrected by
> w(rite)
>  Command (m for help): m
> Command action
> a toggle a bootable flag
> b edit bsd disklabel
> c toggle the dos compatibility flag
> d delete a partition
> l list known partition types
> m print this menu
> n add a new partition
> o create a new empty DOS partition table
> p print the partition table
> q quit without saving changes
> s create a new empty Sun disklabel
> t change a partition's system id
> u change display/entry units
> v verify the partition table
> w write table to disk and exit
> x extra functionality (experts only)
>  Command (m for help): n
> Command action
> e extended
> p primary partition (1-4)
> p
> Partition number (1-4): 1
> First cylinder (1-3541, default 1):
> Using default value 1
> Last cylinder or +size or +sizeM or +sizeK (1-3541, default 3541):
> Using default value 3541
>  Command (m for help): t
> Selected partition 1
> Hex code (type L to list codes): 8e
> Changed system type of partition 1 to 8e (Linux LVM)
>  Command (m for help): m
> Command action
> a toggle a bootable flag
> b edit bsd disklabel
> c toggle the dos compatibility flag
> d delete a partition
> l list known partition types
> m print this menu
> n add a new partition
> o create a new empty DOS partition table
> p print the partition table
> q quit without saving changes
> s create a new empty Sun disklabel
> t change a partition's system id
> u change display/entry units
> v verify the partition table
> w write table to disk and exit
> x extra functionality (experts only)
>  Command (m for help): p
>  Disk /dev/sdo1: 29.1 GB, 29133909504 bytes
> 255 heads, 63 sectors/track, 3541 cylinders
> Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>   Device Boot Start End Blocks Id System
> /dev/sdo1p1 1 3541 28443051 8e Linux LVM
>  Command (m for help): v
> 62 unallocated sectors
>  Command (m for help): v
> 62 unallocated sectors
>  Command (m for help): w
> The partition table has been altered!
>  Calling ioctl() to re-read partition table.
>  WARNING: Re-reading the partition table failed with error 16: Device or
> resource busy.
> The kernel still uses the old table.
> The new table will be used at the next reboot.
> Syncing disks.
>  +++++++++++++++++++++++++++++ end ++++++++++++++++++++++++++++++++++++++
>  ------------------------------
> *From:* linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com=
]
> *On Behalf Of *Stein, Paul (TLR Corp)
> *Sent:* Friday, September 23, 2005 11:20 AM
> *To:* linux-lvm@redhat.com
> *Subject:* [linux-lvm] Recover Partition Table - vgdisplay/vgscan fails
>
>  I inadvertantly blew away the partition table on /dev/sdo that was in
> use. While the system is still running and no errors have occured...yet, =
I
> need
> to get the partition table restored and be able to vgdisplay the datavg.
> Below is the sampling of error messages.
>  <root@paxton:/proc/lvm># vgdisplay datavg
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
> run vgscan
> <root@paxton:/proc/lvm># vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "rootvg"
> vgscan -- found active volume group "localvg"
> vgscan -- found active volume group "datavg"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "datavg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
>    Is it safe to clear VGDA using the "dd if=3D/dev/zero of=3DPhysicalVol=
ume
> bs=3D512 count=3D1" shown in the pvcreate man pages and the come back and
> recreate the VGDA using pvcreate, or use pvcreate outright not using the
> dd method? Or, is there a better method to get /dev/sdo back into the dat=
avg
> group while recreating the partition table?
>   Paul Stein
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

------=_Part_12184_28659489.1127598552127
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

We tested out the below steps and they appeared to work. <br>
<br>
First you need to remove the partition table on /dev/sd01. So issue the
&quot;fdisk /dev/sdo1&quot; then delete the partition table and write out t=
he
changes.<br>
<br>
A reboot is required since most of the lvm command fail due to the VDGA
being inconsistent with what is in the kernel. All of the filesystems,
that are in datavg, need to be commented out of /etc/fstab to avoid
having the OS try and mount them on reboot. When the system comes back
up all the volume groups, logical volumes and filesystem should be up
except for datavg, and its logical volumes and file-systems. The LVM
commands no longer will error out.<br>
<br>
Once the system is back up a VGDA needs to be created on /dev/sdo1. &quot;p=
vcreate -v /dev/sdo1&quot;<br>
Recover the old VGDA data, for /dev/sdo1. &quot;vgcfgrestore -v -n datavg /=
dev/sdo1&quot;<br>
<br>
Scan for volume groups, &quot;vgscan&quot;<br>
Activate the &quot;newly&quot; found datavg volume group, &quot;vgchange -a=
 y datavg&quot;<br>
<br>
At this point we were able to see datavg, all of the logical volumes,
under datavg, and mount the filesystems. We un-commented the
filesystems entries, in /etc/fstab, rebooted a few times and verified
that the filesystem<br>
were available on the reboot.<br>
<br>
Len Smith<br>
<br><br><div><span class=3D"gmail_quote">On 9/23/05, <b class=3D"gmail_send=
ername"><a href=3D"mailto:paul.stein@thomson.com">paul.stein@thomson.com</a=
></b> &lt;<a href=3D"mailto:paul.stein@thomson.com">paul.stein@thomson.com<=
/a>
&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-left: 1=
px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"=
>




<div align=3D"left" dir=3D"ltr"><span><font color=3D"#0000ff" face=3D"Arial=
" size=3D"2">Additional information explaining what caused the below=20
errors:</font></span></div>
<div align=3D"left" dir=3D"ltr"><span><font color=3D"#0000ff" face=3D"Arial=
" size=3D"2"></font></span>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><span><font color=3D"#0000ff" face=3D"Arial=
" size=3D"2">+++++++++++++++ start=20
+++++++++++++++++++++++++++++++++++++++++++++</font></span></div>
<div align=3D"left" dir=3D"ltr"><span><font color=3D"#0000ff" face=3D"Arial=
" size=3D"2"></font></span>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><span><font color=3D"#0000ff" face=3D"Arial=
" size=3D"2">&lt;<a href=3D"mailto:root@paxton" target=3D"_blank" onclick=
=3D"return top.js.OpenExtLink(window,event,this)">root@paxton</a>:~&gt;#=20
fdisk /dev/sdo1<br>Device contains neither a valid DOS partition table, nor=
 Sun,=20
SGI or OSF disklabel<br>Building a new DOS disklabel. Changes will remain i=
n=20
memory only,<br>until you decide to write them. After that, of course, the=
=20
previous<br>content won't be recoverable.</font></span></div>
<div>&nbsp;</div><span>
<div align=3D"left" dir=3D"ltr"><br><font color=3D"#0000ff" face=3D"Arial" =
size=3D"2">The number of=20
cylinders for this disk is set to 3541.<br>There is nothing wrong with that=
, but=20
this is larger than 1024,<br>and could in certain setups cause problems=20
with:<br>1) software that runs at boot time (e.g., old versions of LILO)<br=
>2)=20
booting and partitioning software from other OSs<br>&nbsp;&nbsp; (e.g., DOS=
=20
FDISK, OS/2 FDISK)<br>Warning: invalid flag 0x0000 of partition table 4 wil=
l be=20
corrected by w(rite)</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): o<br>Building a new DOS disklabel. Changes will remain in memory=20
only,<br>until you decide to write them. After that, of course, the=20
previous<br>content won't be recoverable.</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><br><font color=3D"#0000ff" face=3D"Arial" =
size=3D"2">The number of=20
cylinders for this disk is set to 3541.<br>There is nothing wrong with that=
, but=20
this is larger than 1024,<br>and could in certain setups cause problems=20
with:<br>1) software that runs at boot time (e.g., old versions of LILO)<br=
>2)=20
booting and partitioning software from other OSs<br>&nbsp;&nbsp; (e.g., DOS=
=20
FDISK, OS/2 FDISK)<br>Warning: invalid flag 0x0000 of partition table 4 wil=
l be=20
corrected by w(rite)</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): m<br>Command action<br>&nbsp;&nbsp; a&nbsp;&nbsp; toggle a bootable=
=20
flag<br>&nbsp;&nbsp; b&nbsp;&nbsp; edit bsd disklabel<br>&nbsp;&nbsp;=20
c&nbsp;&nbsp; toggle the dos compatibility flag<br>&nbsp;&nbsp; d&nbsp;&nbs=
p;=20
delete a partition<br>&nbsp;&nbsp; l&nbsp;&nbsp; list known partition=20
types<br>&nbsp;&nbsp; m&nbsp;&nbsp; print this menu<br>&nbsp;&nbsp;=20
n&nbsp;&nbsp; add a new partition<br>&nbsp;&nbsp; o&nbsp;&nbsp; create a ne=
w=20
empty DOS partition table<br>&nbsp;&nbsp; p&nbsp;&nbsp; print the partition=
=20
table<br>&nbsp;&nbsp; q&nbsp;&nbsp; quit without saving changes<br>&nbsp;&n=
bsp;=20
s&nbsp;&nbsp; create a new empty Sun disklabel<br>&nbsp;&nbsp; t&nbsp;&nbsp=
;=20
change a partition's system id<br>&nbsp;&nbsp; u&nbsp;&nbsp; change=20
display/entry units<br>&nbsp;&nbsp; v&nbsp;&nbsp; verify the partition=20
table<br>&nbsp;&nbsp; w&nbsp;&nbsp; write table to disk and exit<br>&nbsp;&=
nbsp;=20
x&nbsp;&nbsp; extra functionality (experts only)</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): n<br>Command action<br>&nbsp;&nbsp; e&nbsp;&nbsp;=20
extended<br>&nbsp;&nbsp; p&nbsp;&nbsp; primary partition (1-4)<br>p<br>Part=
ition=20
number (1-4): 1<br>First cylinder (1-3541, default 1):<br>Using default val=
ue=20
1<br>Last cylinder or +size or +sizeM or +sizeK (1-3541, default 3541):<br>=
Using=20
default value 3541</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): t<br>Selected partition 1<br>Hex code (type L to list codes):=20
8e<br>Changed system type of partition 1 to 8e (Linux LVM)</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): m<br>Command action<br>&nbsp;&nbsp; a&nbsp;&nbsp; toggle a bootable=
=20
flag<br>&nbsp;&nbsp; b&nbsp;&nbsp; edit bsd disklabel<br>&nbsp;&nbsp;=20
c&nbsp;&nbsp; toggle the dos compatibility flag<br>&nbsp;&nbsp; d&nbsp;&nbs=
p;=20
delete a partition<br>&nbsp;&nbsp; l&nbsp;&nbsp; list known partition=20
types<br>&nbsp;&nbsp; m&nbsp;&nbsp; print this menu<br>&nbsp;&nbsp;=20
n&nbsp;&nbsp; add a new partition<br>&nbsp;&nbsp; o&nbsp;&nbsp; create a ne=
w=20
empty DOS partition table<br>&nbsp;&nbsp; p&nbsp;&nbsp; print the partition=
=20
table<br>&nbsp;&nbsp; q&nbsp;&nbsp; quit without saving changes<br>&nbsp;&n=
bsp;=20
s&nbsp;&nbsp; create a new empty Sun disklabel<br>&nbsp;&nbsp; t&nbsp;&nbsp=
;=20
change a partition's system id<br>&nbsp;&nbsp; u&nbsp;&nbsp; change=20
display/entry units<br>&nbsp;&nbsp; v&nbsp;&nbsp; verify the partition=20
table<br>&nbsp;&nbsp; w&nbsp;&nbsp; write table to disk and exit<br>&nbsp;&=
nbsp;=20
x&nbsp;&nbsp; extra functionality (experts only)</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): p</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Disk /dev/sdo1:=20
29.1 GB, 29133909504 bytes<br>255 heads, 63 sectors/track, 3541=20
cylinders<br>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes</font></d=
iv>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">&nbsp;&nbsp;&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;=20
Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;=20
Blocks&nbsp;&nbsp; Id&nbsp;=20
System<br>/dev/sdo1p1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;=20
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3541&nbsp; 28443051&nbsp;&nbsp; 8e&nbsp; Li=
nux=20
LVM</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): v<br>62 unallocated sectors</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): v<br>62 unallocated sectors</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Command (m for=20
help): w<br>The partition table has been altered!</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">Calling ioctl() to=20
re-read partition table.</font></div>
<div><font color=3D"#0000ff" face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2">WARNING:=20
Re-reading the partition table failed with error 16: Device or resource=20
busy.<br>The kernel still uses the old table.<br>The new table will be used=
 at=20
the next reboot.<br>Syncing disks.</font></div>
<div align=3D"left" dir=3D"ltr"><font color=3D"#0000ff" face=3D"Arial" size=
=3D"2"></font>&nbsp;</div>
<div align=3D"left" dir=3D"ltr"></div></span><span><font color=3D"#0000ff" =
face=3D"Arial" size=3D"2">+++++++++++++++++++++++++++++ end=20
++++++++++++++++++++++++++++++++++++++</font></span><br>
<div align=3D"left" dir=3D"ltr" lang=3D"en-us">
<hr>
<font face=3D"Tahoma" size=3D"2"><b>From:</b> <a href=3D"mailto:linux-lvm-b=
ounces@redhat.com" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(w=
indow,event,this)">linux-lvm-bounces@redhat.com</a>=20
[mailto:<a href=3D"mailto:linux-lvm-bounces@redhat.com" target=3D"_blank" o=
nclick=3D"return top.js.OpenExtLink(window,event,this)">linux-lvm-bounces@r=
edhat.com</a>] <b>On Behalf Of </b>Stein, Paul (TLR=20
Corp)<br><b>Sent:</b> Friday, September 23, 2005 11:20 AM<br><b>To:</b>=20
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" onclick=3D"return=
 top.js.OpenExtLink(window,event,this)">linux-lvm@redhat.com</a><br><b>Subj=
ect:</b> [linux-lvm] Recover Partition Table -=20
vgdisplay/vgscan fails<br></font><br></div><div><span class=3D"e" id=3D"q_1=
06845cd9241fa54_1">
<div></div>
<div><font face=3D"Arial" size=3D"2"><span>I inadvertantly blew=20
away the partition table on /dev/sdo that was in use. While the system is s=
till=20
running and no errors have occured...yet, I need</span></font></div>
<div><font face=3D"Arial" size=3D"2"><span>to get the partition=20
table restored and&nbsp; be able to vgdisplay the datavg. Below is the samp=
ling=20
of error messages.</span></font></div>
<div><font face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div><font face=3D"Arial" size=3D"2">&lt;<a href=3D"mailto:root@paxton:/pro=
c/lvm" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,=
this)">root@paxton:/proc/lvm</a>&gt;# vgdisplay=20
datavg<br>vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent;=
=20
please run vgscan<br></font></div>
<div><font face=3D"Arial" size=3D"2">&lt;<a href=3D"mailto:root@paxton:/pro=
c/lvm" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,=
this)">root@paxton:/proc/lvm</a>&gt;#=20
vgscan<br>vgscan -- reading all physical volumes (this may take a=20
while...)<br>vgscan -- found active volume group &quot;rootvg&quot;<br>vgsc=
an -- found=20
active volume group &quot;localvg&quot;<br>vgscan -- found active volume gr=
oup=20
&quot;datavg&quot;<br>vgscan -- ERROR &quot;vg_read_with_pv_and_lv(): curre=
nt PV&quot; can't get=20
data of volume group &quot;datavg&quot; from physical volume(s)<br>vgscan -=
- &quot;/etc/lvmtab&quot;=20
and &quot;/etc/lvmtab.d&quot; successfully created<br>vgscan -- WARNING: Th=
is program does=20
not do a VGDA backup of your volume groups</font></div>
<div><font face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div><font face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div><font face=3D"Arial" size=3D"2"></font>&nbsp;</div>
<div><span><font face=3D"Arial" size=3D"2">Is it safe to clear=20
VGDA using the &quot;dd if=3D/dev/zero of=3DPhysicalVolume bs=3D512 count=
=3D1&quot;&nbsp; shown in=20
the pvcreate man pages and the come back and</font></span></div>
<div><span><font face=3D"Arial" size=3D"2">recreate the=20
VGDA&nbsp; using pvcreate, or use pvcreate outright not using the dd method=
? Or,=20
is there a better method to get /dev/sdo back into the=20
datavg</font></span></div>
<div><span><font face=3D"Arial" size=3D"2">group while=20
recreating the partition table?</font></span></div>
<div>&nbsp;</div>
<div align=3D"left">
<div align=3D"left"><font face=3D"Comic Sans MS" size=3D"4">Paul Stein</fon=
t></div></div>
<div>&nbsp;</div>

</span></div><br>_______________________________________________<br>linux-l=
vm mailing list<br><a onclick=3D"return top.js.OpenExtLink(window,event,thi=
s)" href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a onc=
lick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https://www.r=
edhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-T=
O at <a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"ht=
tp://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM=
-HOWTO/
</a><br><br></blockquote></div><br>

------=_Part_12184_28659489.1127598552127--
