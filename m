Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7H4sPP0001296
	for <linux-lvm@redhat.com>; Sun, 17 Aug 2008 00:54:25 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.179])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7H4sNjE013260
	for <linux-lvm@redhat.com>; Sun, 17 Aug 2008 00:54:23 -0400
Received: by wa-out-1112.google.com with SMTP id j32so2962812waf.7
	for <linux-lvm@redhat.com>; Sat, 16 Aug 2008 21:54:22 -0700 (PDT)
Message-ID: <f64d94760808162154ifc69bd5p93ad409f104e35a6@mail.gmail.com>
Date: Sun, 17 Aug 2008 00:54:22 -0400
From: "Gordon McLellan" <gordonthree@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] mirroring an LV?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm pulling my hair out trying to setup a mirrored logical volume.

lvconvert tells me I don't have enough free space, even though I have
hundreds of gigabytes free on both physical volumes.

Command: lvconvert -m1 /dev/vg1/iscsi_deeds_data
Insufficient suitable allocatable extents for logical volume : 10240
more required

Any ideas?

Thanks!,

Gordon

Here's the output from the lvconvert with verbose and debugging turned on:

# lvconvert -vvv -d -m1 /dev/vg1/iscsi_deeds_data
        Processing: lvconvert -vvv -d -m1 /dev/vg1/iscsi_deeds_data
        O_DIRECT will be used
      Setting global/locking_type to 1
      File-based locking selected.
      Setting global/locking_dir to /var/lock/lvm
      Setting activation/mirror_region_size to 512
      Getting target version for linear
        dm version   OF   [16384]
        dm versions   OF   [16384]
      Getting target version for striped
        dm versions   OF   [16384]
    Checking for existing volume group "vg1"
      Locking /var/lock/lvm/V_vg1 WB
        /dev/ramdisk: Not using O_DIRECT
        Opened /dev/ramdisk RW
        /dev/ramdisk: block size is 1024 bytes
      /dev/ramdisk: No label detected
        Closed /dev/ramdisk
        Opened /dev/md0 RW O_DIRECT
        /dev/md0: block size is 1024 bytes
      /dev/md0: No label detected
        Closed /dev/md0
        Opened /dev/root RW O_DIRECT
        /dev/root: block size is 4096 bytes
      /dev/root: No label detected
        Closed /dev/root
        /dev/ram: Not using O_DIRECT
        Opened /dev/ram RW
        /dev/ram: block size is 1024 bytes
      /dev/ram: No label detected
        Closed /dev/ram
        Opened /dev/md1 RW O_DIRECT
        /dev/md1: block size is 4096 bytes
      /dev/md1: No label detected
        Closed /dev/md1
        Opened /dev/dm-1 RW O_DIRECT
        /dev/dm-1: block size is 4096 bytes
      /dev/dm-1: No label detected
        Closed /dev/dm-1
        /dev/ram2: Not using O_DIRECT
        Opened /dev/ram2 RW
        /dev/ram2: block size is 1024 bytes
      /dev/ram2: No label detected
        Closed /dev/ram2
        Opened /dev/md2 RW O_DIRECT
        /dev/md2: block size is 4096 bytes
      /dev/md2: lvm2 label detected
        lvmcache: /dev/md2: now orphaned
        /dev/md2: Found metadata at 8192 size 872 for vg0
(lRcg12-Pt0L-NYUv-zJfF-GT62-UKnP-VmhtD0)
        lvmcache: /dev/md2: now in VG vg0
        lvmcache: /dev/md2: setting vg0 VGID to lRcg12Pt0LNYUvzJfFGT62UKnPVmhtD0
        lvmcache: /dev/md2: VG vg0: Set creation host to incognito.mcch.org.
        Closed /dev/md2
        Opened /dev/dm-2 RW O_DIRECT
        /dev/dm-2: block size is 4096 bytes
      /dev/dm-2: No label detected
        Closed /dev/dm-2
        /dev/ram3: Not using O_DIRECT
        Opened /dev/ram3 RW
        /dev/ram3: block size is 1024 bytes
      /dev/ram3: No label detected
        Closed /dev/ram3
        Opened /dev/dm-3 RW O_DIRECT
        /dev/dm-3: block size is 4096 bytes
      /dev/dm-3: No label detected
        Closed /dev/dm-3
        /dev/ram4: Not using O_DIRECT
        Opened /dev/ram4 RW
        /dev/ram4: block size is 1024 bytes
      /dev/ram4: No label detected
        Closed /dev/ram4
        Opened /dev/sda4 RW O_DIRECT
        /dev/sda4: block size is 512 bytes
      /dev/sda4: lvm2 label detected
        lvmcache: /dev/sda4: now orphaned
        /dev/sda4: Found metadata at 18432 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
        lvmcache: /dev/sda4: now in VG vg1
        lvmcache: /dev/sda4: setting vg1 VGID to
