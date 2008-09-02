Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m82AhjUi001622
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 06:43:45 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.231])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m82AhZc6010974
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2008 06:43:35 -0400
Received: by wr-out-0506.google.com with SMTP id c49so1814577wra.19
	for <linux-lvm@redhat.com>; Tue, 02 Sep 2008 03:43:34 -0700 (PDT)
Message-ID: <c8ce53500809020343y6236762age945a548c3eb8df4@mail.gmail.com>
Date: Tue, 2 Sep 2008 11:43:34 +0100
From: "Michael Guyver" <michael.guyver@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Problems with LVM setup using former RAID-1 disks
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

Hi there,

My server recently got a (short) holiday from the data centre it's
been locked in for a few years and a fresh OS install which brought it
up to CentOS 5.2. The installation was slightly hurried and the LVM
setup was not reviewed very thoroughly - the default CentOS installer
partitions were simply accepted. The server has two Maxtor 200 GB
disks which were previously configured to run in a RAID-1
configuration.

However, judging by the output of fdisk -l, mount, pvdisplay and
lvdisplay, it seems that while the system is using /dev/sda1 as /boot,
it's using /dev/sdb2 as the / partition. Running system-config-lvm
shows /dev/sda2 as uninitialised. Running pvdisplay results in the
following:

# pvdisplay
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VolGroup00
  PV Size               189.67 GB / not usable 15.34 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              6069
  Free PE               0
  Allocated PE          6069
  PV UUID               g7ZWtz-NQcH-x2PM-QghP-0NBH-DXuY-caYqAt

I'm not running EMC PowerPath as suggested in KB article
http://kbase.redhat.com/faq/FAQ_80_12135.shtm.

Some other config details are included below for information and
hopefully to help someone to spot the problem I'm having. Could this
be caused by the RAID superblock being preserved on the disks despite
the OS being reinstalled?

Ideally I would like to configure the system to run with redundancy -
either using software RAID-1 or using LVM mirroring, the investigation
of which is what led me to discover this problem in the first place.

Best wishes

Michael

---------------------------------------------------------------------------------------------------
# lvdisplay
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                rvPZJS-6Z7a-kXzk-aLcM-vv13-eRCK-kjg6I1
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                187.72 GB
  Current LE             6007
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                zvxDsa-MZXn-akSA-DlzC-49IX-65Fo-HPBuyJ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.94 GB
  Current LE             62
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1

---------------------------------------------------------------------------------------------------
# vgdisplay
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               189.66 GB
  PE Size               32.00 MB
  Total PE              6069
  Alloc PE / Size       6069 / 189.66 GB
  Free  PE / Size       0 / 0
  VG UUID               QeetG1-sSbh-g4Sp-bnbQ-9ZdD-Co1q-aoJe6t


--------------------------------------------------------------------------------------------------
# fdisk -l

Disk /dev/sda: 203.9 GB, 203928109056 bytes
255 heads, 63 sectors/track, 24792 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   83  Linux
/dev/sda2              14       24773   198884700   8e  Linux LVM

Disk /dev/sdb: 203.9 GB, 203928109056 bytes
255 heads, 63 sectors/track, 24792 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1          13      104391   83  Linux
/dev/sdb2              14       24773   198884700   8e  Linux LVM

--------------------------------------------------------------------------------------------------
# lvm dumpconfig
  devices {
        dir="/dev"
        scan="/dev"
        preferred_names=[]
        filter="a/.*/"
        cache_dir="/etc/lvm/cache"
        cache_file_prefix=""
        write_cache_state=1
        sysfs_scan=1
        md_component_detection=1
        ignore_suspended_devices=0
  }
  activation {
        missing_stripe_filler="/dev/ioerror"
        reserved_stack=256
        reserved_memory=8192
        process_priority=-18
        mirror_region_size=512
        readahead="auto"
        mirror_log_fault_policy="allocate"
        mirror_device_fault_policy="remove"
  }
  global {
        umask=63
        test=0
        units="h"
        activation=1
        proc="/proc"
        locking_type=1
        fallback_to_clustered_locking=1
        fallback_to_local_locking=1
        locking_dir="/var/lock/lvm"
  }
  shell {
        history_size=100
  }
  backup {
        backup=1
        backup_dir="/etc/lvm/backup"
        archive=1
        archive_dir="/etc/lvm/archive"
        retain_min=10
        retain_days=30
  }
  log {
        verbose=0
        syslog=1
        overwrite=0
        level=0
        indent=1
        command_names=0
        prefix="  "
  }
--------------------------------------------------------------------------------------------------
# pvcreate -M 2 /dev/sda2
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sda2
not /dev/sdb2
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sda2
not /dev/sdb2
  Can't initialize physical volume "/dev/sda2" of volume group
"VolGroup00" without -ff

--------------------------------------------------------------------------------------------------
# pvcreate -M 2 -ff /dev/sda2
  Found duplicate PV g7ZWtzNQcHx2PMQghP0NBHDXuYcaYqAt: using /dev/sdb2
not /dev/sda2
Really INITIALIZE physical volume "/dev/sda2" of volume group
"VolGroup00" [y/n]? n
  /dev/sda2: physical volume not initialized

--------------------------------------------------------------------------------------------------
# cat /proc/mdstat
Personalities :
unused devices: <none>
