Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3JJqoBL025757
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2014 15:52:50 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3JJqlvX012216
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2014 15:52:47 -0400
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 849AE20A30
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2014 15:52:46 -0400 (EDT)
Message-Id: <1397937166.25179.108234009.0F2C14AA@webmail.messagingengine.com>
From: grantksupport@operamail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 19 Apr 2014 12:52:46 -0700
Subject: [linux-lvm] my LV-on-RAID system is up&running,
 but 'lvcreate' of new LVs FAILs @ "Incorrect metadata area header
 checksum ..." ?
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
To: linux-lvm@redhat.com

Hi,

I've a desktop machine, running Opensuse 13.1/x86_64.

It's booted to a RAID-10 array: "/boot" is on RAID, "/" (root) etc are
on LV-on-RAID.

I'm up & functional -- I can read/write all existing
drives/volumes/partitions.

BUT ... today, I attempted to create another, new LV.  It FAILs:

	lvcreate -L 200G -n LV_TEST /dev/VGD
	File descriptor 5 (/run/systemd/sessions/1.ref) leaked on
	lvcreate invocation. Parent PID 24577: bash
	  Incorrect metadata area header checksum on /dev/md127 at
	  offset 1069547520

I also notice that none of the {pv,vg,lv}scan tools work anymore, even
though they used to,

	pvscan
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on pvscan invocation. Parent PID 5962: bash
	vgscan
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on vgscan invocation. Parent PID 5962: bash
	lvscan
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on lvscan invocation. Parent PID 5962: bash

