Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i43NKMv31493
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 19:20:22 -0400
Received: from fukurou.paranoiacs.org
	(eddie@adsl-216-158-28-251.cust.oldcity.dca.net [216.158.28.251])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i43NKJkG004624
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 19:20:19 -0400
Received: from fukurou.paranoiacs.org (eddie@localhost [127.0.0.1])
	by fukurou.paranoiacs.org (8.12.10/8.12.10) with ESMTP id
	i43NKKe7011539
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 19:20:20 -0400
Received: (from sluskyb@localhost)
	by fukurou.paranoiacs.org (8.12.10/8.12.10/Submit) id i43NKKx0011538
	for linux-lvm@redhat.com; Mon, 3 May 2004 19:20:20 -0400
Date: Mon, 3 May 2004 19:20:20 -0400
From: Ben Slusky <sluskyb@paranoiacs.org>
Message-ID: <20040503232018.GD7384@fukurou.paranoiacs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] crypto for LVM2
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
To: linux-lvm@redhat.com


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello LVM people,

I'd like to submit for discussion this patch (against version 2.00.08),
which adds the ability to create and manipulate encrypted volumes, using
the dm-crypt target that was merged into kernel 2.6.4.

From the user's perspective, there are now two more options to lvcreate:
-e or --encryption, to specify the cipher; and -E or --keysize, to specify
the key size (in bits). These options can also be used with lvchange,
as can the -k or --changekey option, which will prompt the user for a
new key.

The encryption key is not stored with the metadata, as that would
kinda defeat the purpose of encryption. LVM will ask for it when it's
needed. That turns out to be about often enough, IMHO.

Other points to note:

* LVM accepts the key as a raw hexadecimal string. That's not pretty
  but it keeps LVM out of the key management business, which I believe is
  a Good Thing. For your basic encryption with a passphrase, I recommend
  using hashalot[1]: hashalot -x sha512 |lvcreate ... should do the trick.

* If you try to create an encrypted and striped volume, lvcreate will
  inform you that this isn't possible. The necessary support for
  compound volumes just isn't there. I assume that's somewhere down
  the line in the development plan?

Questions? Comments? Flames?
-
-Ben

[1] <URL:http://www.paranoiacs.org/~sluskyb/hacks/hashalot/>

-- 
Ben Slusky                      | "O Lord, make my enemies
sluskyb@paranoiacs.org          |  ridiculous."
sluskyb@stwing.org              |               -Voltaire
PGP keyID ADA44B3B      



--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm-crypto.diff"

diff -pruN LVM2.2.00.08/configure LVM2.2.00.08+crypto/configure
--- LVM2.2.00.08/configure	2003-11-06 12:14:05.000000000 -0500
+++ LVM2.2.00.08+crypto/configure	2004-04-25 11:32:32.000000000 -0400
@@ -1997,7 +1997,7 @@ fi
 
 fi
 
-for ac_func in mkdir rmdir uname
+for ac_func in mkdir rmdir uname mlock sysconf
 do
 echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
 echo "configure:2004: checking for $ac_func" >&5
diff -pruN LVM2.2.00.08/configure.in LVM2.2.00.08+crypto/configure.in
--- LVM2.2.00.08/configure.in	2003-11-06 12:14:05.000000000 -0500
+++ LVM2.2.00.08+crypto/configure.in	2004-02-08 14:57:46.000000000 -0500
@@ -130,7 +130,7 @@ dnl Checks for library functions.
 AC_PROG_GCC_TRADITIONAL
 AC_TYPE_SIGNAL
 AC_FUNC_VPRINTF
-AC_CHECK_FUNCS(mkdir rmdir uname)
+AC_CHECK_FUNCS(mkdir rmdir uname mlock sysconf)
 
 dnl check for termcap (Shamelessly copied from parted 1.4.17)
 if test x$READLINE = xyes; then
diff -pruN LVM2.2.00.08/include/.symlinks LVM2.2.00.08+crypto/include/.symlinks
--- LVM2.2.00.08/include/.symlinks	2003-09-17 16:35:53.000000000 -0400
+++ LVM2.2.00.08+crypto/include/.symlinks	2004-02-08 16:06:58.000000000 -0500
@@ -4,6 +4,7 @@
 ../lib/commands/toolcontext.h
 ../lib/config/config.h
 ../lib/config/defaults.h
+../lib/crypto/crypto.h
 ../lib/datastruct/bitset.h
 ../lib/datastruct/btree.h
 ../lib/datastruct/hash.h
@@ -31,6 +32,7 @@
 ../lib/misc/crc.h
 ../lib/misc/lib.h
 ../lib/misc/lvm-file.h
+../lib/misc/lvm-mlock.h
 ../lib/misc/lvm-string.h
 ../lib/misc/sharedlib.h
 ../lib/regex/matcher.h
diff -pruN LVM2.2.00.08/lib/Makefile.in LVM2.2.00.08+crypto/lib/Makefile.in
--- LVM2.2.00.08/lib/Makefile.in	2003-09-17 16:35:54.000000000 -0400
+++ LVM2.2.00.08+crypto/lib/Makefile.in	2004-02-08 17:23:13.000000000 -0500
@@ -17,6 +17,7 @@ SOURCES=\
 	cache/lvmcache.c \
 	commands/toolcontext.c \
 	config/config.c \
