Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2PNhBO28001
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 18:43:11 -0500
Received: from smtp811.mail.sc5.yahoo.com (smtp811.mail.sc5.yahoo.com
	[66.163.170.81])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j2PNh5Hw006370
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 18:43:05 -0500
Message-ID: <4244A203.2050304@eorbit.net>
Date: Fri, 25 Mar 2005 15:42:59 -0800
From: Kevin Murphy <kevin@eorbit.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Issues with md RAID-1, LVM, and snapshots
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

I'm having trouble with snapshot volumes when combining software RAID-1
with LVM2 striping.

I have a server with four 18GB drives. I would like to combine them into
two RAID-1 mirrors and then stripe across them with LVM, with the  goal
of data redundancy and the ability to make hot backups via snapshots.

System:
Suse Linux Enterprise Server 9 for x86_64
kernel 2.6.5-7.147-smp
lvm2-2.00.15-0.8

When I set up the drives in one big volume group (no RAID), snapshots
work correctly:

pvcreate /dev/sdc1
pvcreate /dev/sdd1
pvcreate /dev/sdf1
pvcreate /dev/sde1
vgcreate -M2 vg1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1
lvcreate -i4 -I64 -L32G -n lv1 vg1
mkfs.ext2 /dev/vg1/lv1
mount /dev/vg1/lv1 /mnt/bigdisk
{put some data in /mnt/bigdisk}
lvcreate -L1G -s -n snap1 /dev/vg1/lv1
mount /dev/vg1/snap1 /mnt/backup
find /mnt/backup | cpio -ovHnewc > /tmp/backup.cpio

This works fine. However, if I set up two RAID-1 volumes and stripe
across them with LVM, I get errors when reading from a snapshot:

mdadm --create -l1 -n2 /dev/sdc1 /dev/sdd1 /dev/md2
mdadm --create -l1 -n2 /dev/sde1 /dev/sdf1 /dev/md3
pvcreate /dev/md2
pvcreate /dev/md3
vgcreate -M2 vg1 /dev/md2 /dev/md3
lvcreate -i2 -I64 -L32G -n lv1 vg1
mkfs.ext2 /dev/vg1/lv1
mount /dev/vg1/lv1 /mnt/bigdisk
{put some data in /mnt/bigdisk}
lvcreate -L1G -s -n snap1 /dev/vg1/lv1
mount /dev/vg1/snap1 /mnt/backup

I get this error:
cpio: Read error at byte 2129920 in file /mnt/backup/file1, padding with
zeros

dmesg says:
attempt to access beyond end of device
dm-3: rw=0, want=17060337672, limit=67108864
attempt to access beyond end of device
dm-3: rw=0, want=134226096, limit=67108864
attempt to access beyond end of device
dm-3: rw=0, want=3499657224, limit=67108864
attempt to access beyond end of device
dm-3: rw=0, want=3094910976, limit=67108864
attempt to access beyond end of device
dm-3: rw=0, want=8894171864, limit=67108864
attempt to access beyond end of device
dm-3: rw=0, want=17060337672, limit=67108864

When I extract the archive, file1 is corrupted.

Is there any special magic that needs to be done with LVM+MD, or have I
hit a bug?

--
Kevin Murphy
