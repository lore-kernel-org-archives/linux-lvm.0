Return-Path: <soohoon.lee@api-networks.com>
Message-ID: <051DFF3BBA73D3119A5800A0C95BD021C03C34@barracuda.alpha-processor.com>
From: Soohoon Lee <soohoon.lee@api-networks.com>
Subject: RE: [linux-lvm] Problem using lvreduce
Date: Fri, 17 Aug 2001 11:33:11 -0400
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Well, got attentions!
Thanks.

Actually I don't know well LVM.
I've been using this for two weeks so far
So if you say it's wrong then it'll be wrong but to get
real fix, I like to tell you what I had.
First of all, lvreduce/lvextend doesn't work. It's very easly reprodusable.
And I found that problem is when it releases PEs,
Let's say a VG has 0-9 PEs and going to release half of them,
It releases 6-10! and seems origin of that mis calculation is the formular.
           pe_index = ( vg->lv[l]->lv_current_pe[p].pe - 
                        LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
                        vg->pe_size;
If I replace variables to real values for PE[0]
	   1        =  (8352 -
                              81920 / 512) /
                              8192;
I don't know which value is wrong but what I needed to get was -1 of the
result.
And it worked, I tried create/reduce/extend many times to have multiple VGs
fragmented
but it still works.
So I could tell, -1 wouldn't be a real fix but problem is very close to
that.

Soohoon.


-----Original Message-----
From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
Sent: Friday, August 17, 2001 10:39 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Problem using lvreduce


On Fri, Aug 17, 2001 at 11:43:44AM +0100, Joe Thornber wrote:
> Soohoon,
> 
> On Thu, Aug 16, 2001 at 01:06:39PM -0400, Soohoon Lee wrote:
> > 
> > That's the problem what I had.
> > I posted fix and waiting verification but 
> > mail traffic saying they are busy with 1.0 release and PE start point
> > problem.
> 
> If you think we're not attending something important, please repost
> and kick up a fuss.  I do forget/miss things on the list.
> 
> > And seems, this problem is also related to that PE start point problem.
> > Anyway, quick and no warranty fix is
> > 
> > 
> > --- pv_release_pe.c.old Thu Aug 16 09:23:35 2001
> > +++ pv_release_pe.c     Wed Aug 15 09:09:06 2001
> > @@ -85,7 +85,7 @@
> >           }
> >           pe_index = ( vg->lv[l]->lv_current_pe[p].pe - 
> >                        LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
> > -                      vg->pe_size;
> > +                      vg->pe_size - 1;
> >           debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector:
%lu\n",
> >                    vg->pv[pv_num]->pv_name,
> >                    pe_index,
> 
> 
> This patch looks wrong, I cant see why anyone would want to divide by
> pe_size - 1, if it's working it's by accident.
> 
> I'm not familiar with this bit of code, but what I think it's doing
> is converting the le number 'p' into a pe number.
> I suspect that for your
> system the le numbers map directly onto the pe numbers, hence your comment
> wondering why we don't just use 'p'.  The pe location changed recently so
> I could well believe this calculation is wrong.
> 
> Heinz, 
> 
> Please confirm this is what this bit of code does.

Yes, a pe index in the range of 0 to n.
With the patch that will well result in -1 to n-1, wich is wrong.

> 
> If so we should introduce a companion for get_pe_offset that does the
> opposite in liblvm.h:
> 
> static inline ulong get_pe_from_offset(ulong offset, pv_t *pv)
> {
> 	return (offset - pv->pe_start) / pv->pe_size;
> }
> 
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
