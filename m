Return-Path: <mason@suse.com>
Date: Sun, 29 Apr 2001 21:48:03 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <688980000.988595283@tiny>
In-Reply-To: <01041313295800.02991@oscar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Re: [reiserfs-list] mounting reiserfs snapshot fails
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
Content-Type: text/plain; charset="us-ascii"
To: Ed Tomlinson <tomlins@cam.org>, reiserfs-list@namesys.com
Cc: linux-lvm@sistina.com


On Friday, April 13, 2001 01:29:58 PM -0400 Ed Tomlinson <tomlins@cam.org>
wrote:

> Hi,
> 
> Using debian sid, 2.4.3-ac5, lvm 0.91 beta7, with the vfs locking
> patch applied I get:
> 
> oscar# mount /dev/lv/snap /snap -t reiserfs -oro
> mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
>        or too many mounted file systems
> 
> When trying to mount the snap shot.  It was created with: 
> lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
> without problems

I'm not sure what you're doing that I wasn't, but I've tried a bunch of
times to reproduce this over the last few weeks.  Tonight I finally did ;-)

The bug is that reiserfs needs to try harder to wait for the current
transaction to end.  A slight change in the semantics there didn't get
carried into the reiserfs write_super_lockfs call (reiserfs_block_writes
used to be enough on its own).  

But, it only hits when LVM can create the snapshot faster than the next
reiserfs writer can commit the transaction, which doesn't happen often for
me.

Anyway, here's a patch (VFS locking patch for 2.4.4 will follow in a sec).

-chris

diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c	Sun Apr 29 20:44:38 2001
+++ b/fs/reiserfs/super.c	Sun Apr 29 20:44:38 2001
@@ -80,7 +80,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = dirty;
   unlock_kernel() ;
