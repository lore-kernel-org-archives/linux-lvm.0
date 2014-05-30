Date: Fri, 30 May 2014 10:29:26 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530142926.GA9219@redhat.com>
References: <20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530142602.GN1302@redhat.com>
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

On Fri, May 30 2014 at 10:26am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> On Fri, May 30, 2014 at 03:54:49PM +0200, Heinz Mauelshagen wrote:
> > On 05/30/2014 03:46 PM, Richard W.M. Jones wrote:
> > >I have now set both read_promote_adjustment ==
> > >write_promote_adjustment == 0 and used drop_caches between runs.
> > 
> > Did you adjust "sequential_threshold 0" as well?
> > 
> > dm-cache tries to avoid promoting large sequential files to the cache,
> > because spindles have good bandwidth.
> > 
> > This is again because of the hot spot caching nature of dm-cache.
> 
> Setting this had no effect.
> 
> I starting to wonder if my settings are having any effect at all.
> 
> Here are the device-mapper tables:
> 
> $ sudo dmsetup table
> vg_guests-lv_cache_cdata: 0 419430400 linear 8:33 2099200
> vg_guests-lv_cache_cmeta: 0 2097152 linear 8:33 2048
> vg_guests-home: 0 209715200 linear 9:127 2048
> vg_guests-libvirt--images: 0 1677721600 cache 253:1 253:0 253:2 128 0 default 0
> vg_guests-libvirt--images_corig: 0 1677721600 linear 9:127 2055211008
> 
> And here is the command I used to set sequential_threshold to 0
> (there was no error and no other output):
> 
> $ sudo dmsetup message vg_guests-libvirt--images 0 sequential_threshold 0

sequential_threshold is only going to help the md5sum's IO get promoted
(assuming you're having it read a large file).

> Is there a way to print the current settings?
> 
> Could writethrough be enabled?  (I'm supposed to be using writeback).
> How do I find out?

dmsetup status vg_guests-libvirt--images

But I'm really wondering if your IO is misaligned (like my earlier email
brought up).  It _could_ be promoting 2 64K blocks from the origin for
every 64K IO.
