Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i578Uj018219
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 04:30:45 -0400
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 07 Jun 2004 10:25:17 +0200
Message-ID: <m28yezvkpe.fsf@isnogud.escape.de>
MIME-Version: 1.0
Subject: [linux-lvm] Chaning LV minor device numbers
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

Is it possible, in LVM1, to change the minor device numbers of
existing LVs, which are stored in the meta data?

The reason I ask is this:  I want to move a system to a complete new
hardware.  The new machine already had a VG named vg1 on /dev/hda and
/dev/hdc.  These are the steps I've done:

* I booted the new machine with a Knoppix CD
* partitioned the /dev/sda hard drive with a small /dev/sda1 for /boot
  and a large /dev/sda2 for LVM
* vgscan   to detect the existing vg1
* pvcreate /dev/sda2;  vgcreate vg0 /dev/sda2
* created LVs on the new machine, identical in size to the existing
  LVs on the old machine.  However, the minor device numbers are not
  identical to the minor device numbers of the same LVs on the old
  machine.
* copied /boot and the LVs from old to new machine using dd and ssh.

When booting the new machine it first mounts an initrd, executes
vgscan; vgchange -ay, mounts /dev/vg0/root and pivot_root(8)s to
/dev/vg0/root and then runs /sbin/init from the new root fs.  The
problem is, that the /dev/vg0/root, which was copied from the old
machine, has different minor numbers for the LVs in /etc/lvmtab.d so
that LVM commands running on this new root fs don't work correctly.

I could probably boot into single user mode on /dev/vg0/root and run
vgscan to correct the /etc/lvmtab.d on /dev/vg0/root.

Nevertheless, I'd like to know if I can change the minor device
numbers of existing LVs in the metadata, so that they match those in
/etc/lvmtab.d.

BTW, is there some documentation of the format of the LVM1 metadata
and the format of the /etc/lvmtab.d/* and /etc/lvmconf/* files?


urs
