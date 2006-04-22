Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MEDFlE002484
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 10:13:15 -0400
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3MED3g1009523
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 10:13:09 -0400
Message-ID: <003f01c66616$de010400$0100a8c0@inspiron>
From: "Gabriel Barazer" <gabriel@oxeva.fr>
Date: Sat, 22 Apr 2006 16:13:01 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Another XFS + LVM2 snapshots problems
Reply-To: Gabriel Barazer <gabriel@oxeva.fr>,
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

Hello,

Although I often read in the mailing archive that XFS and snapshots aren't 
good friends, this filesystem is the best for my use (a file server with 
~2.5M files and files > 2GB). Now is the time to do snapshots. Here many 
problems occurs :

[hardware detail & software versions on the bottom]

- creating a snapshot with lvcreate -L 10G -n my_backup -s 
/dev/myvg/xfs_storage is OK without using xfs_freeze.

- BUT lvremove the "my_backup" LV (snapshot LV) freeze completely the 
snapshotted LV (xfs_storage in this case). Some days after testing this, i 
found that a simple "dmsetup resume myvg-my_backup" unlock the whole thing 
and lvremove completes.

At this point I was happy to add/remove snapshots freely (but have not tried 
to make multiple snapshot, which kills performances), but now i have a 
snapshot, i can't mount it... here is the scenario :

- lvcreate as shown above
- mount -o nouuid /dev/myvg/my_backup /backups/snapshot

syslog says :
Apr 22 15:14:47 filer1 kernel: XFS mounting filesystem dm-2
Apr 22 15:14:48 filer1 kernel: Starting XFS recovery on filesystem: dm-2 
(logdev: internal)

and nothing else. The I/O activity shown by iostat is the same (no increase 
due to a real XFS recovery)
trying mount -o nouuid,ro does the same. when strace-ing the mount command, 
the last lines are :
open("/dev/myvg/my_backup", O_RDONLY) = 3
lseek(3, 0, SEEK_SET) = 0
read(3, "XFSB\0\0\20\0\0\0\0\0\4\260\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 576) = 
576
close(3) = 0
mount("/dev/myvg/my_backup", "/backups/snapshot/", "xfs", 
MS_RDONLY|0xc0ed0000, 0x517b60 <unfinished ...>

now, i can't kill the mount command initiated neither soft reboot the 
server. I only want to create a snapshot to xfsdump - it , xfsrestore it on 
another backup server, then delete the snapshot.

Does someone here get the same problems ?

Hardware detail:
RAID 10 with 64K stripe on a
3ware 9500S-12 controller and 12x250GB
system is not installed on the LVM (separate RAID 1)

Software versions:
Linux kernel 2.6.16.1
LVM & mapper version 2.01.15 (library 1.01.15, driver version 4.5.0)
XFS utils version 2.7.11
no patches applied, all tools compiled from the official sources

LVM config :
1 VG created from 1 PV (the RAID array is known to the system by /dev/sdb)
some LVs. the LV sizes i want to snapshot are ~200GB each.

-- 
Gabriel Barazer <gabriel@oxeva.fr>
OXEVA 
