Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n61MlPEu014063
	for <linux-lvm@redhat.com>; Wed, 1 Jul 2009 18:47:26 -0400
Received: from em002a.cxnet.dk (em002a.cxnet.dk [87.72.115.243])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n61Ml91Q017435
	for <linux-lvm@redhat.com>; Wed, 1 Jul 2009 18:47:10 -0400
Received: from em002a.cxnet.dk (localhost [127.0.0.1])
	by em002a.cxnet.dk (Postfix) with ESMTP id 51855176B27
	for <linux-lvm@redhat.com>; Thu,  2 Jul 2009 00:47:08 +0200 (CEST)
Received: from em002a.cxnet.dk (localhost [127.0.0.1])
	by em002a.cxnet.dk (Postfix) with ESMTP id 378DC176BCF
	for <linux-lvm@redhat.com>; Thu,  2 Jul 2009 00:47:08 +0200 (CEST)
Received: from [10.0.0.165] (unknown [81.161.190.59])
	by em002a.cxnet.dk (Postfix) with ESMTP id 140EF176B27
	for <linux-lvm@redhat.com>; Thu,  2 Jul 2009 00:47:08 +0200 (CEST)
Message-ID: <4A4BE619.4020600@gmx.net>
Date: Thu, 02 Jul 2009 00:41:29 +0200
From: Michael Ole Olsen <gnu@gmx.net>
MIME-Version: 1.0
References: <4A4BE21C.4020001@gmx.net>
In-Reply-To: <4A4BE21C.4020001@gmx.net>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] ioctl: error adding target to table,
 unable to mount lvm2 device nodes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

This problem happened after switching root filesystem from
 a debian lenny install to debian lenny install. 
The raid is clean and has been correctly shutdown and re-run.

Now it will not mount my raid6 lvm2 device nodes at all,
 but it shows them just fine.

With a new compiled kernel from kernel.org 2.6.30 and
lvm2,dmsetup from lenny repos i keep getting:
# vgchange -a y

I have some special raid6 setup so i think i can only use 2.6.30
(did echo raid6 into /sys in 2.6.30 to reshape to raid6 from raid5),
assembly seemingly fails on 2.6.26-2

here is the error i keep getting when trying to vgchange -a y
which is probably the reason that i cannot mount my device
nodes as xfs fs?

device-mapper ioctl: error adding target to table
table: device 9:0 too small for target
table: 253:11: linear: dm-linear Device lookup failed
device-mapper: reload ioctl failed: Invalid argument

I have everything compiled into the kernel, also DM, not as module.

but it did say:
12 logical volume(s) in volume group st1500 now active

and i can see them in /dev/mapper

if i tried to mount each of them it said:
mount: you must specify the filesystem type

or some other weird error message
i do have xfs in my kernel and can mount other xfs filesystems
but all my dm filesystems fail for some reason

Here is my config

root@mlap:~/mfs# grep CONFIG_DM .config
CONFIG_DMI=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_CRYPT=y
# CONFIG_DM_SNAPSHOT is not set
CONFIG_DM_MIRROR=y
CONFIG_DM_ZERO=y
CONFIG_DM_MULTIPATH=y
# CONFIG_DM_DELAY is not set
# CONFIG_DM_UEVENT is not set
# CONFIG_DM9102 is not set
CONFIG_DMADEVICES=y
CONFIG_DMIID=y
# CONFIG_DMA_API_DEBUG is not set
root@mlap:~/mfs# grep CONFIG_XFS .config
CONFIG_XFS_FS=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
# CONFIG_XFS_RT is not set
# CONFIG_XFS_DEBUG is not set
root@mlap:~/mfs# grep CONFIG_MD .config
CONFIG_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=y
# CONFIG_MD_RAID0 is not set
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_RAID456=y
CONFIG_MD_RAID6_PQ=y
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=y
# CONFIG_MDIO_BITBANG is not set

Any ideas what I am missing ?
I have now tried compiling them all as modules as well into an initramfs
and my mdadm assembles fine and i can see the volumes in vgs and lvs

mdadm is active on the raid, 10 of 10 disks are up and
/dev/mapper/st1500-bigdaddy exists, i just cannot mount it,
i could do this before kernel and system upgrade
(i use an other lenny install now,  but i updated udev,dmsetup,
cryptsetup,lvm2 to most recent versions on it)

