Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BDZG000593
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 09:35:16 -0400
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 11 Jun 2004 15:33:59 +0200
Message-ID: <m2n03a6wxk.fsf@isnogud.escape.de>
MIME-Version: 1.0
Subject: [linux-lvm] Running vgscan while swap on LVM is already active
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This problem has been described before here on the mailing list, but
no reason/solution was posted.

I have two volume groups
* vg0 consisting of one PV  /dev/sda2
* vg1 consisting of two PVs /dev/hda and /dev/hdc

Most of the system is in vg0, containing
/dev/vg0/{root,var,usr,local,home,swap,...}, and vg0 is activated in
the boot process.  At this time no IDE drivers are loaded, thus only
vg0 is detected by vgscan in the boot process.  swap is activated on
/dev/vg0/swap successfully.

When I later decide that I want to load the IDE modules, start the IDE
hard drives, and mount the file systems from vg1 (which I need
seldomly, which is why the drives are spun down most of the time), I
need to run vgscan after activating drives and IDE modules.

However, running vgscan while /dev/vg0/swap is active, breaks things:

isnogud:root# swapon -s
Filename                        Type            Size    Used    Priority
/dev/vg0/swap                   partition       262136  0       -1
isnogud:root# swapoff /dev/vg0/swap
isnogud:root# swapon /dev/vg0/swap
isnogud:root# swapon -s   
Filename                        Type            Size    Used    Priority
/dev/vg0/swap                   partition       262136  0       -2
isnogud:root# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg0"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

isnogud:root# swapon -s
Filename                        Type            Size    Used    Priority
/dev/vg0/swap (deleted)         partition       262136  0       -2
isnogud:root# swapoff /dev/vg0/swap
swapoff: /dev/vg0/swap: Invalid argument

What does the attribute deleted mean here?  I can see the the device
node /dev/vg0/swap is recreated, but with the same major/minor numbers.

isnogud:root# date; ls -l /dev/vg0/swap
Fri Jun 11 15:22:12 CEST 2004
brw-rw----    1 root     disk      58,   8 Jun 11 15:19 /dev/vg0/swap

This reminds of open files which are unlinked while still being
opened, which are displayed as deleted by eg. lsof:

isnogud:root# cat >/tmp/foo & rm /tmp/foo; lsof |grep /tmp/foo
[1] 3490

[1]+  Stopped                 cat >/tmp/foo
cat       3490  root    1w   REG        0,7      0   20112 /tmp/foo (deleted)


But is the active swap space somehow tied to the device node
/dev/vg0/swap in the file system.  I thought this is not the case.
And even if it is, this behavior still suprises me because it the
device node is recreated with the same device number and even inode
number.

On the other hand, unmounting file systems on LVs in vg0 is possible
without any problem after running vgscan, using both, the block device
name or the mount point.

Can someone explain what's going on here?

urs
