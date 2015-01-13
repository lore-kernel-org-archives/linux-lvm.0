Date: Tue, 13 Jan 2015 14:48:46 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131448240.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 3/7] thin-provisioning-tools: fix an ambiguous
 reference on g++-4.4 and older
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Thornber <thornber@redhat.com>, linux-lvm@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

Fix these errors:
thin-provisioning/thin_pool.cc:206: error: reference to 'sector_t' is ambiguous
./thin-provisioning/metadata.h:40: error: candidates are: typedef uint64_t thin_provisioning::sector_t
./block-cache/block_cache.h:20: error:                 typedef uint64_t bcache::sector_t
thin-provisioning/thin_pool.cc:206: error: reference to 'sector_t' is ambiguous
./thin-provisioning/metadata.h:40: error: candidates are: typedef uint64_t thin_provisioning::sector_t
./block-cache/block_cache.h:20: error:                 typedef uint64_t bcache::sector_t
thin-provisioning/thin_pool.cc:206: error: 'sector_t' does not name a type

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 thin-provisioning/thin_pool.cc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: thin-provisioning-tools/thin-provisioning/thin_pool.cc
===================================================================
--- thin-provisioning-tools.orig/thin-provisioning/thin_pool.cc	2014-11-05 16:14:22.000000000 +0100
+++ thin-provisioning-tools/thin-provisioning/thin_pool.cc	2014-11-05 16:14:45.000000000 +0100
@@ -203,7 +203,7 @@ thin_pool::get_nr_free_data_blocks() con
 	return md_->data_sm_->get_nr_free();
 }
 
-sector_t
+thin_provisioning::sector_t
 thin_pool::get_data_block_size() const
 {
 	return md_->sb_.data_block_size_;
