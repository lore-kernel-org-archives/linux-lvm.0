Received: from agrover.com (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8EHsmCM028837
	for <linux-lvm@redhat.com>; Fri, 14 Sep 2012 13:54:50 -0400
From: Andy Grover <agrover@redhat.com>
Date: Fri, 14 Sep 2012 10:54:43 -0700
Message-Id: <1347645284-13738-6-git-send-email-agrover@redhat.com>
In-Reply-To: <1347645284-13738-1-git-send-email-agrover@redhat.com>
References: <1347645284-13738-1-git-send-email-agrover@redhat.com>
Subject: [linux-lvm] [PATCH 5/6] python-lvm: configure.in changes
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
To: linux-lvm@redhat.com

Add --enable-python-bindings configure option (should really depend some-
how on --enable-applib?)

Export PYTHON_BINDINGS variable

Parse liblvm/python/Makefile.in into Makefile

Signed-off-by: Andy Grover <agrover@redhat.com>
---
 configure.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/configure.in b/configure.in
index 1c908f9..a1b1807 100644
--- a/configure.in
+++ b/configure.in
@@ -1022,6 +1022,13 @@ test x$CMDLIB = xyes \
   || LVM2CMD_LIB=
 
 ################################################################################
+dnl -- Enable Python lvm.so
+AC_MSG_CHECKING(whether to build Python wrapper for liblvm2app.so)
+AC_ARG_ENABLE(python-bindings,
+	      AC_HELP_STRING([--enable-python-bindings], [build Python applib bindings]),
+	      PYTHON_BINDINGS=$enableval, PYTHON_BINDINGS=no)
+
+################################################################################
 dnl -- Enable pkg-config
 AC_ARG_ENABLE(pkgconfig,
 	      AC_HELP_STRING([--enable-pkgconfig], [install pkgconfig support]),
@@ -1518,6 +1525,7 @@ AC_SUBST(OCFDIR)
 AC_SUBST(PKGCONFIG)
 AC_SUBST(POOL)
 AC_SUBST(PTHREAD_LIBS)
+AC_SUBST(PYTHON_BINDINGS)
 AC_SUBST(QUORUM_CFLAGS)
 AC_SUBST(QUORUM_LIBS)
 AC_SUBST(RAID)
@@ -1598,6 +1606,7 @@ libdm/Makefile
 libdm/libdevmapper.pc
 liblvm/Makefile
 liblvm/liblvm2app.pc
+liblvm/python/Makefile
 man/Makefile
 po/Makefile
 scripts/clvmd_init_red_hat
-- 
1.7.1
