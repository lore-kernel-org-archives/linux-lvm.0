Return-Path: <thornber@btconnect.com>
Date: Tue, 17 Jul 2001 17:40:08 +0100
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <20010717174008.A1000@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643418@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A643418@AUSMAIL>; from austin@coremetrics.com on Mon, Jul 16, 2001 at 03:42:00PM -0500
From: Joe Thornber <thornber@btconnect.com>
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

This one keeps resurfacing so I had a look at it.

I had a look at Ben LaHaise's patch, it seems to be ensuring that all
sector offsets are stored in a blkoff_t variable, which presumably is
an unsigned 64 bit integer.  The rest of the patch goes through some
of the block drivers (eg, loop) and ensures that no *, / or %
operations are performed on blkoff_t's.  Good stuff.

The email below mentions 3 problems with LVM:

1) planned on supporting 64 bit offsets

   o lvm_disk_data_t which describes the positions of the metadata
     sections uses 32bit sectors - however these will always be in the
     first Meg or so of the block device, so 32 bits is plenty

   o lv_block_exception_t, used for the in core representation and
     hence a part of the ioctl interface, holds 32 bit sectors.  This
     will have to be changed.  But the ioctl interface is going to change
     big time when we move to in kernel metadata io.

2) never used multiplication, division or modulus on block numbers

   It's true that we do this at the moment, I just had a quick go at getting
   rid of them, the no-stripe case is easy:

   int inline map_single(blkoff_t sector, vg_t *vg, lv_t *lv, 
		         blkoff_t *sector_map, kdev_t *dev_map)
   {
	pe_t *pe;
	uint32_t pe_shift = vg->pe_shift;
	uint32_t pe_mask = vg->pe_mask;

	index = rsector_org >> pe_shift;
	pe = lv->lv_current_pe + index;

	*sector_map = pe.pe + (rsector_org & pe_mask);
	*dev_map = pe.dev;
   }

   We just replace the / and % with shifts and masks.

   The striped version is harder:

   int inline map_multiple(blkoff_t sector, vg_t *vg, lv_t *lv,
			   blkoff_t *sector_map, kdev_t *dev_map)
   {
	uint32_t pe_shift = vg->pe_shift;
	uint32_t pe_mask = vg->pe_mask;
	uint32_t stripes = lv->stripes;
	uint32_t seg_size = vg->pe_size * stripes;
	uint32_t index, chunk;
	pe_t *pe;

	index = sector >> pe_shift;  /* safely drop to 32 bits */
        index -= index % stripes;    /* I'm sure there's a neater way */

	/*!!! 64 bit % */
	chunk = (sector % seg_size) >> chunk_shift;

	index += chunk % stripes;
	chunk = chunk / stripes;

	pe = lv->lv_current_pe + index;

	sector_map = pe.pe + (chunk << chunk_shift) + (sector & chunk_mask);
	dev_map = pe.dev;
   }

   Here there's one % that we can't get rid of (we could also do chunk = 
   sector - (pe_size * index)), for the simple fact that the number of
   stripes is not a power of 2, so we can't replace with shifts and masks.

   I just had a chat with one of the EVMS guys, EVMS *does* have this
   exact same problem.

   Should we restrict stripes sets to powers of 2 ?


3) don't allocate memory structures that are indexed by block numbers

   o We don't, I think he's confusing PE's with blocks.


- Joe


