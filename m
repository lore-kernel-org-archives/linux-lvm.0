Message-ID: <3C1576F1.724E8A5E@berbee.com>
From: Scott P <pichelma@berbee.com>
MIME-Version: 1.0
References: <3C11416F.3E60CB9@berbee.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Mistake(s) on install of EXP300...
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Dec 10 21:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: pichelma@berbee.com, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>, "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Heinz,

I apologize for e-mailing you directly!
But, noone has replied to my cries for help.
I am have a situation that I need help w/ asap...
I am working on a production machine now...

I screwed up(at 2:30 in the morning last week) and ran fdisk and
partitioned an array.
So, I left the machine and remounted the fs(using reiser_fs) w/ it.

Hence, messing up LVM really badly.

My notes are below. If they are not thorough enough, I will send more info.

Should I upgrade to 1.0.1 rc4?
Do I dare?

I tryed vgcfgrestore and I get the following:

[root@ptb3 lvmconf]# vgcfgrestore -v -f /etc/lvmconf/exp300_2.conf.2.old -n
exp300_2 /dev/sdc1
vgcfgrestore -- can't restore part of active volume group "exp300_2"
vgcfgrestore [-d|--debug] [-f|--file VGConfPath] [-l[l]|--list [--list]]
        [-n|--name VolumeGroupName] [-h|--help]
        [-o|--oldpath OldPhysicalVolumePath] [-t|--test] [-v|--verbose]
        [--version] [PhysicalVolumePath]

[root@ptb3 lvmconf]# man vgcfgrestore

[root@ptb3 lvmconf]# vgcfgrestore -f /etc/lvmconf/exp300_2.conf.2.old -n
exp300_2 -o /dev/sdc1 /dev/sdd1
vgcfgrestore -- can't restore part of active volume group "exp300_2"
vgcfgrestore [-d|--debug] [-f|--file VGConfPath] [-l[l]|--list [--list]]
        [-n|--name VolumeGroupName] [-h|--help]
        [-o|--oldpath OldPhysicalVolumePath] [-t|--test] [-v|--verbose]
        [--version] [PhysicalVolumePath]

[root@ptb3 lvmconf]# vgcfgrestore -v -f /etc/lvmconf/exp300_2.conf.2.old -n
exp300_2 /dev/sdb /dev/sdc1 /dev/sdd1
vgcfgrestore -- please enter a physical volume name
vgcfgrestore [-d|--debug] [-f|--file VGConfPath] [-l[l]|--list [--list]]
        [-n|--name VolumeGroupName] [-h|--help]
        [-o|--oldpath OldPhysicalVolumePath] [-t|--test] [-v|--verbose]
        [--version] [PhysicalVolumePath]

I also tryed copying:

[root@ptb3 lvmconf]# ls -lt
total 10576
-rw-r-----    1 root     root       765244 Dec  7 01:54 exp300_2.conf
-rw-r-----    1 root     root       765020 Dec  7 01:53 exp300_2.conf.1.old

-rw-r-----    1 root     root       711996 Jul 24 20:40 exp300_2.conf.2.old

[root@ptb3 lvmconf]# cp exp300_2.conf exp300_2.conf.bak

[root@ptb3 lvmconf]# cp exp300_2.conf.2.old exp300_2.conf

But, I have NOT rebooted this machine yet for fear that I will not be able
to access the disks upon boot!





Scott P wrote:

