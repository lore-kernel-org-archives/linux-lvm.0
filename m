References: <bc117214-789f-85b3-35f4-db067fcbfe14@sandisk.com>
From: Bart Van Assche <bart.vanassche@sandisk.com>
Message-ID: <b839b80f-80f1-880b-6e66-0b4ea55b0be9@sandisk.com>
Date: Fri, 18 Nov 2016 14:00:01 -0800
MIME-Version: 1.0
In-Reply-To: <bc117214-789f-85b3-35f4-db067fcbfe14@sandisk.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [PATCH 1/2] Move AC_PYTHON_MODULE() macro definition to
 m4/ac_python_module.m4
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
Content-Type: text/plain; charset="us-ascii"
To: "Bryn M. Reeves" <bmr@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Adding m4 macros in aclocal.m4 is wrong because the file aclocal.m4
gets overwritten when running e.g. "autoreconf -ivf". Hence move the
AC_PYTHON_MODULE() macro definition into a separate file.

Fixes: commit 5987562cf924 ("lvmdbus: Add new daemon")
Signed-off-by: Bart Van Assche <bart.vanassche@sandisk.com>
Cc: Alasdair G Kergon <agk@redhat.com>
---
 aclocal.m4             | 57 --------------------------------------------------
 configure.in           |  1 +
 m4/ac_python_module.m4 | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 57 deletions(-)
 create mode 100755 m4/ac_python_module.m4

diff --git a/aclocal.m4 b/aclocal.m4
index 35107ac..b1d71d7 100644
--- a/aclocal.m4
+++ b/aclocal.m4
@@ -12,63 +12,6 @@
 # PARTICULAR PURPOSE.
 
 m4_ifndef([AC_CONFIG_MACRO_DIRS], [m4_defun([_AM_CONFIG_MACRO_DIRS], [])m4_defun([AC_CONFIG_MACRO_DIRS], [_AM_CONFIG_MACRO_DIRS($@)])])
-# ===========================================================================
-#     http://www.gnu.org/software/autoconf-archive/ax_python_module.html
-# ===========================================================================
-#
-# SYNOPSIS
-#
-#   AX_PYTHON_MODULE(modname[, fatal, python])
-#
-# DESCRIPTION
-#
-#   Checks for Python module.
-#
-#   If fatal is non-empty then absence of a module will trigger an error.
-#   The third parameter can either be "python" for Python 2 or "python3" for
-#   Python 3; defaults to Python 3.
-#
-# LICENSE
-#
-#   Copyright (c) 2008 Andrew Collier
-#
-#   Copying and distribution of this file, with or without modification, are
-#   permitted in any medium without royalty provided the copyright notice
-#   and this notice are preserved. This file is offered as-is, without any
-#   warranty.
-
-#serial 8
-
-AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
-AC_DEFUN([AX_PYTHON_MODULE],[
-    if test -z $PYTHON;
-    then
-        if test -z "$3";
-        then
-            PYTHON="python3"
-        else
-            PYTHON="$3"
-        fi
-    fi
-    PYTHON_NAME=`basename $PYTHON`
-    AC_MSG_CHECKING($PYTHON_NAME module: $1)
-    $PYTHON -c "import $1" 2>/dev/null
-    if test $? -eq 0;
-    then
-        AC_MSG_RESULT(yes)
-        eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
-    else
-        AC_MSG_RESULT(no)
-        eval AS_TR_CPP(HAVE_PYMOD_$1)=no
-        #
-        if test -n "$2"
-        then
-            AC_MSG_ERROR(failed to find required module $1)
-            exit 1
-        fi
-    fi
-])
-
 # pkg.m4 - Macros to locate and utilise pkg-config.            -*- Autoconf -*-
 # serial 1 (pkg-config-0.24)
 # 
diff --git a/configure.in b/configure.in
index cc77aab..b75c950 100644
--- a/configure.in
+++ b/configure.in
@@ -21,6 +21,7 @@ AC_CONFIG_HEADERS([include/configure.h])
 ################################################################################
 dnl -- Setup the directory where autoconf has auxilary files
 AC_CONFIG_AUX_DIR(autoconf)
+AC_CONFIG_MACRO_DIR(m4)
 
 ################################################################################
 dnl -- Get system type
diff --git a/m4/ac_python_module.m4 b/m4/ac_python_module.m4
new file mode 100755
index 0000000..f182c48
--- /dev/null
+++ b/m4/ac_python_module.m4
@@ -0,0 +1,56 @@
+# ===========================================================================
+#     http://www.gnu.org/software/autoconf-archive/ax_python_module.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_PYTHON_MODULE(modname[, fatal, python])
+#
+# DESCRIPTION
+#
+#   Checks for Python module.
+#
+#   If fatal is non-empty then absence of a module will trigger an error.
+#   The third parameter can either be "python" for Python 2 or "python3" for
+#   Python 3; defaults to Python 3.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Andrew Collier
+#
+#   Copying and distribution of this file, with or without modification, are
+#   permitted in any medium without royalty provided the copyright notice
+#   and this notice are preserved. This file is offered as-is, without any
+#   warranty.
+
+#serial 8
+
+AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
+AC_DEFUN([AX_PYTHON_MODULE],[
+    if test -z $PYTHON;
+    then
+        if test -z "$3";
+        then
+            PYTHON="python3"
+        else
+            PYTHON="$3"
+        fi
+    fi
+    PYTHON_NAME=`basename $PYTHON`
+    AC_MSG_CHECKING($PYTHON_NAME module: $1)
+    $PYTHON -c "import $1" 2>/dev/null
+    if test $? -eq 0;
+    then
+        AC_MSG_RESULT(yes)
+        eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
+    else
+        AC_MSG_RESULT(no)
+        eval AS_TR_CPP(HAVE_PYMOD_$1)=no
+        #
+        if test -n "$2"
+        then
+            AC_MSG_ERROR(failed to find required module $1)
+            exit 1
+        fi
+    fi
+])
-- 
2.10.1
