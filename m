From: Bradley M Alexander <storm@tux.org>
Message-ID: <20021102184903.GA12075@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Can't rebuild LVM
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
Date: Sat Nov  2 12:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Background: Norton utilities screwed up the partition table on one of my
lvm drives. I tried a pvcreate -ff to recover but ended up losing the lvm
partitions. I lost all of my partitions with the exception of /, /lib and
/usr, so the system is still bootable and most of the system apps are still
available. (I did lose /var, though the system has automagically recreated
some of the directories). This is on a Debian/sid box running kernel 2.4.19
and devfs.

The hardware allocated to pvs are /dev/hda3 (27GB), /dev/hdc (30GB) and
/dev/hde (30GB).

I tried to create the pvs and got the following:

# pvcreate /dev/hda3
modprobe: Can't locate module /dev/lvm
modprobe: Can't locate module /dev/lvm
modprobe: Can't locate module /dev/lvm
modprobe: Can't locate module /dev/lvm
modprobe: Can't locate module /dev/group
pvcreate -- physical volume "/dev/hda3" successfully created

for subsequent creates (pvcreate /dev/hdc; pvcreate /dev/hde), I get a
response of "modprobe: Can't locate module /dev/group"; both claim to be
successfully created.

I then try to create the volume group:

# vgcreate vg00 /dev/ide/host0/bus0/target0/lun0/part3
/dev/ide/host0/bus1/target0/lun0/disc /dev/ide/host2/bus0/target0/lun0/disc
modprobe: Can't locate module /dev/vg00
invalidate: Busy buffer
vgcreate -- no valid physical volumes in command line

The other night, I attempted to rebuild and restore the system. It came up
in single user, and after three hours of recreating volumes, partitions and
restoring from backups, I tried to go to multiuser. It rebooted and the LVs
disappeared.

LVM is compiled monilithically into the kernel rather than as modules.
Since I have been running it for about a year, it is 1.0.1-rc4. I have the
following questions:

1. Why is modprobe getting these devices (/dev/vg00, /dev/lvm, etc) which
it then cannot find?

2. Why is, after I rebuild the volume, it not persisting between reboots?

3. What should I do to get these back permanently?

4. Would upgrading to 1.0.6 or even lvm2 help my situation?

Can someone please help me get my system back to being operational?

Thanks,
--Brad
