Message-ID: <392522B5.4895ADEB@msede.com>
Date: Fri, 19 May 2000 13:17:09 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Disk failure->Error message indicates bug
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
From: Neil Brown <neilb@cse.unsw.edu.au>
To: mingo@elte.hu
Date: Fri, 19 May 2000 21:12:11 +1000 (EST)
Cc: Neil Brown <neilb@cse.unsw.edu.au>,
        "Andreas J. Koenig" <andreas.koenig@anima.de>,
        linux-raid@vger.rutgers.edu, linux-LVM@msede.com
Subject: Re: Disk failure->Error message indicates bug

For people on linux-LVM@msede.com, the context is the fact that RAID1
in the md driver uses b_rdev out of a failed I/O request to determine
the site of the failure, and if the underlying device remaps b_rdev -
as do RAID0 and LVM, it gets confused ....


On Friday May 19, mingo@elte.hu wrote:
> 
> On Fri, 19 May 2000, Neil Brown wrote:
> 
> > - md2 checks b_rdev to see which device was in error. It gets confused
> >   because sda12 is not part of md2.
> > 
> > The fix probably involves making sure that b_dev really does refer to
> > md0 (a quick look at the code suggests it actually refers to md2!) and
> > then using b_dev instead of b_rdev.
> 
> the fix i think is to not look at b_rdev in the error path (and anywhere
> else), at all. Just like we dont look at rsector.

By my reading we do look at rsector - or more specifically when a
request fails we don't reset it to b_blocknr*(b_size>>9) as we ought.

>  Do we need that
> information? b_rdev is in fact just for RAID0 and LINEAR, and i believe it
> would be cleaner to get rid of it altogether, and create a new
> encapsulated bh for every RAID0 request, like we do it in RAID1/RAID5.
> OTOH handling this is clearly more complex than RAID0 itself.
> 
> > Basically, b_rdev and b_rsector cannot be trusted after a call to
> > make_request, but they are being trusted.
> 
> yep. What about this solution:
> 
> md.c (or buffer.c) implements a generic pool of IO-related buffer-heads.
> This pool would have deadlock assurance, and allocation from this pool
> could never fail. This would already reduce the complexity of raid1.c and
> raid5.c bh-allocation. Then raid0.c and linear.c is changed to create a
> new bh for the mapping, which is hung off bh->b_dev_id. bh->b_rdev would
> be gone, ll_rw_blk looks at bh->b_dev. This also simplifies the handling
> of bhs.
> 
> i like this solution much better, and i dont think there is any
> significant performance impact (starting IO is heavy anyway), but it would
> clean up this issue for once and for all.
> 

Hmm. I certainly wouldn't want to apply this to 2.2 - too intrusive,
and it isn't really necessary.  We can easily identify some fields as
being "owned" by the caller and others being "owned" by the callee,
and using the appropriately.

For 2.3 ... I'll probably sit on the fence.  Maybe the LVM guys have
an opinion - hence I have included them on the Cc: list.

NeilBrown
