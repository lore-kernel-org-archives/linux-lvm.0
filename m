Return-Path: <thornber@btconnect.com>
Date: Fri, 17 Aug 2001 11:43:44 +0100
Subject: Re: [linux-lvm] Problem using lvreduce
Message-ID: <20010817114344.D450@btconnect.com>
References: <051DFF3BBA73D3119A5800A0C95BD021C03C32@barracuda.alpha-processor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <051DFF3BBA73D3119A5800A0C95BD021C03C32@barracuda.alpha-processor.com>; from soohoon.lee@api-networks.com on Thu, Aug 16, 2001 at 01:06:39PM -0400
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Soohoon,

On Thu, Aug 16, 2001 at 01:06:39PM -0400, Soohoon Lee wrote:
> 
> That's the problem what I had.
> I posted fix and waiting verification but 
> mail traffic saying they are busy with 1.0 release and PE start point
> problem.

If you think we're not attending something important, please repost
and kick up a fuss.  I do forget/miss things on the list.

> And seems, this problem is also related to that PE start point problem.
> Anyway, quick and no warranty fix is
> 
> 
> --- pv_release_pe.c.old Thu Aug 16 09:23:35 2001
> +++ pv_release_pe.c     Wed Aug 15 09:09:06 2001
> @@ -85,7 +85,7 @@
>           }
>           pe_index = ( vg->lv[l]->lv_current_pe[p].pe - 
>                        LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
> -                      vg->pe_size;
> +                      vg->pe_size - 1;
>           debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector: %lu\n",
>                    vg->pv[pv_num]->pv_name,
>                    pe_index,


This patch looks wrong, I cant see why anyone would want to divide by
pe_size - 1, if it's working it's by accident.

I'm not familiar with this bit of code, but what I think it's doing
is converting the le number 'p' into a pe number.  I suspect that for your
system the le numbers map directly onto the pe numbers, hence your comment
wondering why we don't just use 'p'.  The pe location changed recently so
I could well believe this calculation is wrong.

Heinz, 

Please confirm this is what this bit of code does.

If so we should introduce a companion for get_pe_offset that does the
opposite in liblvm.h:

static inline ulong get_pe_from_offset(ulong offset, pv_t *pv)
{
	return (offset - pv->pe_start) / pv->pe_size;
}

- Joe
