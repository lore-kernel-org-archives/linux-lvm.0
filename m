Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DA3w8E029082
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 06:03:58 -0400
Received: from loninmrp8.uk.db.com (loninmrp8.uk.db.com [160.83.58.66])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DA3guv003787
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 06:03:42 -0400
Received: from sdbo1007.sg.db.com (sininmailp1007.sg.db.com [10.171.194.115])
	by loninmrp8.uk.db.com (8.14.4/8.14.4) with ESMTP id o3DA3Ymq007294
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 11:03:38 +0100
In-Reply-To: <4BC34F78.8040301@cfl.rr.com>
MIME-Version: 1.0
From: Alan Pek <alan.pek@db.com>
Message-ID: <OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
Date: Tue, 13 Apr 2010 18:03:28 +0800
Content-Type: multipart/alternative;
	boundary="=_alternative 003741D648257704_="
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

This is a multipart message in MIME format.
--=_alternative 003741D648257704_=
Content-Type: text/plain; charset="US-ASCII"

Hi Folks,

Read through the doc and tried to create a snapshot lv for rootlv by 
doing, but failed. 

singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap rootvg
  Path required for Logical Volume "rootvg"
  The origin name should include the volume group.
  lvcreate: Create a logical volume
lvcreate
        [-A|--autobackup {y|n}]
        [--addtag Tag]
        [--alloc AllocationPolicy]
        [-C|--contiguous {y|n}]
        [-d|--debug]
        [-h|-?|--help]
        [-i|--stripes Stripes [-I|--stripesize StripeSize]]
        {-l|--extents LogicalExtentsNumber |
         -L|--size LogicalVolumeSize[kKmMgGtT]}
        [-M|--persistent {y|n}] [--major major] [--minor minor]
        [-m|--mirrors Mirrors]
        [-n|--name LogicalVolumeName]
        [-p|--permission {r|rw}]
        [-r|--readahead ReadAheadSectors]
        [-R|--regionsize MirrorLogRegionSize]
        [-t|--test]
        [--type VolumeType]
        [-v|--verbose]
        [-Z|--zero {y|n}]
        [--version]
        VolumeGroupName [PhysicalVolumePath...]

lvcreate -s|--snapshot
        [-c|--chunksize]
        [-A|--autobackup {y|n}]
        [--addtag Tag]
        [--alloc AllocationPolicy]
        [-C|--contiguous {y|n}]
        [-d|--debug]
        [-h|-?|--help]
        [-i|--stripes Stripes [-I|--stripesize StripeSize]]
        {-l|--extents LogicalExtentsNumber |
         -L|--size LogicalVolumeSize[kKmMgGtT]}
        [-M|--persistent {y|n}] [--major major] [--minor minor]
        [-n|--name LogicalVolumeName]
        [-p|--permission {r|rw}]
        [-r|--readahead ReadAheadSectors]
        [-t|--test]
        [-v|--verbose]
        [--version]
        OriginalLogicalVolume[Path] [PhysicalVolumePath...]


singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap /dev/mapper/rootvg-rootlv
  Volume group "mapper" doesn't exist

singmrecfp1001:~ #  lvcreate -L 2.5g -s -n rsnap /dev/md1
  "/dev/md1": Invalid path for Logical Volume
  The origin name should include the volume group.
  lvcreate: Create a logical volume

lvcreate
        [-A|--autobackup {y|n}]
        [--addtag Tag]
        [--alloc AllocationPolicy]
        [-C|--contiguous {y|n}]
        [-d|--debug]
        [-h|-?|--help]
        [-i|--stripes Stripes [-I|--stripesize StripeSize]]
        {-l|--extents LogicalExtentsNumber |
         -L|--size LogicalVolumeSize[kKmMgGtT]}
        [-M|--persistent {y|n}] [--major major] [--minor minor]
        [-m|--mirrors Mirrors]
        [-n|--name LogicalVolumeName]
        [-p|--permission {r|rw}]
        [-r|--readahead ReadAheadSectors]
        [-R|--regionsize MirrorLogRegionSize]
        [-t|--test]
        [--type VolumeType]
        [-v|--verbose]
        [-Z|--zero {y|n}]
        [--version]
        VolumeGroupName [PhysicalVolumePath...]

lvcreate -s|--snapshot
        [-c|--chunksize]
        [-A|--autobackup {y|n}]
        [--addtag Tag]
        [--alloc AllocationPolicy]
        [-C|--contiguous {y|n}]
        [-d|--debug]
        [-h|-?|--help]
        [-i|--stripes Stripes [-I|--stripesize StripeSize]]
        {-l|--extents LogicalExtentsNumber |
         -L|--size LogicalVolumeSize[kKmMgGtT]}
        [-M|--persistent {y|n}] [--major major] [--minor minor]
        [-n|--name LogicalVolumeName]
        [-p|--permission {r|rw}]
        [-r|--readahead ReadAheadSectors]
        [-t|--test]
        [-v|--verbose]
        [--version]
        OriginalLogicalVolume[Path] [PhysicalVolumePath...]


