Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6GI8kgl008333
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 14:08:46 -0400
Received: from SMTP02.CITRIX.COM (smtp02.citrix.com [66.165.176.63])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6GI8ZMK030704
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 14:08:35 -0400
Subject: Re: [PATCH] [linux-lvm] vgchange -a memory consumption
From: Daniel Stodden <daniel.stodden@citrix.com>
In-Reply-To: <1216231344.16876.25.camel@desktop>
References: <1215842251.3751.53.camel@desktop>
	<20080712165145.GC7155@agk.fab.redhat.com>
	<1216102784.3751.78.camel@desktop> <1216226892.1130.3.camel@desktop>
	<20080716165243.GM7155@agk.fab.redhat.com>
	<1216228176.1130.13.camel@desktop>
	<20080716174240.GN7155@agk.fab.redhat.com>
	<1216231344.16876.25.camel@desktop>
Date: Wed, 16 Jul 2008 11:08:28 -0700
Message-Id: <1216231708.16876.31.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM <linux-lvm@redhat.com>

On Wed, 2008-07-16 at 11:02 -0700, Daniel Stodden wrote:
> On Wed, 2008-07-16 at 18:42 +0100, Alasdair G Kergon wrote:
> > Quick way for starters, is allocate a pointless object in the pool
> > then free eveything back to that point each time round the loop.
> 
> Thought so. Thanks for suggesting it.
> 
> > But proper thing is to track down into the library and find
> > which routines are the ones where the pool can be freed at
> > the end and isn't being.
> 
> Let's take lv_deactivate() in activate.c as an example.
> 
> We'd have
> 	lv = lv_from_lvid() 
> 
> and then would do a:
> 	dm_pool_free(lv->vg)
> 
> or something similar, because we know the VG is constructed before th LV
> can be found. That's what I meant with 'non-obvious'.
> 
> That example wasn't even a very good fix, because it appears to still
> leave a tip hanging around. Didn't figure exactly what it was.

Did you ever consider to have the part behind lock_vol() allocate it's
own pool (let's call it tmp) for temporary storage? So e.g.
lv_from_lvid() would read the VG into tmp and the lv it actally returns
into cmd->mem?

That would be a much larger change, but probably the cleaner way to do
it.

... not like I'm looking for extra work or something :]

Best,
Daniel
