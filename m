Date: Thu, 29 May 2014 16:34:10 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140529203410.GG1954@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140529135246.GA31293@redhat.com>
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Thu, May 29 2014 at  9:52am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> I've done some more testing, comparing RAID 1 HDD with RAID 1 HDD + an
> SSD overlay (using lvm-cache).
> 
> I'm now using 'fio', with the following job file:
> 
> [virt]
> ioengine=libaio
> iodepth=4
> rw=randrw
> bs=64k
> direct=1
> size=1g
> numjobs=4

randrw isn't giving you increased hits to the same blocks.  fio does
have random_distribution controls (zipf and pareto) that are more
favorable for testing cache replacement policies (jens said that testing
caching algorithms is what motivated him to develop these in fio).

> I'm still seeing almost no benefit from LVM cache.  It's about 4%
> faster than the underlying, slow HDDs.  See attached runs.
> 
> The SSD LV is 200 GB and the underlying LV is 800 GB, so I would
> expect there is plenty of space to cache things in the SSD during the
> test.
> 
> For comparison, the fio tests runs about 11 times faster on the SSD.
> 
> Any ideas?

Try using :
dmsetup message <cache device> 0 write_promote_adjustment 0

Also, if you discard the entire cache device (e.g. using blkdiscard)
before use you could get a big win, especially if you use:
dmsetup message <cache device> 0 discard_promote_adjustment 0

Documentation/device-mapper/cache-policies.txt says:

Internally the mq policy maintains a promotion threshold variable.  If
the hit count of a block not in the cache goes above this threshold it
gets promoted to the cache.  The read, write and discard promote adjustment
tunables allow you to tweak the promotion threshold by adding a small
value based on the io type.  They default to 4, 8 and 1 respectively.
If you're trying to quickly warm a new cache device you may wish to
reduce these to encourage promotion.  Remember to switch them back to
their defaults after the cache fills though.