rthUcYKiTwzqwYWgg7rG54wTmZUYY6zA
        lvmcache: /dev/sda4: VG vg1: Set creation host to incognito.mcch.org.
        /dev/ram5: Not using O_DIRECT
        Opened /dev/ram5 RW
        /dev/ram5: block size is 1024 bytes
      /dev/ram5: No label detected
        Closed /dev/ram5
        /dev/ram6: Not using O_DIRECT
        Opened /dev/ram6 RW
        /dev/ram6: block size is 1024 bytes
      /dev/ram6: No label detected
        Closed /dev/ram6
        /dev/ram7: Not using O_DIRECT
        Opened /dev/ram7 RW
        /dev/ram7: block size is 1024 bytes
      /dev/ram7: No label detected
        Closed /dev/ram7
        /dev/ram8: Not using O_DIRECT
        Opened /dev/ram8 RW
        /dev/ram8: block size is 1024 bytes
      /dev/ram8: No label detected
        Closed /dev/ram8
        /dev/ram9: Not using O_DIRECT
        Opened /dev/ram9 RW
        /dev/ram9: block size is 1024 bytes
      /dev/ram9: No label detected
        Closed /dev/ram9
        /dev/ram10: Not using O_DIRECT
        Opened /dev/ram10 RW
        /dev/ram10: block size is 1024 bytes
      /dev/ram10: No label detected
        Closed /dev/ram10
        /dev/ram11: Not using O_DIRECT
        Opened /dev/ram11 RW
        /dev/ram11: block size is 1024 bytes
      /dev/ram11: No label detected
        Closed /dev/ram11
        /dev/ram12: Not using O_DIRECT
        Opened /dev/ram12 RW
        /dev/ram12: block size is 1024 bytes
      /dev/ram12: No label detected
        Closed /dev/ram12
        /dev/ram13: Not using O_DIRECT
        Opened /dev/ram13 RW
        /dev/ram13: block size is 1024 bytes
      /dev/ram13: No label detected
        Closed /dev/ram13
        /dev/ram14: Not using O_DIRECT
        Opened /dev/ram14 RW
        /dev/ram14: block size is 1024 bytes
      /dev/ram14: No label detected
        Closed /dev/ram14
        /dev/ram15: Not using O_DIRECT
        Opened /dev/ram15 RW
        /dev/ram15: block size is 1024 bytes
      /dev/ram15: No label detected
        Closed /dev/ram15
        Opened /dev/sdb4 RW O_DIRECT
        /dev/sdb4: block size is 512 bytes
      /dev/sdb4: lvm2 label detected
        lvmcache: /dev/sdb4: now orphaned
        /dev/sdb4: Found metadata at 4608 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
        lvmcache: /dev/sdb4: now in VG vg1 (rthUcYKiTwzqwYWgg7rG54wTmZUYY6zA)
        Opened /dev/sdc1 RW O_DIRECT
        /dev/sdc1: block size is 1024 bytes
      /dev/sdc1: No label detected
        Closed /dev/sdc1
      /dev/sda4: lvm2 label detected
        /dev/sda4: Found metadata at 18432 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
      /dev/sdb4: lvm2 label detected
        /dev/sdb4: Found metadata at 4608 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
      /dev/sda4: lvm2 label detected
        /dev/sda4: Found metadata at 18432 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
      /dev/sdb4: lvm2 label detected
        /dev/sdb4: Found metadata at 4608 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
        Read vg1 metadata (10) from /dev/sda4 at 18432 size 1715
      /dev/sda4: lvm2 label detected
        /dev/sda4: Found metadata at 18432 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
      /dev/sdb4: lvm2 label detected
        /dev/sdb4: Found metadata at 4608 size 1715 for vg1
(rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA)
        Read vg1 metadata (10) from /dev/sdb4 at 4608 size 1715
        /dev/sda4 0:      0  15360: virt(0:0)
        /dev/sda4 1:  15360  10240: opadata(0:0)
        /dev/sda4 2:  25600  10240: iscsi_deeds_data(0:0)
        /dev/sda4 3:  35840  23040: virt(15360:0)
        /dev/sda4 4:  58880 160513: NULL(0:0)
        /dev/sdb4 0:      0 219393: NULL(0:0)
    Archiving volume group "vg1" metadata (seqno 10).
      Expiring archive /etc/lvm/archive/vg1_00005.vg
        Allowing allocation on /dev/sda4 start PE 58880 length 160513
        Allowing allocation on /dev/sdb4 start PE 0 length 219393
        Parallel PVs at LE 0 length 10240: /dev/sda4
  Insufficient suitable allocatable extents for logical volume : 10240
more required
      Unlocking /var/lock/lvm/V_vg1
        Closed /dev/sda4
        Closed /dev/sdb4

Here's more of my lvm specs:

