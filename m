Message-ID: <3E9F4A2C.9090806@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question about VFS Locking patch, why is a change needed?
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
Date: Fri Apr 18 16:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Folks,

I was analyzing the VFS locking patch and I wanted to know if someone 
could explain the purpose of a change in the reiserfs for me:

The change is:
Index: linus.21/fs/reiserfs/super.c
--- linus.21/fs/reiserfs/super.c Fri, 11 Jan 2002 10:14:59 -0500 root 
(linux/41_super.c 1.2.2.1.2.1.1.1 644)
+++ linus.21(w)/fs/reiserfs/super.c Mon, 28 Jan 2002 13:50:56 -0500 root 
(linux/41_super.c 1.2.2.1.2.1.1.1 644)
@@ -66,7 +66,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = dirty;
   unlock_kernel() ;

I tried LVM with and without this change even under heavy load and LVM 
can still create mountable snapshots of a reiser filesystem without the 
change.  Why is it there?

Thanks
-steve