root@limac:/dev/mapper# lsmod
Module                  Size  Used by
dm_crypt               10676  0
xfs                   408516  3
dm_mirror              11760  0
dm_region_hash          8040  1 dm_mirror
dm_log                  7692  2 dm_mirror,dm_region_hash
dm_snapshot            18416  0
sd_mod                 21068  14
sata_mv                24176  4
sata_nv                18720  6
pata_amd                9108  3
ata_generic             4192  0
libata                126092  4 sata_mv,sata_nv,pata_amd,ata_generic
linear                  3944  0
raid456                39384  1
raid6_pq               79644  1 raid456
async_xor               1744  1 raid456
async_memcpy            1304  1 raid456
async_tx                2096  3 raid456,async_xor,async_memcpy
xor                    13832  2 raid456,async_xor
raid10                 16460  0
raid1                  17284  0
raid0                   5824  0
usb_storage            29544  0
scsi_mod              111380  3 sd_mod,libata,usb_storage
md_mod                 71088  6 linear,raid456,raid10,raid1,raid0
dm_mod                 44944  20 dm_crypt,dm_mirror,dm_log,dm_snapshot

[   16.065280] RAID5 conf printout:
[   16.065380]  --- rd:10 wd:10
[   16.065479]  disk 0, o:1, dev:sdj
[   16.065579]  disk 1, o:1, dev:sdg
[   16.065677]  disk 2, o:1, dev:sdi
[   16.065775]  disk 3, o:1, dev:sde
[   16.065874]  disk 4, o:1, dev:sdh
[   16.065973]  disk 5, o:1, dev:sdf
[   16.066073]  disk 6, o:1, dev:sdc
[   16.066172]  disk 7, o:1, dev:sdk
[   16.066271]  disk 8, o:1, dev:sdb
[   16.066371]  disk 9, o:1, dev:sdd
[   16.066710]  md0: unknown partition table
[   17.284559] device-mapper: table: 254:0: zero-length target
[   17.284660] device-mapper: ioctl: error adding target to table
[   17.302551] device-mapper: table: device 9:0 too small for target
[   17.302663] device-mapper: table: 254:1: linear: dm-linear: Device 
lookup failed
[   17.302834] device-mapper: ioctl: error adding target to table
[   17.318900] device-mapper: table: device 9:0 too small for target
[   17.319013] device-mapper: table: 254:2: linear: dm-linear: Device 
lookup failed
[   17.319183] device-mapper: ioctl: error adding target to table
[   17.398993] device-mapper: table: device 9:0 too small for target
[   17.399105] device-mapper: table: 254:6: linear: dm-linear: Device 
lookup failed
[   17.399275] device-mapper: ioctl: error adding target to table
[   17.415888] device-mapper: table: device 9:0 too small for target
[   17.416002] device-mapper: table: 254:7: linear: dm-linear: Device 
lookup failed
[   17.416173] device-mapper: ioctl: error adding target to table
[   17.433973] device-mapper: table: device 9:0 too small for target
[   17.434087] device-mapper: table: 254:8: linear: dm-linear: Device 
lookup failed
[   17.434274] device-mapper: ioctl: error adding target to table
[   17.452380] device-mapper: table: device 9:0 too small for target
[   17.452493] device-mapper: table: 254:9: linear: dm-linear: Device 
lookup failed
[   17.452661] device-mapper: ioctl: error adding target to table
[   17.494371] device-mapper: table: device 9:0 too small for target
[   17.494483] device-mapper: table: 254:11: linear: dm-linear: Device 
lookup failed
[   17.494654] device-mapper: ioctl: error adding target to table
[   17.636554] XFS mounting filesystem sda5
[   17.729455] Ending clean XFS mount for filesystem: sda5
[   17.801694] XFS mounting filesystem sda6
[   17.914248] Ending clean XFS mount for filesystem: sda6
[   18.217426] Swap area shorter than signature indicates
[   20.170413] ADDRCONF(NETDEV_UP): eth_lan: link is not ready
[   20.173408] e1000: eth_lan NIC Link is Up 1000 Mbps Full Duplex, Flow 
Control: RX/TX
[   20.173844] ADDRCONF(NETDEV_CHANGE): eth_lan: link becomes ready
[   20.874886] ADDRCONF(NETDEV_UP): eth1: link is not ready
[   20.877447] e1000: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow 
Control: RX/TX
[   20.877915] ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   30.957635] eth_lan: no IPv6 routers present
[   31.449659] eth1: no IPv6 routers present
[   31.893034] svc: failed to register lockdv1 RPC service (errno 97).
[   31.893965] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state 
recovery directory
[   31.894164] NFSD: starting 90-second grace period
[   38.985895] warning: `proftpd' uses 32-bit capabilities (legacy 
support in use)
[   60.630094] device-mapper: table: 254:0: zero-length target
[   60.630203] device-mapper: ioctl: error adding target to table
[   60.644356] device-mapper: table: device 9:0 too small for target
[   60.644467] device-mapper: table: 254:1: linear: dm-linear: Device 
lookup failed
[   60.644627] device-mapper: ioctl: error adding target to table
[   60.658678] device-mapper: table: device 9:0 too small for target
[   60.658790] device-mapper: table: 254:2: linear: dm-linear: Device 
lookup failed
[   60.658945] device-mapper: ioctl: error adding target to table
[   60.673619] device-mapper: table: device 9:0 too small for target
[   60.673723] device-mapper: table: 254:6: linear: dm-linear: Device 
lookup failed
[   60.673878] device-mapper: ioctl: error adding target to table
[   60.687894] device-mapper: table: device 9:0 too small for target
[   60.687999] device-mapper: table: 254:7: linear: dm-linear: Device 
lookup failed
[   60.688155] device-mapper: ioctl: error adding target to table
[   60.702170] device-mapper: table: device 9:0 too small for target
[   60.702274] device-mapper: table: 254:8: linear: dm-linear: Device 
lookup failed
[   60.702430] device-mapper: ioctl: error adding target to table
[   60.716475] device-mapper: table: device 9:0 too small for target
[   60.716579] device-mapper: table: 254:9: linear: dm-linear: Device 
lookup failed
[   60.716735] device-mapper: ioctl: error adding target to table
[   60.730982] device-mapper: table: device 9:0 too small for target
[   60.731086] device-mapper: table: 254:11: linear: dm-linear: Device 
lookup failed
[   60.731242] device-mapper: ioctl: error adding target to table

I tried with dm and md as a module using initramfs now also without luck

and upgrading/downgrading udev,dmsetup,cryptsetup,lvm2 to
lenny,testing,unstable (all at once back and forth) to see if that helped

also i tried a kernel option i found on the net something like 
DM_IOCTL_V4=y
but the kernel config just deleted it.

cannot seem to get it to work, tried compiling the kernel a few times also.

root@limac:/home/michael# apt-get install lvm2 dmsetup mdadm -t testing
Reading package lists... Done
Building dependency tree      Reading state information... Done
dmsetup is already the newest version.
The following NEW packages will be installed:
 lvm2 mdadm
0 upgraded, 2 newly installed, 0 to remove and 401 not upgraded.
Need to get 274kB/637kB of archives.
After this operation, 1782kB of additional disk space will be used.
Get:1 http://ftp.de.debian.org testing/main mdadm 2.6.8-12-gb47dff6-2 
[274kB]
Fetched 274kB in 0s (490kB/s)
Preconfiguring packages ...
Selecting previously deselected package lvm2.
(Reading database ... 47849 files and directories currently installed.)
Unpacking lvm2 (from .../lvm2_2.02.44-3_i386.deb) ...
Selecting previously deselected package mdadm.
Unpacking mdadm (from .../mdadm_2.6.8-12-gb47dff6-2_i386.deb) ...
Processing triggers for man-db ...
Setting up lvm2 (2.02.44-3) ...
Setting up LVM Volume Groups  Reading all physical volumes.  This may 
take a while...
 Found volume group "st1500" using metadata type lvm2
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 device-mapper: reload ioctl failed: Invalid argument
 12 logical volume(s) in volume group "st1500" now active
.
Setting up mdadm (2.6.8-12-gb47dff6-2) ...
Installing new version of config file /etc/init.d/mdadm ...
Generating array device nodes... done.
Starting MD monitoring service: mdadm --monitor.
Generating udev events for MD arrays...done.

root@limac:/dev/mapper# pvs
  PV         VG     Fmt  Attr PSize  PFree 
  /dev/md0   st1500 lvm2 a-   10,92T 219,87G

root@limac:/dev/mapper# lvs
  LV        VG     Attr   LSize   Origin Snap%  Move Log Copy%  Convert
  backenc   st1500 -wi-d- 300,00G
  bigdaddy  st1500 -wi-d-   9,50T
  cpq-home  st1500 -wi-a- 250,00G
  mfs-slash st1500 -wi-d- 252,00M
  mfs-swap  st1500 -wi-d-   6,00G
  mfs-tmp   st1500 -wi-d-  50,00G
  mfs-usr   st1500 -wi-d-   6,00G
  mfs-var   st1500 -wi-d-   8,00G
  pictures  st1500 -wi-d- 100,00G
  private   st1500 -wi-a- 200,00G
  scan      st1500 -wi-a- 250,00G
  wwwroot   st1500 -wi-a-  60,00G

root@limac:/home/michael# ls /dev/mapper/ -l
total 0
crw-rw---- 1 root root  10, 60 2009-07-02 00:05 control
brw-rw---- 1 root disk 254,  2 2009-07-02 00:05 st1500-backenc
brw-rw---- 1 root disk 254,  0 2009-07-02 00:05 st1500-bigdaddy
brw-rw---- 1 root disk 254,  5 2009-07-02 00:05 st1500-cpq--home
brw-rw---- 1 root disk 254,  6 2009-07-02 00:05 st1500-mfs--slash
brw-rw---- 1 root disk 254, 11 2009-07-02 00:05 st1500-mfs--swap
brw-rw---- 1 root disk 254,  9 2009-07-02 00:05 st1500-mfs--tmp
brw-rw---- 1 root disk 254,  7 2009-07-02 00:05 st1500-mfs--usr
brw-rw---- 1 root disk 254,  8 2009-07-02 00:05 st1500-mfs--var
brw-rw---- 1 root disk 254,  1 2009-07-02 00:05 st1500-pictures
brw-rw---- 1 root disk 254,  3 2009-07-02 00:05 st1500-private
brw-rw---- 1 root disk 254,  4 2009-07-02 00:05 st1500-scan
brw-rw---- 1 root disk 254, 10 2009-07-02 00:05 st1500-wwwroot

root@limac:/dev/mapper# mount st1500-bigdaddy /mnt
mount: you must specify the filesystem type

why this? I have xfs on it, but if i try hexdumping some
start bytes of the device node i just get 0's where i
usually would see XFSB?

root@limac:/dev/mapper# cat /proc/mdstat
Personalities : [raid0] [raid1] [raid10] [raid6] [raid5] [raid4] [linear]
md0 : active raid6 sdj[0] sdd[9] sdb[8] sdk[7] sdc[6] sdf[5] sdh[4] 
sde[3] sdi[2] sdg[1]
     983689728 blocks level 6, 64k chunk, algorithm 18 [10/10] [UUUUUUUUUU]
    unused devices: <none>

root@limac:/dev/mapper# vgdisplay
 --- Volume group ---
 VG Name               st1500
 System ID             Format                lvm2
 Metadata Areas        1
 Metadata Sequence No  24
 VG Access             read/write
 VG Status             resizable
 MAX LV                0
 Cur LV                12
 Open LV               0
 Max PV                0
 Cur PV                1
 Act PV                1
 VG Size               10,92 TB
 PE Size               4,00 MB
 Total PE              2861598
 Alloc PE / Size       2805311 / 10,70 TB
 Free  PE / Size       56287 / 219,87 GB
 VG UUID               1Rl7ly-OguV-fEbS-TU8F-7tdM-9YH3-wKc9F6
 
root@limac:/dev/mapper# pvdisplay
 --- Physical volume ---
 PV Name               /dev/md0
 VG Name               st1500
 PV Size               10,92 TB / not usable 2,31 MB
 Allocatable           yes
 PE Size (KByte)       4096
 Total PE              2861598
 Free PE               56287
 Allocated PE          2805311
 PV UUID               r9J410-6WGm-qGNY-1JOu-zxqp-l9Hr-lbrA8K
 

root@limac:/dev/mapper# pvdisplay /dev/mapper/st1500-bigdaddy
 Failed to read physical volume "/dev/mapper/st1500-bigdaddy"

this doesn't look too good?


root@limac:/dev/mapper# mdadm --detail /dev/md0
/dev/md0:
        Version : 0.90
  Creation Time : Tue Jun  9 21:56:04 2009
     Raid Level : raid6
     Array Size : 983689728 (938.12 GiB 1007.30 GB)
  Used Dev Size : 1465138496 (1397.26 GiB 1500.30 GB)
   Raid Devices : 10
  Total Devices : 10
Preferred Minor : 0
    Persistence : Superblock is persistent

    Update Time : Thu Jul  2 00:08:25 2009
          State : clean
 Active Devices : 10
Working Devices : 10
 Failed Devices : 0
  Spare Devices : 0

     Chunk Size : 64K

           UUID : 5f206395:a6c11495:f31396ec:f4a5cc75
         Events : 0.979856

    Number   Major   Minor   RaidDevice State
       0       8      144        0      active sync   /dev/sdj
       1       8       96        1      active sync   /dev/sdg
       2       8      128        2      active sync   /dev/sdi
       3       8       64        3      active sync   /dev/sde
       4       8      112        4      active sync   /dev/sdh
       5       8       80        5      active sync   /dev/sdf
       6       8       32        6      active sync   /dev/sdc
       7       8      160        7      active sync   /dev/sdk
       8       8       16        8      active sync   /dev/sdb
       9       8       48        9      active sync   /dev/sdd