singmrecfp1001:~ #


---

This e-mail may contain confidential and/or privileged information. If you 
are not the intended recipient (or have received this e-mail in error) 
please notify the sender immediately and destroy this e-mail. Any 
unauthorized copying, disclosure or distribution of the material in this 
e-mail is strictly forbidden.
--=_alternative 003741D648257704_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi Folks,</font>
<br>
<br><font size=2 face="sans-serif">Read through the doc and tried to create
a snapshot lv for rootlv by doing, but failed. <br>
</font>
<br><font size=2 face="sans-serif">singmrecfp1001:~ # lvcreate -L 2.5g
-s -n rsnap rootvg</font>
<br><font size=2 face="sans-serif">&nbsp; Path required for Logical Volume
&quot;rootvg&quot;</font>
<br><font size=2 face="sans-serif">&nbsp; The origin name should include
the volume group.</font>
<br><font size=2 face="sans-serif">&nbsp; lvcreate: Create a logical volume</font>
<br><font size=2 face="sans-serif">lvcreate</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-A|--autobackup
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--addtag
Tag]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--alloc
AllocationPolicy]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-C|--contiguous
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-d|--debug]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-h|-?|--help]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-m|--mirrors
Mirrors]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-n|--name
LogicalVolumeName]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-p|--permission
{r|rw}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-r|--readahead
ReadAheadSectors]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-R|--regionsize
MirrorLogRegionSize]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-t|--test]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--type
VolumeType]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-v|--verbose]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-Z|--zero
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--version]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; VolumeGroupName
[PhysicalVolumePath...]</font>
<br>
<br><font size=2 face="sans-serif">lvcreate -s|--snapshot</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-c|--chunksize]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-A|--autobackup
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--addtag
Tag]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--alloc
AllocationPolicy]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-C|--contiguous
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-d|--debug]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-h|-?|--help]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-n|--name
LogicalVolumeName]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-p|--permission
{r|rw}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-r|--readahead
ReadAheadSectors]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-t|--test]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-v|--verbose]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--version]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; OriginalLogicalVolume[Path]
[PhysicalVolumePath...]</font>
<br>
<br><font size=2 face="sans-serif"><br>
singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap /dev/mapper/rootvg-rootlv</font>
<br><font size=2 face="sans-serif">&nbsp; Volume group &quot;mapper&quot;
doesn't exist</font>
<br>
<br><font size=2 face="sans-serif">singmrecfp1001:~ # &nbsp;lvcreate -L
2.5g -s -n rsnap /dev/md1</font>
<br><font size=2 face="sans-serif">&nbsp; &quot;/dev/md1&quot;: Invalid
path for Logical Volume</font>
<br><font size=2 face="sans-serif">&nbsp; The origin name should include
the volume group.</font>
<br><font size=2 face="sans-serif">&nbsp; lvcreate: Create a logical volume</font>
<br>
<br><font size=2 face="sans-serif">lvcreate</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-A|--autobackup
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--addtag
Tag]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--alloc
AllocationPolicy]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-C|--contiguous
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-d|--debug]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-h|-?|--help]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-m|--mirrors
Mirrors]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-n|--name
LogicalVolumeName]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-p|--permission
{r|rw}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-r|--readahead
ReadAheadSectors]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-R|--regionsize
MirrorLogRegionSize]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-t|--test]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--type
VolumeType]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-v|--verbose]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-Z|--zero
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--version]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; VolumeGroupName
[PhysicalVolumePath...]</font>
<br>
<br><font size=2 face="sans-serif">lvcreate -s|--snapshot</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-c|--chunksize]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-A|--autobackup
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--addtag
Tag]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--alloc
AllocationPolicy]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-C|--contiguous
{y|n}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-d|--debug]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-h|-?|--help]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-i|--stripes
Stripes [-I|--stripesize StripeSize]]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; {-l|--extents
LogicalExtentsNumber |</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-L|--size
LogicalVolumeSize[kKmMgGtT]}</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-M|--persistent
{y|n}] [--major major] [--minor minor]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-n|--name
LogicalVolumeName]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-p|--permission
{r|rw}]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-r|--readahead
ReadAheadSectors]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-t|--test]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [-v|--verbose]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; [--version]</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; OriginalLogicalVolume[Path]
[PhysicalVolumePath...]</font>
<br>
<br>
<br><font size=2 face="sans-serif">singmrecfp1001:~ #</font>
<p>
<br>
<span style="font-family:'Arial',sans-serif; font-size:8pt; color:#000000">---<br>
<br>
This e-mail may contain confidential and/or privileged information. If you <br>
are not the intended recipient (or have received this e-mail in error) <br>
please notify the sender immediately and destroy this e-mail. Any <br>
unauthorized copying, disclosure or distribution of the material in this <br>
e-mail is strictly forbidden.</span>
--=_alternative 003741D648257704_=--
