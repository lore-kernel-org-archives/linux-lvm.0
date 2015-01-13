Date: Tue, 13 Jan 2015 14:48:19 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131447570.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 2/7] thin-provisioning-tools: fix error on
 g++-4.4 and older
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
caching/superblock.cc:306: error: reference to 'validator' is ambiguous
caching/superblock.cc:271: error: candidates are: namespace validator { }
./block-cache/block_cache.h:22: error:                 class bcache::validator

caching/superblock.cc:316: error: reference to 'validator' is ambiguous
caching/superblock.cc:271: error: candidates are: namespace validator { }
./block-cache/block_cache.h:22: error:                 class bcache::validator

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 caching/superblock.cc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: thin-provisioning-tools/caching/superblock.cc
===================================================================
--- thin-provisioning-tools.orig/caching/superblock.cc	2014-11-05 16:10:19.000000000 +0100
+++ thin-provisioning-tools/caching/superblock.cc	2014-11-05 16:10:23.000000000 +0100
@@ -302,8 +302,9 @@ namespace validator {
 superblock
 caching::read_superblock(block_manager<>::ptr bm, block_address location)
 {
+	using namespace validator;
 	superblock sb;
-	block_manager<>::read_ref r = bm->read_lock(location, validator::mk_v());
+	block_manager<>::read_ref r = bm->read_lock(location, mk_v());
 	superblock_disk const *sbd = reinterpret_cast<superblock_disk const *>(r.data());
 	superblock_traits::unpack(*sbd, sb);
 
@@ -313,7 +314,8 @@ caching::read_superblock(block_manager<>
 void
 caching::write_superblock(block_manager<>::ptr bm, superblock const &sb, block_address location)
 {
-	block_manager<>::write_ref w = bm->superblock_zero(location, validator::mk_v());
+	using namespace validator;
+	block_manager<>::write_ref w = bm->superblock_zero(location, mk_v());
 	superblock_traits::pack(sb, *reinterpret_cast<superblock_disk *>(w.data()));
 }
 
