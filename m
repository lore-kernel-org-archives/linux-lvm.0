Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o87HZDWs026742
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 13:35:13 -0400
Received: from smtp102.sbc.mail.re3.yahoo.com (smtp102.sbc.mail.re3.yahoo.com
	[66.196.96.85])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o87HZ1Po024296
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 13:35:01 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with ESMTP id AD43F4B0023C
	for <linux-lvm@redhat.com>; Tue,  7 Sep 2010 10:34:58 -0700 (PDT)
Received: from pebblebeach.thenewhams.com ([127.0.0.1])
	by localhost (pebblebeach.thenewhams.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id bEOPuNLRgaMR for <linux-lvm@redhat.com>;
	Tue,  7 Sep 2010 10:34:55 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with ESMTP id A7B0A4B0023D
	for <linux-lvm@redhat.com>; Tue,  7 Sep 2010 10:34:55 -0700 (PDT)
Received: from [129.46.70.138] (129-46-70-138.qualcomm.com [129.46.70.138])
	by pebblebeach.thenewhams.com (Postfix) with ESMTPSA id 57FC24B0023C
	for <linux-lvm@redhat.com>; Tue,  7 Sep 2010 10:34:55 -0700 (PDT)
Message-ID: <4C8677BF.40500@thenewhams.com>
Date: Tue, 07 Sep 2010 10:34:55 -0700
From: Adam Newham <adam@thenewhams.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Unable to mount LVM partition - table too small
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

  I didn�t see this getting posted, so re-posting. Sorry if you get this 
twice.

Hi, hopefully somebody on this mailing list will be able to assist. I�ve 
done lots of Googling and tried a few things but with no success.

I recently had multiple hardware failures and had to re-install the OS. 
My server is setup with an OS drive and a data drive. The OS drive is a 
single HDD which had a RHEL5 based distro on it (ClearOS) while the data 
drive consists of a software raid level 5 partition across 4x 1TB drives 
(2.7B available after ext3 format, with 1TB used). On top of this is an 
LVM2 partition with a single PV/LV/LG spanning the whole RAID partition.

The hardware failures that I had were memory & motherboard with the 
first RMA motherboard powering off sporadically (see note below) .

However after completing the OS re-install, I�m unable to access the LVM 
partition. I�ve originally tried Ubuntu 10.04, which once mdadm/lvm2 
were installed - the distro saw the RAID and LVM container but I�m 
unable to mount the symbolic link (/dev/lvm-raid5/lv0) or the dev mapper 
link (/dev/mapper/lvm-raid5-lvm0). (See logs below) - one thing to note, 
as soon as the distro was installed and the RAID was assembled, a 
re-sync occurred. This wasn�t entirely unexpected as the first RMA�d 
motherboard was defective and would power off during the boot sequence 
and forced a check of the disc during boot which only got a few % into 
the sequence before a kernel panic was observed (/etc/stab was modified 
by booting into rescue mode and disabling this once I realized it was 
happening).

Thinking maybe it was something with the Ubuntu distro, I tried 
installing CentOS 5.5 (and the original ClearOS distro) but both these 
distro�s give the same results. I can auto-create the /etc/mdadm.conf 
file by mdadm �detail �scan or mdadm �examine �scan but they can�t see 
any Physical/Logical volumes. One interesting point to note here is the 
/proc/partitions does not contain /dev/sda1�/dev/sdd1 etc. just the raw 
drives. Fdisk �l however shows all of the partitions information. I 
believe there is an issue with some Redhat based distro�s with how /dev 
is populated � specically it was introduced in FC10/11. I tried FC9 but 
got similar results as the RHEL5 based distro�s.

I�d really like to get this data back, I have some backups (the discs 
contained Video, Music & Photo�s) in the form of original CD & DVD�s but 
for the Photo�s due to some other hardware failures, I have a gap from 
March 2008 until around April 2010.

So here are the logs from what I can determine:

Ubuntu 10.04

/proc/partitions

major minor #blocks name

8 0 976762584 sda
8 1 976760001 sda1
8 16 976762584 sdb
8 17 976760001 sdb1
8 32 976762584 sdc
8 33 976760001 sdc1
8 48 976762584 sdd
8 49 976760001 sdd1
8 64 58605120 sde
8 65 56165376 sde1
8 66 1 sde2
8 69 2437120 sde5
9 0 2930287488 md0
259 0 976760001 md0p1

/proc/mdstat

Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5] 
[raid4] [raid10]
md0 : active raid5 sdc[2] sdb[1] sda[0] sdd[3]
2930287488 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]

unused devices: <none>

fdisk �l

Disk /dev/sda: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Device Boot Start End Blocks Id System
/dev/sda1 1 121601 976760001 fd Linux raid autodetect

Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Device Boot Start End Blocks Id System
/dev/sdb1 1 121601 976760001 fd Linux raid autodetect

