Date: Thu, 29 May 2014 17:58:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140529215815.GA4183@redhat.com>
References: <537E0D25.7010108@redhat.com> <20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140529211955.GE1302@redhat.com>
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

On Thu, May 29 2014 at  5:19pm -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> On Thu, May 29, 2014 at 05:06:48PM -0400, Mike Snitzer wrote:
> > On Thu, May 29 2014 at  4:47pm -0400,
> > Richard W.M. Jones <rjones@redhat.com> wrote:
> > > To be clear, that means I should do:
> > > 
> > > lvcreate -L 1G -n lv_cache_meta vg_guests /dev/fast
> > > lvcreate -L 229G -n lv_cache vg_guests /dev/fast
> > > lvconvert --type cache-pool --poolmetadata vg_guests/lv_cache_meta vg_guests/lv_cache
> > > blkdiscard /dev/vg_guests/lv_cache
> > > lvconvert --type cache --cachepool vg_guests/lv_cache vg_guests/testoriginlv
> > > 
> > > Or should I do the blkdiscard earlier?
> > 
> > You want to discard the cached device before you run fio against it.
> > I'm not completely sure what cache-pool vs cache is.  But it looks like
> > you'd want to run the discard against the /dev/vg_guests/testoriginlv
> > (assuming it was converted to use the 'cache' DM target, 'dmsetup table
> > vg_guests-testoriginlv' should confirm as much).
> 
> I'm concerned that would delete all the data on the origin LV ...

OK, but how are you testing with fio at this point?  Doesn't that
destroy data too?

The cache target doesn't have passdown support.  So none of your data
would be discarded directly, but it could eat data as a side-effect of
the cache bypassing promotion from the origin (because it thinks the
origin's blocks were discarded).  But on writeback you'd lose data.

So you raise a valid point: if you're adding a cache in front of a
volume with existing data you'll want to avoid discarding the logical
address space that contains data you want to keep.

Do you have a filesystem on the libvirt-images volume?  If so, would be
enough to run fstrim against /dev/vg_guests/libvirt-images

BTW, this is all with a eye toward realizing the optimization that
dm-cache provides for origin blocks that were discarded (like I said
before dm-cache doesn't promote from the origin if the corresponding
block was marked for discard).  So you don't _need_ to do any of
this.. purely about trying to optimize a bit more.

> My origin LV now has a slightly different name.  Here are the
> device-mapper tables:
> 
> $ sudo dmsetup table
> vg_guests-lv_cache_cdata: 0 419430400 linear 8:33 2099200
> vg_guests-lv_cache_cmeta: 0 2097152 linear 8:33 2048
> vg_guests-home: 0 209715200 linear 9:127 2048
> vg_guests-libvirt--images: 0 1677721600 cache 253:1 253:0 253:2 128 0 default 0
> vg_guests-libvirt--images_corig: 0 1677721600 linear 9:127 2055211008
> 
> So it does look as if my origin LV (vg_guests/libvirt-images) does use
> the 'cache' target.

Yeap.
