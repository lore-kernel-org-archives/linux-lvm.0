Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DAV5HJ002969
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 06:31:05 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DAUtp2008283
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 06:30:56 -0400
Received: by wyf19 with SMTP id 19so97503wyf.33
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 03:30:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
References: <4BC34F78.8040301@cfl.rr.com>
	<OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
From: =?ISO-8859-1?Q?S=E9bastien_Roy?= <sroy.tcs@gmail.com>
Date: Tue, 13 Apr 2010 12:30:35 +0200
Message-ID: <m2hbf00f8301004130330k798bf501j468ede0e76a00807@mail.gmail.com>
Content-Type: multipart/alternative; boundary=0016e6d56693ae1f5304841bc1e4
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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
To: linux-lvm@redhat.com

--0016e6d56693ae1f5304841bc1e4
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Maybe you can try

lvcreate -L 2.5g -s -n rsnap /dev/rootvg/rootlv

Already faced this kind of situation on previous RH releases (4.3 ?) where
/dev/mapper could not (yet) be used with some LVM commands.

2010/4/13 Alan Pek <alan.pek@db.com>

>
> Hi Folks,
>
> Read through the doc and tried to create a snapshot lv for rootlv by doing,
> but failed.
>
> singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap rootvg
>   Path required for Logical Volume "rootvg"
>   The origin name should include the volume group.
>   lvcreate: Create a logical volume
> lvcreate
>         [-A|--autobackup {y|n}]
>         [--addtag Tag]
>         [--alloc AllocationPolicy]
>         [-C|--contiguous {y|n}]
>         [-d|--debug]
>         [-h|-?|--help]
>         [-i|--stripes Stripes [-I|--stripesize StripeSize]]
>         {-l|--extents LogicalExtentsNumber |
>          -L|--size LogicalVolumeSize[kKmMgGtT]}
>         [-M|--persistent {y|n}] [--major major] [--minor minor]
>         [-m|--mirrors Mirrors]
>         [-n|--name LogicalVolumeName]
>         [-p|--permission {r|rw}]
>         [-r|--readahead ReadAheadSectors]
>         [-R|--regionsize MirrorLogRegionSize]
>         [-t|--test]
>         [--type VolumeType]
>         [-v|--verbose]
>         [-Z|--zero {y|n}]
>         [--version]
>         VolumeGroupName [PhysicalVolumePath...]
>
> lvcreate -s|--snapshot
>         [-c|--chunksize]
>         [-A|--autobackup {y|n}]
>         [--addtag Tag]
>         [--alloc AllocationPolicy]
>         [-C|--contiguous {y|n}]
>         [-d|--debug]
>         [-h|-?|--help]
>         [-i|--stripes Stripes [-I|--stripesize StripeSize]]
>         {-l|--extents LogicalExtentsNumber |
>          -L|--size LogicalVolumeSize[kKmMgGtT]}
>         [-M|--persistent {y|n}] [--major major] [--minor minor]
>         [-n|--name LogicalVolumeName]
>         [-p|--permission {r|rw}]
>         [-r|--readahead ReadAheadSectors]
>         [-t|--test]
>         [-v|--verbose]
>         [--version]
>         OriginalLogicalVolume[Path] [PhysicalVolumePath...]
>
>
> singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap /dev/mapper/rootvg-rootlv
>   Volume group "mapper" doesn't exist
>
> singmrecfp1001:~ #  lvcreate -L 2.5g -s -n rsnap /dev/md1
>   "/dev/md1": Invalid path for Logical Volume
>   The origin name should include the volume group.
>   lvcreate: Create a logical volume
>
> lvcreate
>         [-A|--autobackup {y|n}]
>         [--addtag Tag]
>         [--alloc AllocationPolicy]
>         [-C|--contiguous {y|n}]
>         [-d|--debug]
>         [-h|-?|--help]
>         [-i|--stripes Stripes [-I|--stripesize StripeSize]]
>         {-l|--extents LogicalExtentsNumber |
>          -L|--size LogicalVolumeSize[kKmMgGtT]}
>         [-M|--persistent {y|n}] [--major major] [--minor minor]
>         [-m|--mirrors Mirrors]
>         [-n|--name LogicalVolumeName]
>         [-p|--permission {r|rw}]
>         [-r|--readahead ReadAheadSectors]
>         [-R|--regionsize MirrorLogRegionSize]
>         [-t|--test]
>         [--type VolumeType]
>         [-v|--verbose]
>         [-Z|--zero {y|n}]
>         [--version]
>         VolumeGroupName [PhysicalVolumePath...]
>
> lvcreate -s|--snapshot
>         [-c|--chunksize]
>         [-A|--autobackup {y|n}]
>         [--addtag Tag]
>         [--alloc AllocationPolicy]
>         [-C|--contiguous {y|n}]
>         [-d|--debug]
>         [-h|-?|--help]
>         [-i|--stripes Stripes [-I|--stripesize StripeSize]]
>         {-l|--extents LogicalExtentsNumber |
>          -L|--size LogicalVolumeSize[kKmMgGtT]}
>         [-M|--persistent {y|n}] [--major major] [--minor minor]
>         [-n|--name LogicalVolumeName]
>         [-p|--permission {r|rw}]
>         [-r|--readahead ReadAheadSectors]
>         [-t|--test]
>         [-v|--verbose]
>         [--version]
>         OriginalLogicalVolume[Path] [PhysicalVolumePath...]
>
>
> singmrecfp1001:~ #
>
>
> ---
>
> This e-mail may contain confidential and/or privileged information. If you
> are not the intended recipient (or have received this e-mail in error)
> please notify the sender immediately and destroy this e-mail. Any
> unauthorized copying, disclosure or distribution of the material in this
> e-mail is strictly forbidden.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e6d56693ae1f5304841bc1e4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<font size=3D"2" face=3D"sans-serif">Hello,<br><br>Maybe you can try <br><b=
r>lvcreate -L 2.5g -s -n rsnap /dev/rootvg/rootlv</font><br><br><font size=
=3D"2" face=3D"sans-serif">Already faced this kind of situation on
 previous RH releases (4.3 ?) where /dev/mapper could not (yet) be used wit=