+	crypto/crypto.c \
 	datastruct/bitset.c \
 	datastruct/btree.c \
 	datastruct/hash.c \
@@ -49,6 +50,7 @@ SOURCES=\
 	metadata/snapshot_manip.c \
 	misc/crc.c \
 	misc/lvm-file.c \
+	misc/lvm-mlock.c \
 	misc/lvm-string.c \
 	mm/memlock.c \
 	mm/pool.c \
diff -pruN LVM2.2.00.08/lib/activate/dev_manager.c LVM2.2.00.08+crypto/lib/activate/dev_manager.c
--- LVM2.2.00.08/lib/activate/dev_manager.c	2003-11-13 13:47:22.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/activate/dev_manager.c	2004-04-25 11:25:45.000000000 -0400
@@ -13,6 +13,8 @@
 #include "fs.h"
 #include "defaults.h"
 #include "toolcontext.h"
+#include "crypto.h"
+#include "lvm-mlock.h"
 
 #include <libdevmapper.h>
 #include <limits.h>
@@ -805,6 +807,27 @@ static int _emit_target_line(struct dev_
 			goto error;
 		w = tw;
 		break;
+	case SEG_CRYPTO:
+		if (segment_cipher(seg)) {
+			target = "crypt";
+
+			if (lvm_mlock(params, paramsize) < 0) {
+				perror("mlock");
+				log_warn("_emit_target: Couldn't lock memory: "
+					 "mlock(2) failed");
+			}
+
+			if ((tw = lvm_snprintf(params, paramsize, "%s %s %" PRIu64 " ",
+					       segment_cipher(seg),
+					       get_lv_key(seg->lv), 0ULL)) < 0)
+				goto error;
+			w = tw;
+		} else {
+			log_error("_emit_target: Internal error: SEG_CRYPTO "
+				  "with no cipher");
+			return 0;
+		}
+		break;
 	}
 
 	for (s = start_area; s < areas; s++, w += tw) {
diff -pruN LVM2.2.00.08/lib/crypto/crypto.c LVM2.2.00.08+crypto/lib/crypto/crypto.c
--- LVM2.2.00.08/lib/crypto/crypto.c	1969-12-31 19:00:00.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/crypto/crypto.c	2004-04-27 23:22:08.000000000 -0400
@@ -0,0 +1,93 @@
+/*
+ * Copyright (C) 2004 Ben Slusky <sluskyb@paranoiacs.org>
+ *
+ * This file is released under the LGPL.
+ */
+
+#include "lib.h"
+#include "crypto.h"
+#include "metadata.h"
+#include "lvm-mlock.h"
+
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#define KEYLEN 64 /* bytes = 512 bits, "should be enough for anybody" */
+#define HEX_DIGITS "0123456789AaBbCcDdEeFf"
+
+static char _current_key[2*KEYLEN+1];  /* hexadecimal representation of the key */
+static char _scratch_key[2*KEYLEN+1];
+static union lvid _current_lvid;
+static int _key_locked = 0;
+
+const char *get_lv_key(const struct logical_volume *lv) {
+	char *p;
+
+	if (!_key_locked) {
+		if (lvm_mlock(_current_key, sizeof(_current_key)) < 0
+		    || lvm_mlock(_scratch_key, sizeof(_scratch_key)) < 0) {
+			perror("mlock");
+			log_warn("get_lv_key: Couldn't lock memory: "
+				 "mlock(2) failed");
+		}
+
+		_key_locked = 1;
+	}
+
+	if (strncmp(lv->lvid.s, _current_lvid.s, sizeof(_current_lvid))) {
+		memcpy(&_current_lvid, &lv->lvid, sizeof(_current_lvid));
+
+		memset(_scratch_key, '\0', sizeof(_scratch_key));
+		memset(_current_key, '\0', sizeof(_current_key));
+		memset(_current_key, '0', 2 * lv->keysize);
+
+		if (isatty(STDIN_FILENO)) {
+			/*
+			 * Give the user a minimal prompt to work with,
+			 * even though this is NOT the recommended way of
+			 * specifying a key
+			 */
+			fprintf(stderr, "%s/%s %u ? ", lv->vg->name, lv->name, 8 * lv->keysize);
+			fflush(stderr);
+		}
+	
+		/*
+		 * Read the key from standard input.
+		 * XXX This gets kinda complicated, but I'd rather not
+		 * resort to using stdio here... who knows where it'll
+		 * put the secret key?
+		 */
+		for (p = _scratch_key;
+		     p < _scratch_key + 2 * lv->keysize;
+		     p++) {
+			if (read(STDIN_FILENO, p, 1) < 1)
+				break;
+			else if (*p == '\n')
+				break;
+		}
+
+		strncpy(_current_key, _scratch_key, strspn(_scratch_key, HEX_DIGITS));
+
+		/* Read (and throw away) everything up thru a newline. */
+		while (*p != '\n') {
+			fd_set rfds;
+			struct timeval tv;
+
+			FD_ZERO(&rfds);
+			FD_SET(STDIN_FILENO, &rfds);
+			tv.tv_sec = 0;
+			tv.tv_usec = 0;
+
+			if (select(STDIN_FILENO+1, &rfds, NULL, NULL, &tv) == -1) {
+				perror("select");
+				break;
+			} else if (!FD_ISSET(STDIN_FILENO, &rfds))
+				break;
+			else if (read(STDIN_FILENO, p, 1) < 1)
+				break;
+		}
+	}
+
+	return _current_key;
+}
diff -pruN LVM2.2.00.08/lib/crypto/crypto.h LVM2.2.00.08+crypto/lib/crypto/crypto.h
--- LVM2.2.00.08/lib/crypto/crypto.h	1969-12-31 19:00:00.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/crypto/crypto.h	2004-02-08 13:27:08.000000000 -0500
@@ -0,0 +1,14 @@
+/*
+ * Copyright (C) 2004 Ben Slusky <sluskyb@paranoiacs.org>
+ *
+ * This file is released under the LGPL.
+ */
+
+#ifndef _LVM_CRYPTO_H
+#define _LVM_CRYPTO_H
+
+#include "metadata.h"
+
+const char *get_lv_key(const struct logical_volume *lv);
+
+#endif
diff -pruN LVM2.2.00.08/lib/display/display.c LVM2.2.00.08+crypto/lib/display/display.c
--- LVM2.2.00.08/lib/display/display.c	2003-07-11 13:09:21.000000000 -0400
+++ LVM2.2.00.08+crypto/lib/display/display.c	2004-04-27 23:34:14.000000000 -0400
@@ -43,7 +43,8 @@ static struct {
 	{
 	SEG_STRIPED, "striped"}, {
 	SEG_MIRRORED, "mirror"}, {
-	SEG_SNAPSHOT, "snapshot"}
+	SEG_SNAPSHOT, "snapshot"}, {
+	SEG_CRYPTO, "encrypted"}
 };
 
 static int _num_policies = sizeof(_policies) / sizeof(*_policies);
