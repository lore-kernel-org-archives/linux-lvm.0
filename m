Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59JlMq2005758
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 15:47:22 -0400
Received: from vms042pub.verizon.net (vms042pub.verizon.net [206.46.252.42])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59JlLHj019483
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 15:47:21 -0400
Received: from [192.168.1.100] ([72.82.90.249])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-4.02
	(built Sep
	9 2005)) with ESMTPA id <0J0L00B5KYYNU5LB@vms042.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 09 Jun 2006 14:47:12 -0500 (CDT)
Date: Fri, 09 Jun 2006 15:45:51 -0400
From: Jeremy Johnson <jazz_johnson@verizon.net>
Message-id: <200606091545.51379.jazz_johnson@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] question about corrupted lvm2 volumes
Reply-To: jazz_johnson@verizon.net,
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I have an amd64 computer running 64-bit Gentoo.
I had a pair of 160G hard drives in a raid1 mirror configuration.
I recently added another 160G harddrive which I set up as
a lvm2 physical volume: `lvcreate /dev/sda && vgcreate extra /dev/sda`
I then created a logical volume on /dev/extra and copied my old filesystem
to this new volume:

#lvcreate -L50G -nbackup extra
#mkreiserfs /dev/extra/backup
#mount /dev/extra/backup /mnt/backup
#BACKUP /   /mnt/backup

I then repartitioned my original pair of harddrives
#cfdisk; sfdisk -d /dev/sdb | sfdisk /dev/sdc
and repartitioned:

I set up 4 partitions
/dev/md1 /dev/sd{b,c}1   /boot    ext2
                 /dev/sd{b,c}2   swap   sw
/dev/md3 /dev/sd{b,c}3   /            reiserfs
/dev/md4 /dev/sd{b,c}4   LVM2 main  
/dev/main/{archives ,home ,opt ,portage ,tmp ,usr ,var  vartmp}
I initialized filesystems on /dev/main/{LVM2 volumes}
and mounted /dev/md3 on /mnt/newroot, created mount points and
mounted LVM2 volumes on /mnt/newroot/{usr,opt,var,...etc}
and restored from my /mnt/backup to my /mnt/newroot
I then chroot'd into my new root and edited /etc/{fstab,mdadm.conf,lvm/} 
and I setup grub into my MBR on /dev/sd{b,c} <=> (hd1) and (hd2):
grub> root (hd1,0)
grub> setup (hd1)
grub> root (hd2,0)
grub> setup (hd2)

My problem is that after booting into my new system
3 of my LVM2 partitions {usr,opt,archives} get corrupted during booting.
If I then reinitizialize their filesystems and restore from backup
my system seems to be working OK. If I then reboot to a livecd
I can then mount all my LVM2 partitions without error.
But if I reboot to my system these same 3 LVM2 volumes get corrupted
and when I try to mount the partitions I get error message 
"Operation not permitted"

So running e.g. 
#reiserfck /dev/main/opt:
Replaying journal ...
Reiserfs journal /dev/main/opt in blocks [18..8211]
0 transactions replayed
Checking internal tree on 1 1(of14) 1(of 170) block 8211
The level of the node (25938) is not correct (1) expected.
the problem in the internal node occurred (8211)
whole subtree skipped
finished
Comparing bitmaps ..vpf--10640: The on-disk and the correct bitmaps differs
Bad nodes were found, semantic pass skipped
1 found corruption can be fixed when running with --rebuild-tree 

I've tried lvremove'ing these volumes and re-lvcreate'ing them but haven't
yet fixed the problem. I've built my 2.6.16-gentoo-r3 kernel with
device-mapper + lvm2 + raid0 + raid1 built-in:
#zless /proc/config.gz
#
# Multi-device support (RAID and LVM)
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=m
CONFIG_MD_RAID5=m
CONFIG_MD_RAID6=m
# CONFIG_MD_MULTIPATH is not set
# CONFIG_MD_FAULTY is not set
CONFIG_BLK_DEV_DM=y
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_MIRROR=m
CONFIG_DM_ZERO=m
# CONFIG_DM_MULTIPATH is not set
# CONFIG_BLK_DEV_DM_BBR is not set 

I've removed my old /etc/raidtab
and I've done a `mdadm --details --scan >>/etc/mdadm.conf`
and I've modified my filter in /etc/lvm/lvm.conf: filter = 
[ "a|/dev/sda|", "a|/dev/md4|", "a|/dev/main/*|", "a|/dev/extra/*|", "r/.*/" ]


This is tail of what `vgdisplay` says:
 Finding volume group "main"
        Opened /dev/md4 RO O_DIRECT
        /dev/md4: block size is 4096 bytes
      /dev/md4: lvm2 label detected
        /dev/md4: Found metadata at 90624 size 2745 for main 
(CcE5mw-EKsk-u2QZ-tqZp-26YU-QTx6-4YIlys)
      /dev/md4: lvm2 label detected
        /dev/md4: Found metadata at 90624 size 2745 for main 
