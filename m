Date: Fri, 30 May 2014 09:38:14 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530133814.GB8830@redhat.com>
References: <20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530090422.GB31293@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Heinz Mauelshagen <heinzm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 30 2014 at  5:04am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> On Thu, May 29, 2014 at 05:58:15PM -0400, Mike Snitzer wrote:
> > On Thu, May 29 2014 at  5:19pm -0400, Richard W.M. Jones <rjones@redhat.com> wrote:
> > > I'm concerned that would delete all the data on the origin LV ...
> > 
> > OK, but how are you testing with fio at this point?  Doesn't that
> > destroy data too?
> 
> I'm testing with files.  This matches my final configuration which is
> to use qcow2 files on an ext4 filesystem to store the VM disk images.
> 
> I set read_promote_adjustment == write_promote_adjustment == 1 and ran
> fio 6 times, reusing the same test files.
> 
> It is faster than HDD (slower layer), but still much slower than the
> SSD (fast layer).  Across the fio runs it's about 5 times slower than
> the SSD, and the times don't improve at all over the runs.  (It is
> more than twice as fast as the HDD though).
> 
> Somehow something is not working as I expected.

Why are you setting {read,write}_promote_adjustment to 1?  I asked you
to set write_promote_adjustment to 0.

Your random fio job won't hit the same blocks, and md5sum likely uses
buffered IO so unless you set 0 for both the cache won't aggressively
cache like you're expecting.

I explained earlier in this thread that the dm-cache is currently a
"hotspot cache".  Not a pure writeback cache like you're hoping.  We're
working to make it fit your expectations (you aren't alone in expecting
more performance!)

> Back to an earlier point.  I wrote and you replied:
> 
> > > What would be bad about leaving write_promote_adjustment set at 0 or 1?
> > > Wouldn't that mean that I get a simple LRU policy?  (That's probably
> > > what I want.)
> >
> > Leaving them at 0 could result in cache thrashing.  But given how
> > large your SSD is in relation to the origin you'd likely be OK for a
> > while (at least until your cache gets quite full).
> 
> My SSD is ~200 GB and the backing origin LV is ~800 GB.  It is
> unlikely the working set will ever grow > 200 GB, not least because I
> cannot run that many VMs at the same time on the cluster.
> 
> So should I be concerned about cache thrashing?  Specifically: If the
> cache layer gets full, then it will send the least recently used
> blocks back to the slow layer, right?  (It seems obvious, but I'd like
> to check that)

Right, you should be fine.  But I'll defer to Heinz on more particulars
about the cache replacement strategy that is provided in this case for
the "mq" (aka multi-queue policy).
