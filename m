Date: Tue, 13 Jan 2015 14:49:28 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131448510.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 4/7] thin-provisioning-tools: fix an error on
 g++ 4.3 and previous
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

Fix this error:
persistent-data/data-structures/bloom_filter.cc:10: error: integer constant is too large for 'unsigned long' type

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 persistent-data/data-structures/bloom_filter.cc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: thin-provisioning-tools/persistent-data/data-structures/bloom_filter.cc
===================================================================
--- thin-provisioning-tools.orig/persistent-data/data-structures/bloom_filter.cc	2014-11-05 16:11:48.000000000 +0100
+++ thin-provisioning-tools/persistent-data/data-structures/bloom_filter.cc	2014-11-05 16:12:14.000000000 +0100
@@ -7,7 +7,7 @@ using namespace persistent_data;
 //----------------------------------------------------------------
 
 namespace {
-	static const uint64_t m1 = 0x9e37fffffffc0001UL;
+	static const uint64_t m1 = 0x9e37fffffffc0001ULL;
 	static const unsigned bits = 18;
 
 	static uint32_t hash1(block_address const &b) {
