From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Resizing snapshots leaks vmalloc memory
Message-Id: <20020314195940.A29763@sistina.com>
References: <2D0AFEFEE711D611923E009027D39F2B02F0EC@cdserv.meridian-data.com>
MIME-Version: 1.0
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F0EC@cdserv.meridian-data.com>;
    from dstephenson@snapserver.com on Thu, Mar 14, 2002 at 09:17:52AM -0800
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
Date: Thu Mar 14 13:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dale,

thanks for pointing this out.

Have changed it in CVS and will forward it to Marcelo with the next patches.

On Thu, Mar 14, 2002 at 09:17:52AM -0800, Stephenson, Dale wrote:
> When repeatedly resizing snapshots (both reducing and enlarging), I
> eventually would get VMALLOC failures.  Looking at the code, it looks like
> when snapshots are resized the old exception table and hash table are never
> freed.  A patch to address the problem follows.
> 
> Dale Stephenson
> steph@snapserver.com
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

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
