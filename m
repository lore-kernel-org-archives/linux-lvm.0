Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104111949.f3BJnFHt014761@webber.adilger.int>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
In-Reply-To: <m2k84rn0im.fsf@isnogud.escape.de> "from Urs Thuermann at Apr 11,
 2001 01:23:13 pm"
Date: Wed, 11 Apr 2001 13:49:14 -0600 (MDT)
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

Urs, you write:
> > One thing that now comes to mind is if the LVM I/O is not aligned,
> > because LVM PEs are aligned with the end of the PV and not the
> > start, this _may_ cause performance problems because of misaligned
> > read-modify-write causing extra seeking (purely speculation).
> 
> I don't understand, what you're saying here (and above).  I was
> *reading* with dd if=/dev/vg0/test of=/dev/null.  So why is there an
> RMW involved?

Sorry, too sleepy I guess.  Obviously don't need read-modify-write
when only reading pages.

> Could you explain the interaction of the kernel, LVM and the physical
> device a little bit or give a pointer to some text?

Ok, the chain of events is as follows (hopefully correct):

Non-LVM read			LVM read
------------			--------
sys_read			sys_read
block_read			block_read
ll_rw_block			ll_rw_block
submit_bh			submit_bh
generic_make_request		generic_make_request
				lvm_make_request_fn
				lvm_map
__make_request			__make_request

The rest should be the same because you have the same IDE driver below.


> > Try the following patch, which will align the PE structs to 64kB
> > boundaries from the start of the disk, as well as making the other
> > large VGDA structs start on 4k boundaries.
> 
> Does it align to the start of the disk (as you write) or to the start
> of the PV?

You are correct, it aligns to the start of the PV, and not the disk.

> And is this a patch that will go into further releases anyway or is it
> just to find my reported performance problem?  Since alignment is changed,
> I think I will have to recreate the PV, VG and LV with pvcreate, vgcreate
> and lvcreate, right?  The patched tools and kernel would not work with
> my existing LV, would they?

I'm hoping this patch will make it into the stock LVM because it aligns
all of the large VGDA structs to PAGE_SIZE (at least 4k pages), and the
PE alignment matches MD RAID device alignment.

Yes, you will need to re-create the PV and VG and LV for this to take
effect.  However, the kernel currently knows nothing at all about on-disk
layout of VGDA data.  Also, the tools all use the VGDA locations stored
in the PV header (they are written at pvcreate and vgcreate time), so even
if you create your VG/LV with this patch and it doesn't make it into the
stock kernel, it is 100% compatible with unpatched tools.

> I don't expect this change in alignment to cause a change in performance.

Neither do I.  Just something that I was thinking about when I had writing
on my mind, not reading.

> For testing, I have written my own very simple version of dd which can
> seek (not only skip) on the input file (I called it di since it understands
> only if= but not of=, it always writes to stdout).  With this I have read
> from /dev/sda5 exactly the same sectors that /dev/vg0/test allocates
> (the first PE in vg0 starts at sector 4352 and /dev/vg0/test allocates
> PEs from vg0 contigously starting at PE no 0, see my last mail):
> 
>     # time ~urs/src/di bs=512 count=131072 if=/dev/sda5 >/dev/null
>     131072+0
>     
>     real    0m9.345s
>     user    0m0.180s
>     sys     0m1.250s
>     # time ~urs/src/di bs=512 count=131072 if=/dev/sda5 seek=4352 >/dev/null
>     131072+0
>     
>     real    0m8.955s
>     user    0m0.130s
>     sys     0m1.570s
>     # time ~urs/src/di bs=512 count=131072 if=/dev/vg0/test >/dev/null
>     131072+0
>     
>     real    0m54.611s
>     user    0m0.110s
>     sys     0m2.480s

Very strange.  I just tested the same on my system, and LVM ends up
_faster_ than raw disk access in each of the 3 tests I did:

dd if=<dev> of=/dev/null bs=512 count=131072

LVM /dev/lvtest/vgtest: 11.099s, 11.393s, 10.785s
IDE /dev/hda9:          12.073s, 11.822s, 11.843s

This may have something to do with how my LV is set up.  The first 5
PEs are actually closer to the end of the PV, and then the remaining
PEs are contiguous from the start of the PV.

> Anyway, I will try your patch, probably today.  I have not applied
> patches from the lvm-0.9... to the kernel before.  AFAICS, I have to
> apply your patch to the lvm-0.9.1beta7 package, then ./configure; cd
> PATCHES; make and then apply lvm-0.9.1_beta7-2.4.3.patch to my kernel
> src, right?

Yes, but you really don't need to change the kernel code to use my
patch.  The VGDA alignment is purely a user-space issue.  The kernel
never does I/O to the VGDA - it is all read in user-space and passed
to the kernel via ioctl.

> Also, does lvm-0.9.1_beta7-2.4.3.patch affect files other than
> lvm-mod.o, i.e. do I have to restart my kernel or only reload the LVM
> module?

Actually, I think you should be OK with only rebuilding the LVM module.
However, you should be able to see from the patch itself if it affects
anything outside lvm*.  AFAIK, noting includes lvm.h in the kernel that
would be affected.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
