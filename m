Date: Mon, 16 Oct 2000 04:57:20 -0400 (EDT)
From: Myles Uyema <myles@puck.nether.net>
Subject: [linux-lvm] LVM recovery suggestions?
Message-ID: <Pine.LNX.4.10.10010160413440.24443-100000@puck.nether.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

well, here's my situation:

/dev/sda2 and /dev/sdb2 physical devices making up VG "uyema"
/   raid1 mirror (sda1 and sdb1)

/usr /home /var /tmp are all separate LVs in VG "uyema"

Running kernel 2.4.0-test10-3, I decided to umount /home, and resize
/dev/uyema/home using e2fsadm.  I had ~8GB free PV space at the time.

I run: e2fsadm -L +1G /dev/uyema/home
All goes well, and ext2resize finishes successfully and e2fsck checks out
fine.  I'm feeling lucky....

Next I run: e2fsadm -L +5G /dev/uyema/home
e2fsadm gets to the part where it says "running ext2resize"

-kernel panic- which I don't have a paste of, but do recall seeing 
"ll_rw_block" in the kernel oops message.  I run 'sync' which also
generates a kernel panic, with "ll_rw_block" again...and a couple other
lvm commands I've tried also caused the kernel to regenerate OOPs stack
traces.  Magic SYSRQ Sync - kernel panic.  shutdown -r now - kernel panic.

Things are not looking good, so I magic sysrq UMOUNT, then cold boot.
Upon reboot, lvm doesn't recognize VG "uyema"
pvscan -v shows /dev/sda2 and /dev/sdb2 as having "uyema" in EXPORTED
state, and vgscan says no volume groups.

No problem, let's just "vgimport uyema /dev/sda2 /dev/sdb2"
vgimport -- ERROR "vg_read_with_pv_and_lv" allocate LE of LV" reading data
of volume group "uyema"

vgcfgrestore won't let me restore, even though /etc/lvmconf/uyema.conf
exists: "-- ERROR pv_read(): PV exported" reading physical volume
/dev/scsi/host0/bus0/target0/lun0/part2
(same goes for sdb2 (target12))

So...I'm out of ideas.  I have a backup of /home, not a problem, but if I
can get the whole uyema Volume Group back online...it would be great. =)

Any suggestions?
