Return-Path: <banal@home.com>
Message-ID: <3AE91AEF.22ABDC51@home.com>
Date: Fri, 27 Apr 2001 00:08:31 -0700
From: Evan Day <banal@home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I thought I had everything set up right...

I've got a system with two SCSI disks.  Currently the system is mostly
installed on /dev/sda using a straight ext2 setup.  I'm using GRUB as the
bootloader since LILO has been giving me problems.  Currently on kernel 2.4.3
using the lvm 0.9.1beta7 patches and lvm tools.

My intention is to mirror the disks using Linux software RAID, with 
/dev/sda1 and /dev/sdb1 as /dev/md0 (mounted as /boot) and /dev/sda4 and
/dev/sdb4 as /dev/md1, which will be VG00 and have the rest of the system
on it, with most everything using the reiserfs.

Right now, /dev/md0 is working as /boot (reiserfs), with the rest of the
system on /dev/sda (/dev/sda2 is root).  I've created /dev/vg00 and 
/dev/md1 (with /dev/sda4 failed) and built a new root logical volume on
/dev/vg00/lvol1.  This works fine and I can mount it on /mnt and copy 
/ over to it just fine, then edit /mnt/etc/fstab to put root on
/dev/vg00/lvol1.

I used lvmcreate_initrd to make /boot/initrd-lvm-2.4.3.gz, and can boot grub
with initrd just fine.  At boot time, it boots the kernel, loads the ram 
disk, runs /linuxrc and successfully activates /dev/vg00.  I have LVM, 
reiserfs, and, RAID-1 in the kernel (no modules).

After activating vg00 and umounting /proc (in initrd/linuxrc), the system 
dies:

Kernel panic: I have no root and I must scream!

I thought it might be that having the LV on the RAID was too complex, and 
tried creating a VG on a partition, but I still get the same result.  I've 
edited the linuxrc on the initrd and both vgdisplay and lvdisplay show the 
correct info.

The line from /etc/fstab

/dev/vg00/lvol1	/	reiserfs	defaults,errors=remount-ro 0 1
(tried formatting ext2 and it still fails)

Saw one other message on this dated April 9, 2001, but no apparent 
resolution.

HELP!
