Date: Tue, 13 Jan 2015 14:47:52 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1501131447140.21211@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1411071921260.12579@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 1/7] thin-provisioning-tools: provide missing
	macros
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

Old glibc doesn't provide these macros, so we have to define them.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 base/endian_utils.h |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

Index: thin-provisioning-tools/base/endian_utils.h
===================================================================
--- thin-provisioning-tools.orig/base/endian_utils.h	2014-11-08 00:26:05.000000000 +0100
+++ thin-provisioning-tools/base/endian_utils.h	2014-11-08 00:26:20.000000000 +0100
@@ -25,6 +25,26 @@
 
 //----------------------------------------------------------------
 
+/* An old glic doesn't provide these macros */
+#if !defined(htole16) || !defined(le16toh) || !defined(htole32) || !defined(le32toh) || !defined(htole64) || !defined(le64toh)
+#include <byteswap.h>
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+#define htole16(x) (x)
+#define le16toh(x) (x)
+#define htole32(x) (x)
+#define le32toh(x) (x)
+#define htole64(x) (x)
+#define le64toh(x) (x)
+#else
+#define htole16(x) __bswap_16(x)
+#define le16toh(x) __bswap_16(x)
+#define htole32(x) __bswap_32(x)
+#define le32toh(x) __bswap_32(x)
+#define htole64(x) __bswap_64(x)
+#define le64toh(x) __bswap_64(x)
+#endif
+#endif
+
 namespace base {
 
 	// These are just little wrapper types to make the compiler
