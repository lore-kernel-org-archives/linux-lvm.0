Date: Fri, 23 Apr 2004 15:08:06 -0700
From: Dave Olien <dmo@osdl.org>
Message-ID: <20040423220806.GA29188@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] trivial patch to trivial patch to dm-table.c
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
To: linux-lvm@redhat.com, linux-kernel@vger.kernel.org
Cc: thornber@redhat.com



Hi, Joe

Here's a trivial patch to call to dm_vcalloc().  The patch doesn't
actually change the behavior of the code.  But I think this change
makes the call more in the spirit of the declaration for dm_vcallc().

this is to your latest udm1 patch to 2.6.6-rc2.


diff -ur rc2-mm1-UDM1-original/drivers/md/dm-table.c rc2-mm1-UDM1-patched/drivers/md/dm-table.c
--- rc2-mm1-UDM1-original/drivers/md/dm-table.c	2004-04-23 14:53:20.000000000 -0700
+++ rc2-mm1-UDM1-patched/drivers/md/dm-table.c	2004-04-23 14:57:20.000000000 -0700
@@ -181,8 +181,8 @@
 	/*
 	 * Allocate both the target array and offset array at once.
 	 */
-	n_highs = (sector_t *) dm_vcalloc(sizeof(struct dm_target) +
-					  sizeof(sector_t), num);
+	n_highs = (sector_t *) dm_vcalloc(num, sizeof(struct dm_target) +
+					  sizeof(sector_t));
 	if (!n_highs)
 		return -ENOMEM;
 
