Date: Fri, 23 Apr 2004 15:16:37 -0700
From: Dave Olien <dmo@osdl.org>
Message-ID: <20040423221637.GA29746@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] trivial patch to dm-exception-store.c
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thornber@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-lvm@redhat.com


Here's another trivial patch to dm-exception-store.c  It just makes
some function declarations static.


diff -ur rc2-mm1-UDM1-original/drivers/md/dm-exception-store.c rc2-mm1-UDM1-patched/drivers/md/dm-exception-store.c
--- rc2-mm1-UDM1-original/drivers/md/dm-exception-store.c	2004-04-23 15:02:58.000000000 -0700
+++ rc2-mm1-UDM1-patched/drivers/md/dm-exception-store.c	2004-04-23 15:13:34.000000000 -0700
@@ -588,17 +588,17 @@
 	sector_t next_free;
 };
 
-void transient_destroy(struct exception_store *store)
+static void transient_destroy(struct exception_store *store)
 {
 	kfree(store->context);
 }
 
-int transient_read_metadata(struct exception_store *store)
+static int transient_read_metadata(struct exception_store *store)
 {
 	return 0;
 }
 
-int transient_prepare(struct exception_store *store, struct exception *e)
+static int transient_prepare(struct exception_store *store, struct exception *e)
 {
 	struct transient_c *tc = (struct transient_c *) store->context;
 	sector_t size = get_dev_size(store->snap->cow->bdev);
@@ -612,7 +612,7 @@
 	return 0;
 }
 
-void transient_commit(struct exception_store *store,
+static void transient_commit(struct exception_store *store,
 		      struct exception *e,
 		      void (*callback) (void *, int success),
 		      void *callback_context)