(CcE5mw-EKsk-u2QZ-tqZp-26YU-QTx6-4YIlys)
        Read main metadata (34) from /dev/md4 at 90624 size 2745
        /dev/md4 0:      0   7680: archives(11887:0)
        /dev/md4 1:   7680    512: portage(0:0)
        /dev/md4 2:   8192   2560: home(0:0)
        /dev/md4 3:  10752    913: archives(19567:0)
        /dev/md4 4:  11665   1024: opt(0:0)
        /dev/md4 5:  12689    111: NULL(0:0)
        /dev/md4 6:  12800   1536: vartmp(0:0)
        /dev/md4 7:  14336    512: tmp(0:0)
        /dev/md4 8:  14848   1024: NULL(0:0)
        /dev/md4 9:  15872   1024: var(0:0)
        /dev/md4 10:  16896   7680: usr(0:0)
        /dev/md4 11:  24576  11887: archives(0:0)
  --- Volume group ---
  VG Name               main
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  34
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                8
        Getting device info for main-portage
        dm version   O   [16384]
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlysxJOAb8ERUBxCzQ7bgLrdPUC8d9eQCzdk O   
[16384]
        Getting device info for main-home
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlys0lnabC1A2xWwwWejywcctENDtBxn4exj O   
[16384]
        Getting device info for main-vartmp
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlysXXkM5IYLIvUyx0h0I8kNLK1R8i2fyPmT O   
[16384]
        Getting device info for main-tmp
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlysTpyh1z5fxA98aPlbuLGKYCVuER3kvDtB O   
[16384]
        Getting device info for main-var
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlyse9ahmisyqPN2H6vKujCaXan2X1u7N9WV O   
[16384]
        Getting device info for main-usr
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlysRiNQCmmlDqipc0gvIF3R5huzf3Q9rdbg O   
[16384]
        Getting device info for main-archives
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlysRWgvL4RZO6izvsBHqGez3V5h5KUsBsLB O   
[16384]
        Getting device info for main-opt
        dm info  
LVM-CcE5mwEKsku2QZtqZp26YUQTx64YIlysHBTkmIQSC4Rb6xZ7J13gISkRe4InoFBf O   
[16384]
  Open LV               7
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               142.43 GB
  PE Size               4.00 MB
  Total PE              36463
  Alloc PE / Size       35328 / 138.00 GB
  Free  PE / Size       1135 / 4.43 GB
  VG UUID               CcE5mw-EKsk-u2QZ-tqZp-26YU-QTx6-4YIlys

        Read volume group main from /etc/lvm/backup/main
      Unlocking /var/lock/lvm/V_main
        Closed /dev/md4
      Locking /var/lock/lvm/V_extra RB
    Finding volume group "extra"
        Opened /dev/sda RO O_DIRECT
        /dev/sda: block size is 4096 bytes
      /dev/sda: lvm2 label detected
        /dev/sda: Found metadata at 24064 size 1810 for extra 
(KboSee-hy8G-4NV9-jHfb-PiXt-m9wI-MewC6X)
      /dev/sda: lvm2 label detected
        /dev/sda: Found metadata at 24064 size 1810 for extra 
(KboSee-hy8G-4NV9-jHfb-PiXt-m9wI-MewC6X)
        Read extra metadata (12) from /dev/sda at 24064 size 1810
        /dev/sda 0:      0   2560: distfiles(0:0)
        /dev/sda 1:   2560   2560: archives(0:0)
        /dev/sda 2:   5120   5120: archives-bkup(0:0)
        /dev/sda 3:  10240  10240: NULL(0:0)
        /dev/sda 4:  20480  10240: backup(0:0)
        /dev/sda 5:  30720   3840: oldroot(0:0)
        /dev/sda 6:  34560   3596: NULL(0:0)
  --- Volume group ---
  VG Name               extra
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  12
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                5
        Getting device info for extra-distfiles
        dm info  
LVM-KboSeehy8G4NV9jHfbPiXtm9wIMewC6X7lJNShC8kMJ5uhzo9jBpGT7IBUp9HGYC O   
[16384]
        Getting device info for extra-archives
        dm info  
LVM-KboSeehy8G4NV9jHfbPiXtm9wIMewC6XdArNebRyzy0ix2AxgqO7MH0di9u3FcIy O   
[16384]
        Getting device info for extra-backup
        dm info  
LVM-KboSeehy8G4NV9jHfbPiXtm9wIMewC6XHD0VXSAb2YOiMjtomSa2pwCXnNcfh6rN O   
[16384]
        Getting device info for extra-oldroot
        dm info  
LVM-KboSeehy8G4NV9jHfbPiXtm9wIMewC6X6ZQkzscIHkbgP4KGCGhG1reDBm3dcuUt O   
[16384]
        Getting device info for extra-archives--bkup
        dm info  
LVM-KboSeehy8G4NV9jHfbPiXtm9wIMewC6XOM3JPV7QVyvjg35osPHriSixzA89rU4k O   
[16384]
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               149.05 GB
  PE Size               4.00 MB
  Total PE              38156
  Alloc PE / Size       24320 / 95.00 GB
  Free  PE / Size       13836 / 54.05 GB
  VG UUID               KboSee-hy8G-4NV9-jHfb-PiXt-m9wI-MewC6X

        Read volume group extra from /etc/lvm/backup/extra
      Unlocking /var/lock/lvm/V_extra
        Closed /dev/sda
      Dumping persistent device cache to /etc/lvm/.cache
    Wiping internal VG cache

====================================

Does anybody have a clue as to what might be causing
a few (but not all) of the volumes on my /dev/main <==> /dev/md4
to get corrupted during booting?
Does anything look strange in my vgdisplay? or lvm.conf filter?
Nothing should even be written to /usr,/opt,or /archives during bootup
so what could corrupt these LVM2 volumes?


THANKS for any insights.
