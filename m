Date: Fri, 8 Sep 2000 00:11:09 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908001109.A23577@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <200009071825.MAA08578@lynx.turbolabs.com> <20000907234301.B21294@gruyere.muc.suse.de>
Mime-Version: 1.0
In-Reply-To: <20000907234301.B21294@gruyere.muc.suse.de>; from ak@suse.de on Thu, Sep 07, 2000 at 11:43:01PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: mge@sistina.com, linux-lvm@msede.com

On Thu, Sep 07, 2000 at 11:43:01PM +0200, Andi Kleen wrote:
> On Thu, Sep 07, 2000 at 12:25:07PM -0600, Andreas Dilger wrote:
> > Heinz,
> > Michael Kellen and I have been working to add LILO support for booting
> > from a LV (i.e. have /boot be an LV, and then not have ANY DOS partitions).
> 
> [...]
> 
> I did some similar work. I implemented an LVM_BMAP ioctl for LVM that
> simply translates a given block to a (dev_t, blocknr in dev). lilo 
> simply does a normal FIOBMAP and then calls LVM_BMAP for every block
> it gets. When the dev_t ever changes it complains loudly. Then it does
> its normal work with the resulting blocks.
> 
> It works ok. The only problem is that a standard PV cannot be used for
> booting, because it does leave any space for a MBR (it probably needs 
> a PV format revision that simply leaves 4K free) 

This would be a major change forcing us to move structures around in
existing installations..

There should be no problem with a partition based PV though.

> 
> > However, the main problem that we are having is that you cannot use
> > an LV device major/minor to do anything with liblvm.  All of the liblvm
> > functions use an LV name, it would be good to add an ioctl which takes
> > a dev_t (e.g. 0x3a01) and returns an LV name, or maybe an lv_t which
> > we can use with liblvm.  Along the same lines, it may be good to have
> > an ioctl which takes a dev_t and returns a vg_t of the VG which this LV
> > is a part of.  Finally, it would be good to take the code out of lvm_map()
> > which only does block/dev remapping (which lvm_map() will call), but
> > which also be called by an ioctl like FIBMAP.
> 
> I'm just calling lvm_bmap from my ioctl. It is easy enough (patch against
> 2.2 appended) 
> 

Thanks for providing the code Andi.

We can start from that but i like to extract the bare mapping code from
lvm_map() and call that one from bmap to have a cleaner interface.

> 
> --- include/linux/lvm.h.LVMBMAP	Wed Aug  2 18:44:26 2000
> +++ include/linux/lvm.h	Thu Aug 10 01:29:14 2000
> @@ -355,6 +355,10 @@
>  
>  /* lock the logical volume manager */
>  #define	LVM_LOCK_LVM            _IO ( 0xfe, 0x100)
> +
> +/* bmap, argument lv_bmap_t */
> +#define LV_BMAP		_IOWR ( 0xfe, 0x51, 1)
> +
>  /* END ioctls */
>  
>  
> @@ -534,7 +538,10 @@
>     ulong    new_pe;
>  } le_remap_req_t;
>  
> -
> +typedef struct lv_bmap {
> +    ulong lv_block;
> +    dev_t lv_dev;	    
> +} lv_bmap_t;
>  
>  /*
>   * Structure Logical Volume (LV) Version 1
> --- drivers/block/lvm.c.LVMBMAP	Sun Jul 30 01:55:16 2000
> +++ drivers/block/lvm.c	Thu Aug 10 04:53:17 2000
> @@ -1076,6 +1076,28 @@
>   *
>   ********************************************************************/
>  
> +static int lvm_user_bmap(struct inode *inode, struct lv_bmap *user_result) 
> +{ 
> +	struct buffer_head bh; 
> +	unsigned long block; 
> +	int err;
> +
> +	if (get_user(block, &user_result->lv_block)) 
> +		return -EFAULT; 	
> +
> +	memset(&bh,0,sizeof bh); 
> +	bh.b_size = 512; /* XXX */ 
> +	bh.b_rsector = block;
> +	bh.b_dev = bh.b_rdev = inode->i_dev;
> +	if ((err=lvm_map(&bh, READ)) < 0)  {
> +		printk("lvm map failed: %d\n", err); 
> +		return -EINVAL; 
> +	}	
> +
> +	return put_user(  kdev_t_to_nr(bh.b_rdev), &user_result->lv_dev) ||
> +		put_user(bh.b_rsector, &user_result->lv_block) ? -EFAULT : 0;
> +} 
> +
>  /*
>   * block device open routine
>   */
> @@ -1259,6 +1281,10 @@
>           vg[VG_BLK(minor)]->lv[LV_BLK(minor)]->lv_status = ( ulong) arg;
>           break;
>  
> +	case LV_BMAP:
> +		/* turn logical block into (dev_t, block). non privileged. */ 
> +		return lvm_user_bmap(inode, (struct lv_bmap *) arg);  		
> +		break; 
>  
>        /* set allocation flags of a logical volume */
>        case LV_SET_ALLOCATION:
> 
> 
> 
> 
> -Andi

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