UNLESS I now add at least one "-v" flag


	pvscan -v
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on pvscan invocation. Parent PID 6485: bash
		    connect() failed on local socket: No such file or
		    directory
		    Internal cluster locking initialisation failed.
		    WARNING: Falling back to local file-based locking.
		    Volume Groups with the clustered attribute will be
		    inaccessible.
		    Wiping cache of LVM-capable devices
		    Wiping internal VG cache
		    Walking through all physical volumes
		    PV /dev/md127   VG VGD       lvm2 [1.82 TiB / 584.97
		    GiB free]
		    Total: 1 [1.82 TiB] / in use: 1 [1.82 TiB] / in no
		    VG: 0 [0   ]    <============= "no VG" ?

	vgscan -v
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on vgscan invocation. Parent PID 6485: bash
		    connect() failed on local socket: No such file or
		    directory
		    Internal cluster locking initialisation failed.
		    WARNING: Falling back to local file-based locking.
		    Volume Groups with the clustered attribute will be
		    inaccessible.
		    Wiping cache of LVM-capable devices
		    Wiping internal VG cache
		    Reading all physical volumes.  This may take a
		    while...
		    Finding all volume groups
		    Finding volume group "VGD"
		    Found volume group "VGD" using metadata type lvm2

	lvscan -v
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on lvscan invocation. Parent PID 6485: bash
		    connect() failed on local socket: No such file or
		    directory
		    Internal cluster locking initialisation failed.
		    WARNING: Falling back to local file-based locking.
		    Volume Groups with the clustered attribute will be
		    inaccessible.
		    Finding all logical volumes
		    ACTIVE            '/dev/VGD/LV_ROOT' [40.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_SWAP' [8.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_VAR' [6.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_VARCACHE' [2.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_USRLOCAL' [150.00
		    GiB] inherit
		    ACTIVE            '/dev/VGD/LV_HOME' [300.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_DATA' [300.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_VBOX_DATA1' [30.00
		    GiB] inherit
		    ACTIVE            '/dev/VGD/LV_VBOX_DATA2' [20.00
		    GiB] inherit
		    ACTIVE            '/dev/VGD/LV_BACKUPS' [400.00 GiB]
		    inherit
		    ACTIVE            '/dev/VGD/LV_EXTRA1' [20.00 GiB]
		    inherit

This article

	6.4. Recovering Physical Volume Metadata
		https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/mdatarecover.html

suggests what I *think* may be a relevant solution,

	"If the volume group metadata area of a physical volume is
	accidentally overwritten or otherwise destroyed, you will get an
	error message indicating that the metadata area is incorrect, or
	that the system was unable to find a physical volume with a
	particular UUID. You may be able to recover the data the
	physical volume by writing a new metadata area on the physical
	volume specifying the same UUID as the lost metadata."


but I am NOT@all clear/certain that it's the right solution for this
problem.

Given the data above & below, and anything else I can provide, IS that
the right approach to fix this?

If it is, I'm hoping to get some help making sure I get this procedure
right!  afaict, that procedure CAN work, but if you get it wrong, you're
hosed :-/  I understand I'm in over my head here, and appreciate any &
help I can get!

Thanks!  Grant




here's more of the data from my system,

	uname -a
		Linux gsvr 3.14.1-1.geafcebd-desktop #1 SMP PREEMPT Mon
		Apr 14 20:10:59 UTC 2014 (eafcebd) x86_64 x86_64 x86_64
		GNU/Linux

	rpm -qa | egrep -i "lvm|mdadm" | grep -iv llvm
		lvm2-2.02.98-0.28.14.1.x86_64
		mdadm-3.3-126.1.x86_64

	lvs --version
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on lvs invocation. Parent PID 6485: bash
		  LVM version:     2.02.98(2) (2012-10-15)
		  Library version: 1.03.01 (2011-10-15)
		  Driver version:  4.27.0

	cat /proc/mdstat
		Personalities : [raid0] [raid1] [raid10] [raid6] [raid5]
		[raid4] [linear]
		md126 : active raid1 sdc1[2] sdb1[1] sdd1[3] sda1[0]
		      1060160 blocks [4/4] [UUUU]
		      bitmap: 0/130 pages [0KB], 4KB chunk

		md127 : active raid10 sdc2[2] sdb2[1] sda2[0] sdd2[4]
		      1951397888 blocks super 1.2 512K chunks 2
		      far-copies [4/4] [UUUU]
		      bitmap: 4/466 pages [16KB], 2048KB chunk

	unused devices: <none>

	mdadm --detail /dev/md127
		/dev/md127:
		        Version : 1.2
		  Creation Time : Mon Feb 14 07:49:55 2011
		     Raid Level : raid10
		     Array Size : 1951397888 (1861.00 GiB 1998.23 GB)
		  Used Dev Size : 975698944 (930.50 GiB 999.12 GB)
		   Raid Devices : 4
		  Total Devices : 4
		    Persistence : Superblock is persistent

		  Intent Bitmap : Internal

		    Update Time : Sat Apr 19 12:09:59 2014
		          State : active
		 Active Devices : 4
		Working Devices : 4
		 Failed Devices : 0
		  Spare Devices : 0

		         Layout : far=2
		     Chunk Size : 512K

		           Name : gsvr:gsvr1  (local to host gsvr)
		           UUID : d47afb79:e5fa9b28:ff35c586:f2602920
		         Events : 29697

		    Number   Major   Minor   RaidDevice State
		       0       8        2        0      active sync  
		       /dev/sda2
		       1       8       18        1      active sync  
		       /dev/sdb2
		       2       8       34        2      active sync  
		       /dev/sdc2
		       4       8       50        3      active sync  
		       /dev/sdd2


	mdadm --examine /dev/sda2
		/dev/sda2:
		          Magic : a92b4efc
		        Version : 1.2
		    Feature Map : 0x1
		     Array UUID : d47afb79:e5fa9b28:ff35c586:f2602920
		           Name : gsvr:gsvr1  (local to host gsvr)
		  Creation Time : Mon Feb 14 07:49:55 2011
		     Raid Level : raid10
		   Raid Devices : 4

		 Avail Dev Size : 1951399213 (930.50 GiB 999.12 GB)
		     Array Size : 1951397888 (1861.00 GiB 1998.23 GB)
		  Used Dev Size : 1951397888 (930.50 GiB 999.12 GB)
		    Data Offset : 272 sectors
		   Super Offset : 8 sectors
		   Unused Space : before=192 sectors, after=1325 sectors
		          State : clean
		    Device UUID : b7d6b1cd:6fe152fe:398c453b:6f6ac87a

		Internal Bitmap : 8 sectors from superblock
		    Update Time : Sat Apr 19 12:10:05 2014
		       Checksum : c54765c9 - correct
		         Events : 29697

		         Layout : far=2
		     Chunk Size : 512K

		   Device Role : Active device 0
		   Array State : AAAA ('A' == active, '.' == missing,
		   'R' == replacing)

	pvdisplay
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on pvdisplay invocation. Parent PID 5962: bash
		  --- Physical volume ---
		  PV Name               /dev/md127
		  VG Name               VGD
		  PV Size               1.82 TiB / not usable 30.00 MiB
		  Allocatable           yes
		  PE Size               32.00 MiB
		  Total PE              59551
		  Free PE               18719
		  Allocated PE          40832
		  PV UUID              
		  m9FXrP-QuuZ-4jlY-wlW1-f9wy-za5c-9Zh7ZM


	vgdisplay
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on vgdisplay invocation. Parent PID 5962: bash
		  --- Volume group ---
		  VG Name               VGD
		  System ID
		  Format                lvm2
		  Metadata Areas        2
		  Metadata Sequence No  30
		  VG Access             read/write
		  VG Status             resizable
		  MAX LV                0
		  Cur LV                11
		  Open LV               9
		  Max PV                0
		  Cur PV                1
		  Act PV                1
		  VG Size               1.82 TiB
		  PE Size               32.00 MiB
		  Total PE              59551
		  Alloc PE / Size       40832 / 1.25 TiB
		  Free  PE / Size       18719 / 584.97 GiB
		  VG UUID              
		  vxSnJu-tTyx-MPzK-10MU-Tkez-gigb-JwXSav


	lvdisplay
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on lvdisplay invocation. Parent PID 5962: bash
		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_ROOT
		  LV Name                LV_ROOT
		  VG Name                VGD
		  LV UUID               
		  fWKUKN-v2I8-9hGy-mble-YIKe-Usjv-ERigkO
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                40.00 GiB
		  Current LE             1280
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:0

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_SWAP
		  LV Name                LV_SWAP
		  VG Name                VGD
		  LV UUID               
		  z6Bkzp-cNEL-EShB-eFf7-27j3-V3bH-417PYu
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 2
		  LV Size                8.00 GiB
		  Current LE             256
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:1

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_VAR
		  LV Name                LV_VAR
		  VG Name                VGD
		  LV UUID               
		  Cy4N9u-gS9l-xdYa-pcYf-2aVz-FjcA-Tkf6tE
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                6.00 GiB
		  Current LE             192
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:2

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_VARCACHE
		  LV Name                LV_VARCACHE
		  VG Name                VGD
		  LV UUID               
		  WnK6tX-Wqc1-thTv-GOs1-fop6-UfrJ-mlA0Jb
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                2.00 GiB
		  Current LE             64
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:3

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_USRLOCAL
		  LV Name                LV_USRLOCAL
		  VG Name                VGD
		  LV UUID               
		  pJL0cP-V5og-vTzk-GkbV-p7ut-AQLC-egU8FF
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                150.00 GiB
		  Current LE             4800
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:4

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_HOME
		  LV Name                LV_HOME
		  VG Name                VGD
		  LV UUID               
		  gNY87k-SDU3-GUcf-sQf6-kVhA-Yh1b-v1C3T4
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                300.00 GiB
		  Current LE             9600
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:5

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_DATA
		  LV Name                LV_DATA
		  VG Name                VGD
		  LV UUID               
		  Avz6Cd-Wg2s-Ehne-A6Db-bsyp-ANIA-AO83XH
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                300.00 GiB
		  Current LE             9600
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:6

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_BACKUPS
		  LV Name                LV_BACKUPS
		  VG Name                VGD
		  LV UUID               
		  hdFydK-4twc-Ixav-w8hV-GA8K-jWrX-9P3sPp
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 1
		  LV Size                400.00 GiB
		  Current LE             12800
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:9

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_EXTRA1
		  LV Name                LV_EXTRA1
		  VG Name                VGD
		  LV UUID               
		  hKC3qz-07hL-ESfw-1wWd-FVXN-nxsX-hhz6dz
		  LV Write Access        read/write
		  LV Creation host, time gsvr.gdomain.loc, 2013-12-13
		  15:13:45 -0800
		  LV Status              available
		  # open                 1
		  LV Size                20.00 GiB
		  Current LE             640
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:10

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_VBOX_DATA1
		  LV Name                LV_VBOX_DATA1
		  VG Name                VGD
		  LV UUID               
		  n0cf1s-gfyd-7ek3-SFfj-EEMC-SKdg-z0C40g
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 0
		  LV Size                30.00 GiB
		  Current LE             960
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:7

		  --- Logical volume ---
		  LV Path                /dev/VGD/LV_VBOX_DATA2
		  LV Name                LV_VBOX_DATA2
		  VG Name                VGD
		  LV UUID               
		  eQmtwC-M6gq-sisX-iRLT-sRqD-N3R2-QcHZXf
		  LV Write Access        read/write
		  LV Creation host, time ,
		  LV Status              available
		  # open                 0
		  LV Size                20.00 GiB
		  Current LE             640
		  Segments               1
		  Allocation             inherit
		  Read ahead sectors     auto
		  - currently set to     8192
		  Block device           253:8


	ls -al /etc/lvm/backup/VGD
		-rw------- 1 root root 4.5K Dec 13 15:13
		/etc/lvm/backup/VGD

	pvs -v
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on pvs invocation. Parent PID 6485: bash
		    connect() failed on local socket: No such file or
		    directory
		    Internal cluster locking initialisation failed.
		    WARNING: Falling back to local file-based locking.
		    Volume Groups with the clustered attribute will be
		    inaccessible.
		    Scanning for physical volume names
		  PV         VG      Fmt  Attr PSize PFree   DevSize PV
		  UUID
		  /dev/md127 VGD     lvm2 a--  1.82t 584.97g   1.82t
		  m9FXrP-QuuZ-4jlY-wlW1-f9wy-za5c-9Zh7ZM

	vgs -v
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on vgs invocation. Parent PID 6485: bash
		    connect() failed on local socket: No such file or
		    directory
		    Internal cluster locking initialisation failed.
		    WARNING: Falling back to local file-based locking.
		    Volume Groups with the clustered attribute will be
		    inaccessible.
		    Finding all volume groups
		    Finding volume group "VGD"
		  VG      Attr   Ext    #PV #LV #SN VSize VFree   VG
		  UUID
		  VGD     wz--n- 32.00m   1  11   0 1.82t 584.97g
		  vxSnJu-tTyx-MPzK-10MU-Tkez-gigb-JwXSav

	lvs -v
		File descriptor 5 (/run/systemd/sessions/1.ref) leaked
		on lvs invocation. Parent PID 6485: bash
		    connect() failed on local socket: No such file or
		    directory
		    Internal cluster locking initialisation failed.
		    WARNING: Falling back to local file-based locking.
		    Volume Groups with the clustered attribute will be
		    inaccessible.
		    Finding all logical volumes
		  LV                 VG      #Seg Attr      LSize   Maj
		  Min KMaj KMin Pool Origin Data%  Meta%  Move Copy% 
		  Log Convert LV UUID
		  LV_BACKUPS         VGD        1 -wi-ao--- 400.00g  -1 
		  -1 253  9                                             
		          hdFydK-4twc-Ixav-w8hV-GA8K-jWrX-9P3sPp
		  LV_DATA            VGD        1 -wi-ao--- 300.00g  -1 
		  -1 253  6                                             
		          Avz6Cd-Wg2s-Ehne-A6Db-bsyp-ANIA-AO83XH
		  LV_HOME            VGD        1 -wi-ao--- 300.00g  -1 
		  -1 253  5                                             
		          gNY87k-SDU3-GUcf-sQf6-kVhA-Yh1b-v1C3T4
		  LV_ROOT            VGD        1 -wi-ao---  40.00g  -1 
		  -1 253  0                                             
		          fWKUKN-v2I8-9hGy-mble-YIKe-Usjv-ERigkO
		  LV_EXTRA1          VGD        1 -wi-ao---  20.00g  -1 
		  -1 253  10                                            
		          hKC3qz-07hL-ESfw-1wWd-FVXN-nxsX-hhz6dz
		  LV_SWAP            VGD        1 -wi-ao---   8.00g  -1 
		  -1 253  1                                             
		          z6Bkzp-cNEL-EShB-eFf7-27j3-V3bH-417PYu
		  LV_USRLOCAL        VGD        1 -wi-ao--- 150.00g  -1 
		  -1 253  4                                             
		          pJL0cP-V5og-vTzk-GkbV-p7ut-AQLC-egU8FF
		  LV_VAR             VGD        1 -wi-ao---   6.00g  -1 
		  -1 253  2                                             
		          Cy4N9u-gS9l-xdYa-pcYf-2aVz-FjcA-Tkf6tE
		  LV_VARCACHE        VGD        1 -wi-ao---   2.00g  -1 
		  -1 253  3                                             
		          WnK6tX-Wqc1-thTv-GOs1-fop6-UfrJ-mlA0Jb
		  LV_VBOX_DATA1      VGD        1 -wi-a----  30.00g  -1 
		  -1 253  7                                             
		          n0cf1s-gfyd-7ek3-SFfj-EEMC-SKdg-z0C40g
		  LV_VBOX_DATA2      VGD        1 -wi-a----  20.00g  -1 
		  -1 253  8                                             
		          eQmtwC-M6gq-sisX-iRLT-sRqD-N3R2-QcHZXf
