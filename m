From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot resizing memory leak
Message-ID: <20030304125855.B19923@sistina.com>
References: <3E63C91A.9030803@mac.com>
Mime-Version: 1.0
In-Reply-To: <3E63C91A.9030803@mac.com>; from dalestephenson@mac.com on Mon, Mar 03, 2003 at 01:28:58PM -0800
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
Date: Tue Mar  4 06:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dale,

thanks for finding this one.
Could you please give the LVM version you patched in future posts ?

Regards,
Heinz    -- The LVM Guy --

On Mon, Mar 03, 2003 at 01:28:58PM -0800, Dale J. Stephenson wrote:
> It looks like the current lvm code still has the memory leak when 
> resizing snapshots.  The lv_block_exception and lv_snapshot_hash_table 
> fields are set to ones newly allocated for the new size, but the old 
> ones are not freed.  The following patch should fix it:
> 
> --- linux/drivers/md/lvm.c.orig	Thu Mar 14 08:21:16 2002
> +++ linux/drivers/md/lvm.c	Thu Mar 14 08:23:07 2002
> @@ -2489,6 +2489,8 @@
>  		memcpy(new_lv->lv_block_exception,
>  		       old_lv->lv_block_exception, size);
>  
> +		vfree(old_lv->lv_block_exception);
> +		vfree(old_lv->lv_snapshot_hash_table);
>  		old_lv->lv_remap_end = new_lv->lv_remap_end;
>  		old_lv->lv_block_exception = new_lv->lv_block_exception;
>  		old_lv->lv_snapshot_hash_table =
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