@@ -556,6 +557,12 @@ int lvdisplay_segments(struct logical_vo
 			_display_stripe(seg, 1, "    ");
 			log_print(" ");
 			break;
+		case SEG_CRYPTO:
+			_display_stripe(seg, 0, "  ");
+			log_print("  Cipher\t\t%s (%u-bit)", segment_cipher(seg),
+				  8 * segment_keysize(seg));
+			log_print(" ");
+			break;
 		}
 	}
 
diff -pruN LVM2.2.00.08/lib/format1/format1.c LVM2.2.00.08+crypto/lib/format1/format1.c
--- LVM2.2.00.08/lib/format1/format1.c	2003-11-06 15:33:33.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/format1/format1.c	2004-02-05 19:55:37.000000000 -0500
@@ -352,6 +352,11 @@ static int _lv_setup(struct format_insta
 				       SIZE_SHORT));
 		return 0;
 	}
+	if (lv->cipher) {
+		log_error("encrypted volumes are not allowed in LVM1 "
+			  "volume groups");
+		return 0;
+	}
 
 	return 1;
 }
diff -pruN LVM2.2.00.08/lib/format_text/export.c LVM2.2.00.08+crypto/lib/format_text/export.c
--- LVM2.2.00.08/lib/format_text/export.c	2003-09-15 14:22:49.000000000 -0400
+++ LVM2.2.00.08+crypto/lib/format_text/export.c	2004-04-27 20:23:08.000000000 -0400
@@ -395,6 +395,7 @@ static int _print_segment(struct formatt
 
 	case SEG_MIRRORED:
 	case SEG_STRIPED:
+	case SEG_CRYPTO:
 		type = (seg->type == SEG_MIRRORED) ? "mirror" : "stripe";
 		_outf(f, "%s_count = %u%s", type, seg->area_count,
 		      (seg->area_count == 1) ? "\t# linear" : "");
@@ -566,6 +567,10 @@ static int _print_lvs(struct formatter *
 			_outf(f, "major = %d", lv->major);
 		if (lv->minor >= 0)
 			_outf(f, "minor = %d", lv->minor);
+		if (lv->cipher) {
+			_outf(f, "cipher_name = \"%s\"", lv->cipher);
+			_outf(f, "key_size = %u", lv->keysize);
+		}
 		_outf(f, "segment_count = %u", _count_segments(lv));
 		f->nl(f);
 
diff -pruN LVM2.2.00.08/lib/format_text/import_vsn1.c LVM2.2.00.08+crypto/lib/format_text/import_vsn1.c
--- LVM2.2.00.08/lib/format_text/import_vsn1.c	2003-09-17 16:35:57.000000000 -0400
+++ LVM2.2.00.08+crypto/lib/format_text/import_vsn1.c	2004-04-28 01:02:38.000000000 -0400
@@ -254,7 +254,7 @@ static int _read_segment(struct pool *me
 		segtype = get_segtype_from_string(cv->v.str);
 	}
 
-	if (segtype == SEG_STRIPED) {
+	if (segtype == SEG_STRIPED || segtype == SEG_CRYPTO) {
 		if (!_read_int32(sn, "stripe_count", &area_count)) {
 			log_error("Couldn't read 'stripe_count' for "
 				  "segment '%s'.", sn->key);
@@ -337,6 +337,7 @@ static int _read_segment(struct pool *me
 		break;
 
 	case SEG_STRIPED:
+	case SEG_CRYPTO:
 		if ((area_count != 1) &&
 		    !_read_int32(sn, "stripe_size", &seg->stripe_size)) {
 			log_error("Couldn't read stripe_size for segment '%s'.",
@@ -543,6 +544,23 @@ static int _read_lvnames(struct format_i
 	if (!_read_int32(lvn, "read_ahead", &lv->read_ahead))
 		lv->read_ahead = 0;
 
+	if ((cn = find_config_node(lvn, "cipher_name", '/'))) {
+		struct config_value *cv = cn->v;
+		if (!cv || !cv->v.str) {
+			log_error("cipher_name must be a string.");
+			return 0;
+		}
+
+		lv->cipher = pool_strdup(mem, cv->v.str);
+
+		if (!_read_int32(lvn, "key_size", &lv->keysize)) {
+			log_error("Couldn't find key size for "
+				  "encrypted logical volume.");
+			return 0;
+		}
+		
+	}
+
 	list_init(&lv->segments);
 
 	lv->vg = vg;
diff -pruN LVM2.2.00.08/lib/metadata/lv_manip.c LVM2.2.00.08+crypto/lib/metadata/lv_manip.c
--- LVM2.2.00.08/lib/metadata/lv_manip.c	2003-11-06 15:33:33.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/metadata/lv_manip.c	2004-04-27 20:19:20.000000000 -0400
@@ -195,7 +195,7 @@ static int _alloc_linear_area(struct log
 	}
 
 	seg->lv = lv;
-	seg->type = SEG_STRIPED;
+	seg->type = (segment_cipher(seg) ? SEG_CRYPTO : SEG_STRIPED);
 	seg->le = *ix;
 	seg->len = count;
 	seg->area_len = count;
@@ -540,6 +540,8 @@ struct logical_volume *lv_create(struct 
 				 uint32_t stripes,
 				 uint32_t stripe_size,
 				 uint32_t extents,
+				 const char *cipher_name,
+				 uint32_t key_size,
 				 struct volume_group *vg,
 				 struct list *allocatable_pvs)
 {
@@ -571,6 +573,14 @@ struct logical_volume *lv_create(struct 
 
 	lv->size = (uint64_t) extents *vg->extent_size;
 	lv->le_count = extents;
+	if (cipher_name) {
+		if (!(lv->cipher = pool_strdup(vg->cmd->mem, cipher_name))) {
+			stack;
+			return NULL;
+		}
+
+		lv->keysize = key_size;
+	}
 
 	if (!_allocate(vg, lv, allocatable_pvs, 0u, stripes, stripe_size,
 		       NULL, 0u, 0u)) {
diff -pruN LVM2.2.00.08/lib/metadata/metadata.h LVM2.2.00.08+crypto/lib/metadata/metadata.h
--- LVM2.2.00.08/lib/metadata/metadata.h	2003-11-06 15:15:13.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/metadata/metadata.h	2004-04-27 20:19:52.000000000 -0400
@@ -65,7 +65,8 @@ typedef enum {
 typedef enum {
 	SEG_STRIPED,
 	SEG_SNAPSHOT,
-	SEG_MIRRORED
+	SEG_MIRRORED,
+	SEG_CRYPTO
 } segment_type_t;
 
 typedef enum {
@@ -229,9 +230,20 @@ struct logical_volume {
 	uint64_t size;
 	uint32_t le_count;
 
+	char *cipher;
+	uint32_t keysize;
+
 	struct list segments;
 };
 
+static inline const char *segment_cipher(const struct lv_segment *s) {
+	return s->lv->cipher;
+}
+
+static inline uint32_t segment_keysize(const struct lv_segment *s) {
+	return s->lv->keysize;
+}
+
 struct snapshot {
 	struct id id;
 
@@ -392,6 +404,8 @@ struct logical_volume *lv_create(struct 
 				 uint32_t stripes,
 				 uint32_t stripe_size,
 				 uint32_t extents,
+				 const char *cipher_name,
+				 uint32_t key_size,
 				 struct volume_group *vg,
 				 struct list *allocatable_pvs);
 
diff -pruN LVM2.2.00.08/lib/misc/lvm-mlock.c LVM2.2.00.08+crypto/lib/misc/lvm-mlock.c
--- LVM2.2.00.08/lib/misc/lvm-mlock.c	1969-12-31 19:00:00.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/misc/lvm-mlock.c	2004-02-09 02:21:54.000000000 -0500
@@ -0,0 +1,31 @@
+/*
+ * Copyright (C) 2004 Ben Slusky <sluskyb@paranoiacs.org>
+ *
+ * This file is released under the LGPL.
+ */
+
+#include "lvm-mlock.h"
+
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/mman.h>
+
+int lvm_mlock(const void *addr, size_t len) {
+	const void *newaddr;
+	size_t newlen;
+	long pagesize = sysconf(_SC_PAGESIZE);
+
+	if (pagesize != -1) {
+		/* round addr down */
+		newaddr = (const void *)(((size_t) addr / pagesize) * pagesize);
+		/* round len up */
+		newlen = ((len + pagesize - 1) / pagesize) * pagesize;
+	} else {
+		perror("sysconf");
+		/* pray that we can pass any old address to mlock() */
+		newaddr = addr;
+		newlen = len;
+	}
+
+	return mlock(newaddr, newlen);
+}
diff -pruN LVM2.2.00.08/lib/misc/lvm-mlock.h LVM2.2.00.08+crypto/lib/misc/lvm-mlock.h
--- LVM2.2.00.08/lib/misc/lvm-mlock.h	1969-12-31 19:00:00.000000000 -0500
+++ LVM2.2.00.08+crypto/lib/misc/lvm-mlock.h	2004-02-08 17:43:22.000000000 -0500
@@ -0,0 +1,21 @@
+/*
+ * Copyright (C) 2004 Ben Slusky <sluskyb@paranoiacs.org>
+ *
+ * This file is released under the LGPL.
+ */
+
+#ifndef _LVM_MLOCK_H
+#define _LVM_MLOCK_H
+
+#include <unistd.h>
+
+/*
+ * POSIX allows an implementation of mlock to require that the given address
+ * is aligned to a page boundary. Linux' implementation is more forgiving, but
+ * others may not be. lvm_mlock rounds the address down and the length up to a
+ * page boundary.
+ */
+
+int lvm_mlock(const void *addr, size_t len);
+
+#endif
diff -pruN LVM2.2.00.08/man/lvchange.8 LVM2.2.00.08+crypto/man/lvchange.8
--- LVM2.2.00.08/man/lvchange.8	2002-11-18 09:02:24.000000000 -0500
+++ LVM2.2.00.08+crypto/man/lvchange.8	2004-04-28 02:10:17.046707323 -0400
@@ -4,8 +4,10 @@ lvchange \- change attributes of a logic
 .SH SYNOPSIS
 .B lvchange
 [\-A/\-\-autobackup y/n] [\-a/\-\-available y/n]
-[\-C/\-\-contiguous y/n] [\-d/\-\-debug] [\-h/\-?/\-\-help]
+[\-C/\-\-contiguous y/n] [\-d/\-\-debug]
+[\-e/\-\-encryption cipher] [\-E/\-\-keysize #bits] [\-h/\-?/\-\-help]
 [\-\-ignorelockingfailure]
+[\-k/\-\-changekey] 
 [\-M/\-\-persistent y/n] [\-\-minor minor]
 [\-P/\-\-partial y/n]
 [\-p/\-\-permission r/w] [\-r/\-\-readahead ReadAheadSectors]
@@ -29,6 +31,21 @@ logical volumes. It's only possible to c
 logical volume's allocation policy to contiguous, if all of the
 allocated physical extents are already contiguous.
 .TP
+.I \-e, \-\-encryption cipher
+Set the cipher used to encrypt the data in the logical volume.
+See \fBNOTES\fP below.
+.TP
+.I \-E, \-\-keylength nbits
+Set the key length (in bits) used to encrypt the data in the logical
+volume.
+See \fBNOTES\fP below.
+.TP
+.I \-k, \-\-changekey
+Change the encryption key for a logical volume. The key will be
+read from standard input, and should be given as a string of
+hexadecimal digits.
+See \fBNOTES\fP below.
+.TP
 .I \-\-minor minor
 Set the minor number.
 .TP
@@ -44,6 +61,11 @@ Not used by device-mapper.
 .SH Examples
 "lvchange -x n vg00/lvol1" prevents the allocation of any physical
 extents on logical volume lvol1 in volume group vg00.
+.SH NOTES
+Changing the encryption settings (cipher, key, and/or key size) of
+a volume will \fB*NOT*\fP re-encrypt the data on that volume. If the
+encryption settings do not match the settings that were used
+to write the data, then the data will be \fB*inaccessible*\fP.
 .SH SEE ALSO
 .BR lvm (8), 
 .BR lvcreate (8)
diff -pruN LVM2.2.00.08/man/lvcreate.8 LVM2.2.00.08+crypto/man/lvcreate.8
--- LVM2.2.00.08/man/lvcreate.8	2003-07-04 18:34:54.000000000 -0400
+++ LVM2.2.00.08+crypto/man/lvcreate.8	2004-04-28 02:10:25.175686731 -0400
@@ -4,7 +4,7 @@ lvcreate \- create a logical volume in a
 .SH SYNOPSIS
 .B lvcreate
 [\-A/\-\-autobackup y/n] [\-C/\-\-contiguous y/n] [\-d/\-\-debug]
-[\-h/\-?/\-\-help]
+[\-e/\-\-encryption cipher] [\-E/\-\-keysize #bits] [\-h/\-?/\-\-help]
 [\-i/\-\-stripes Stripes [\-I/\-\-stripesize StripeSize]]
 {\-l/\-\-extents LogicalExtentsNumber |
  \-L/\-\-size LogicalVolumeSize[kKmMgGtT]}
@@ -47,6 +47,13 @@ Sets or resets the contiguous allocation
 logical volumes. Default is no contiguous allocation based
 on a next free principle.
 .TP
+.I \-e, \-\-encryption cipher
+Set the cipher used to encrypt the data in the logical volume.
+.TP
+.I \-E, \-\-keylength nbits
+Set the key length (in bits) used to encrypt the data in the logical
+volume.
+.TP
 .I \-i, \-\-stripes Stripes
 Gives the number of stripes.
 This is equal to the number of physical volumes to scatter
diff -pruN LVM2.2.00.08/tools/args.h LVM2.2.00.08+crypto/tools/args.h
--- LVM2.2.00.08/tools/args.h	2003-11-14 09:03:48.000000000 -0500
+++ LVM2.2.00.08+crypto/tools/args.h	2004-04-27 23:27:54.000000000 -0400
@@ -47,7 +47,9 @@ arg(columns_ARG, 'C', "columns", NULL)
 arg(contiguous_ARG, 'C', "contiguous", yes_no_arg)
 arg(debug_ARG, 'd', "debug", NULL)
 arg(disk_ARG, 'D', "disk", NULL)
+arg(encryption_ARG, 'e', "encryption", string_arg)
 arg(exported_ARG, 'e', "exported", NULL)
+arg(keysize_ARG, 'E', "keysize", int_arg)
 arg(physicalextent_ARG, 'E', "physicalextent", NULL)
 arg(file_ARG, 'f', "file", string_arg)
 arg(force_ARG, 'f', "force", NULL)
@@ -58,6 +60,7 @@ arg(stripesize_ARG, 'I', "stripesize", s
 arg(stripes_ARG, 'i', "stripes", int_arg)
 arg(interval_ARG, 'i', "interval", int_arg)
 arg(iop_version_ARG, 'i', "iop_version", NULL)
+arg(changekey_ARG, 'k', "changekey", NULL)
 arg(logicalvolume_ARG, 'l', "logicalvolume", int_arg)
 arg(maxlogicalvolumes_ARG, 'l', "maxlogicalvolumes", int_arg)
 arg(extents_ARG, 'l', "extents", int_arg_with_sign)
diff -pruN LVM2.2.00.08/tools/commands.h LVM2.2.00.08+crypto/tools/commands.h
--- LVM2.2.00.08/tools/commands.h	2003-11-14 09:03:48.000000000 -0500
+++ LVM2.2.00.08+crypto/tools/commands.h	2004-04-28 02:10:53.105179370 -0400
@@ -58,9 +58,12 @@ xx(lvchange,
    "\t[-a|--available y|n]\n"
    "\t[-C|--contiguous y|n]\n"
    "\t[-d|--debug]\n"
+   "\t[-e|--encryption cipher]\n"
+   "\t[-E|--keysize #bits]\n"
    "\t[-f|--force]\n"
    "\t[-h|--help]\n"
    "\t[--ignorelockingfailure]\n"
+   "\t[-k|--changekey] " "\n"
    "\t[-M|--persistent y|n] [--major major] [--minor minor]\n"
    "\t[-P|--partial] " "\n"
    "\t[-p|--permission r|rw]\n"
@@ -70,9 +73,10 @@ xx(lvchange,
    "\t[--version]" "\n"
    "\tLogicalVolume[Path] [LogicalVolume[Path]...]\n",
 
-   autobackup_ARG, available_ARG, contiguous_ARG, force_ARG,
-   ignorelockingfailure_ARG, major_ARG, minor_ARG, partial_ARG, permission_ARG,
-   persistent_ARG, readahead_ARG, test_ARG)
+   autobackup_ARG, available_ARG, changekey_ARG, contiguous_ARG,
+   encryption_ARG, force_ARG, ignorelockingfailure_ARG, keysize_ARG,
+   major_ARG, minor_ARG, partial_ARG, permission_ARG, persistent_ARG,
+   readahead_ARG, test_ARG)
 
 xx(lvcreate,
    "Create a logical volume",
@@ -80,6 +84,8 @@ xx(lvcreate,
    "\t[-A|--autobackup {y|n}]\n"
    "\t[-C|--contiguous {y|n}]\n"
    "\t[-d|--debug]\n"
+   "\t[-e|--encryption cipher]\n"
+   "\t[-E|--keysize #bits]\n"
    "\t[-h|-?|--help]\n"
    "\t[-i|--stripes Stripes [-I|--stripesize StripeSize]]\n"
    "\t{-l|--extents LogicalExtentsNumber |\n"
@@ -98,6 +104,8 @@ xx(lvcreate,
    "\t[-c|--chunksize]\n"
    "\t[-A|--autobackup {y|n}]\n"
    "\t[-C|--contiguous {y|n}]\n"
+   "\t[-e|--encryption cipher]\n"
+   "\t[-E|--keysize #bits]\n"
    "\t[-d|--debug]\n"
    "\t[-h|-?|--help]\n"
    "\t[-i|--stripes Stripes [-I|--stripesize StripeSize]]\n"
@@ -112,9 +120,10 @@ xx(lvcreate,
    "\t[--version]\n"
    "\tOriginalLogicalVolume[Path] [PhysicalVolumePath...]\n\n",
 
-   autobackup_ARG, chunksize_ARG, contiguous_ARG, extents_ARG, major_ARG, minor_ARG, 
-   name_ARG, permission_ARG, persistent_ARG, readahead_ARG, size_ARG,
-   snapshot_ARG, stripes_ARG, stripesize_ARG, test_ARG, zero_ARG)
+   autobackup_ARG, chunksize_ARG, contiguous_ARG, encryption_ARG,
+   extents_ARG, keysize_ARG, major_ARG, minor_ARG, name_ARG,
+   permission_ARG, persistent_ARG, readahead_ARG, size_ARG, snapshot_ARG,
+   stripes_ARG, stripesize_ARG, test_ARG, zero_ARG)
 
 xx(lvdisplay,
    "Display information about a logical volume",
diff -pruN LVM2.2.00.08/tools/lvchange.c LVM2.2.00.08+crypto/tools/lvchange.c
--- LVM2.2.00.08/tools/lvchange.c	2003-10-21 18:06:06.000000000 -0400
+++ LVM2.2.00.08+crypto/tools/lvchange.c	2004-04-27 23:46:11.000000000 -0400
@@ -301,6 +301,154 @@ static int lvchange_persistent(struct cm
 	return 1;
 }
 
+static int lvchange_cipher(struct cmd_context *cmd,
+			   struct logical_volume *lv)
+{
+	const char *encryption;
+	struct lv_segment *seg;
+
+	log_info("Changing encryption cipher may invalidate all data "
+		 "on volume \"%s\"", lv->name);
+
+	encryption = arg_value(cmd, encryption_ARG);
+	if (strlen(encryption) > 0) {
+		if (!lv->cipher) {
+			if (!arg_count(cmd, keysize_ARG)) {
+				log_error("Must specify encryption key size with cipher");
+				return 0;
+			}
+
+			lv->keysize = arg_uint_value(cmd, keysize_ARG, 0) / 8;
+		}
+
+		lv->cipher = pool_strdup(cmd->mem, encryption);
+
+		list_iterate_items(seg, &lv->segments) {
+			if (seg->area_count > 1) {
+				log_error("Cannot encrypt a striped or "
+					  "mirrored volume");
+				return 0;
+			}
+
+			seg->type = SEG_CRYPTO;
+		}
+	} else if (lv->cipher) {
+		lv->cipher = NULL;
+		list_iterate_items(seg, &lv->segments) {
+			seg->type = SEG_STRIPED;
+		}
+	}
+
+	log_very_verbose("Updating logical volume \"%s\" on disk(s)", lv->name);
+	if (!vg_write(lv->vg)) {
+		stack;
+		return 0;
+	}
+
+	backup(lv->vg);
+
+	if (!lock_vol(cmd, lv->lvid.s, LCK_LV_SUSPEND | LCK_HOLD)) {
+		log_error("Failed to lock %s", lv->name);
+		vg_revert(lv->vg);
+		return 0;
+	}
+
+	if (!vg_commit(lv->vg)) {
+		unlock_lv(cmd, lv->lvid.s);
+		return 0;
+	}
+
+	log_very_verbose("Updating permissions for \"%s\" in kernel", lv->name);
+	if (!unlock_lv(cmd, lv->lvid.s)) {
+		log_error("Problem reactivating %s", lv->name);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int lvchange_keysize(struct cmd_context *cmd,
+			    struct logical_volume *lv)
+{
+	if (!lv->cipher) {
+		log_error("Logical volume \"%s\" is not encrypted", lv->name);
+		return 0;
+	}
+
+	log_info("Changing encryption key size may invalidate all data "
+		 "on volume \"%s\"", lv->name);
+
+	lv->keysize = arg_uint_value(cmd, keysize_ARG, 0) / 8;
+
+	log_very_verbose("Updating logical volume \"%s\" on disk(s)", lv->name);
+	if (!vg_write(lv->vg)) {
+		stack;
+		return 0;
+	}
+
+	backup(lv->vg);
+
+	if (!lock_vol(cmd, lv->lvid.s, LCK_LV_SUSPEND | LCK_HOLD)) {
+		log_error("Failed to lock %s", lv->name);
+		vg_revert(lv->vg);
+		return 0;
+	}
+
+	if (!vg_commit(lv->vg)) {
+		unlock_lv(cmd, lv->lvid.s);
+		return 0;
+	}
+
+	log_very_verbose("Updating permissions for \"%s\" in kernel", lv->name);
+	if (!unlock_lv(cmd, lv->lvid.s)) {
+		log_error("Problem reactivating %s", lv->name);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int lvchange_key(struct cmd_context *cmd,
+			struct logical_volume *lv)
+{
+	if (!lv->cipher) {
+		log_error("Logical volume \"%s\" is not encrypted", lv->name);
+		return 0;
+	}
+
+	log_info("Changing encryption key may invalidate all data "
+		 "on volume \"%s\"", lv->name);
+
+	/* Do nothing here. We'll get the new key in the commit phase. */
+
+	log_very_verbose("Updating logical volume \"%s\" on disk(s)", lv->name);
+	if (!vg_write(lv->vg)) {
+		stack;
+		return 0;
+	}
+
+	backup(lv->vg);
+
+	if (!lock_vol(cmd, lv->lvid.s, LCK_LV_SUSPEND | LCK_HOLD)) {
+		log_error("Failed to lock %s", lv->name);
+		vg_revert(lv->vg);
+		return 0;
+	}
+
+	if (!vg_commit(lv->vg)) {
+		unlock_lv(cmd, lv->lvid.s);
+		return 0;
+	}
+
+	log_very_verbose("Updating permissions for \"%s\" in kernel", lv->name);
+	if (!unlock_lv(cmd, lv->lvid.s)) {
+		log_error("Problem reactivating %s", lv->name);
+		return 0;
+	}
+
+	return 1;
+}
+
 static int lvchange_single(struct cmd_context *cmd, struct logical_volume *lv,
 			   void *handle)
 {
@@ -368,6 +516,30 @@ static int lvchange_single(struct cmd_co
 		doit += lvchange_persistent(cmd, lv);
 	}
 
+	/* encryption cipher change */
+	if (arg_count(cmd, encryption_ARG)) {
+		if (!archived && !archive(lv->vg))
+			return ECMD_FAILED;
+		archived = 1;
+		doit += lvchange_cipher(cmd, lv);
+	}
+
+	/* encryption key size change */
+	if (arg_count(cmd, keysize_ARG)) {
+		if (!archived && !archive(lv->vg))
+			return ECMD_FAILED;
+		archived = 1;
+		doit += lvchange_keysize(cmd, lv);
+	}
+
+	/* encryption key change */
+	if (arg_count(cmd, changekey_ARG)) {
+		if (!archived && !archive(lv->vg))
+			return ECMD_FAILED;
+		archived = 1;
+		doit += lvchange_key(cmd, lv);
+	}
+
 	if (doit)
 		log_print("Logical volume \"%s\" changed", lv->name);
 
@@ -384,8 +556,10 @@ int lvchange(struct cmd_context *cmd, in
 	if (!arg_count(cmd, available_ARG) && !arg_count(cmd, contiguous_ARG)
 	    && !arg_count(cmd, permission_ARG) && !arg_count(cmd, readahead_ARG)
 	    && !arg_count(cmd, minor_ARG) && !arg_count(cmd, major_ARG)
-	    && !arg_count(cmd, persistent_ARG)) {
-		log_error("One or more of -a, -C, -j, -m, -M, -p or -r "
+	    && !arg_count(cmd, persistent_ARG)
+	    && !arg_count(cmd, encryption_ARG) && !arg_count(cmd, keysize_ARG)
+	    && !arg_count(cmd, changekey_ARG)) {
+		log_error("One or more of -a, -C, -e, -E, -j, -k, -m, -M, -p or -r "
 			  "required");
 		return EINVALID_CMD_LINE;
 	}
diff -pruN LVM2.2.00.08/tools/lvcreate.c LVM2.2.00.08+crypto/tools/lvcreate.c
--- LVM2.2.00.08/tools/lvcreate.c	2003-11-14 12:55:39.000000000 -0500
+++ LVM2.2.00.08+crypto/tools/lvcreate.c	2004-04-27 23:19:43.000000000 -0400
@@ -32,6 +32,9 @@ struct lvcreate_params {
 	uint32_t permission;
 	uint32_t read_ahead;
 
+	const char *encryption;
+	uint32_t keysize;
+
 	int pv_count;
 	char **pvs;
 };
@@ -250,6 +253,18 @@ static int _read_params(struct lvcreate_
 		}
 	}
 
+	if (arg_count(cmd, encryption_ARG) && arg_count(cmd, stripes_ARG)) {
+		log_error("-e and -i are incompatible");
+		return 0;
+	}
+
+	if ((arg_count(cmd, encryption_ARG) && !arg_count(cmd, keysize_ARG)) ||
+	    (arg_count(cmd, keysize_ARG) && !arg_count(cmd, encryption_ARG))) {
+		log_error("Must specify encryption key size with cipher, "
+			  "and vice versa");
+		return 0;
+	}
+
 	if (!_read_name_params(lp, cmd, &argc, &argv) ||
 	    !_read_size_params(lp, cmd, &argc, &argv) ||
 	    !_read_stripe_params(lp, cmd, &argc, &argv))
@@ -304,6 +319,11 @@ static int _read_params(struct lvcreate_
 		}
 	}
 
+	if (arg_count(cmd, encryption_ARG))
+		lp->encryption = arg_value(cmd, encryption_ARG);
+	if (arg_count(cmd, keysize_ARG))
+		lp->keysize = arg_uint_value(cmd, keysize_ARG, 0) / 8;
+
 	lp->pv_count = argc;
 	lp->pvs = argv;
 
@@ -459,7 +479,7 @@ static int _lvcreate(struct cmd_context 
 
 	if (!(lv = lv_create(vg->fid, lp->lv_name, status, alloc,
 			     lp->stripes, lp->stripe_size, lp->extents,
-			     vg, pvh)))
+			     lp->encryption, lp->keysize, vg, pvh)))
 		return 0;
 
 	if (lp->read_ahead) {

--GvXjxJ+pjyke8COw--