> Hi list,
>
> This is what I've done so far ( I apologize for the large amount of
> lines/info!):
>
> [root@ptb3 /root]# pvcreate -v /dev/sdb
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/sdb"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/sdb with 860231680
> sectors
> pvcreate -- writing physical volume data to disk "/dev/sdb"
> pvcreate -- physical volume "/dev/sdb" successfully created
> pvcreate -- unlocking logical volume manager
>
> [root@ptb3 /root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdb"  is in no VG  [410.19 GB]
> pvscan -- ACTIVE   PV "/dev/sdc1" of VG "exp300_2" [440.69 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdd1" of VG "exp300_2" [440.69 GB / 0 free]
> pvscan -- total: 3 [1.26 TB] / in use: 2 [881.43 GB] / in no VG: 1
> [410.19 GB]
>
> [root@ptb3 /root]# dmesg | less
> [root@ptb3 /root]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "exp300_2"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
>
> [root@ptb3 /root]# lvscan
> lvscan -- ACTIVE            "/dev/exp300_2/exp300_lv2" [881.38 GB]
> lvscan -- 1 logical volumes with 881.38 GB total in 1 volume group
> lvscan -- 1 active logical volumes
>
> [root@ptb3 /root]# vgextend -A y exp300_2 /dev/sdb
> vgextend -- INFO: maximum logical volume size is 1 Terabyte
> vgextend -- doing automatic backup of volume group "exp300_2"
> vgextend -- volume group "exp300_2" successfully extended
>
> [root@ptb3 /root]# lvextend -L +440.7 /dev/exp300_2/exp300_lv2 /dev/sdb
> lvextend -- rounding size to physical extent boundary
> lvextend -- extending logical volume "/dev/exp300_2/exp300_lv2" to
> 881.81 GB
> lvextend -- doing automatic backup of volume group "exp300_2"
> lvextend -- logical volume "/dev/exp300_2/exp300_lv2" successfully
> extended
>
> Then,  not thinking at all,  I went back and ran fdisk, since I forgot
> to run fdisk, it was 2:00 a.m. in the morning!!!
>
> root@ptb3 rc3.d]# fdisk /dev/sdb
>
> The number of cylinders for this disk is set to 53757.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)
>
> Command (m for help): p
>
> Disk /dev/sdb: 254 heads, 63 sectors, 53757 cylinders
> Units = cylinders of 16002 * 512 bytes
>
>    Device Boot    Start       End    Blocks   Id  System
>
> Command (m for help): m
> Command action
>    a   toggle a bootable flag
>    b   edit bsd disklabel
>    c   toggle the dos compatibility flag
>    d   delete a partition
>    l   list known partition types
>    m   print this menu
>    n   add a new partition
>    o   create a new empty DOS partition table
>    p   print the partition table
>    q   quit without saving changes
>    s   create a new empty Sun disklabel
>    t   change a partition's system id
>    u   change display/entry units
>    v   verify the partition table
>    w   write table to disk and exit
>    x   extra functionality (experts only)
>
> Command (m for help): n
> Command action
>    e   extended
>    p   primary partition (1-4)
> p
> Partition number (1-4): 1
> First cylinder (1-53757, default 1):
> Using default value 1
> Last cylinder or +size or +sizeM or +sizeK (1-53757, default 53757):
> Using default value 53757
>
> Command (m for help): p
>
> Disk /dev/sdb: 254 heads, 63 sectors, 53757 cylinders
> Units = cylinders of 16002 * 512 bytes
>
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sdb1             1     53757 430109725+  83  Linux
>
> Command (m for help): l
>
>  0  Empty           17  Hidden HPFS/NTF 5c  Priam Edisk     a6  OpenBSD
>  1  FAT12           18  AST Windows swa 61  SpeedStor       a7  NeXTSTEP
>
>  2  XENIX root      1b  Hidden Win95 FA 63  GNU HURD or Sys b7  BSDI fs
>  3  XENIX usr       1c  Hidden Win95 FA 64  Novell Netware  b8  BSDI
> swap
>  4  FAT16 <32M      1e  Hidden Win95 FA 65  Novell Netware  c1
> DRDOS/sec (FAT-
>  5  Extended        24  NEC DOS         70  DiskSecure Mult c4
> DRDOS/sec (FAT-
>  6  FAT16           3c  PartitionMagic  75  PC/IX           c6
> DRDOS/sec (FAT-
>  7  HPFS/NTFS       40  Venix 80286     80  Old Minix       c7  Syrinx
>  8  AIX             41  PPC PReP Boot   81  Minix / old Lin db  CP/M /
> CTOS / .
>  9  AIX bootable    42  SFS             82  Linux swap      e1  DOS
> access
>  a  OS/2 Boot Manag 4d  QNX4.x          83  Linux           e3  DOS R/O
>  b  Win95 FAT32     4e  QNX4.x 2nd part 84  OS/2 hidden C:  e4
> SpeedStor
>  c  Win95 FAT32 (LB 4f  QNX4.x 3rd part 85  Linux extended  eb  BeOS fs
>  e  Win95 FAT16 (LB 50  OnTrack DM      86  NTFS volume set f1
> SpeedStor
>  f  Win95 Ext'd (LB 51  OnTrack DM6 Aux 87  NTFS volume set f4
> SpeedStor
> 10  OPUS            52  CP/M            93  Amoeba          f2  DOS
> secondary
> 11  Hidden FAT12    53  OnTrack DM6 Aux 94  Amoeba BBT      fd  Linux
> raid auto
> 12  Compaq diagnost 54  OnTrackDM6      a0  IBM Thinkpad hi fe  LANstep
> 14  Hidden FAT16 <3 55  EZ-Drive        a5  BSD/386         ff  BBT
> 16  Hidden FAT16    56  Golden Bow
>
> Command (m for help): m
> Command action
>    a   toggle a bootable flag
>    b   edit bsd disklabel
>    c   toggle the dos compatibility flag
>    d   delete a partition
>    l   list known partition types
>    m   print this menu
>    n   add a new partition
>    o   create a new empty DOS partition table
>    p   print the partition table
>    q   quit without saving changes
>    s   create a new empty Sun disklabel
>    t   change a partition's system id
>    u   change display/entry units
>    v   verify the partition table
>    w   write table to disk and exit
>    x   extra functionality (experts only)
>
> Command (m for help): t
> Partition number (1-4): 1
> Hex code (type L to list codes): l
>
>  0  Empty           17  Hidden HPFS/NTF 5c  Priam Edisk     a6  OpenBSD
>  1  FAT12           18  AST Windows swa 61  SpeedStor       a7  NeXTSTEP
>
>  2  XENIX root      1b  Hidden Win95 FA 63  GNU HURD or Sys b7  BSDI fs
>  3  XENIX usr       1c  Hidden Win95 FA 64  Novell Netware  b8  BSDI
> swap
>  4  FAT16 <32M      1e  Hidden Win95 FA 65  Novell Netware  c1
> DRDOS/sec (FAT-
>  5  Extended        24  NEC DOS         70  DiskSecure Mult c4
> DRDOS/sec (FAT-
>  6  FAT16           3c  PartitionMagic  75  PC/IX           c6
> DRDOS/sec (FAT-
>  7  HPFS/NTFS       40  Venix 80286     80  Old Minix       c7  Syrinx
>  8  AIX             41  PPC PReP Boot   81  Minix / old Lin db  CP/M /
> CTOS / .
>  9  AIX bootable    42  SFS             82  Linux swap      e1  DOS
> access
>  a  OS/2 Boot Manag 4d  QNX4.x          83  Linux           e3  DOS R/O
>  b  Win95 FAT32     4e  QNX4.x 2nd part 84  OS/2 hidden C:  e4
> SpeedStor
>  c  Win95 FAT32 (LB 4f  QNX4.x 3rd part 85  Linux extended  eb  BeOS fs
>  e  Win95 FAT16 (LB 50  OnTrack DM      86  NTFS volume set f1
> SpeedStor
>  f  Win95 Ext'd (LB 51  OnTrack DM6 Aux 87  NTFS volume set f4
> SpeedStor
> 10  OPUS            52  CP/M            93  Amoeba          f2  DOS
> secondary
> 11  Hidden FAT12    53  OnTrack DM6 Aux 94  Amoeba BBT      fd  Linux
> raid auto
> 12  Compaq diagnost 54  OnTrackDM6      a0  IBM Thinkpad hi fe  LANstep
> 14  Hidden FAT16 <3 55  EZ-Drive        a5  BSD/386         ff  BBT
> 16  Hidden FAT16    56  Golden Bow
> Hex code (type L to list codes): 8e
> Changed system type of partition 1 to 8e (Unknown)
>
> Command (m for help): p
>
> Disk /dev/sdb: 254 heads, 63 sectors, 53757 cylinders
> Units = cylinders of 16002 * 512 bytes
>
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sdb1             1     53757 430109725+  8e  Unknown
>
> Command (m for help): m
> Command action
>    a   toggle a bootable flag
>    b   edit bsd disklabel
>    c   toggle the dos compatibility flag
>    d   delete a partition
>    l   list known partition types
>    m   print this menu
>    n   add a new partition
>    o   create a new empty DOS partition table
>    p   print the partition table
>    q   quit without saving changes
>    s   create a new empty Sun disklabel
>    t   change a partition's system id
>    u   change display/entry units
>    v   verify the partition table
>    w   write table to disk and exit
>    x   extra functionality (experts only)
>
> Command (m for help): v
> 62 unallocated sectors
>
> Command (m for help): w
> The partition table has been altered!
>
> Calling ioctl() to re-read partition table.
>
> WARNING: If you have created or modified any DOS 6.x
> partitions, please see the fdisk manual page for additional
> information.
> Syncing disks.
>
> So,  now I have these errors when running most of the LVM cmds!!
>
> [root@ptb3 rc3.d]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "exp300_2"
> vgscan -- ERROR "pv_read_pe(): PV size invalid" can't get data of volume
> group "exp300_2" from physical volume(s)
> vgscan -- ERROR "pv_read_pe(): PV size invalid" creating "/etc/lvmtab"
> and "/etc/lvmtab.d"
>
> [root@ptb3 rc3.d]# vgdisplay
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
> run vgscan
>
> [root@ptb3 rc3.d]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb"   is associated to an unknown VG (run
> vgscan)
> pvscan -- ACTIVE   PV "/dev/sdc1"  is associated to an unknown VG (run
> vgscan)
> pvscan -- ACTIVE   PV "/dev/sdd1"  is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 3 [889.43 GB] / in use: 3 [889.43 GB] / in no VG: 0 [0]
>
> [root@ptb3 rc3.d]# lvscan
> lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
> run vgscan
>
> Hence, chaos ensues on this machine....
>
> Please let me know if "vgcfgrestore" will work for me.
> Or do I try to remove the partition from fdisk? I really don't think
> that will help though!
> I think the damage is done from the partition write to the EXP300 disk
> array.
>
> Also,  if I reboot, will there be a disaster?(fdisk...)
> This is a production machine.
>
> Please help me if you can...
>
> TIA!
>
> -Scott
