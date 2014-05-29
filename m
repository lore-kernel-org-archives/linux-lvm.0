Date: Thu, 29 May 2014 17:06:48 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140529210648.GA3955@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140529204719.GD1302@redhat.com>
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

On Thu, May 29 2014 at  4:47pm -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> On Thu, May 29, 2014 at 04:34:10PM -0400, Mike Snitzer wrote:
> > Try using :
> > dmsetup message <cache device> 0 write_promote_adjustment 0
> > 
> > Documentation/device-mapper/cache-policies.txt says:
> > 
> > Internally the mq policy maintains a promotion threshold variable.  If
> > the hit count of a block not in the cache goes above this threshold it
> > gets promoted to the cache.  The read, write and discard promote adjustment
> > tunables allow you to tweak the promotion threshold by adding a small
> > value based on the io type.  They default to 4, 8 and 1 respectively.
> > If you're trying to quickly warm a new cache device you may wish to
> > reduce these to encourage promotion.  Remember to switch them back to
> > their defaults after the cache fills though.
> 
> What would be bad about leaving write_promote_adjustment set at 0 or 1?
> 
> Wouldn't that mean that I get a simple LRU policy?  (That's probably
> what I want.)

Leaving them at 0 could result in cache thrashing.  But given how large
your SSD is in relation to the origin you'd likely be OK for a while (at
least until your cache gets quite full).
 
> > Also, if you discard the entire cache device (e.g. using blkdiscard)
> > before use you could get a big win, especially if you use:
> > dmsetup message <cache device> 0 discard_promote_adjustment 0
> 
> To be clear, that means I should do:
> 
> lvcreate -L 1G -n lv_cache_meta vg_guests /dev/fast
> lvcreate -L 229G -n lv_cache vg_guests /dev/fast
> lvconvert --type cache-pool --poolmetadata vg_guests/lv_cache_meta vg_guests/lv_cache
> blkdiscard /dev/vg_guests/lv_cache
> lvconvert --type cache --cachepool vg_guests/lv_cache vg_guests/testoriginlv
> 
> Or should I do the blkdiscard earlier?

You want to discard the cached device before you run fio against it.
I'm not completely sure what cache-pool vs cache is.  But it looks like
you'd want to run the discard against the /dev/vg_guests/testoriginlv
(assuming it was converted to use the 'cache' DM target, 'dmsetup table
vg_guests-testoriginlv' should confirm as much).

> [On the separate subject of volume groups ...]
> 
> Is there a reason why fast and slow devices need to be in the same VG?
> 
> I've talked to two other people who found this very confusing.  No one
> knew that you could manually place LVs into different PVs, and it's
> something of a pain to have to remember to place LVs every time you
> create or resize one.  It seems it would be a lot simpler if you could
> have the slow PVs in one VG and the fast PVs in another VG.

I cannot answer the lvm details.  Best to ask Jon Brassow or Zdenek
(hopefully they'll respond)
