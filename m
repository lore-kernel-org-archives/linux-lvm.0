From: Bradley M Alexander <storm@tux.org>
Message-ID: <20011112141948.P715@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM fails at bootup
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
Date: Mon Nov 12 13:18:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I am just trying out LVM for a space allocation problem that I am running
into, and I am having problems with getting the machine to boot with the
new configuration.

The machine is an i386 (Athlon with a Maxtor30 GB IDE HD on hda and a
Quantum   
30 GB IDE HD on hdb). It is running Debian/GNU Linux (unstable/sid) with a
2.4.13 kernel which was custom compiled. It is also running devfs.

I am using (or attempting to use) lvm 1.0.1rc4 compiled directly into the
kernel.

I compiled the tools, patched the kernel, booted onto the patched kernel. I
was able to create the pv on /dev/hdb after figuring out that I had to give
the full path to the drive, and then was able to create the volgroup (vg01)
and the logical volumes fine. They mounted fine manually, but after
changing fstab and copying the files on to the logical volume, I rebooted.
Thats when my problems began.

I added the vgscan and the vgchange commands to the end of the checkroot.sh
script (which in Debian is different from the mountfs.sh script). When the
vgscan runs, it generates about two pages of drive errors:

hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hdb: read_intr: error=0x04 { DriveStatusError }

followed by two

modprobe: Can't locate module /dev/vg01

then vgscan finds the volume, followed by vgchange activating it. After
this,
I get a series of "Can't locate module /dev/vg01/<logical volume> errors.
After several iterations of this, the machine hangs trying to start
syslogging.

The filesystems I am trying to lvm are

/var
/tmp
/home
/usr/local
/opt
/backup (backup images of filesystems on machines in my network)
/archive (cd images, mp3s etc)

Once I get this booting on the lvm'ed filesystems, I plan to free up the
partitions that these occupy and create a second volgroup on /dev/hda, then
splitting up the above filesystems between the two volgrps.

Note that once I reverted the system back to the old fstab (effectively
using the old partitions, I tried mounting the lvm filesystems. They
mounted just fine, and in fact, hdb does not give the drive errors when I
do a vgscan (nor has it ever given me drive errors, and a Debian mirror
used to live there).

Is it the partition selections I made? I checked and devfs is initialized
even before / is checked, S01devfsd versus S10checkroot.sh. Why am I unable
to mount my LVM partitions when I boot straight, but it mounts when I boot
the system and do the steps manually? Did I miss something major?

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
As usual, this being a 1.3.x release, I haven't even compiled this kernel yet.
So if it works, you should be doubly impressed.
(Linus Torvalds, announcing kernel 1.3.3 on the linux-kernel mailing list.)
