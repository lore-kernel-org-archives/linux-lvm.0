Return-Path: <jweber@valinux.com>
Date: Thu, 30 Nov 2000 14:04:48 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
In-Reply-To: <200011301948.eAUJm6k01893@webber.adilger.net>
Message-ID: <Pine.LNX.3.96.1001130135709.18793D-100000@beefcake.hdqt.valinux.com>
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
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@sistina.com, "Heinz J. Mauelshagen" <mauelshagen@sistina.com>

Okay, got my kdb fixed up and applied the patch but I've no idea if it
solves the issue, because I now have the OTHER problem I ran into prior
but didn't finish looking into yet.

It's the issue where when I do a vgchange -ay I get an oops, or in this
case I'm dropping to kdb.  I can not get my volume active again at this
point to see if the snapshotting problem exists yet. :)

Oh, I'm starting to think I'm running into the vgchange bug as a result of
the snapshot out of space bug?  I was unable to recreate it prior, but I
just did now.

I can recreate this at will now on my laptop, so if there's any registers
or such you'd like me to dig up, I'll be glad to dig into them via kdb for
you. :)

I'm attaching the kdb/oops output below if you'd care to take a look.

----
Nov 30 14:01:07 slippey kernel: Unable to handle kernel NULL pointer
dereference at virtual address 000001b0 
Nov 30 14:01:07 slippey kernel: current->tss.cr3 = 06183000, %cr3 =
06183000 
Nov 30 14:01:07 slippey kernel: *pde = 06180067 
Nov 30 14:01:07 slippey kernel: *pte = 00000000 
Nov 30 14:01:07 slippey kernel: Entering kdb due to panic @ 0xc01afdcf 
Nov 30 14:01:07 slippey kernel: eax = 0x00000000  ebx = 0xc7f900c0  ecx =
0x00000100  edx = 0x00000000   
Nov 30 14:01:07 slippey kernel: esi = 0xc7f900c0  edi = 0x0000ffff  esp =
0x00000400  eip = 0xc01afdcf   
Nov 30 14:01:07 slippey kernel: ebp = 0xc6185b0c   ss = 0x0000ffff   cs =
0x00000010  eflags = 0x00010246   
Nov 30 14:01:07 slippey kernel:  ds = 0xc0120018   es = 0x00000018
origeax = 0xffffffff  &regs = 0xc6185acc 
Nov 30 14:01:07 slippey kernel: kdb> bt 
Nov 30 14:01:07 slippey kernel:     EBP       EIP         Function(args) 
Nov 30 14:01:07 slippey kernel: 0xc6185b0c 0xc01afdcf
lvm_pv_get_number+0x3f( 0xc7f90000, 0xffff) 
Nov 30 14:01:07 slippey kernel: 0xc6185b64 0xc01b0062
lvm_snapshot_fill_COW_page+0x10e( 0xc7f90000, 0xc65aca00, 0x0) 
Nov 30 14:01:07 slippey kernel: 0xc6185bb8 0xc01ae2a3
lvm_do_lv_create+0x557( 0x0, 0xc6185c14, 0xc6185c14, 0xc5c09c40) 
Nov 30 14:01:07 slippey kernel: 0xc6185da8 0xc01ad5a1
lvm_do_vg_create+0x47d( 0x0, 0x158bc0, 0xc5c09c40, 0xffffffe7) 
Nov 30 14:01:07 slippey kernel: 0xc6185f90 0xc01aafaf
lvm_chr_ioctl+0x2bf( 0xc6160d70, 0xc5c09c40, 0x4004fe00, 0x158bc0,
0xc6184000) 
Nov 30 14:01:07 slippey kernel: 0xc6185fbc 0xc0137ebd  sys_ioctl+0x19d(
0x4, 0x4004fe00, 0x158bc0, 0x4, 0x158bc0) 
Nov 30 14:01:07 slippey kernel: 0xbffffa88 0xc010b83c  system_call 


