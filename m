From: "yves.alloyer" <Yves.ALLOYER@slpinfoware.com>
Date: Thu, 4 Oct 2001 16:51:59 +0200
Message-Id: <NEBBLHFAEINCLDICDLOAEENBCHAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Root + Software RAID 1 in partition + LVM + Reiserfs
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

Hi there,
I just set up an SMP i686 box with 2 SCSI drives (adaptec_7xxx) which is:
- 2.4.9 kernel
- lilo 22.0-1 with (slightly tweaked) lilo-21.7.5-lvm.patch (from Andreas
Dilger)
- 100% reiserfs (3.x.0j-2)
- 100% LVM (1.0.1-rc2)  (excepted swap) on top of MD on top of two
partitions
- two drives on adaptec_7xxx

I am somewhat used to HP LVM which allows me to define some LVs as RAID 1
some as RAID 0 or lets LVM lay them out as it sees fit.
I wanted that, because I wanted to mirror my most precious filesystems. Then
again I did not want to waste that space for swap /tmp and other not so
vital stuff.

The interesting(/insane?) thing about this configuration is that since I
have two hard drives I could not just make a software RAID 1 device out of
them... I did so with a partition on each device.
-	/dev/md1 uses /dev/sda1 and /dev/sdb1
-	swap is on /dev/sda2 and /dev/sdb2

pvcreate /dev/md1 complained about using a Linux SWAP partition
I tweaked lvm_check_partitioned_device to have it return FALSE for MD
devices. This would probably prevent me from partitioning any MD device. But
I won't anyway... that's what I use LVM for.
This time it worked.
I was able to create my future root VG, my LVs, create my reiserfs
filesystems, copy my original filesystems etc.
The box came up with:
/dev/vgroot/lvroot on / type reiserfs (rw)
none on /proc type proc (rw)
usbdevfs on /proc/bus/usb type usbdevfs (rw)
/dev/vgroot/lvusr on /usr type reiserfs (rw)
/dev/vgroot/lvvar on /var type reiserfs (rw)
/dev/vgroot/lvopt on /opt type reiserfs (rw)
/dev/vgroot/lvtmp on /tmp type reiserfs (rw)
/dev/vgroot/lvusr-local on /usr/local type reiserfs (rw)
none on /dev/pts type devpts (rw,gid=5,mode=620)

This allowed me to trash my old filesystems and consolidate their partitions
into /dev/sda3 and /dev/sdb3.
My current root VG now comprises /dev/md1 /dev/sda3 and /dev/sdb3

This allows me to do LVM with mirroring and striping on just two disks.

Has anyone experience with that kind of layout? Is it just plain insane?

Thanks,
Yves
