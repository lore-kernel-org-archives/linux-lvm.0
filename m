Return-Path: <wish@dumain.com>
Message-ID: <20010820205802.29906.qmail@dumain.com>
Date: Mon, 20 Aug 2001 21:58:02 +0100
From: Bill Hay <wish@dumain.com>
Subject: [linux-lvm] Building outside source tree
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
MIME-Version: 1.0
Content-Type: text; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

The following patch allows building the lvm utilities in a 
seperate directory from the source.  It is a patch agains 1.0.1rc1
and has been tested with linux 2.2.18.


diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/INSTALL 1.0.1-wh1/INSTALL
--- ../../orig/LVM/1.0.1-rc1/INSTALL	Fri Aug 17 19:58:22 2001
+++ 1.0.1-wh1/INSTALL	Mon Aug 20 21:43:31 2001
@@ -8,29 +8,36 @@
 
 If you don't have a stock kernel including LVM or you want to use a more
 recent LVM version than the one in the stock kernel you have to patch your
-kernel with the corresponding patch. See bellow for details.
+kernel with the corresponding patch. See below for details.
 
+1. Unpack the source code.  This will create a directory called
+   LVM/1.0.1-rc1 containing the sourcecode, documentation and
+   the configure script.
 
-1. Change to LVM/1.0.1-rc1/
+2. Change directories to the directory where you want to build
+   the lvm utilities and run the configure script from the
+   source directory.  You will need to tell configure where
+   the kernel source is located using  --with-kernel_dir=.
 
-2. run the configure script 
+3. Build and apply the appropriate kernel patches following the 
+   instructions in PATCHES/README.
 
-3. Follow the instructions in PATCHES/README to create
-   a patch for your kernel and apply it
+4. Configure and build a new kernel following the instructions
+   in the README file at the top of the kernel source tree.
+   Make sure that you enable lvm when configuring the kernel
+   (you should find it under block devices).
 
-4. cd to /usr/src/linux and configure LVM and loadable module support
-   if you want to load it as a module (see /usr/src/linux/README for
-   instructions) by "make config/menuconfig/xconfig" (whichever you prefer)
+5. Install the new kernel and modules making sure you have
+   some means of booting the old kernel if something goes 
+   wrong.
 
-5. Build a new kernel
+6. Type "make" in the lvm build directory to create the library
+   and utilities.
 
-6. Change back to LVM/1.0.1-rc1/
+7. Type "make install" in the lvm build directory to install the
+   lvm library, utilities and man pages.
 
-7. Do a "make"
-
-8. Do a "make install"
-
-9. Omit this step if you chose yes for LVM instead of module in "make config".
+8. If you built the lvm kernel code as a module then:
 
    Put an "insmod lvm-mod" into your startup script OR check/extend
    /etc/modules.conf (formerly /etc/conf.modules) for/by
