Date: Fri, 30 May 2014 16:53:59 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530205358.GA11399@redhat.com>
References: <20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
	<20140530142926.GA9219@redhat.com>
	<20140530143659.GP1302@redhat.com>
	<20140530144453.GD9219@redhat.com>
	<20140530145152.GQ1302@redhat.com>
	<20140530145802.GA9373@redhat.com>
	<20140530152858.GR1302@redhat.com>
	<20140530181648.GA10285@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530181648.GA10285@redhat.com>
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
Cc: Heinz Mauelshagen <heinzm@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Fri, May 30 2014 at  2:16pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Fri, May 30 2014 at 11:28am -0400,
> Richard W.M. Jones <rjones@redhat.com> wrote:
> > 
> > This time the LVM cache test is about 10% slower than the HDD test.
> > I'm not sure what to make of that at all.
> 
> It could be that the 32k cache blocksize increased the metadata overhead
> enough to reduce the performance to that degree.
> 
> And even though you recreated the filesystem it still could be the case
> that the IO issued from ext4 is slightly misaligned.  I'd welcome you
> going to back to a blocksize of 64K (you don't _need_ to go to 64K but it
> seems you're giving up quite a bit of performance now).  And then
> collecting blktraces of the origin volume for the fio run -- to see if
> 64K * 2 IOs are being issued for each 64K fio IO.  I would think it
> would be fairly clear from the blktrace but maybe not.

Thinking about this a little more: if the IO that ext4 is issuing to the
cache is aligned on a blocksize boundary (e.g. 64K) we really shouldn't
see _any_ IO from the origin device when you are running fio.  The
reason is we avoid promoting (aka copying) from the origin if an entire
cache block is being overwritten.

Looking at the fio output from the cache run you did using the 32K
blocksize it is very clear that the MD array (on sda and sdb) is
involved quite a lot.

And your even older fio run output when using the original 64K blocksize
shows a bunch of IO to md127...

So it seems fairly clear that dm-cache isn't utilizing the cache block
overwrite optimization it has to avoid promotions from the origin.  This
would _seem_ to validate my concern about alignment.. or something else
needs to explain why we're not able to avoid promotions.

If you have time to reconfigure with 64K blocksize and rerun the fio
test, please look at the amount of write IO performed by md127 (and sda
and sdb).. and also look at the number of promotions, via 'dmsetup
status' for the cache device, before and after the fio run.

We can try to reproduce using a pristine ext4 filesystem ontop of
MD with the fio job you provided... and I'm now wondering if we're
getting bitten by DM stacked on MD (due to bvec merge being limited to 1
page, see linux.git commit 8cbeb67a for some additional context).  So it
may be worth trying _without_ MD raid1 just as a test.  Use either sda
or sdb directly as the origin volume.
