Received: from agrover.com (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8EHsmCL028837
	for <linux-lvm@redhat.com>; Fri, 14 Sep 2012 13:54:50 -0400
From: Andy Grover <agrover@redhat.com>
Date: Fri, 14 Sep 2012 10:54:42 -0700
Message-Id: <1347645284-13738-5-git-send-email-agrover@redhat.com>
In-Reply-To: <1347645284-13738-1-git-send-email-agrover@redhat.com>
References: <1347645284-13738-1-git-send-email-agrover@redhat.com>
Subject: [linux-lvm] [PATCH 4/6] python-lvm: liblvm/python/Makefile.in
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

This Makefile works, but might need some work by someone who knows what
they're doing.

Signed-off-by: Andy Grover <agrover@redhat.com>
---
 liblvm/python/Makefile.in |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 liblvm/python/Makefile.in

diff --git a/liblvm/python/Makefile.in b/liblvm/python/Makefile.in
new file mode 100644
index 0000000..cd93674
--- /dev/null
+++ b/liblvm/python/Makefile.in
@@ -0,0 +1,30 @@
+#
+# Copyright (C) 2011-2012 Red Hat, Inc.
+#
+# This file is part of LVM2.
+#
+# This copyrighted material is made available to anyone wishing to use,
+# modify, copy, or redistribute it subject to the terms and conditions
+# of the GNU Lesser General Public License v.2.1.
+#
+# You should have received a copy of the GNU Lesser General Public License
+# along with this program; if not, write to the Free Software Foundation,
+# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+
+srcdir = @srcdir@
+top_srcdir = @top_srcdir@
+top_builddir = @top_builddir@
+
+SOURCES = liblvm.c
+
+python_bindings:
+	LVM_VERSION="$(LVM_VERSION)" python setup.py build
+
+install_python_bindings:
+	LVM_VERSION="$(LVM_VERSION)" python setup.py install --skip-build --root $(prefix)
+
+install_lvm2: install_python_bindings
+
+install: install_lvm2
+
+include $(top_builddir)/make.tmpl
-- 
1.7.1
