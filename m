Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103071957.f27Jvue20056@webber.adilger.net>
Subject: Re: [linux-lvm] EXT2-fs panic (device lvm(58,0)):
In-Reply-To: <3AA65DD7.B1256051@mbsmm.com> from Bill Clark at "Mar 7, 2001 11:12:07
 am"
Date: Wed, 7 Mar 2001 12:57:55 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Bill Clark writes:
> Not sure if this is a LVM problem or a ext2fs problem. It is happening
> with the 2.4.2 kernel and the 0.9 release of the LVM user tools.  
> 
> kernel: Kernel panic: EXT2-fs panic (device lvm(58,0)):
> load_block_bitmap: block_group >= groups_count - block_group = 131071,
> groups_count = 24
> 
> There is a 1gig+ file on the filesystem, and most operations on it seem
> to bring about the error.  

This sounds like an ext2 problem.  Can you send the output of "dumpe2fs"
so I can at least know what sort of filesystem parameters there are?
Also, the output from debugfs "stat <inode_number>" would help as well.

Basically, the error you are getting is impossible.  In all calls to
load_block_bitmap(), the "group number" is either checked directly, or
"block" (which is what is used to find "group number") is checked to be <
s_blocks_count, so by inference should return a valid group number.

The only remote possibility is in ext2_free_blocks() if block+count
overflows a 32-bit unsigned value.  Only 2 places call ext2_free_blocks()
with a count != 1, and ext2_free_data() looks to be OK.  The other
possibility is that i_prealloc_count is bogus - that is it!  Nowhere
is i_prealloc_count initialized to zero AFAICS.  On most filesystems,
this would return a "freeing blocks not in datazone" error (which ISTR
is reported on l-k on occasion), but in your case the filesystem is
large enough to have a valid block number.  Try this patch and let me
know if it works, so I can submit it.

Failing that, can you change the panic() call in ext2_panic() to a BUG()
so we can get a stack trace to see how we get into this situation?  KDB
would be even better, since it would also tell us the function parameters.

Cheers, Andreas
==========================================================================
diff -ru linux/fs/ext2/ialloc.c.orig linux/fs/ext2/ialloc.c
--- linux/fs/ext2/ialloc.c.orig	Fri Dec  8 18:35:54 2000
+++ linux/fs/ext2/ialloc.c	Wed Mar  7 12:22:11 2001
@@ -432,6 +444,7 @@
 	inode->u.ext2_i.i_file_acl = 0;
 	inode->u.ext2_i.i_dir_acl = 0;
 	inode->u.ext2_i.i_dtime = 0;
+	inode->u.ext2_i.i_prealloc_count = 0;
 	inode->u.ext2_i.i_block_group = i;
 	if (inode->u.ext2_i.i_flags & EXT2_SYNC_FL)
 		inode->i_flags |= S_SYNC;
diff -ru linux/fs/ext2/inode.c.orig linux/fs/ext2/inode.c
--- linux/fs/ext2/inode.c.orig	Tue Jan 16 01:29:29 2001
+++ linux/fs/ext2/inode.c	Wed Mar  7 12:05:47 2001
@@ -1048,6 +1038,7 @@
 	}
 	inode->i_generation = le32_to_cpu(raw_inode->i_generation);
 	inode->u.ext2_i.i_block_group = block_group;
+	inode->u.ext2_i.i_prealloc_count = 0;
 
 	/*
 	 * NOTE! The in-memory inode i_data array is in little-endian order
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
