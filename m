Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7NFJGFZ003895
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 11:19:16 -0400
Received: from smtp-send.myrealbox.com (smtp-send.myrealbox.com
	[151.155.5.143])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7NFJEjU017469
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 11:19:15 -0400
Message-Id: <7.0.1.0.2.20060823231439.020a6c48@myrealbox.com>
Date: Wed, 23 Aug 2006 23:18:03 +0800
From: Jim Morgan <peripatetic@myrealbox.com>
In-Reply-To: <20060823142949.GA13859@agk.surrey.redhat.com>
References: <1156095294.3778.5.camel@dividebyzero.somewhere.localtld>
	<20060823142949.GA13859@agk.surrey.redhat.com>
Mime-Version: 1.0
Subject: [linux-lvm] Partitioning remotely
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

I've just inherited a server which sits about 2000 miles away in a 
data centre. If I make any changes to it, therefore, I have to be 
really sure that its not going to mess up.

So, with that in mind, the server was set up with two 160Gb hard 
disks in a Software RAID 1 configuration. Within the RAID config 
there is a boot partition, a swap partition and the rest of the disk 
is dedicated to / . (config details attached below). I want to resize 
the main partition to 50GB, and move /home onto one partition of 50Gb 
and then set up another partition for /var.

I've been reading around the internet to see if I can resize the 
partitions on the disk and/or in the LVM. There seems to be 
conflicting advice on the subject and I don't want to make a move 
before I'm absolutely sure. My choices seem to be

a) resize physical disk partition using parted, then resize RAID 
partition using lvreduce etc. (ref article in gentoo documentation )

b) The converse of this: resize RAID partition first, then resize physical disk
(ref parted manual, specifically:
"You usually resize the file system at the same times as you resize 
your virtual device. If you are growing the file system and virtual 
device, you should grow the device first (with the RAID or LVM 
tools), and then grow the file system. If you are shrinking the file 
system and virtual device, you should shrink the file system first, 
and then the virtual device afterwards.

To resize the file system in Parted, use the resize command. For example:

(parted) select /dev/md0"

c) Forget about the physical disk: just do everything in RAID LVM

d) You can't do anything. The partition you want to resize contains 
the OS, and you need to umount it first.

So, can anyone tell me the definitive way to do this? I guess I'm 
having a hard time working out the relationship between the LVM and 
the physical disk. If the server were in front of me, I'd just plough 
in there and try things out. However its not, and if I mess up, I mess up big.

Thanks. Dazed and confused.

Jim

=============================================================

Here are some config details:

[root@server ~]# cat /etc/fstab
==========================================================
# This file is edited by fstab-sync - see 'man fstab-sync' for details
/dev/md2 / ext3 defaults 1 1
/dev/md0 /boot ext3 defaults 1 2
none /dev/pts devpts gid=5,mode=620 0 0
none /dev/shm tmpfs defaults 0 0
none /proc proc defaults 0 0
none /sys sysfs defaults 0 0
/dev/md1 swap swap defaults 0 0

(parted) print
=====================================================
Disk geometry for /dev/sda: 0.000-152627.835 megabytes
Disk label type: msdos
Minor Start End Type Filesystem Flags
1 0.031 101.975 primary ext3 boot, raid
2 101.975 2149.321 primary linux-swap raid
3 2149.321 152625.344 primary ext3 raid
(parted) select /dev/sdb
Using /dev/sdb
(parted) print
Disk geometry for /dev/sdb: 0.000-152627.835 megabytes
Disk label type: msdos
Minor Start End Type Filesystem Flags
1 0.031 101.975 primary ext3 boot, raid
2 101.975 2149.321 primary linux-swap raid
3 2149.321 152625.344 primary ext3 raid

[root@server ~]# mdadm --misc --detail /dev/md0
===========================================================
/dev/md0:
Version : 00.90.01
Creation Time : Mon Aug 7 22:41:35 2006
Raid Level : raid1
Array Size : 104320 (101.88 MiB 106.82 MB)
Device Size : 104320 (101.88 MiB 106.82 MB)
Raid Devices : 2
Total Devices : 2
Preferred Minor : 0
Persistence : Superblock is persistent

Update Time : Tue Aug 8 03:00:22 2006
State : clean
Active Devices : 2
Working Devices : 2
Failed Devices : 0
Spare Devices : 0


Number Major Minor RaidDevice State
0 8 1 0 active sync /dev/sda1
1 8 17 1 active sync /dev/sdb1
UUID : 62655ecf:e3ceaaf4:
Events : 0.23

[root@server ~]# cat /proc/mdstat
=================================================================
Personalities : [raid1]
md1 : active raid1 sdb2[1] sda2[0]
2096384 blocks [2/2] [UU]

md2 : active raid1 sdb3[1] sda3[0]
154087360 blocks [2/2] [UU]

md0 : active raid1 sdb1[1] sda1[0]
104320 blocks [2/2] [UU]

unused devices: <none> 
