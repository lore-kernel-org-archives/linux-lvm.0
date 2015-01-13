Date: Tue, 13 Jan 2015 14:51:13 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131450490.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 7/7] thin-provisioning-tools: test for old boost
	version
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

The file boost/random/uniform_int_distribution.hpp was introduced in boost
version 1.47. If we have older Boost, use random numbers from libc.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 unit-tests/bloom_filter_t.cc |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Index: thin-provisioning-tools/unit-tests/bloom_filter_t.cc
===================================================================
--- thin-provisioning-tools.orig/unit-tests/bloom_filter_t.cc	2015-01-13 03:22:38.000000000 +0100
+++ thin-provisioning-tools/unit-tests/bloom_filter_t.cc	2015-01-13 04:20:36.000000000 +0100
@@ -5,8 +5,16 @@
 #include "persistent-data/data-structures/array_block.h"
 #include "test_utils.h"
 
+#include <boost/version.hpp>
+
+#if BOOST_VERSION >= 104700
+#define HAVE_RANDOM_UNIFORM_INT_DISTRIBUTION
+#endif
+
 #include <boost/random/mersenne_twister.hpp>
+#ifdef HAVE_RANDOM_UNIFORM_INT_DISTRIBUTION
 #include <boost/random/uniform_int_distribution.hpp>
+#endif
 #include <utility>
 #include <deque>
 #include <vector>
@@ -40,10 +48,16 @@ namespace {
 
 			using namespace boost::random;
 
+#ifdef HAVE_RANDOM_UNIFORM_INT_DISTRIBUTION
 			boost::random::uniform_int_distribution<uint64_t> uniform_dist(0, max);
+#endif
 
 			while (r.size() < count) {
+#ifdef HAVE_RANDOM_UNIFORM_INT_DISTRIBUTION
 				block_address b = uniform_dist(rng_);
+#else
+				block_address b = random() % max;
+#endif
 				r.insert(b);
 			}
 
@@ -75,7 +89,9 @@ namespace {
 		space_map::ptr sm_;
 		transaction_manager tm_;
 
+#ifdef HAVE_RANDOM_UNIFORM_INT_DISTRIBUTION
 		boost::random::mt19937 rng_;
+#endif
 	};
 }
 
@@ -312,3 +328,4 @@ TEST_F(BloomFilterTests, false_positives
 }
 
 //----------------------------------------------------------------
+
