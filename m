From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot resizing pe_allocated correction
Message-ID: <20030304131239.A20001@sistina.com>
References: <3E63CCA0.3000908@mac.com>
Mime-Version: 1.0
In-Reply-To: <3E63CCA0.3000908@mac.com>; from dalestephenson@mac.com on Mon, Mar 03, 2003 at 01:44:00PM -0800
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
Date: Tue Mar  4 06:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Accepted.

Please send patches relative to the head of CVS.

Thanks,
Heinz    -- The LVM Guy --


On Mon, Mar 03, 2003 at 01:44:00PM -0800, Dale J. Stephenson wrote:
> Another slight fix.  When a snapshot is resized, the volume groups' 
> pe_allocated field is not updated.  The following patch should fix this 
> problem:
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
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