@@ -40,19 +47,18 @@
 
    to enable modprobe to load the LVM module (don't forget to enable kmod).
 
-10. Add a "vgscan" and a "vgchange -a y" to your startup files
-    (/sbin/init.d/boot with SuSE for eg.) so that the actual volume
-    group configuration is online after each reboot.
-
-    Put a "vgchange -a n" into your shutdown script (/sbin/init.d/halt for eg.)
-    after dismounting all filesystems.
-
-11. Please remember to keep a lilo.conf entry which is configured to boot
-    the previous kernel in case of an emergency!
-
-    Reboot your machine.
+9. Add a "vgscan" and a "vgchange -a y" to your startup files
+   (/sbin/init.d/boot with SuSE for eg.) so that the actual volume
+   group configuration is online after each reboot.
+
+   Put a "vgchange -a n" into your shutdown script (/sbin/init.d/halt for eg.)
+   after dismounting all filesystems.
+
+10. Reboot your machine with the new kernel (remember what we said
+    about having some means to boot the old kernel in case something 
+    goes wrong).
 
-12. read the ascii file LVM-HOWTO to go ahead using the LVM
+11. Read the ascii file LVM-HOWTO to go ahead using the LVM
     and read the manuals starting with lvm(8).
 
 
@@ -60,7 +66,7 @@
 
 If you want to remove the LVM software.
 
-1. change directory to LVM/1.0.1-rc1
+1. change to the lvm build directory
 
 2. do a "make remove"
 
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/PATCHES/Makefile.in 1.0.1-wh1/PATCHES/Makefile.in
--- ../../orig/LVM/1.0.1-rc1/PATCHES/Makefile.in	Tue Apr 24 15:29:19 2001
+++ 1.0.1-wh1/PATCHES/Makefile.in	Sun Aug 19 13:51:53 2001
@@ -26,11 +26,11 @@
 LVM_VERSION=@lvm_ver@
 KERNEL_VERSION=@kernel_ver@
 
-DRIVER_DIR=../kernel
+DRIVER_DIR=@top_srcdir@/kernel
 CLEANED_DIR=cleaned
-CLEANER=../scripts/select_version
-PATCHER=../scripts/patch_fragment
-FRAGGER=../scripts/select_fragments
+CLEANER=@top_srcdir@/scripts/select_version
+PATCHER=@top_srcdir@/scripts/patch_fragment
+FRAGGER=@top_srcdir@/scripts/select_fragments
 LVM_PATCH=./lvm-$(LVM_VERSION)-$(KERNEL_VERSION).patch
 
 ifneq (,$(findstring 2.2,$(KERNEL_VERSION)))
@@ -51,7 +51,7 @@
 	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm-internal.h $(CLEANED_DIR)/lvm-internal.h >> $@
 	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm-snap.c $(CLEANED_DIR)/lvm-snap.c >> $@
 	$(PATCHER) $(KERNEL_DIR) $(K_DRIVER_DIR)/lvm-fs.c $(CLEANED_DIR)/lvm-fs.c >> $@
-	$(FRAGGER) $(KERNEL_VERSION) >> $@
+	(cd @top_srcdir@/PATCHES/ ; $(FRAGGER) $(KERNEL_VERSION)) >> $@
 
 $(CLEANED_DIR)/lvm.h: $(DRIVER_DIR)/lvm.h cleaned
 	$(CLEANER) $(KERNEL_VERSION) < $< > $@
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/PATCHES/README 1.0.1-wh1/PATCHES/README
--- ../../orig/LVM/1.0.1-rc1/PATCHES/README	Tue Apr 24 15:29:19 2001
+++ 1.0.1-wh1/PATCHES/README	Mon Aug 20 21:32:52 2001
@@ -11,34 +11,18 @@
 If you are not familiar with patching or building the kernel then
 consider looking for pre-built binaries of LVM.
 
-Configuring LVM for your kernel
--------------------------------
-
-You can skip this step if you are sure you ran configure with the correct
-options.
-
-o untar your clean Linux kernel
-
-o run 'make distclean' in the directory above this one to clean up any
-  previous configure information.  If you get an error that says
-  "make: *** No rule to make target `distclean'.  Stop." it generally
-  means your source tree is clean and you can ignore it.
-  
-o run configure in the directory above this one to produce 'Makefile', making
-  sure to specify the '--with-kernel_dir=' flag if your kernel source is not
-  in '/usr/src/linux'.
-
 Creating the patch
 ------------------
 
-o check the following variables at the top of 'Makefile' in the PATCHES
-  directory
+o Check the following variables at the top of 'Makefile' in the PATCHES
+  subdirectory of your lvm build directory.  If these are not correct
+  then you probably didn't pass the correct values to configure.
 
   KERNEL_DIR should point to the kernel source that you wish to patch
   eg, KERNEL_DIR=/usr/src/linux
 
   LVM_VERSION the LVM version
-  eg, LVM_VERSION=0.9.1_beta5
+  eg, LVM_VERSION=1.0.1
 
   KERNEL_VERSION the version of your kernel that is to be patched
   eg, KERNEL_VERSION=2.2.18
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/configure 1.0.1-wh1/configure
--- ../../orig/LVM/1.0.1-rc1/configure	Fri Aug 17 15:03:29 2001
+++ 1.0.1-wh1/configure	Sun Aug 19 13:52:04 2001
@@ -1585,12 +1585,12 @@
    kernel_dir=/usr/src/linux 
 fi
 
-kernel_ver=`scripts/linuxver -d $kernel_dir`
-lvm_ver=`scripts/lvmver -d .`
-lvm_majver=`scripts/lvmver -d . | sed -e 's/\([0-9][0-9]*\)\.\([0-9][0-9]*\)\(.*\)*/\1/'`
-lvm_minver=`scripts/lvmver -d . | sed -e 's/\([0-9][0-9]*\)\.\([0-9][0-9]*\)\(.*\)*/\2/'`
-iop_ver=`scripts/iopver -d .`
-
+kernel_ver=`cd $srcdir;./scripts/linuxver -d $kernel_dir`
+lvm_ver=`cd $srcdir; ./scripts/lvmver -d .`
+lvm_majver=`cd $srcdir; ./scripts/lvmver -d . | sed -e 's/\([0-9][0-9]*\)\.\([0-9][0-9]*\)\(.*\)*/\1/'`
+lvm_minver=`cd $srcdir; ./scripts/lvmver -d . | sed -e 's/\([0-9][0-9]*\)\.\([0-9][0-9]*\)\(.*\)*/\2/'`
+iop_ver=`cd $srcdir; ./scripts/iopver -d .`
+topobjdir=`pwd`
 if [ -z $iop_ver ]; 
 then 
   echo "Unable to determine IOP version...configure failed.";
@@ -1878,6 +1878,7 @@
 
 
 
+
 trap '' 1 2 15
 cat > confcache <<\EOF
 # This file is a shell script that caches the results of configure
@@ -2049,6 +2050,7 @@
 s%@lvm_majver@%$lvm_majver%g
 s%@lvm_minver@%$lvm_minver%g
 s%@iop_ver@%$iop_ver%g
+s%@topobjdir@%$topobjdir%g
 
 CEOF
 EOF
@@ -2170,5 +2172,5 @@
 test "$no_create" = yes || ${CONFIG_SHELL-/bin/sh} $CONFIG_STATUS || exit 1
 
 
-ln -f kernel/lvm.h tools/lib/lvm.h
+ln -sf $srcdir/kernel/lvm.h tools/lib/lvm.h
 
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/configure.in 1.0.1-wh1/configure.in
--- ../../orig/LVM/1.0.1-rc1/configure.in	Fri Aug 17 15:03:29 2001
+++ 1.0.1-wh1/configure.in	Sun Aug 19 10:51:48 2001
@@ -66,13 +66,13 @@
   [ kernel_dir="$withval" ],
   [ kernel_dir=/usr/src/linux ])
 dnl -- get the version of the specified kernel
