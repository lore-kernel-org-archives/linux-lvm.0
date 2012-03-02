Date: Fri, 2 Mar 2012 12:17:12 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120302171712.GA14405@redhat.com>
References: <4F50CEB1.7040601@profitbricks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F50CEB1.7040601@profitbricks.com>
Subject: Re: [linux-lvm] LVM Thin Provisioning size limited to 16 GiB?
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
To: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 02 2012 at  8:44am -0500,
Sebastian Riemer <sebastian.riemer@profitbricks.com> wrote:

> Hi list,
> 
> I've tested LVM thin provisioning with the latest LVM user-space from
> git and today together with kernel 3.2.7.
> 
> I've got 24 SAS HDDs put together into 12 MD RAID-1 arrays. So I want to
> have a thin pool with striping over all RAID-1 arrays. But this seems to
> be size limited to 16 GiB. With bigger size the pool can't be activated
> and LVM can't be removed any more - forces me to reboot.
> 
> I've also tested to explicitly set the --poolmetadatasize to 16 GiB and
> the data pool to 100 GiB, but same result. I also did some benchmarks.
> Performance wasn't that bad, but could be really better (at least doubled).
> 
> Is this the current development state or do I do something wrong?

You haven't actually shown how you attempted to make use of a 100GB and
16GB metadatasize.

But the maximum metadata device size is 17112760320 sectors (or 15.9375
GB).

So try with 15GB (even though that is way larger than you need for 100GB
of data).

> Here are my commands:
>    vgcreate test /dev/md/test*
>    lvcreate -i 12 -I 64 -L 16G -T test/pool
>    lvcreate -V 45G -T test/pool -n test00
> 
> Furthermore, when writing and afterwards reading to/from the thin LV it
> is only possible with up to 11 GiB. Then there are messages like the
> following in the kernel log.
> 
>    device-mapper: space map metadata: out of metadata space
>    device-mapper: thin: dm_thin_insert_block() failed
> 
> Seems like pool meta-data and pool data aren't separated at current
> development state.

But in the above test, you've created a striped LV named /dev/test/pool
of 16GB.

And you've written 11GB to the test00 thin device.  And you're running
out of metadata space.

This implies to me that LVM2's size guesstimate for the proper data vs
metadata size split for a 16GB volume isn't conservative enough
(relative to metadata size).

Anyway, showing your 'dmsetup table' output would be helpful in the
future.

Mike
