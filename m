Received: from agrover.com (ovpn-113-45.phx2.redhat.com [10.3.113.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8EHsmCN028837
	for <linux-lvm@redhat.com>; Fri, 14 Sep 2012 13:54:51 -0400
From: Andy Grover <agrover@redhat.com>
Date: Fri, 14 Sep 2012 10:54:44 -0700
Message-Id: <1347645284-13738-7-git-send-email-agrover@redhat.com>
In-Reply-To: <1347645284-13738-1-git-send-email-agrover@redhat.com>
References: <1347645284-13738-1-git-send-email-agrover@redhat.com>
Subject: [linux-lvm] [PATCH 6/6] python-lvm: Other Makefile.in changes
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

Add install_python_bindings target to toplevel makefile

Recurse into liblvm/python if PYTHON_BINDINGS is set

Signed-off-by: Andy Grover <agrover@redhat.com>
---
 Makefile.in        |    3 +++
 liblvm/Makefile.in |    6 +++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/Makefile.in b/Makefile.in
index 4316190..ed2be56 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -107,6 +107,9 @@ install_systemd_generators:
 install_systemd_units:
 	$(MAKE) -C scripts install_systemd_units
 
+install_python_bindings:
+	$(MAKE) -C liblvm/python install_python_bindings
+
 install_tmpfiles_configuration:
 	$(MAKE) -C scripts install_tmpfiles_configuration
 
diff --git a/liblvm/Makefile.in b/liblvm/Makefile.in
index 8ae4661..8941288 100644
--- a/liblvm/Makefile.in
+++ b/liblvm/Makefile.in
@@ -30,6 +30,10 @@ ifeq ("@STATIC_LINK@", "yes")
   LIB_STATIC = $(LIB_NAME).a
 endif
 
+ifeq ("@PYTHON_BINDINGS@", "yes")
+  SUBDIRS += python
+endif
+
 LIB_SHARED = $(LIB_NAME).$(LIB_SUFFIX)
 
 CLEAN_TARGETS += liblvm.cflow $(LIB_NAME).a
@@ -47,7 +51,7 @@ ifeq ("@DMEVENTD@", "yes")
   LIBS += -ldevmapper-event
 endif
 
-.PHONY: install_dynamic install_static install_include install_pkgconfig
+.PHONY: install_dynamic install_static install_include install_pkgconfig python
 
 INSTALL_TYPE = install_dynamic
 
-- 
1.7.1
