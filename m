Date: Tue, 13 Jan 2015 14:50:45 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131450140.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 6/7] thin-provisioning-tools: fix typename error
 on g++-4.4 and older
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
unit-tests/array_block_t.cc:38: error: using 'typename' outside of template
unit-tests/array_block_t.cc:39: error: using 'typename' outside of template
unit-tests/array_block_t.cc:40: error: using 'typename' outside of template

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 unit-tests/array_block_t.cc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: thin-provisioning-tools/unit-tests/array_block_t.cc
===================================================================
--- thin-provisioning-tools.orig/unit-tests/array_block_t.cc	2014-11-08 01:42:09.000000000 +0100
+++ thin-provisioning-tools/unit-tests/array_block_t.cc	2014-11-08 01:42:18.000000000 +0100
@@ -35,9 +35,9 @@ using namespace testing;
 namespace {
 	uint64_t MAX_VALUE = 1000ull;
 	block_address const NR_BLOCKS = 1024;
-	typedef typename bcache::noop_validator noop_validator;
-	typedef typename block_manager<>::read_ref read_ref;
-	typedef typename block_manager<>::write_ref write_ref;
+	typedef bcache::noop_validator noop_validator;
+	typedef block_manager<>::read_ref read_ref;
+	typedef block_manager<>::write_ref write_ref;
 
 	// FIXME: lift to utils?
 	class simple_ref_counter {
