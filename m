Date: Tue, 13 Jan 2015 14:50:04 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131449380.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 5/7] thin-provisioning-tools: fix binary
 constants for g++-4.2 and older
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

g++-4.2 and older doesn't accept binary constants.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 persistent-data/space-maps/disk.cc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: thin-provisioning-tools/persistent-data/space-maps/disk.cc
===================================================================
--- thin-provisioning-tools.orig/persistent-data/space-maps/disk.cc	2014-11-08 00:38:27.000000000 +0100
+++ thin-provisioning-tools/persistent-data/space-maps/disk.cc	2014-11-08 00:38:51.000000000 +0100
@@ -112,7 +112,7 @@ namespace {
 			ref_t b1 = test_bit_le(bits, b * 2);
 			ref_t b2 = test_bit_le(bits, b * 2 + 1);
 			ref_t result = b2 ? 1 : 0;
-			result |= b1 ? 0b10 : 0;
+			result |= b1 ? 2 : 0;
 			return result;
 		}
 
@@ -165,7 +165,7 @@ namespace {
 				ref_t b1 = test_bit_le(bits, b * 2);
 				ref_t b2 = test_bit_le(bits, b * 2 + 1);
 				ref_t result = b2 ? 1 : 0;
-				result |= b1 ? 0b10 : 0;
+				result |= b1 ? 2 : 0;
 				it(offset + b, result);
 			}
 		}