h=20
some LVM commands.<br><br></font><div class=3D"gmail_quote">2010/4/13 Alan =
Pek <span dir=3D"ltr">&lt;<a href=3D"mailto:alan.pek@db.com">alan.pek@db.co=
m</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt =
0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">


<br><font size=3D"2" face=3D"sans-serif">Hi Folks,</font>
<br>
<br><font size=3D"2" face=3D"sans-serif">Read through the doc and tried to =
create
a snapshot lv for rootlv by doing, but failed. <br>
</font>
<br><font size=3D"2" face=3D"sans-serif">singmrecfp1001:~ # lvcreate -L 2.5=
g
-s -n rsnap rootvg</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 Path required for Logical Volu=
me
&quot;rootvg&quot;</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 The origin name should include
the volume group.</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 lvcreate: Create a logical vol=
ume</font>
<br><font size=3D"2" face=3D"sans-serif">lvcreate</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-A|--autobackup
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--addtag
Tag]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--alloc
AllocationPolicy]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-C|--contiguous
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-d|--debug]</font=
>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-h|-?|--help]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 =A0-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-m|--mirrors
Mirrors]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-n|--name
LogicalVolumeName]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-p|--permission
{r|rw}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-r|--readahead
ReadAheadSectors]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-R|--regionsize
MirrorLogRegionSize]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-t|--test]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--type
VolumeType]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-v|--verbose]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-Z|--zero
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--version]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 VolumeGroupName
[PhysicalVolumePath...]</font>
<br>
<br><font size=3D"2" face=3D"sans-serif">lvcreate -s|--snapshot</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-c|--chunksize]</=
font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-A|--autobackup
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--addtag
Tag]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--alloc
AllocationPolicy]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-C|--contiguous
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-d|--debug]</font=
>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-h|-?|--help]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 =A0-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-n|--name
LogicalVolumeName]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-p|--permission
{r|rw}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-r|--readahead
ReadAheadSectors]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-t|--test]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-v|--verbose]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--version]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 OriginalLogicalVol=
ume[Path]
[PhysicalVolumePath...]</font>
<br>
<br><font size=3D"2" face=3D"sans-serif"><br>
singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap /dev/mapper/rootvg-rootlv</=
font>
<br><font size=3D"2" face=3D"sans-serif">=A0 Volume group &quot;mapper&quot=
;
doesn&#39;t exist</font>
<br>
<br><font size=3D"2" face=3D"sans-serif">singmrecfp1001:~ # =A0lvcreate -L
2.5g -s -n rsnap /dev/md1</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 &quot;/dev/md1&quot;: Invalid
path for Logical Volume</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 The origin name should include
the volume group.</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 lvcreate: Create a logical vol=
ume</font>
<br>
<br><font size=3D"2" face=3D"sans-serif">lvcreate</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-A|--autobackup
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--addtag
Tag]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--alloc
AllocationPolicy]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-C|--contiguous
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-d|--debug]</font=
>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-h|-?|--help]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 =A0-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-m|--mirrors
Mirrors]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-n|--name
LogicalVolumeName]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-p|--permission
{r|rw}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-r|--readahead
ReadAheadSectors]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-R|--regionsize
MirrorLogRegionSize]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-t|--test]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--type
VolumeType]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-v|--verbose]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-Z|--zero
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--version]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 VolumeGroupName
[PhysicalVolumePath...]</font>
<br>
<br><font size=3D"2" face=3D"sans-serif">lvcreate -s|--snapshot</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-c|--chunksize]</=
font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-A|--autobackup
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--addtag
Tag]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--alloc
AllocationPolicy]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-C|--contiguous
{y|n}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-d|--debug]</font=
>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-h|-?|--help]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 =A0-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-n|--name
LogicalVolumeName]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-p|--permission
{r|rw}]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-r|--readahead
ReadAheadSectors]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-t|--test]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [-v|--verbose]</fo=
nt>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 [--version]</font>
<br><font size=3D"2" face=3D"sans-serif">=A0 =A0 =A0 =A0 OriginalLogicalVol=
ume[Path]
[PhysicalVolumePath...]</font>
<br>
<br>
<br><font size=3D"2" face=3D"sans-serif">singmrecfp1001:~ #</font><div><div=
></div><div class=3D"h5">
<p>
<br>
<span style=3D"font-family: &#39;Arial&#39;,sans-serif; font-size: 8pt; col=
or: rgb(0, 0, 0);">---<br>
<br>
This e-mail may contain confidential and/or privileged information. If you =
<br>
are not the intended recipient (or have received this e-mail in error) <br>
please notify the sender immediately and destroy this e-mail. Any <br>
unauthorized copying, disclosure or distribution of the material in this <b=
r>
e-mail is strictly forbidden.</span></p></div></div><br>___________________=
____________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--0016e6d56693ae1f5304841bc1e4--
