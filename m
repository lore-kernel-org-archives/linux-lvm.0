Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106041756.f54Hu4BT020372@webber.adilger.int>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
In-Reply-To: <20010604010750.A2560@pc.ilinx> "from Brian J. Murrell at Jun 4,
 2001 01:07:50 am"
Date: Mon, 4 Jun 2001 11:56:04 -0600 (MDT)
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Brian writes:
> When I try to boot with the LVM disk I get "LI" and that is it.  The
> LILO docs say this about "LI":
> 
> This means the first-stage loader gained control; it thought it success-
> fully loaded the second-stage loader; but it never got there.  This most
> often occurs when the second-stage loader, '/boot/boot.b', is not load-
> able using the BIOS.

Are you sure that you can boot directly from /dev/hdg and/or the partition
that /dev/system/root lives on?  It may well be that the BIOS doesn't
understand this disk (I have never tried it myself).  Have you ever tried
booting from this setup without LVM?

On my LVM/LILO test system, I first made a regular partition for /boot,
and ensured that the BIOS could boot from there, and that I had all of
the right files, etc.  Then I backed the whole thing up, turned the
partition into a PV->VG->LV, restored the data and fixed up lilo.conf
to have the LV name instead of the partition name, and re-ran lilo.

> Which would suggest to me that the mapping is not making it through
> LVM correct me.  But I don't really know that much about how LILO
> really works with the underlying device.

I take it that this is not the other system we are talking about in which
you are moving disks around, is it?  That would complicate matters a bit
for trying to find the cause of this problem.

> My current lilo.conf is:
> 
> boot=/dev/hdg
> map=/boot/map
> install=/boot/boot.b
> vga=780
> default=linux
> keytable=/boot/us.klt
> lba32
> prompt
> timeout=50
> message=/boot/message
> 
> image=/boot/vmlinuz
>     label=linux
>     root=/dev/system/root
>     initrd=/boot/initrd-lvm-2.4.5-1.1mdk.gz
>     append=" hda=ide-scsi devfs=mount video=matrox:vesa:263"
>     read-only

Could you check that the output of "lilo -v5" produces reasonable block
numbers for your kernel image?  You can find out what "reasonable" is
by checking "lvdisplay -v /dev/system/root" output for PV location of
this LV, and then checking partition start offset via /proc/partitions.
Finally, you can use debugfs to list the filesystem blocks used by the
kernel image in that filesystem (via "stat file").

If you go the route of making a regular /boot partition first, you can
save the output of "lilo -v5" from before and after and compare.  There
should be a fixed offset between the partition and LV case, which should
match where your PE data starts (see "pvdata -PP /dev/hdX" and add pe_on_disk
base and size to get start of PE 0 on disk).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