Disk /dev/sdc: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Device Boot Start End Blocks Id System
/dev/sdc1 1 121601 976760001 fd Linux raid autodetect

Disk /dev/sdd: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Device Boot Start End Blocks Id System
/dev/sdd1 1 121601 976760001 fd Linux raid autodetect

Disk /dev/sde: 60.0 GB, 60011642880 bytes
255 heads, 63 sectors/track, 7296 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0005cd42

Device Boot Start End Blocks Id System
/dev/sde1 * 1 6993 56165376 83 Linux
/dev/sde2 6993 7296 2437121 5 Extended
/dev/sde5 6993 7296 2437120 82 Linux swap / Solaris

Disk /dev/md0: 3000.6 GB, 3000614387712 bytes
255 heads, 63 sectors/track, 364803 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 65536 bytes / 196608 bytes
Disk identifier: 0x00000000

Device Boot Start End Blocks Id System
/dev/md0p1 1 121601 976760001 fd Linux raid autodetect
Partition 1 does not start on physical sector boundary.

pvscan
PV /dev/md0p1 VG lvm-raid5 lvm2 [2.73 TiB / 0 free]
Total: 1 [746.53 GiB] / in use: 1 [746.53 GiB] / in no VG: 0 [0 ]

lvscan
Reading all physical volumes. This may take a while...
Found volume group "lvm-raid5" using metadata type lvm2

vgscan
Reading all physical volumes. This may take a while...
Found volume group "lvm-raid5" using metadata type lvm2

vgdisplay
--- Volume group ---
VG Name lvm-raid5
System ID
Format lvm2
Metadata Areas 1
Metadata Sequence No 2
VG Access read/write
VG Status resizable
MAX LV 0
Cur LV 1
Open LV 0
Max PV 0
Cur PV 1
Act PV 1
VG Size 2.73 TiB
PE Size 32.00 MiB
Total PE 89425
Alloc PE / Size 89425 / 2.73 TiB
Free PE / Size 0 / 0
VG UUID wovrCm-knof-Ycdl-LdXt-4t28-mPWq-kngufG

lvmdiskscan
/dev/ram0 [ 64.00 MiB]
/dev/md0p1 [ 931.51 GiB] LVM physical volume
/dev/ram1 [ 64.00 MiB]
/dev/ram2 [ 64.00 MiB]
/dev/ram3 [ 64.00 MiB]
/dev/ram4 [ 64.00 MiB]
/dev/ram5 [ 64.00 MiB]
/dev/ram6 [ 64.00 MiB]
/dev/ram7 [ 64.00 MiB]
/dev/ram8 [ 64.00 MiB]
/dev/ram9 [ 64.00 MiB]
/dev/ram10 [ 64.00 MiB]
/dev/ram11 [ 64.00 MiB]
/dev/ram12 [ 64.00 MiB]
/dev/ram13 [ 64.00 MiB]
/dev/ram14 [ 64.00 MiB]
/dev/ram15 [ 64.00 MiB]
/dev/root [ 53.56 GiB]
/dev/sde5 [ 2.32 GiB]
1 disk
17 partitions
0 LVM physical volume whole disks
1 LVM physical volume

