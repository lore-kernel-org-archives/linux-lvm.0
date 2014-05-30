Date: Fri, 30 May 2014 09:55:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530135529.GC8830@redhat.com>
References: <20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530134642.GL1302@redhat.com>
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

On Fri, May 30 2014 at  9:46am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> I have now set both read_promote_adjustment ==
> write_promote_adjustment == 0 and used drop_caches between runs.
> 
> I also read Documentation/device-mapper/cache-policies.txt at Heinz's
> suggestion.
> 
> I'm afraid the performance of the fio test is still not the same as
> the SSD (4.8 times slower than the SSD-only test now).

Obviously not what we want.  But you're not doing any repeated IO to
those blocks.. it is purely random right?

So really, the cache is waiting for blocks to get promoted from the
origin if the IOs from fio don't completely cover the cache block size
you've specified.

Can you go back over those settings?  From your dmsetup table output you
shared earlier in the thread you're using a blocksize of 128 sectors (or
64K).  And your fio random write workload is using 64K.

So unless you have misaligned IO you _should_ be able to avoid reading
from the origin.  But XFS is in play here.. I'm wondering if it is
issuing IO differently than we'd otherwise see if you were testing
against the block devices directly...
 
> Would repeated runs of (md5sum virt.* ; echo 3 > /proc/sys/vm/drop_caches)
> not eventually cause the whole file to be placed on the SSD?
> It does seem very counter-intuitive if not.

If you set read_promote_adjustment to 0 it should pull the associated
blocks into the cache.  What makes you think it isn't?  How are you
judging the performance of the md5sum IO?  Do you see IO being issued to
the origin via blktrace or something?
