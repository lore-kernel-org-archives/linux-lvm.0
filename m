Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AJVuxB019598
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 15:31:56 -0400
Received: from zcars04f.nortel.com (zcars04f.nortel.com [47.129.242.57])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6AJVoYN012849
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 15:31:50 -0400
Received: from zrtphxs1.corp.nortel.com
	(zrtphxs1.corp.nort...s0.corp.nortel.com [47.140.202.46])
	by zcars04f.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	k6AJVgY29966
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 15:31:43 -0400 (EDT)
Message-ID: <44B2AAD4.70505@dogpad.net>
Date: Mon, 10 Jul 2006 14:30:28 -0500
From: Joe Harvell <jharvell@dogpad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cannot create snapshot LV (unrecognised segment type
	snapshot)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

In the past, I have been able to create snapshot LVs using LVM2.  I had
a script that did this as part of a full backup.  I have upgraded LVM2
several times and now I find I cannot create a snapshot LV anymore.  It
seems to be related to an error message I get every time I enter an LVM2
command'

Version info:

dogboy ~ # lvm version
  LVM version:     2.02.05 (2006-04-21)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.1.0

Snapshot creation output:

dogboy ~ # lvcreate -dddddd -s -L 256m -n test.snap /dev/paris/test
  Unrecognised segment type snapshot
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

Logs:

Jul 10 14:28:44 [lvm] Setting global/locking_type to 1
Jul 10 14:28:44 [lvm] Setting global/locking_dir to /var/lock/lvm
Jul 10 14:28:44 [lvm] File-based locking enabled.
Jul 10 14:28:44 [lvm] Setting chunksize to 16 sectors.
Jul 10 14:28:44 [lvm] Unrecognised segment type snapshot


Here is what I get when I try a standard LVM command:

dogboy ~ # lvs
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  LV    VG    Attr   LSize   Origin Snap%  Move Log Copy%
  home  paris -wi-ao   4.49G
  opt   paris -wi-ao   6.20G
  ora-0 paris -wi-a-  10.00G
  ora-1 paris -wi-a-  10.00G
  ora-2 paris -wi-a-  10.00G
  pcsoe paris -wi-ao  12.00G
  root  paris -wi-ao 200.00M
  test  paris -wi-ao   1.00G
  usr   paris -wi-ao   8.00G
  var   paris -wi-ao   4.00G
