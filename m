Date: Tue, 10 Aug 1999 14:39:41 -0500 (CDT)
From: David Teigland <teigland@lcse.umn.edu>
Subject: [linux-lvm] Re: PATCH: volume drivers in ll_rw_block
In-Reply-To: <37AFFA45.FAF773E@ep-ag.com>
Message-ID: <Pine.LNX.4.10.9908101134520.14241-100000@orinoco.lcse.umn.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Klaus Strebel <stb@ep-ag.com>
Cc: linux-raid@vger.rutgers.edu, linux-lvm@msede.com, gfs-devel@lcse.umn.edu

> the lvm_map-0.7 lacks one thing in ll_rw_blk.c, i show below in
> generic_map-2.2.10-raid what and where.

> -#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE
> -                major = MAJOR(bh[i]->b_dev);
> -                if ( major == LVM_BLK_MAJOR) {
> -                   int ret;
> -
> -                   if ( lvm_map_ptr == NULL) {
> -                              printk ( KERN_ERR
> -                               "Bad lvm_map_ptr in ll_rw_block\n");
> -                      goto sorry;
> -                   }
> -                   if ( ( ret = ( lvm_map_ptr) ( MINOR ( bh[i]->b_dev),
> -                                                 &bh[i]->b_rdev,
> -                                                 &bh[i]->b_rsector,
> -                                                 bh[i]->b_size >> 9,
> -                                                 rw)) != 0) {
> -                      printk ( KERN_ERR
> -                               "Bad lvm_map in ll_rw_block\n");
> -                      goto sorry;
> -                   }
> -                   /* remap major too ... */
> -                   major = MAJOR(bh[i]->b_rdev);
> -               }
> -#endif


Correct.  This chunk is no longer needed.  In the lvm_map-0.7 patch I
wasn't trying to fix everything from patch-2.2.10-LVM, only lvm.c.

To adhere with the generic mapping, patch-2.2.10-LVM should change in the
following ways:

 - remove all modifications to the function ll_rw_block()
 - remove all references to lvm_map from ll_rw_blk.c
 - lvm.c should include the changes in lvm_map-0.7

In other words, when using the generic mapping, the LVM stuff shouldn't
affect ll_rw_blk.c at all except the insertion of lvm_init at the very
end.  This simplifies the LVM patch.

Thanks for pointing that out.  I'm not sure if this addresses your fsck
problem or not.

David Teigland
