From: Kenneth Preslan <kpreslan@zarniwoop.com>
Message-Id: <199905120743.CAA09565@tipsy.zarniwoop.com>
Subject: Re: [linux-lvm] Local GFS on lvm
Date: Wed, 12 May 1999 02:43:49 -0500 (CDT)
In-Reply-To: <3737F4B7.6E582E4F@ep-ag.com> from "Klaus Strebel" at May 11, 99 09:13:27 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Klaus Strebel <stb@ep-ag.com>
Cc: linux-lvm@msede.com, gfs-devel@lcse.umn.edu

> P.S.: Thanks Dave for your quick response. I�ve some trubble with the
> locking module,  it doesn�t find register_lock_proto,
> unregister_lock_proto, though gfs.o is loaded ? But i think  i can work
> it out ;-).

This problem happens when you enable the "Set version information on all 
symbols for modules" option under "Loadable module support" when configuring
the kernel.

If you enable the option, you need to apply the attached patch and compile
GFS with the MODVERSIONS=y switch.  (i.e.  cd GFS2/bin;make MODVERSIONS=y)

Ken


diff -urN GFS2/src/fs/Makefile GFS2-modversions/src/fs/Makefile
--- GFS2/src/fs/Makefile	Tue Apr  6 01:00:47 1999
+++ GFS2-modversions/src/fs/Makefile	Wed May 12 02:04:34 1999
@@ -15,6 +15,10 @@
 
 DEBUG = y
 
+#    If module versions are turned on in the kernel, set this to y
+
+MODVERSIONS = n
+
 ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/)
 
 
@@ -45,6 +49,10 @@
 CFLAGS += -O -g -DDEBUG
 else
 CFLAGS += -O2
+endif
+
+ifeq ($(MODVERSIONS),y)
+CFLAGS += -DMODVERSIONS
 endif
 
 ifeq ($(ARCH),alpha)
diff -urN GFS2/src/locking/dlock-0.6/Makefile GFS2-modversions/src/locking/dlock-0.6/Makefile
--- GFS2/src/locking/dlock-0.6/Makefile	Wed Apr 21 16:53:54 1999
+++ GFS2-modversions/src/locking/dlock-0.6/Makefile	Wed May 12 02:06:23 1999
@@ -16,6 +16,11 @@
 
 DEBUG = y
 
+#    If module versions are turned on in the kernel, set this to y
+
+MODVERSIONS = n
+
+
 ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/)
 
 
@@ -33,6 +38,10 @@
 CFLAGS += -O -g -DDEBUG
 else
 CFLAGS += -O2
+endif
+
+ifeq ($(MODVERSIONS),y)
+CFLAGS += -DMODVERSIONS
 endif
 
 ifeq ($(ARCH),alpha)
diff -urN GFS2/src/locking/dlock-0.9.4/Makefile GFS2-modversions/src/locking/dlock-0.9.4/Makefile
--- GFS2/src/locking/dlock-0.9.4/Makefile	Wed Apr 21 16:54:22 1999
+++ GFS2-modversions/src/locking/dlock-0.9.4/Makefile	Wed May 12 02:06:32 1999
@@ -16,6 +16,11 @@
 
 DEBUG = y
 
+#    If module versions are turned on in the kernel, set this to y
+
+MODVERSIONS = n
+
+
 ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/)
 
 
@@ -35,6 +40,10 @@
 CFLAGS += -O -g -DDEBUG
 else
 CFLAGS += -O2
+endif
+
+ifeq ($(MODVERSIONS),y)
+CFLAGS += -DMODVERSIONS
 endif
 
 ifeq ($(ARCH),alpha)
diff -urN GFS2/src/locking/nolock/Makefile GFS2-modversions/src/locking/nolock/Makefile
--- GFS2/src/locking/nolock/Makefile	Tue Apr  6 01:02:00 1999
+++ GFS2-modversions/src/locking/nolock/Makefile	Wed May 12 02:06:11 1999
@@ -16,6 +16,11 @@
 
 DEBUG = y
 
+#    If module versions are turned on in the kernel, set this to y
+
+MODVERSIONS = n
+
+
 ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/)
 
 
@@ -33,6 +38,10 @@
 CFLAGS += -O -g -DDEBUG
 else
 CFLAGS += -O2
+endif
+
+ifeq ($(MODVERSIONS),y)
+CFLAGS += -DMODVERSIONS
 endif
 
 ifeq ($(ARCH),alpha)
diff -urN GFS2/src/locking/stupid/Makefile GFS2-modversions/src/locking/stupid/Makefile
--- GFS2/src/locking/stupid/Makefile	Tue Apr  6 01:02:30 1999
+++ GFS2-modversions/src/locking/stupid/Makefile	Wed May 12 02:06:00 1999
@@ -16,6 +16,11 @@
 
 DEBUG = y
 
+#    If module versions are turned on in the kernel, set this to y
+
+MODVERSIONS = n
+
+
 ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/)
 
 
@@ -33,6 +38,10 @@
 CFLAGS += -O -g -DDEBUG
 else
 CFLAGS += -O2
+endif
+
+ifeq ($(MODVERSIONS),y)
+CFLAGS += -DMODVERSIONS
 endif
 
 ifeq ($(ARCH),alpha)
diff -urN GFS2/src/pool/Makefile GFS2-modversions/src/pool/Makefile
--- GFS2/src/pool/Makefile	Tue Apr 13 15:09:07 1999
+++ GFS2-modversions/src/pool/Makefile	Wed May 12 02:15:42 1999
@@ -20,6 +20,10 @@
 
 DLOCK_VERSION = 3
 
+#    If module versions are turned on in the kernel, set this to y
+
+MODVERSIONS = n
+
 
 ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/)
 
@@ -37,10 +41,14 @@
   DLOCKVER += -DDLOCK_VERSION=2
 endif
 
+ifeq ($(MODVERSIONS),y)
+  MOD += -DMODVERSIONS
+endif
+
 
 INCLUDE = -I../include -I../../config -I/usr/src/linux/drivers/scsi
 
-CFLAGS = -D__KERNEL__ -DMODULE -Wall $(DEBFLAGS) $(DLOCKVER) $(INCLUDE)
+CFLAGS = -D__KERNEL__ -DMODULE -Wall $(DEBFLAGS) $(DLOCKVER) $(MOD) $(INCLUDE)
 
 #  These should be changed to the correct flags for your Alpha
 
diff -urN GFS2/src/pool/pool_linux.c GFS2-modversions/src/pool/pool_linux.c
--- GFS2/src/pool/pool_linux.c	Fri May  7 15:13:22 1999
+++ GFS2-modversions/src/pool/pool_linux.c	Wed May 12 02:17:58 1999
@@ -20,8 +20,12 @@
 *******************************************************************************
 ******************************************************************************/
 
+#define __NO_VERSION__ 
 #define EXPORT_SYMTAB
 #include <linux/module.h>
+#include <linux/version.h>
+char kernel_version [] = UTS_RELEASE;
+
 #include <linux/fs.h>
 #include <linux/types.h>
 #include <linux/malloc.h>
