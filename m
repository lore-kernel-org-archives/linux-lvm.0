Return-Path: <eric@nutstreet.net>
Date: Fri, 17 Aug 2001 07:25:11 -0500 (CDT)
From: Eric Smith <eric@nutstreet.net>
Subject: Re: [linux-lvm] [PATCH] LVM 1.0 & Linux 2.4.9
In-Reply-To: <20010817112527.C450@btconnect.com>
Message-ID: <Pine.LNX.4.33.0108170723230.22688-100000@willow.nutstreet.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <thornber@btconnect.com>
Cc: linux-lvm@sistina.com

Are you sure this patch works?  I applied this to a clean lvm 1.0 and got:

[root@plum 1.0]# patch -p0 < /tmp/lvmpatch
patching file kernel/lvm-internal.h
patching file kernel/lvm-snap.c
Hunk #1 FAILED at 373.
Hunk #2 FAILED at 382.
Hunk #3 FAILED at 508.
3 out of 3 hunks FAILED -- saving rejects to file kernel/lvm-snap.c.rej
patching file kernel/lvm.c
Hunk #1 FAILED at 2452.
Hunk #2 FAILED at 2466.
2 out of 2 hunks FAILED -- saving rejects to file kernel/lvm.c.rej
patching file kernel/lvm.h
Hunk #1 succeeded@165 with fuzz 2.
patching file tools/lib/pv_read_uuidlist.c
[root@plum 1.0]#


????????






On Fri, 17 Aug 2001, Joe Thornber wrote:

> On Thu, Aug 16, 2001 at 10:40:52PM +0100, James Pattinson wrote:
> > Hi!
> >
> > Another day, another kernel to compile! But after applying LVM 1.0 to
> > 2.4.9 this evening, I found it didn't compile. It's to do with a mismatch
> > between the max and min macros in the kernel and in LVM. Here's a patch to
> > make things work:
>
> This is what I've checked in, just a few changes to ensure we still work
> with older kernels.
>
> - Joe
>
> --- kernel/lvm-internal.h	2001/07/10 13:19:25	1.5
> +++ kernel/lvm-internal.h	2001/08/17 10:21:19
> @@ -53,6 +53,12 @@
>  extern struct block_device_operations lvm_blk_dops;
>  #endif
>
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 4, 9)
> +#undef min
> +#undef max
> +#define min(type, a, b) (((a) < (b)) ? (a) : (b))
> +#define max(type, a, b) (((a) > (b)) ? (a) : (b))
> +#endif
>
>  /* debug macros */
>  #ifdef DEBUG_IOCTL
> --- kernel/lvm-snap.c	2001/06/27 12:03:09	1.5
> +++ kernel/lvm-snap.c	2001/08/17 10:21:20
> @@ -373,8 +373,8 @@
>
>  	blksize_org = lvm_get_blksize(org_phys_dev);
>  	blksize_snap = lvm_get_blksize(snap_phys_dev);
> -	max_blksize = max(blksize_org, blksize_snap);
> -	min_blksize = min(blksize_org, blksize_snap);
> +	max_blksize = max(int, blksize_org, blksize_snap);
> +	min_blksize = min(int, blksize_org, blksize_snap);
>  	max_sectors = KIO_MAX_SECTORS * (min_blksize>>9);
>
>  	if (chunk_size % (max_blksize>>9))
> @@ -382,7 +382,7 @@
>
>  	while (chunk_size)
>  	{
> -		nr_sectors = min(chunk_size, max_sectors);
> +		nr_sectors = min(int, chunk_size, max_sectors);
>  		chunk_size -= nr_sectors;
>
>  		iobuf->length = nr_sectors << 9;
> @@ -508,7 +508,7 @@
>
>  	buckets = lv->lv_remap_end;
>  	max_buckets = calc_max_buckets();
> -	buckets = min(buckets, max_buckets);
> +	buckets = min(unsigned long, buckets, max_buckets);
>  	while (buckets & (buckets-1))
>  		buckets &= (buckets-1);
>
> --- kernel/lvm.c	2001/07/13 11:40:42	1.39
> +++ kernel/lvm.c	2001/08/17 10:21:24
> @@ -2452,7 +2452,7 @@
>
>  	/* save availiable i/o statistic data */
>  	if (old_lv->lv_stripes < 2) {	/* linear logical volume */
> -		end = min(old_lv->lv_current_le, new_lv->lv_current_le);
> +		end = min(uint, old_lv->lv_current_le, new_lv->lv_current_le);
>  		for (l = 0; l < end; l++) {
>  			new_lv->lv_current_pe[l].reads +=
>  				old_lv->lv_current_pe[l].reads;
> @@ -2466,7 +2466,7 @@
>
>  		old_stripe_size = old_lv->lv_allocated_le / old_lv->lv_stripes;
>  		new_stripe_size = new_lv->lv_allocated_le / new_lv->lv_stripes;
> -		end = min(old_stripe_size, new_stripe_size);
> +		end = min(uint, old_stripe_size, new_stripe_size);
>
>  		for (i = source = dest = 0; i < new_lv->lv_stripes; i++) {
>  			for (j = 0; j < end; j++) {
>
> --- kernel/lvm.h	2001/08/16 14:31:45	1.25
> +++ kernel/lvm.h	2001/08/17 10:21:25
> @@ -165,14 +165,6 @@
>
>  #define	LVM_DIR_PREFIX	"/dev/"
>
> -#ifndef min
> -#define min(a,b) (((a)<(b))?(a):(b))
> -#endif
> -#ifndef max
> -#define max(a,b) (((a)>(b))?(a):(b))
> -#endif
> -
> -
>  /*
>   * i/o protocol version
>   *
>
>
> --- tools/lib/pv_read_uuidlist.c	2001/04/24 14:29:21	1.4
> +++ tools/lib/pv_read_uuidlist.c	2001/08/17 10:21:25
> @@ -74,7 +74,10 @@
>        goto pv_read_uuidlist_end;
>     }
>
> -   num = min(pv->pv_uuidlist_on_disk.size, LIST_SIZE);
> +   num = pv->pv_uuidlist_on_disk.size;
> +   if (LIST_SIZE < num)
> +	   num = LIST_SIZE;
> +
>     if (read(pv_handle, this_pv_uuidlist, num) != num) {
>        ret = -LVM_EPV_READ_UUIDLIST_READ;
>        goto pv_read_uuidlist_end;
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
