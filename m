Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0C4SBw8002046
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2014 23:28:11 -0500
Received: from nm32-vm6.bullet.mail.bf1.yahoo.com
	(nm32-vm6.bullet.mail.bf1.yahoo.com [72.30.239.142])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0C4S9DM019148
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2014 23:28:09 -0500
Message-ID: <1389500888.48728.YahooMailNeo@web161702.mail.bf1.yahoo.com>
Date: Sat, 11 Jan 2014 20:28:08 -0800 (PST)
From: Tom+Dale <tdmyth@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Logical Volume Inaccessible
Reply-To: Tom+Dale <tdmyth@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>



I am hoping that someone can assist me with a problem that I have on a 
single 500GB drive that was partitioned by "Mythdora" a (now defunct) 
distribution of Fedora + MythTV.� I had this system in use for several 
years and recently the motherboard died.� When I put the hard disk into a different machine it would not boot up (no surprise); however, I also 
was unable to access the partitions from a Knoppix Live CD (I tried both 5.1 and 7.0).� When I tried with Knoppix to mount the partitions I 
discovered that something is wrong with the partition tables or logical 
volumes.� Here are some examples of the commands that I tried along with the results.� Will you please give me some advice about the best way to recover data from sda2 (the recordings)?� Thank you in advance!
-Tom

---------------------------------------------
root@Microknoppix:/# fdisk -l

Disk /dev/sda: 500.1 GB, 500107862016 bytes
255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk identifier: 0x000537fa

�� Device Boot����� Start�������� End����� Blocks�� Id� System
/dev/sda1�� *��������� 63����� 409662����� 204800�� 83� Linux
Partition 1 does not start on physical sector boundary.
/dev/sda2��������� 409663�� 976768064��
 488179201�� 8e� Linux LVM
Partition 2 does not start on physical sector boundary.
root@Microknoppix:/# parted -l
Model: ATA WDC WD5000AADS-1 (scsi)
Disk /dev/sda: 500GB
Sector size (logical/physical): 512B/4096B
Partition Table: msdos

Number� Start�� End��� Size�� Type���� File system� Flags
�1����� 32.3kB� 210MB� 210MB� primary� ext4�������� boot
�2����� 210MB�� 500GB� 500GB� primary�������������� lvm


Warning: Unable to open /dev/fd0 read-write (Read-only file system).� /dev/fd0
has been opened read-only.
Error: /dev/fd0: unrecognised disk
 label�������������������������������� 

Warning: Unable to open /dev/sr0 read-write (Read-only file system).� /dev/sr0
has been opened read-only.
Error: /dev/sr0: unrecognised disk label�������������������������������� 

Error: /dev/zram0: unrecognised disk label������������������������������ 

Warning: Unable to open /dev/cloop0 read-write (Read-only file system).� 
/dev/cloop0 has been opened read-only.
Error: /dev/cloop0: unrecognised disk
 label����������������������������� 

root@Microknoppix:/# gdisk -l /dev/sda
GPT fdisk (gdisk) version 0.8.5

Partition table scan:
� MBR: MBR only
� BSD: not present
� APM: not present
� GPT: not present


***************************************************************
Found invalid GPT and valid MBR; converting MBR to GPT format.
***************************************************************

Disk /dev/sda: 976773168 sectors, 465.8 GiB
Logical sector size: 512 bytes
Disk identifier (GUID): E9B4E83E-86F3-4843-801E-495E6864F682
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 976773134
Partitions will be aligned on 8-sector boundaries
Total free space is 5099 sectors (2.5
 MiB)

Number� Start (sector)��� End (sector)� Size������ Code� Name
�� 1������������� 63��������� 409662�� 200.0 MiB�� 8300� Linux filesystem
�� 2��������� 409663������ 976768064�� 465.6 GiB�� 8E00� Linux LVM
root@Microknoppix:/# vgchange -ay
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� No volume groups found
root@Microknoppix:/# lvscan
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read
 failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� No volume groups found
root@Microknoppix:/# lvm lvdisplay
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� No volume groups found
root@Microknoppix:/# vgscan --mknodes
� Reading all physical volumes.� This may take a while...
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� No volume groups found
� No volume groups found
root@Microknoppix:/# 
