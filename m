From: Petro <petro@auctionwatch.com>
Message-ID: <20011111212427.B4199@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM, Reiserfs, and snapshots.
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
Date: Sun Nov 11 23:23:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

    Im having a bit of trouble here, and I'm hoping that someone on this 
    list can assist me. 

    I am trying to do snapshots on a database system, and I'm getting:
dbgsh01:~# lvremove /dev/vg0/snap23052 
lvremove -- do you really want to remove "/dev/vg0/snap23052"? [y/n]: y
lvremove -- doing automatic backup of volume group "vg0"
lvremove -- logical volume "/dev/vg0/snap23052" successfully removed

dbgsh01:~# lvcreate -L 10G -s -n test /dev/vg0/lv0
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/vg0/test"
lvcreate -- doing automatic backup of "vg0"
lvcreate -- logical volume "/dev/vg0/test" successfully created

dbgsh01:~# mount -o ro /dev/vg0/test /snap/
mount: wrong fs type, bad option, bad superblock on /dev/vg0/test,
       or too many mounted file systems

And of course, /dev/log/kern.log contains:

Nov 11 21:15:23 dbgsh01 kernel: reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
Nov 11 21:15:23 dbgsh01 kernel: reiserfs:warning: - it is slow mode for debugging.
Nov 11 21:15:23 dbgsh01 kernel: reiserfs: checking transaction log (device 3a:01) ...
Nov 11 21:15:23 dbgsh01 kernel: journal-1153: found in header: first_unflushed_offset 7026, last_flushed_trans_id 11094
Nov 11 21:15:23 dbgsh01 kernel: journal-1006: found valid transaction start offs et 7026, len 3 id 11095
Nov 11 21:15:23 dbgsh01 kernel: clm-2076: device is readonly, unable to replay log
Nov 11 21:15:23 dbgsh01 kernel: Replay Failure, unable to mount
Nov 11 21:15:23 dbgsh01 kernel: reiserfs_read_super: unable to initialize journal space

Ok, so there's the problem description. 

Kernel version is 2.4.14 (no patches), Debian variant of Linux, using:
Logical Volume Manager 0.9.1_beta7
mount: mount-2.11h

The funny thing is that I've got 2 other systems where I *can* do the
above steps, and the only differences are the kernel on *one* of the
systems (2.4.8-ac8) and the configuration of the underlying hardware
(all three have 3ware cards, one of them has 2 disks in raid0, the other
2 have raid1. One working and one non-working have raid1.). 

Any clues? 

-- 
Share and Enjoy. 