Nov 30 14:01:07 slippey kernel: Oops: 0000 
Nov 30 14:01:07 slippey kernel: CPU:    0 
Nov 30 14:01:07 slippey kernel: EIP:    0010:[lvm_pv_get_number+63/76] 
Nov 30 14:01:07 slippey kernel: EFLAGS: 00010246 
Nov 30 14:01:07 slippey kernel: eax: 00000000   ebx: c7f900c0   ecx:
00000100   edx: 00000000 
Nov 30 14:01:07 slippey kernel: esi: c7f900c0   edi: 0000ffff   ebp:
c6185b0c   esp: c6185b08 
Nov 30 14:01:07 slippey kernel: ds: 0018   es: 0018   ss: 0018 
Nov 30 14:01:07 slippey kernel: Process vgchange (pid: 646, process nr:
38, stackpage=c6185000) 
Nov 30 14:01:07 slippey kernel: Stack: c7f90000 c6185b64 c01b0062 c7f90000
0000ffff 0000007e c65aca00 c65aca00  
Nov 30 14:01:07 slippey kernel:        00000900 00000000 c65aca00 c65acb68
c6185b50 c01b0a29 c03921c0 00000000  
Nov 30 14:01:07 slippey kernel:        0000007d c65aca00 c01b0abe 00000060
00000020 c5ad8000 00000000 c6185bb8  
Nov 30 14:01:07 slippey kernel: Call Trace:
[lvm_snapshot_fill_COW_page+270/468] (0) [lvm_do_lv_create+1367/1804] (88)
[lvm_do_vg_create+1149/1244] (84) [lvm_chr_ioctl+703/2032] (496)
[sys_ioctl+413/436] (488) [system_call+52/56] (44)  
Nov 30 14:01:07 slippey kernel: Code: 8b 80 b0 01 00 00 5b 5e 5f 89 ec 5d
c3 55 89 e5 83 ec 18 57  


On Thu, 30 Nov 2000, Andreas Dilger wrote:

> Date: Thu, 30 Nov 2000 12:48:06 -0700 (MST)
> From: Andreas Dilger <adilger@turbolinux.com>
> To: "Stephen C. Tweedie" <sct@redhat.com>
> Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@sistina.com,
>     jweber@valinux.com, "Heinz J. Mauelshagen" <mauelshagen@sistina.com>
> Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
> 
> Stephen writes:
> > So, is somebody else doing a read?  It could be ext3, conceivably, if
> > we had had an IO error previously on the buffer and the BH_uptodate
> > flag had been cleared: a subsequent access to the buffer by another
> > process would try to reread the buffer off disk, locking it
> > temporarily.
> 
> Considering that there was the "Bad lvm_map in ll_rw_block" message just
> before the oops, this would lead to the situation you are talking about.
> In ll_rw_block the error path at "sorry:" clears BH_Dirty and BH_Uptodate,
> and calls b_end_io() but does not necessarily unlock the buffer?
> 
> Looking at the code more closely, I see that I may have introduced a bug
> here, because I didn't understand what was going on:
> 
> - in lvm_map() we call lvm_snapshot_COW() and lvm_write_COW_table(), set "ret"
> - we return the last "ret" value to ll_rw_block()
> - ll_rw_block() fails if the lvm_map() return value is non-zero
> 
> Really, the lvm_map() call should NOT return an error if the snapshot write
> fails, because it needs to write the primary LV in this case.  The
> snapshot LV may fill up, and then be removed, but this should not affect
> the I/O on the primary LV.  There should only be an error if the primary
> LV mapping fails, which will only happen on an inactive or R/O LV, or if
> we try to write past the end of the LV.
> 
> *** Stephen, in case of ANY error inside lvm_map() should it unlock the buffer?
>     What do the low-level drivers do on an error?  ll_rw_block() will already
>     call b_end_io for us at "sorry:", but it still clearly causes a problem for
>     ext3.  This bug with the snapshots has only brought forth the *real* issue
>     of what to in case any of the other errors in lvm_map() happens.
> 
> 
> The simple fix for this problem is to remove "ret" from lvm_map, and always
> returning "0" at the end.  The first patch does this.  The second part cleans
> up a few other error return values, to follow the normal kernel "-ve is error"
> standard, and remove a bunch of needless gotos.  It is based on my reorg
> of lvm_map, so if the first patch (the one that should "hide" this bug)
> fails for you, just manually delete the 4 cases of "ret" in that function.
> 
> Cheers, Andreas
> ===========================================================================
> 
> --- lvm.c.orig	Sun Nov 19 20:35:44 2000
> +++ lvm.c	Thu Nov 30 12:17:17 2000
> @@ -1597,7 +1597,6 @@
>  static int lvm_map(struct buffer_head *bh, int rw)
>  {
>  	int minor = MINOR(bh->b_dev);
> -	int ret = 0;
>  	ulong index;
>  	ulong pe_start;
>  	ulong size = bh->b_size >> 9;
> @@ -1715,11 +1716,15 @@
>  			if (lvm_snapshot_remap_block(&rdev_tmp, &rsector_tmp,
>  						     pe_start, lv_ptr))
>  				continue;
> -			/* create a new mapping */
> -			if (!(ret = lvm_snapshot_COW(rdev_map, rsector_map,
> -						     pe_start, rsector_map,
> -						     lv_ptr)))
> -				ret = lvm_write_COW_table_block(vg_this,lv_ptr);
> +			/*
> +			 * Create a new mapping for this chunk.  If it fails,
> +			 * it will remove the snapshot, but this should not
> +			 * return the error to ll_rw_block(), which would stop
> +			 * the I/O on the primary LV copy.
> +			 */
> +			if (!lvm_snapshot_COW(rdev_map, rsector_map,
> +					      pe_start, rsector_map, lv_ptr))
> +				(void)lvm_write_COW_table_block(vg_this,lv_ptr);
>  		}
>  		up(&lv->lv_snapshot_org->lv_snapshot_sem);
>  	} else {	/* snapshot logical volume */
> @@ -1740,7 +1740,7 @@
>  	bh->b_rdev = rdev_map;
>  	bh->b_rsector = rsector_map;
>  
> -	return ret;
> +	return 0;
>  } /* lvm_map() */
>  
>  
> ===========================================================================
> --- lvm.c.orig	Sun Nov 19 20:35:44 2000
> +++ lvm.c	Thu Nov 30 12:17:17 2000
> @@ -2708,7 +2685,7 @@
>  			up(&lv_ptr->lv_snapshot_org->lv_snapshot_sem);
>  			vfree(lvbe_old);
>  			vfree(lvs_hash_table_old);
> -			return 1;
> +			return -ENOMEM;
>  		}
>  
>  		for (e = 0; e < lv_ptr->lv_remap_ptr; e++)
> --- lvm-snap.c.orig	Tue Nov 14 05:52:45 2000
> +++ lvm-snap.c	Thu Nov 30 11:52:57 2000
> @@ -295,7 +305,10 @@
>  	if (brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev,
>  		       blocks, blksize_snap, 0) != blksize_snap)
>  #endif
> -		goto fail_raw_write;
> +	{
> +		reason = "write error";
> +		goto error;
> +	}
>  
>  
>  	/* initialization of next COW exception table block with zeroes */
> @@ -323,7 +336,10 @@
>  		if (brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev,
>  			       blocks, blksize_snap, 0) != blksize_snap)
>  #endif
> -			goto fail_raw_write;
> +		{
> +			reason = "write error";
> +			goto error;
> +		}
>  	}
>  
>  
> @@ -334,13 +350,9 @@
>  	return 0;
>  
>  	/* slow path */
> - out:
> + error:
>  	lvm_drop_snapshot(lv_snap, reason);
> -	return 1;
> +	return -1;
> -
> - fail_raw_write:
> -	reason = "write error";
> -	goto out;
>  }
>  
>  /*
> @@ -366,8 +378,10 @@
>  	int max_sectors, nr_sectors;
>  
>  	/* check if we are out of snapshot space */
> -	if (idx >= lv_snap->lv_remap_end)
> -		goto fail_out_of_space;
> +	if (idx >= lv_snap->lv_remap_end) {
> +		reason = "out of space";
> +		goto error;
> +	}
>  
>  	/* calculate physical boundaries of source chunk */
>  	pe_off = org_pe_start % chunk_size;
> @@ -401,8 +415,10 @@
>  	min_blksize = min(blksize_org, blksize_snap);
>  	max_sectors = KIO_MAX_SECTORS * (min_blksize>>9);
>  
> -	if (chunk_size % (max_blksize>>9))
> -		goto fail_blksize;
> +	if (chunk_size % (max_blksize>>9)) {
> +		reason = "block size error";
> +		goto error;
> +	}
>  
>  	while (chunk_size)
>  	{
> @@ -420,7 +436,10 @@
>  		if (brw_kiovec(READ, 1, &iobuf, org_phys_dev,
>  			       blocks, blksize_org, 0) != (nr_sectors<<9))
>  #endif
> -			goto fail_raw_read;
> +		{
> +			reason = "read error";
> +			goto error;
> +		}
>  
>  		lvm_snapshot_prepare_blocks(blocks, snap_start,
>  					    nr_sectors, blksize_snap);
> @@ -431,7 +450,10 @@
>  		if (brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev,
>  			       blocks, blksize_snap, 0) != (nr_sectors<<9))
>  #endif
> -			goto fail_raw_write;
> +		{
> +			reason = "write error";
> +			goto error;
> +		}
>  	}
>  
>  #ifdef DEBUG_SNAPSHOT
> @@ -455,22 +477,9 @@
>  	return 0;
>  
>  	/* slow path */
> - out:
> + error:
>  	lvm_drop_snapshot(lv_snap, reason);
> -	return 1;
> +	return -1;
> -
> - fail_out_of_space:
> -	reason = "out of space";
> -	goto out;
> - fail_raw_read:
> -	reason = "read error";
> -	goto out;
> - fail_raw_write:
> -	reason = "write error";
> -	goto out;
> - fail_blksize:
> -	reason = "blocksize error";
> -	goto out;
>  }
>  
>  int lvm_snapshot_alloc_iobuf_pages(struct kiobuf * iobuf, int sectors)
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> 
