Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <200104102137.f3ALb1MS032178@webber.adilger.int>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 11 Apr 2001 13:23:13 +0200
In-Reply-To: <200104102137.f3ALb1MS032178@webber.adilger.int>; from Andreas Dilger on Tue, 10 Apr 2001 15:37:00 -0600 (MDT)
Message-ID: <m2k84rn0im.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolinux.com> writes:

> No, PEs are allocated from the start, but are only aligned with the
> end of the disk/partition (to give maximum room to LVM for
> metadata).  If you have contiguous LE allocation (which you appear
> to have), the read order for LVM should basically be exactly the
> same as for a raw disk.  Effectively all that LVM is doing is adding
> a small offset to the disk blocks to leave room for the VGDA,
> nothing more.

Yes, I found that out after my posting by writing a 32 Mb ( = 8 PEs)
pattern to the beginning of /dev/vg0/test and searching for it in
/dev/sda5.  In my case the offset is of the first PE is 4352 sectors,
since /dev/sda5 has 627 * 4 MB + 4352 * 512 bytes.  This small offset
shouldn't have an impact on the performance when reading 2.45 GB.

> Do you notice the sound of frantic head seeking when you are running
> with small block sizes?

No, sounds very similar and only very moderate head seeking (probably
from syslogd).

> So basically a few memory accesses and a few math operations.
> Nothing _should_ affect disk performance at all.  With < 2k I/O you
> are forcing read-modify-write on pages, but this shouldn't be an
> issue, because you are also doing the same for the raw disk.

What has that all to do with pages?  Isn't it the hardsect_size that
is relevant here?  And why is < 2k the relevant limit?  If the page
size was relevant this is 4k.  If the hardsect_size is relevant, this
is 1k in 2.4.3 (after initialization, but can grow when mounting a FS
with larger block size, due to the bug I reported on this list) and if
I read the src in 0.9.1b7 correctly Andrea's patch makes the
hardsect_size equal to the maximum sector size of all PVs, i.e. 512
bytes with most disks.

> One thing that now comes to mind is if the LVM I/O is not aligned,
> because LVM PEs are aligned with the end of the PV and not the
> start, this _may_ cause performance problems because of misaligned
> read-modify-write causing extra seeking (purely speculation).

I don't understand, what you're saying here (and above).  I was
*reading* with dd if=/dev/vg0/test of=/dev/null.  So why is there an
RMW involved?

What does happen, when I do a write(2) of a 512-byte block to
/dev/vg0/test, when the hardsect_size of the PV /dev/sda5 is 512 bytes
and the hardsect_size of the LV /dev/vg0/test is 1k?  Does the kernel
read 1k from LVM, modify 512 bytes and (later, when syncing) write 1k
back to LVM?  If so, the fact that hardsect_size of the LV is larger
than the physical sector size could explain the performance impact.
The kernel would have to modify only parts of a LV block, so (I
assume) it would RMW.  With

    hardsect_size == sector size == size of the write(2) call

the kernel could probably just write to LVM without prior reading.
But this would still not explain the performance degradation in my
tests where I was *reading* from the LV.

Could you explain the interaction of the kernel, LVM and the physical
device a little bit or give a pointer to some text?

> Try the following patch, which will align the PE structs to 64kB
> boundaries from the start of the disk, as well as making the other
> large VGDA structs start on 4k boundaries.

Does it align to the start of the disk (as you write) or to the start
of the PV?  And is this a patch that will go into further releases
anyway or is it just to find my reported performance problem?  Since
alignment is changed, I think I will have to recreate the PV, VG and
LV with pvcreate, vgcreate and lvcreate, right?  The patched tools and
kernel would not work with my existing LV, would they?

I don't expect this change in alignment to cause a change in
performance.  For testing, I have written my own very simple version
of dd which can seek (not only skip) on the input file (I called it di
since it understands only if= but not of=, it always writes to
stdout).  With this I have read from /dev/sda5 exactly the same
sectors that /dev/vg0/test allocates (the first PE in vg0 starts at
sector 4352 and /dev/vg0/test allocates PEs from vg0 contigously
starting at PE no 0, see my last mail):

    # time ~urs/src/di bs=512 count=131072 if=/dev/sda5 >/dev/null
    131072+0
    
    real    0m9.345s
    user    0m0.180s
    sys     0m1.250s
    # time ~urs/src/di bs=512 count=131072 if=/dev/sda5 seek=4352 >/dev/null
    131072+0
    
    real    0m8.955s
    user    0m0.130s
    sys     0m1.570s
    # time ~urs/src/di bs=512 count=131072 if=/dev/vg0/test >/dev/null
    131072+0
    
    real    0m54.611s
    user    0m0.110s
    sys     0m2.480s


Anyway, I will try your patch, probably today.  I have not applied
patches from the lvm-0.9... to the kernel before.  AFAICS, I have to
apply your patch to the lvm-0.9.1beta7 package, then ./configure; cd
PATCHES; make and then apply lvm-0.9.1_beta7-2.4.3.patch to my kernel
src, right?

Also, does lvm-0.9.1_beta7-2.4.3.patch affect files other than
lvm-mod.o, i.e. do I have to restart my kernel or only reload the LVM
module?  I have already made the lvm-0.9.1_beta7-2.4.3.patch file and
see lvm.h is changed, but haven't already checked where it is
included.


urs
