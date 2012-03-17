From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 17 Mar 2012 20:16:53 +0200
Message-Id: <1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <20120317175827.GB12111@agk-dp.fab.redhat.com>
References: <20120317175827.GB12111@agk-dp.fab.redhat.com>
Subject: [linux-lvm] [PATCH] mtd: sm_ftl: fix typo in major number.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, John Mesmon <jmesmon@gmail.com>, Alasdair G Kergon <agk@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

major == 0 allocates dynamic major, not major == -1

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/sm_ftl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 072ed59..9e2dfd5 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1256,7 +1256,7 @@ static void sm_remove_dev(struct mtd_blktrans_dev *dev)
 
 static struct mtd_blktrans_ops sm_ftl_ops = {
 	.name		= "smblk",
-	.major		= -1,
+	.major		= 0,
 	.part_bits	= SM_FTL_PARTN_BITS,
 	.blksize	= SM_SECTOR_SIZE,
 	.getgeo		= sm_getgeo,
-- 
1.7.9.1
