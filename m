Return-Path: <misiek@pld.ORG.PL>
Date: Wed, 2 May 2001 01:28:51 +0200
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Message-ID: <20010502012851.A4517@ikar.t17.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvm on alpha/sparc
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Small fix for alpha was required:
diff -urN 0.9.1_beta7.org/tools/lib/liblvm.h 0.9.1_beta7/tools/lib/liblvm.h
--- 0.9.1_beta7.org/tools/lib/liblvm.h  Wed May  2 01:01:31 2001
+++ 0.9.1_beta7/tools/lib/liblvm.h      Wed May  2 01:02:54 2001
@@ -228,7 +228,11 @@
 int    pv_get_index_by_kdev_t ( vg_t *, kdev_t);
 int    pv_get_index_by_name ( vg_t *, char *);
 kdev_t pv_get_kdev_t_by_number ( vg_t *, int);
+#ifndef        __alpha__
 int    pv_get_size ( char *, struct partition *);
+#else
+long   pv_get_size ( char *, struct partition *);
+#endif
 int    pv_move_pes ( vg_t*, char*, size_t, char**, int, int,
                      long*, long*, long*, int, int);
 int    pv_move_pe ( vg_t*, char*, size_t, long, long, long, long,

but on sparc there is problem with linux/string.h which is breaking compila=
tion ;-(
Workaround - avoid inclusion of linux/string.h:

diff -urN 0.9.1_beta7.org/tools/lib/liblvm.h 0.9.1_beta7/tools/lib/liblvm.h
--- 0.9.1_beta7.org/tools/lib/liblvm.h  Wed May  2 01:01:31 2001
+++ 0.9.1_beta7/tools/lib/liblvm.h      Wed May  2 01:07:28 2001
@@ -43,6 +43,8 @@
 #ifndef _LIBLVM_H_INCLUDE
 #define _LIBLVM_H_INCLUDE
=20
+#define _LINUX_STRING_H_ 1 /* ugly hack - avoid inclusion of <linux/string=
.h> */
+
 #define        LVM_LIB_IOP_VERSION     10
=20
 #include <features.h>

ps. I'm not subscribed to devel list, so I'm posting here.
--=20
Arkadiusz Mi=EF=BF=BDkiewicz, AM2-6BONE    [ PLD GNU/Linux IPv6 ]
http://www.t17.ds.pwr.wroc.pl/~misiek/ipv6/   [ enabled ]
