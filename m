Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SIHpc0007241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2015 14:17:51 -0400
Received: from mail-wi0-f193.google.com (mail-wi0-f193.google.com
	[209.85.212.193])
	by mx1.redhat.com (Postfix) with ESMTPS id 2AE74C0B64B3
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2015 18:17:50 +0000 (UTC)
Received: by wiku15 with SMTP id u15so19594145wik.1
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2015 11:17:49 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 28 Sep 2015 13:11:30 -0500
Message-ID: <CAEyTGCdtApafW_wd-XTjs=CiMaNj+CqrrczsD0gDa5QaMDz6+Q@mail.gmail.com>
From: Lakshmi <sendtold@gmail.com>
Subject: [linux-lvm] Question on lvconvert when using to create Cachepool-
 Gives no space in Volume group
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

   I am hoping to get some answers, pointers here as I am stuck with
this for quite sometime and need some suggestions to proceed further.

I am using lvm-cache for my test and My current test setup has,

1x1142GB HDD in Raid0
1x387GB SSD in Raid 0
I have RHEL 7.1 and 3.10.0-229.el7.ppc64.
lvm version that was part of the distro
  LVM version:     2.02.115(2)-RHEL7 (2015-01-28)
  Library version: 1.02.93-RHEL7 (2015-01-28)
  Driver version:  4.29.0

pvscan looks like this.

# pvscan
  PV /dev/sdi1 lvm2 [1.04 TiB]
  PV /dev/sdh1 lvm2 [361.31 GiB]


Steps I followed to create the lvm-cache device

1. Created a partition on entire HDD and a partition on entire SSD
2. Created physical volumes for the above partitions
3. Created Volume Group using these 2 PVs
4. Created LVMS as follows

Create  Origin Device logical Volume (origin_device)
lvcreate -L 1024G -n origin_device cache_VG /dev/sdu1

Create a cache meta data logical Volume  (cache_meta)
lvcreate -L 315M -n Cache_Meta Cache_VG /dev/sdw1
>>> used 1/1000(307G) as mentione din lvm-cache manpage

Create a cache  block data logical Volume  (cache_block)
lvcreate -L 307G -n Cache_Block Cache_VG /dev/sdw1

Create a cache pool logical volume by combining cache block and cache meta
data logical volumes (combining step 5 and 6)
lvconvert --type cache-pool --cachemode writeback --poolmetadata
Cache_VG/Cache_Meta Cache_VG/Cache_Block

ISSUE: And I get

  WARNING: Maximum supported pool metadata size is 16.00 GiB.
  WARNING: Converting logical volume Cache_VG/Cache_Meta and
Cache_VG/Cache_Block to pool's data and metadata volumes.
  THIS WILL DESTROY CONTENT OF LOGICAL VOLUME (filesystem etc.)
Do you really want to convert Cache_VG/Cache_Meta and Cache_VG/Cache_Block?
[y/n]: y
  Volume group "Cache_VG" has insufficient free space (24077 extents): 78592
required.

QUESTION:
Can someone tell me why it complains that it doesnt have enough space,
since the LVMS are already carved from the Volume group and all it does is
convert to a cachepool? I am not aware of the intrenal details of converting
a cache pool, but if somebody could tell me the reason or how i can fix this
, it would be very helpful.

This is my "vgdisplay" output
  --- Volume group ---
  VG Name               Cache_VG
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.39 TiB
  PE Size               4.00 MiB
  Total PE              364892
  Alloc PE / Size       340815 / 1.30 TiB
  Free  PE / Size       24077 / 94.05 GiB

# pvdisplay /dev/sdh1
  --- Physical volume ---
  PV Name               /dev/sdh1
  VG Name               Cache_307GB_VG
  PV Size               361.31 GiB / not usable 3.00 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              92495
  Free PE               13824
  Allocated PE          78671


# pvdisplay /dev/sdi1
  --- Physical volume ---
  PV Name               /dev/sdi1
  VG Name               Cache_307GB_VG
  PV Size               1.04 TiB / not usable 3.00 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              272397
  Free PE               10253
  Allocated PE          262144

Any suggestions , pointers will be really helpful as I am stuck with this
for sometime and I have not been able to proceed.

Thanks,
ld
