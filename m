Return-Path: <thornber@btconnect.com>
Date: Fri, 17 Aug 2001 14:14:33 +0100
Subject: Re: [linux-lvm] Problem using lvreduce
Message-ID: <20010817141433.A907@btconnect.com>
References: <051DFF3BBA73D3119A5800A0C95BD021C03C32@barracuda.alpha-processor.com> <20010817114344.D450@btconnect.com> <20010817150540.A19093@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010817150540.A19093@dragon.blacknet.de>; from bock@blacknet.de on Fri, Aug 17, 2001 at 03:05:40PM +0200
From: Joe Thornber <thornber@btconnect.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, Aug 17, 2001 at 03:05:40PM +0200, Goetz Bock wrote:
> 
> On Fri, Aug 17 '01 at 11:43, Joe Thornber wrote:
> > > --- pv_release_pe.c.old Thu Aug 16 09:23:35 2001
> > > +++ pv_release_pe.c     Wed Aug 15 09:09:06 2001
> > > @@ -85,7 +85,7 @@
> > >           }
> > >           pe_index = ( vg->lv[l]->lv_current_pe[p].pe - 
> > >                        LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
> > > -                      vg->pe_size;
> > > +                      vg->pe_size - 1;
> > >           debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector: %lu\n",
> > >                    vg->pv[pv_num]->pv_name,
> > >                    pe_index,
> > 
> > This patch looks wrong, I cant see why anyone would want to divide by
> > pe_size - 1, if it's working it's by accident.
> Disclamer: I did not lok at the code, and don't know what I
m talking
>            about ...
> 
> But, what this patch does, is devide by pe_size and substract 1 from the
> result.

doh, parse error !

Still wrong.

- Joe