-kernel_ver=`scripts/linuxver -d $kernel_dir`
+kernel_ver=`cd $srcdir;./scripts/linuxver -d $kernel_dir`
 dnl -- get the version of LVM we are configuring
-lvm_ver=`scripts/lvmver -d .`
-lvm_majver=`scripts/lvmver -d . | sed -e 's/\([[0-9]][[0-9]]*\)\.\([[0-9]][[0-9]]*\)\(.*\)*/\1/'`
-lvm_minver=`scripts/lvmver -d . | sed -e 's/\([[0-9]][[0-9]]*\)\.\([[0-9]][[0-9]]*\)\(.*\)*/\2/'`
-iop_ver=`scripts/iopver -d .`
-
+lvm_ver=`cd $srcdir; ./scripts/lvmver -d .`
+lvm_majver=`cd $srcdir; ./scripts/lvmver -d . | sed -e 's/\([[0-9]][[0-9]]*\)\.\([[0-9]][[0-9]]*\)\(.*\)*/\1/'`
+lvm_minver=`cd $srcdir; ./scripts/lvmver -d . | sed -e 's/\([[0-9]][[0-9]]*\)\.\([[0-9]][[0-9]]*\)\(.*\)*/\2/'`
+iop_ver=`cd $srcdir; ./scripts/iopver -d .`
+topobjdir=`pwd`
 if [[ -z $iop_ver ]]; 
 then 
   echo "Unable to determine IOP version...configure failed.";
