From: Chris Abbey <linux@cabbey.net>
Message-Id: <Pine.LNX.4.33.0202240226470.26350-100000@tweedle.cabbey.net>
MIME-Version: 1.0
Subject: [linux-lvm] pvextend?
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
Date: Sun Feb 24 02:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Howdy all,
	I've searched through the archives and how-to's but I see
no mention of this concept anywhere. I'm hoping someone can point
me twoard a tool to accomplish it.

	What I have today is one VG with the following PVs:

PV Name (#)           /dev/sda3 (1)
PV Status             available / allocatable
Total PE / Free PE    1666 / 172

PV Name (#)           /dev/sdb2 (2)
PV Status             available / allocatable
Total PE / Free PE    1666 / 322

The drives that these PVs come from are allocated as such:

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1       131   1052226   83  Linux
/dev/sda2           132       163    257040   82  Linux swap
/dev/sda3           164       588   3413812+  8e  Linux LVM
/dev/sda4           589      1105   4152802+   c  Win95 FAT32 (LBA)
/dev/sdb1             1       163   1309266    b  Win95 FAT32
/dev/sdb2           164       588   3413812+  8e  Linux LVM
/dev/sdb4           589      1106   4160835   83  Linux

	I want to nuke sda4 and sdb4 and add the space they
occupy to the PVs on sda3 and sdb2. If these were ext2 fs'
or were striped together with md this would be trivial: open
fdisk, delete the last two partitions create a new, unified,
partition in their place, write the table, repeat on the other
drive, then use e2resize to push the filesystems into the new
space. But how do I do this with PVs? I assume the fdisk
adjustment will still be needed, but what is the corresponding
e2resize command for a PV? Or will they just see the added
space and grow to fit?

	I have dreamed up a rather ugly way to accomplish
this, kinda-sorta.... I could create a second PV on one
of the drives, say as sdb4... then pvmove the PV from the
other drive into that, then create a new PV on the first
drive of the full size, then add that to the VG, then pvmove
the data from both of the small PVs into the large one, then
pvremove them and create a replacement large PV in their place
and add it to the VG. The end result of that though would be
that all my data was on one drive... the advantage of striping
over two drives would be shot to hell. I measured a healthy
performance boost when I moved to striping two drives, I'm not
keen to loose that, and as far as I can tell, there is no tool
to rebalance the PEs over several PVs. Or did I miss something?

	Any suggestions appreciated.
