Date: Fri, 30 May 2014 10:44:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530144453.GD9219@redhat.com>
References: <20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
	<20140530142926.GA9219@redhat.com>
	<20140530143659.GP1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530143659.GP1302@redhat.com>
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

On Fri, May 30 2014 at 10:36am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> On Fri, May 30, 2014 at 10:29:26AM -0400, Mike Snitzer wrote:
> > sequential_threshold is only going to help the md5sum's IO get promoted
> > (assuming you're having it read a large file).
> 
> Note the fio test runs on the virt.* files.  I'm using md5sum in an
> attempt to pull those same files into the SSD.
> 
> > > Is there a way to print the current settings?
> > > 
> > > Could writethrough be enabled?  (I'm supposed to be using writeback).
> > > How do I find out?
> > 
> > dmsetup status vg_guests-libvirt--images
> 
> Here's dmsetup status on various objects:
> 
> $ sudo dmsetup table
> vg_guests-lv_cache_cdata: 0 419430400 linear 8:33 2099200
> vg_guests-lv_cache_cmeta: 0 2097152 linear 8:33 2048
> vg_guests-home: 0 209715200 linear 9:127 2048
> vg_guests-libvirt--images: 0 1677721600 cache 253:1 253:0 253:2 128 0 default 0
> vg_guests-libvirt--images_corig: 0 1677721600 linear 9:127 2055211008
> $ sudo dmsetup status vg_guests-libvirt--images
> 0 1677721600 cache 8 10162/262144 128 39839/3276800 1087840 821795 116320 2057235 0 39835 0 1 writeback 2 migration_threshold 2048 mq 10 random_threshold 4 sequential_threshold 0 discard_promote_adjustment 1 read_promote_adjustment 0 write_promote_adjustment 0
> $ sudo dmsetup status vg_guests-lv_cache_cdata
> 0 419430400 linear 
> $ sudo dmsetup status vg_guests-lv_cache_cmeta
> 0 2097152 linear 
> $ sudo dmsetup status vg_guests-libvirt--images_corig
> 0 1677721600 linear 
> 
> > But I'm really wondering if your IO is misaligned (like my earlier email
> > brought up).  It _could_ be promoting 2 64K blocks from the origin for
> > every 64K IO.
> 
> There's nothing obviously wrong ...

I'm not talking about alignment relative to the physical device's
limits.  I'm talking about alignment of ext4's data areas relative to
the 64K block boundaries.

Also a point of conern would be: how fragmented is the ext4 space?  It
could be that it cannot get contiguous 64K regions from the namespace.
If that is the case than a lot more IO would get pulled in.

Can you try reducing the cache blocksize to 32K (lowest we support at
the moment, it'll require you to remove the cache and recreate) to see
if performance for this 64K random IO workload improves?  If so it does
start to add weight to my alignment concerns.

Mike
