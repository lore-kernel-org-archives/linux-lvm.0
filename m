Date: Wed, 25 Jul 2012 17:04:34 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120725210434.GA20135@redhat.com>
References: <500C44EF.4080004@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <500C44EF.4080004@tlinx.org>
Subject: Re: [linux-lvm] RFE?  Really power of 2?  extents,
	chunks and raid alignment
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linda Walsh <lvm@tlinx.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jul 22 2012 at  2:22pm -0400,
Linda Walsh <lvm@tlinx.org> wrote:

> 
> 
> 
> I was trying to figure out why I didn't get performance out of my RAID,
> except when operating on really large files where it's many stripes
> v. 1 stripe.
> 
> I have 12 data disks in a RAID 50 (3 RAID5's in a RAID0) and use a suggested
> stripesize of 64k, so a stripe-width of 768k.
> 
> Some issues that have been nagging me though are getting my allocations
> lined up on 768k boundaries.  xfs is no prob -- tell it 64k and 12
> and it does it.
> 
> But I just realized that lvm doesn't really tell me where it is
> aligning things
> and worse, only lets me align both chunksizes for lv's and extents for vg's
> in powers of 2.   Um... Not a multiple of 4k? or 64k?
> 
> Am I wrong in thinking this would tend to give me both pv's and lv's that
> are very likely NOT to be stripe-width aligned, but, worse, not stripewidth
> alignable, at all.
> 
> This would mean that a high performance file system aware of RAID
> stripe with
> that tries to allocate chunks starting on a 768k boundary are likely
> to just
> get it completely wrong?  No?
> 
> Or what am I missing?

The DM update for the 3.6 merge window adds non power of 2 support in
the kernel (for the stripe and thin-pool targets).

So the lvm2 constraints that require a power of 2 chunksize will be
relaxed very shortly.
