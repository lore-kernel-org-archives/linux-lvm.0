From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <200201050346.g053kmg29738@oss.sgi.com>
Message-Id: <Pine.LNX.4.33.0201042103110.11386-100000@chuckle.americas.sgi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Fri Jan  4 21:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

Ok, I've done a bit of kdb sleuthing over here... it looks like it's
blowing up shortly after lvm_snapshot_COW, although for some reason kdb
says the backtrace is from sys_stat64 after the oops.  On the other
hand, setting a breakpoint at
lvm_snapshot_COW, it oopses just a couple steps later.  Here's the
backtrace out of lvm_snapshot_COW.  It gets there from lvm_do_lv_creat
via unlockfs; does this make sense?  I didn't expect to get into
lvm_snapshot_COW until after the snapshot volume was created...

kdb> bp lvm_snapshot_COW
Instruction(i) BP #0 at 0xc8848ab4 ([lvm-mod]lvm_snapshot_COW)
    is enabled globally adjust 1
kdb> go
Instruction(i) breakpoint #0 at 0xc8848ab4 (adjusted)
0xc8848ab4 lvm_snapshot_COW:	int3

Entering kdb (current=0xc5ca0000, pid 1063) due to Breakpoint @ 0xc8848ab4
kdb> bt
    EBP       EIP         Function(args)
0xc5ca1718 0xc8848ab4 [lvm-mod]lvm_snapshot_COW (0x802, 0x10178, 0x10178,
0x10178, 0xc5e8f000)
                               lvm-mod .text 0xc8844060 0xc8848ab4
0xc8848fc0
           0xc884538b [lvm-mod]__remap_snapshot+0x5b (0x802, 0x10178,
0x10178, 0xc5b10a00, 0xc5e8f000)
                               lvm-mod .text 0xc8844060 0xc8845330
0xc88453b8
0xc5ca179c 0xc8845760 [lvm-mod]lvm_map+0x3a8 (0xc5777900, 0x1)
                               lvm-mod .text 0xc8844060 0xc88453b8
0xc88457e8
0xc5ca17ac 0xc88457f8 [lvm-mod]lvm_make_request_fn+0x10 (0xc039e028, 0x1,
0xc5777900)
                               lvm-mod .text 0xc8844060 0xc88457e8
0xc8845808
0xc5ca17d0 0xc01a004b generic_make_request+0xa7 (0x1, 0xc5777900)
                               kernel .text 0xc0100000 0xc019ffa4
0xc01a00d0
0xc5ca182c 0xc882caa2 [pagebuf]_pagebuf_page_io+0x24a (0xc116c400,
0xc5caa080, 0x1, 0x0, 0x3a00)
                               pagebuf .text 0xc882b060 0xc882c858
0xc882cb1c
0xc5ca1888 0xc882cc6b [pagebuf]_page_buf_page_apply+0x14f (0xc5caa080,
0x0, 0x0, 0xc116c400, 0x600)
                               pagebuf .text 0xc882b060 0xc882cb1c
0xc882cc78
0xc5ca18c8 0xc882d0a8 [pagebuf]pagebuf_segment_apply+0x98 (0xc882cb1c,
0xc5caa080)
                               pagebuf .text 0xc882b060 0xc882d010
0xc882d0f0
0xc5ca1908 0xc882cd64 [pagebuf]pagebuf_iorequest+0xec (0xc5caa080)
                               pagebuf .text 0xc882b060 0xc882cc78
0xc882cdb8
0xc5ca1914 0xc88c977a [xfs]xfsbdstrat+0x2a (0xc13cfc00, 0xc5caa080)
                               xfs .text 0xc8866060 0xc88c9750 0xc88c978c
0xc5ca1934 0xc88b20a8 [xfs]xfs_unmountfs_writesb+0xc4 (0xc13cfc00)
more>
                               xfs .text 0xc8866060 0xc88b1fe4 0xc88b2108
0xc5ca1944 0xc889ef4d [xfs]xfs_fs_thaw+0xd (0xc13cfc00)
                               xfs .text 0xc8866060 0xc889ef40 0xc889ef60
0xc5ca1ce0 0xc88c55b0 [xfs]xfs_ioctl+0x1684 (0xc5ca6058, 0xc5b11440, 0x0,
0xc0045878, 0x0)
                               xfs .text 0xc8866060 0xc88c3f2c 0xc88c5660
0xc5ca1d08 0xc88caabd [xfs]linvfs_unfreeze_fs+0x41 (0xc13cf400)
                               xfs .text 0xc8866060 0xc88caa7c 0xc88caacc
0xc5ca1d18 0xc0131469 unlockfs+0x31 (0x3a00)
                               kernel .text 0xc0100000 0xc0131438
0xc013148c
0xc5ca1da8 0xc8847174 [lvm-mod]lvm_do_lv_create+0x7fc (0x0, 0xc884ce60,
0xc5ca1dec, 0xc6482cc0)
                               lvm-mod .text 0xc8844060 0xc8846978
0xc88471ac
0xc5ca1f90 0xc8844900 [lvm-mod]lvm_chr_ioctl+0x644 (0xc5b11800,
0xc6482cc0, 0x4004fe20, 0xbfffec60, 0xc5ca0000)
                               lvm-mod .text 0xc8844060 0xc88442bc
0xc8844a0c
0xc5ca1fbc 0xc01393f4 sys_ioctl+0x174 (0x4, 0x4004fe20, 0xbfffec60,
0x804f1bc, 0xbffff940)
                               kernel .text 0xc0100000 0xc0139280
0xc0139410
           0xc0106c5b system_call+0x33
                               kernel .text 0xc0100000 0xc0106c28
0xc0106c60
