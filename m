From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Extend/Reduce snapshot not updating VG's used PE
    count.
Message-Id: <20020506153334.D26606@sistina.com>
References: <2D0AFEFEE711D611923E009027D39F2B02F13F@cdserv.meridian-data.com>
MIME-Version: 1.0
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F13F@cdserv.meridian-data.com>;
    from dstephenson@snapserver.com on Wed, May 01, 2002 at 07:55:04AM -0700
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
Date: Mon May  6 08:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dale,

have integrated this one and probably found the bug for the wrong PE count
after reboot (VG reactivation) as well.

Testing now. Soon to be in CVS.

Regards,
Heinz    -- The LVM Guy --


On Wed, May 01, 2002 at 07:55:04AM -0700, Stephenson, Dale wrote:
> I've noticed that extending or reducing a snapshot doesn't seem to affect
> the used PE count of its volume group (as shown in places like
> /proc/lvm/global).  I haven't noticed any particular ill effects, but it is
> disconcerting.
> 
> The PE count for the PV *is* updated.  Strangely, after reboot (at least
> with lvm 1.0.3) the PE count for the PV does not include PEs used by
> snapshots.  As soon as a single snapshot is created, removed, extended, or
> reduced, it becomes correct again.  Again, I haven't noticed any particular
> ill effects.
> 
> Following is a patch that solves the first problem (but not the second) for
> lvm 1.0.3.  Looking at current CVS, I believe the problem still exists.  The
> first portion of the patch adjusts vg's pe_allocated field in
> __extend_reduce_snapshot().  The second portion of the patch updates the
> snapshot's lv_allocated_snapshot_le field to be correct after a resize in
> lvm_do_lv_extend_reduce().  No user space changes are required.
> 
> Dale J. Stephenson
> steph@snapserver.com
> 
> --- linux/drivers/md/lvm.c.orig	Mon Apr 29 08:50:41 2002
> +++ linux/drivers/md/lvm.c	Mon Apr 29 12:41:29 2002
> @@ -2280,6 +2280,9 @@
>  		return -ENOMEM;
>  	}
>  
> +	vg_ptr->pe_allocated -= old_lv->lv_allocated_snapshot_le;
> +	vg_ptr->pe_allocated += new_lv->lv_allocated_le;
> +
>  	return 0;
>  }
>  
> @@ -2409,6 +2412,8 @@
>  
>  		vfree(old_lv->lv_block_exception);
>  		vfree(old_lv->lv_snapshot_hash_table);
> +		old_lv->lv_allocated_snapshot_le = 
> +			new_lv->lv_allocated_le;
>  		old_lv->lv_remap_end = new_lv->lv_remap_end;
>  		old_lv->lv_block_exception = new_lv->lv_block_exception;
>  		old_lv->lv_snapshot_hash_table =
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