tail /var/log/messages (after mdadm �assemble /dev/md0 and mount 
/dev/lvm-raid5/lvm0 /mnt/lvm-raid5

Sep 3 18:46:13 adam-desktop kernel: [ 479.014444] md: bind<sdb>
Sep 3 18:46:13 adam-desktop kernel: [ 479.015421] md: bind<sdc>
Sep 3 18:46:13 adam-desktop kernel: [ 479.015753] md: bind<sdd>
Sep 3 18:46:13 adam-desktop kernel: [ 479.016272] md: bind<sda>
Sep 3 18:46:13 adam-desktop kernel: [ 479.022937] raid5: device sda 
operational as raid disk 0
Sep 3 18:46:13 adam-desktop kernel: [ 479.022944] raid5: device sdd 
operational as raid disk 3
Sep 3 18:46:13 adam-desktop kernel: [ 479.022950] raid5: device sdc 
operational as raid disk 2
Sep 3 18:46:13 adam-desktop kernel: [ 479.022955] raid5: device sdb 
operational as raid disk 1
Sep 3 18:46:13 adam-desktop kernel: [ 479.023690] raid5: allocated 
4222kB for md0
Sep 3 18:46:13 adam-desktop kernel: [ 479.024690] 0: w=1 pa=0 pr=4 m=1 
a=2 r=4 op1=0 op2=0
Sep 3 18:46:13 adam-desktop kernel: [ 479.024697] 3: w=2 pa=0 pr=4 m=1 
a=2 r=4 op1=0 op2=0
Sep 3 18:46:13 adam-desktop kernel: [ 479.024703] 2: w=3 pa=0 pr=4 m=1 
a=2 r=4 op1=0 op2=0
Sep 3 18:46:13 adam-desktop kernel: [ 479.024709] 1: w=4 pa=0 pr=4 m=1 
a=2 r=4 op1=0 op2=0
Sep 3 18:46:13 adam-desktop kernel: [ 479.024715] raid5: raid level 5 
set md0 active with 4 out of 4 devices, algorithm 2
Sep 3 18:46:13 adam-desktop kernel: [ 479.024719] RAID5 conf printout:
Sep 3 18:46:13 adam-desktop kernel: [ 479.024722] --- rd:4 wd:4
Sep 3 18:46:13 adam-desktop kernel: [ 479.024726] disk 0, o:1, dev:sda
Sep 3 18:46:13 adam-desktop kernel: [ 479.024730] disk 1, o:1, dev:sdb
Sep 3 18:46:13 adam-desktop kernel: [ 479.024734] disk 2, o:1, dev:sdc
Sep 3 18:46:13 adam-desktop kernel: [ 479.024737] disk 3, o:1, dev:sdd
Sep 3 18:46:13 adam-desktop kernel: [ 479.024823] md0: detected capacity 
change from 0 to 3000614387712
Sep 3 18:46:13 adam-desktop kernel: [ 479.028687] md0: p1
Sep 3 18:46:13 adam-desktop kernel: [ 479.207359] device-mapper: table: 
252:0: md0p1 too small for target: start=384, len=5860556800, 
dev_size=1953520002

mdadm �detail /dev/md0

/dev/md0:
Version : 00.90
Creation Time : Sat Nov 1 22:14:18 2008
Raid Level : raid5
Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
Raid Devices : 4
Total Devices : 4
Preferred Minor : 0
Persistence : Superblock is persistent

Update Time : Fri Sep 3 18:39:58 2010
State : clean
Active Devices : 4
Working Devices : 4
Failed Devices : 0
Spare Devices : 0

Layout : left-symmetric
Chunk Size : 64K

UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
Events : 0.68

Number Major Minor RaidDevice State
0 8 0 0 active sync /dev/sda
1 8 16 1 active sync /dev/sdb
2 8 32 2 active sync /dev/sdc
3 8 48 3 active sync /dev/sdd

mdadm �detail /dev/sda1
ARRAY /dev/md0 level=raid5 num-devices=4 
UUID=08558923:881d9efd:464c249d:988d2ec6

Note: performing this for /dev/sdb1�/dev/sdd1 produce no output. As the 
UUID for /dev/md0 is above, I remove this line from the mdadm.conf file.

As I don�t have the original /etc/lvm info, here is what I managed to 
recover by doing a dd from the discs/cut pasted into a lvm template.

/etc/lvm/backup/lvm_raid5_00000.vg
# Generated by LVM2 version 2.02.37-RHEL4 (2008-06-06): Tue Nov 18 
13:45:06 2008

contents = "Text Format Volume Group"
version = 1

description = ""

creation_host = "pebblebeach.thenewhams.lan" # Linux 
pebblebeach.thenewhams.lan 2.6.27 #4 SMP Mon Nov 17 11:05:05 PST 2008 i686
creation_time = 1227044706 # Tue Nov 18 13:45:06 2008

lvm-raid5 {
id = "wovrCm-knof-Ycdl-LdXt-4t28-mPWq-kngufG"
seqno = 2
status = ["RESIZEABLE", "READ", "WRITE"]
max_lv = 0
max_pv = 0

physical_volumes {

pv0 {
id = "aBkcEY-nZho-iWe5-700D-kDSy-pTAK-sJJFYm"
device = "/dev/md0p1" # Hint only

status = ["ALLOCATABLE"]
pe_start = 384
pe_count = 89425
}
}

logical_volumes {

lvm0 {
id = "lzHyck-6X6E-48pC-uW1N-OQmp-Ayjt-vbAvVR"
status = ["READ", "WRITE", "VISIBLE"]
segment_count = 1

segment1 {
start_extent = 0
extent_count = 89425

type = "striped"
stripe_count = 1 # linear

stripes = [
"pv0", 0
]
}
}
}
}


Some info from when in Centos/EL5 land�

/proc/partitions (note the missing sub partitions � this I why I belive 
the lv/pv scan�s don�t see any LVM info)
major minor #blocks name

3 0 156290904 hda
3 1 200781 hda1
3 2 4192965 hda2
3 3 151894575 hda3
8 0 976762584 sda
8 16 976762584 sdb
8 32 976762584 sdc
8 48 976762584 sdd
9 0 2930287488 md0

/proc/mdstat
Personalities : [raid6] [raid5] [raid4]
md0 : active raid5 sda[0] sdd[3] sdc[2] sdb[1]
2930287488 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]

unused devices: <none>