@@ -106,6 +106,7 @@
 AC_SUBST(lvm_majver)
 AC_SUBST(lvm_minver)
 AC_SUBST(iop_ver)
+AC_SUBST(topobjdir)
 dnl First and last lines should not contain files to generate in order to 
 dnl keep utility scripts running properly
 AC_OUTPUT( 								\
@@ -117,4 +118,4 @@
 tools/lib/Makefile							\
 tools/man8/Makefile							\
 )
-AC_OUTPUT_COMMANDS([ln -f kernel/lvm.h tools/lib/lvm.h])
+AC_OUTPUT_COMMANDS([ln -sf $srcdir/kernel/lvm.h tools/lib/lvm.h])
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/make.tmpl.in 1.0.1-wh1/make.tmpl.in
--- ../../orig/LVM/1.0.1-rc1/make.tmpl.in	Mon Jun 18 18:47:55 2001
+++ 1.0.1-wh1/make.tmpl.in	Mon Aug 20 21:33:32 2001
@@ -41,7 +41,7 @@
 sbindir = @sbindir@
 infodir = @infodir@
 mandir = @mandir@
-
+topobjdir = @topobjdir@
 # setup misc variables
 # define the ownership variables for the binaries and man pages
 OWNER=@OWNER@
@@ -59,26 +59,26 @@
 .SUFFIXES = .o.po.c
 
 %.a:	%.o
-	$(AR) -r $@ $*.o
+	$(AR) -r $@ $<
 
 %.o:	%.c
-	$(CC) -c -pipe $(CFLAGS) -o $@ $*.c
+	$(CC) -c -pipe $(CFLAGS) -o $@ $<
 
 %.po:	%.c
-	$(CC) -c -pipe $(CFLAGS) -fPIC -o $@ $*.c
+	$(CC) -c -pipe $(CFLAGS) -fPIC -o $@ $<
 
 %:	%.o $(LIBS)
-	$(CC) $(LDFLAGS) $*.o $(LOADLIBES) $(LDLIBS) -o $@
+	$(CC) $(LDFLAGS) $< $(LOADLIBES) $(LDLIBS) -o $@
 
 CFLAGS+= @CFLAGS@ -Wall
 
