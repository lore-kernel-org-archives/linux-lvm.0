From: Daniel Savard <dsavard@cids.ca>
Content-Transfer-Encoding: 7bit
Message-Id: <1014762518.12325.76.camel@dirac.cids.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Re: lvm 1.0.3, kernel 2.4.17 and the libs...
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
Date: Tue Feb 26 16:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I managed to get the vgcfgrestore execute using the executable in the
lvm-build tree. I still don't know why the installed executable is
missing a definition for the opt_ignore (this is a variable that seems
to be used by pv_move() and introduced around mid February according to
the source files).

The operation cannot be completed. I will explain my big mistake and I
would like to know if something can be try to recover from this or if I
must check this as an unrecoverable error.

I was making some changes in order to move my partitions to LV in my VG.
The idea was to recover as much space as possible from my drive, making
all remaining partitions continguous and creating a new partition marked
for LVM and add the new partition to the VG in order to migrate as much
stuff as possible into the VG.

So, I was to the point I needed to create a partition contiguous to the
other one, move stuff on it, delete the old one and recover contiguous
space for the future LVM partition to be added to the VG. I add just
remove an obsolete partition, say /dev/sda6, my existing LVM partition
was /dev/sda8, so the partition numbers were decreased by one for all
partitions above 6 as usual, I then created a new partition which became
/dev/sda8 and the LVM partition was the /dev/sda7. Everything would be
just fine if I didn't forget to reboot the machine before proceeding
with the following:

I did mkfs.ext2 on /dev/sda8 !!! However, this was still pointing to my
LVM partition even if fdisk was not showing this.

The big question: Is it still possible to recover some data from the LVM
partition which was the only partition in my VG?

If yes, HOW.

-- 

=======================================
Daniel Savard

Internet: dsavard@cids.ca
=======================================