On Mon, Jul 16, 2001@03:42:00PM -0500, Gonyou, Austin wrote:
> I think ELVM at the bottom is EVMS. I wish I knew where the original article
> was, cause I'd like to know what 64bit frame he's talking about. Currently
> I'm using LVM for striping, and plan to use it with Fibre. From what I
> understand on this list, is that others are using it on fibre already. So,
> if they are using a 2.4 kernel, with fibre, wouldn't that mean that they'd
> need to employ 64-bit access(if they use a 64-bit controller+driver?)
> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com 
> 
> > -----Original Message-----
> > From: Gonyou, Austin [mailto:austin@coremetrics.com]
> > Sent: Monday, July 16, 2001 3:36 PM
> > To: 'linux-lvm@sistina.com'
> > Subject: [linux-lvm] FW: LVM on Linux
> > 
> > 
> > From the XFS list. 
> > 
> > -- 
> > Austin Gonyou
> > Systems Architect, CCNA
> > Coremetrics, Inc.
> > Phone: 512-796-9023
> > email: austin@coremetrics.com 
> > 
> > > -----Original Message-----
> > > From: Ric Tibbetts [mailto:ric@pipcws.ca.boeing.com]
> > > Sent: Monday, July 16, 2001 3:09 PM
> > > To: Linux XFS Mailing List; JFS Discussion List
> > > Subject: LVM on Linux
> > > 
> > > 
> > > For anyone considering using LVM on Linux. You might want to take a 
> > > second to look at the following "short" article. It casts a 
> > > questionalble light on the current state of the LVM code.
> > > 
> > > ================================================
> > > 
> > > 0 Jun - 5 Jul (8 posts) Archive Link: [RFC][PATCH] first cut 
> > > 64 bit block
> > > support
> > >                   Summary by Zack Brown
> > > 
> > > Ben LaHaise posted a patch and announced, "Below is the first 
> > > cut at making
> > > the block size limit configurable to 64 bits on x86, as well 
> > > as always 64
> > > bits on 64 bit machines. The audit isn't complete yet, but a 
> > > good chunk of
> > > it is done." [..] "The following should be 64 bit clean now: 
> > > nbd, loop,
> > > raid0, raid1, raid5." He gave links to two homepages at
> > > http://people.redhat.com/bcrl/lb/ and
> > > http://www.kvack.org/~blah/lb/. He added, "Ugly bits: I had 
> > > to add libgcc.a
> > > to satisfy the need for 64 bit division. Yeah, it sucks, but 
> > > RAID needs some
> > > more massaging before I can remove the 64 bit division 
> > > completely. This will
> > > be fixed." Chris Wedgwood proposed some changes to libgcc.a 
> > > to be less ugly,
> > > and Ben replied, "I'm getting rid of the need for libgcc 
> > > entirely. That's
> > > what "This will be fixed" means. If you want to expedite the 
> > > process, send a
> > > patch. Until then, this is Good Enough for testing purposes."
> > > 
> > > Elsewhere, Ragnar Kjarstad was very happy about Ben's work, 
> > > asking if LVM
> > > was also 64-bit clean. Ben replied cryptically, "Errr, I'll 
> > > refrain from
> > > talking about LVM." Ragnar wanted some clarification, and Ben 
> > > explained:
> > > 
> > > Fixing LVM is not on the radar of my priorities. The code is 
> > > sorely in need
> > > of a
> > > rewrite and violates several of the basic planning tenents 
> > > that any good
> > > code in the block layer should follow. Namely, it should have 
> > > 1) planned on
> > > supporting 64 bit offsets, 2) never used multiplication, 
> > > division or modulus
> > > on block numbers, and 3) don't allocate memory structures 
> > > that are indexed
> > > by block numbers. LVM failed on all three of these -- and 
> > > this si just what
> > > I noticed in a quick 5 minute glance through the code. Sorry, 
> > > but LVM is
> > > obsolete by design. It will continue to work on 32 bit block 
> > > devices, but if
> > > you try to use it beyond that, it will fail. That said, we'll 
> > > have to make
> > > sure these failures are graceful and occur prior to the user 
> > > having a chance
> > > at loosing any data.
> > > 
> > > Now, thankfully there are alternatives like ELVM, which are 
> > working on
> > > getting the
> > > details right from the lessons learned. Given that, I think 
> > > we'll be in good
> > > shape
> > > during the 2.5 cycle.
> > > 
> > > End Of Thread (tm).
> > > 
> > > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