# pvdisplay -v
    Scanning for physical volume names
  --- Physical volume ---
  PV Name               /dev/sda4
  VG Name               vg1
  PV Size               857.01 GB / not usable 1.97 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              219393
  Free PE               160513
  Allocated PE          58880
  PV UUID               zLqW68-3oW4-Mi8H-P2ti-ltnG-WA0C-CRJS1e

  --- Physical volume ---
  PV Name               /dev/sdb4
  VG Name               vg1
  PV Size               857.01 GB / not usable 2.16 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              219393
  Free PE               219393
  Allocated PE          0
  PV UUID               VuPgY3-kf7s-aFyO-2Nof-G2Sw-xkqN-kwjAnz

  --- Physical volume ---
  PV Name               /dev/md2
  VG Name               vg0
  PV Size               73.28 GB / not usable 29.88 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              2344
  Free PE               1844
  Allocated PE          500
  PV UUID               tRNWez-5Yi4-ODco-2hIN-KD11-bsND-qEUxAk

# vgdisplay -v
    Finding all volume groups
    Finding volume group "vg1"
  --- Volume group ---
  VG Name               vg1
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  10
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.67 TB
  PE Size               4.00 MB
  Total PE              438786
  Alloc PE / Size       58880 / 230.00 GB
  Free  PE / Size       379906 / 1.45 TB
  VG UUID               rthUcY-KiTw-zqwY-Wgg7-rG54-wTmZ-UYY6zA

  --- Logical volume ---
  LV Name                /dev/vg1/virt
  VG Name                vg1
  LV UUID                N47Gdi-hdHO-jH8a-oBgP-4zvp-q8Uf-zgAQc0
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                150.00 GB
  Current LE             38400
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

  --- Logical volume ---
  LV Name                /dev/vg1/opadata
  VG Name                vg1
  LV UUID                NGL22V-JcPj-sLBf-CJaK-ps25-QCdz-EXfNK7
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                40.00 GB
  Current LE             10240
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0
  Block device           253:2

  --- Logical volume ---
  LV Name                /dev/vg1/iscsi_deeds_data
  VG Name                vg1
  LV UUID                WBwyFc-RJnp-z8Cl-hyjS-8AIT-psUc-nj64uS
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                40.00 GB
  Current LE             10240
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0
  Block device           253:3

  --- Physical volumes ---
  PV Name               /dev/sda4
  PV UUID               zLqW68-3oW4-Mi8H-P2ti-ltnG-WA0C-CRJS1e
  PV Status             allocatable
  Total PE / Free PE    219393 / 160513

  PV Name               /dev/sdb4
  PV UUID               VuPgY3-kf7s-aFyO-2Nof-G2Sw-xkqN-kwjAnz
  PV Status             allocatable
  Total PE / Free PE    219393 / 219393

    Finding volume group "vg0"
  --- Volume group ---
  VG Name               vg0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               73.25 GB
  PE Size               32.00 MB
  Total PE              2344
  Alloc PE / Size       500 / 15.62 GB
  Free  PE / Size       1844 / 57.62 GB
  VG UUID               lRcg12-Pt0L-NYUv-zJfF-GT62-UKnP-VmhtD0

  --- Logical volume ---
  LV Name                /dev/vg0/root
  VG Name                vg0
  LV UUID                av2DIv-p1Ns-pgPW-zN8U-fHbp-tMps-Q5b8dH
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                15.62 GB
  Current LE             500
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Physical volumes ---
  PV Name               /dev/md2
  PV UUID               tRNWez-5Yi4-ODco-2hIN-KD11-bsND-qEUxAk
  PV Status             allocatable
  Total PE / Free PE    2344 / 1844


# lvdisplay -v
    Finding all logical volumes
  --- Logical volume ---
  LV Name                /dev/vg1/virt
  VG Name                vg1
  LV UUID                N47Gdi-hdHO-jH8a-oBgP-4zvp-q8Uf-zgAQc0
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                150.00 GB
  Current LE             38400
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

  --- Logical volume ---
  LV Name                /dev/vg1/opadata
  VG Name                vg1
  LV UUID                NGL22V-JcPj-sLBf-CJaK-ps25-QCdz-EXfNK7
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                40.00 GB
  Current LE             10240
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0
  Block device           253:2

  --- Logical volume ---
  LV Name                /dev/vg1/iscsi_deeds_data
  VG Name                vg1
  LV UUID                WBwyFc-RJnp-z8Cl-hyjS-8AIT-psUc-nj64uS
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                40.00 GB
  Current LE             10240
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0
  Block device           253:3

  --- Logical volume ---
  LV Name                /dev/vg0/root
  VG Name                vg0
  LV UUID                av2DIv-p1Ns-pgPW-zN8U-fHbp-tMps-Q5b8dH
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                15.62 GB
  Current LE             500
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