-ALL_SOURCES = $(wildcard *.c)
-ALL_TARGETS = $(ALL_SOURCES:.c=)
+ALL_SOURCES := $(foreach dir,. $(subst :, ,$(VPATH)),$(wildcard $(dir)/*.c))
+ALL_TARGETS := $(notdir $(ALL_SOURCES:.c=))
 ALL_EXECS = $(ALL_TARGETS)
-ALL_HEADERS = $(wildcard *.h)
+ALL_HEADERS := $(notdir $(foreach dir,. $(subst :, ,$(VPATH)),$(wildcard $(dir)/*.h)))
 ALL_FILES = $(ALL_SOURCES) $(ALL_HEADERS)
-ALL_OBJECTS = $(ALL_SOURCES:.c=.o)
-ALL_POBJECTS = $(ALL_SOURCES:.c=.po)
+ALL_OBJECTS := $(notdir $(ALL_SOURCES:.c=.o))
+ALL_POBJECTS := $(notdir $(ALL_SOURCES:.c=.po))
 OTHER_DEP = Makefile
 
 all:	
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/scripts/select_fragments 1.0.1-wh1/scripts/select_fragments
--- ../../orig/LVM/1.0.1-rc1/scripts/select_fragments	Tue Apr 24 15:29:20 2001
+++ 1.0.1-wh1/scripts/select_fragments	Sun Aug 19 13:33:45 2001
@@ -1,7 +1,6 @@
 #! /usr/bin/perl -w
 
 $kver = shift() || _help();
-
 for $f (<fragments-*>) {
     if($f =~ m/fragments-([0-9]+\.[0-9]+\.[0-9]+)/) {
 	if($1 le $kver) {
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/tools/Makefile.in 1.0.1-wh1/tools/Makefile.in
--- ../../orig/LVM/1.0.1-rc1/tools/Makefile.in	Mon Jun 18 18:47:55 2001
+++ 1.0.1-wh1/tools/Makefile.in	Mon Aug 20 17:37:25 2001
@@ -41,11 +41,11 @@
 include ../make.tmpl
 include tools_and_lib.make.tmpl
 
-LOADLIBES = -L$(TOP)/tools/lib
+LOADLIBES = -L$(topobjdir)/tools/lib
 LDLIBS = -llvm-@iop_ver@
 LDFLAGS += @LDFLAGS@
 
-ALL = $(ALL_SOURCES:.c=)
+ALL := $(notdir $(ALL_SOURCES:.c=))
 ALL_RM = $(ALL) $(ALL_OBJECTS)
 ALL_SCRIPTS = lvmcreate_initrd
 
@@ -82,7 +82,7 @@
 	do \
 	   rm -f $(DESTDIR)$(sbindir)/$$f; \
 	   @INSTALL@ -d $(DESTDIR)$(sbindir); \
-	   @INSTALL@ -o $(OWNER) -g $(GROUP) -m 555 $$f $(DESTDIR)$(sbindir)/$$f; \
+	   @INSTALL@ -o $(OWNER) -g $(GROUP) -m 555 $(srcdir)/$$f $(DESTDIR)$(sbindir)/$$f; \
 	done
 
 remove-bin:	$(ALL_TARGETS) $(ALL_SCRIPTS)
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/tools/man8/Makefile.in 1.0.1-wh1/tools/man8/Makefile.in
--- ../../orig/LVM/1.0.1-rc1/tools/man8/Makefile.in	Mon Jun 18 18:47:56 2001
+++ 1.0.1-wh1/tools/man8/Makefile.in	Mon Aug 20 18:35:50 2001
@@ -29,23 +29,21 @@
 
 include ../../make.tmpl
 
-ALL_MANUALS=$(wildcard *.8)
+ALL_MANUALS= $(foreach dir,. $(subst :, ,$(VPATH)),$(wildcard $(dir)/*.8))
+MAN_PAGES= $(notdir $(ALL_MANUALS))
+
 MAN8DIR=${mandir}/man8
 
 all_this:
 	@true
 
-install-man8:
-	@echo "*** Installing $(ALL_MANUALS) in $(DESTDIR)$(MAN8DIR) ***"
-	@for f in $(ALL_MANUALS); \
-	do \
-	   rm -f $(DESTDIR)$(MAN8DIR)/$$f; \
-	   @INSTALL@ -D -o $(OWNER) -g $(GROUP) -m 444 $$f $(DESTDIR)$(MAN8DIR)/$$f; \
-	done
+install-man8: remove-man8
+	@echo "*** Installing $(MAN_PAGES) in $(DESTDIR)$(MAN8DIR) ***"
+	@INSTALL@  -o $(OWNER) -g $(GROUP) -m 444 $(ALL_MANUALS) $(DESTDIR)$(MAN8DIR)/  
 
 remove-man8:
-	@echo "*** Removing $(ALL_MANUALS) from $(DESTDIR)$(MAN8DIR) ***"
-	for f in $(ALL_MANUALS); \
+	@echo "*** Removing $(MAN_PAGES) from $(DESTDIR)$(MAN8DIR) ***"
+	for f in $(MAN_PAGES); \
 	do \
 	  rm -f $(DESTDIR)$(MAN8DIR)/$$f; \
 	done
diff -u --new-file --recursive ../../orig/LVM/1.0.1-rc1/tools/tools_and_lib.make.tmpl.in 1.0.1-wh1/tools/tools_and_lib.make.tmpl.in
--- ../../orig/LVM/1.0.1-rc1/tools/tools_and_lib.make.tmpl.in	Sun Nov 12 18:52:12 2000
+++ 1.0.1-wh1/tools/tools_and_lib.make.tmpl.in	Sun Aug 19 10:32:30 2001
@@ -25,4 +25,4 @@
 #
 
 # CFLAGS += -DLVM_DONT_INTERRUPT
-CFLAGS += -DDEBUG -I${TOP}/tools/lib -I${TOP}/tools
+CFLAGS += -DDEBUG -I${TOP}/tools/lib -I${TOP}/tools -I${topobjdir}/tools/lib
