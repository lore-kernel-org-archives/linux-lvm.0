Message-ID: <20040110232726.20247.qmail@web13605.mail.yahoo.com>
From: Jason White <jw2dotorg@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LILO overwrote boot sector on LVM1 whole disk
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
Date: Sat Jan 10 18:28:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Here was my old setup:

hda1 -> /boot
hda2 -> LVM1 (rootvg)
hda3 -> LVM1 (rootvg)
hdb  -> LVM1 (rootvg)

/dev/rootvg/rootlv (/)
/dev/rootvg/usrlv
/dev/rootvg/varlv
...etc...

(all filesystems are reiserfs, except /boot)

I bought a new drive (hdc), so my plan was to "pvmove"
hda to hdc, and then remove hda.   So, here are the
commands I ran:

# pvcreate /dev/hdc
# vgextend rootvg /dev/hdc
# pvmove /dev/hda /dev/hdc
# vgreduce rootvg /dev/hda
(I also moved /boot to /)

So, now I have:

hdb -> LVM1
hdc -> LVM1

So far, so good.  Then, I rebooted.  The problem was
that LILO was installed on hda (which I removed), so
basically I had no way of booting now.  So, I booted
with a floppy, mounted /, and changed /etc/lilo.conf
to point to /dev/hdc.  Ran lilo, and everything is
cool....or so I thought.  

Well, since this is LVM1, a "whole" disk dedicated to
LVM, uses boot sector 0 (unlike LVM2, I've heard).
LILO overwrote boot sector 0, which LVM kinda needs.

It gets worse because although LILO makes a backup
copy of the boot sector in /boot/boot.XXXX, /boot at
the time LILO ran, was on hdc.  So....since hdc
doesn't have a valid boot sector anymore, the LVM
tools don't recongize it, and I can't recover the
backup boot sector.

I now have both disks, hdb and hdc, on a different
machine with all the LVM2 tools (device-mapper, etc),
but I'm still not able to do much with the hdc.  Of
course, all the data is still on the drive, I just
don't have the "table of contents".

I've dug through this list, and tried several things
mentioned to others, but have not come up with
anything yet.  Since my VG is spanned across 2
physical disks, I can still see everything on hdb by
using the --partial option on many of the tools.   I
just don't know what informaton is contained in the
boot sector, or if there is any way that hdb can help
hdc remember where all his partitions are!  :)

Also, /dev/rootvg/root_lv appears to be on hdc, and it
shows up under /dev/mapper/rootvg-root_lv, but when I
tried to mount it, reiserfs just complains that it
can't find the superblock.  If I tried to rebuild the
superblock (reiserfsck --rebuild-sb), I just get
"Operation not permitted", because LVM is in the
middle, preventing any writes (so it seems).

Any ideas would be appreciated.

Thanks,
Jason







__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
