Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2C4C4804436
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 23:12:04 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net [68.14.253.125])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2C4C207028941
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 23:12:03 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1B1e1d-0001Eg-H2
	for linux-lvm@redhat.com; Thu, 11 Mar 2004 21:11:57 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
 by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04464-04 for <linux-lvm@redhat.com>;
 Thu, 11 Mar 2004 21:11:47 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1B1e1T-0001Ea-1d
	for linux-lvm@redhat.com; Thu, 11 Mar 2004 21:11:47 -0700
Received: from [192.168.172.107] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05)
	id 1B1e1R-0003mz-00
	for linux-lvm@redhat.com; Thu, 11 Mar 2004 21:11:45 -0700
Message-ID: <4051388C.3050700@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [RFC][PATCH] proper DESTDIR handling for device-mapper and LVM2
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar 11 23:10:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

The patches below are intended to make the DESTDIR handling in the 
device-mapper and LVM2 Makefiles a little more useful, and to fix a 
number of problems with the current DESTDIR handling. The patches are 
against the latest tarballs (device-mapper.1.00.08 and LVM2.2.00.08). 
Links to the patches are:

http://www.backtobasicsmgmt.com/uClibc/device-mapper-DESTDIR.patch
http://www.backtobasicsmgmt.com/uClibc/LVM2-DESTDIR.patch

Commented versions are inline below. The patches assume that DESTDIR is 
used only for "make install"-type targets, not during compile and/or 
link phases. This is the most common usage of DESTDIR, unless I'm very 
much mistaken :-) If so, please correct my misunderstanding...

--- snip patch for device-mapper ---

diff -ur device-mapper.1.00.08/dmsetup/Makefile.in 
device-mapper.new/dmsetup/Makefile.in
--- device-mapper.1.00.08/dmsetup/Makefile.in	Tue Feb 24 12:05:44 2004
+++ device-mapper.new/dmsetup/Makefile.in	Thu Mar 11 20:37:53 2004
@@ -16,11 +16,10 @@
  dmsetup: $(OBJECTS) $(interfacedir)/libdevmapper.so \
  	 $(interfacedir)/libdevmapper.a
  	$(CC) -o dmsetup $(OBJECTS) $(LD_FLAGS) \
-	      -L$(interfacedir) -L$(DESTDIR)/lib $(LIBS) \
-	      -ldevmapper
+	      $(LIBS) -ldevmapper

*** $(interfacedir) is in $(LD_FLAGS) courtesy of make_tmpl
*** -L$(DESTDIR)/lib is just wrong; DESTDIR should not be provided at 
link time, only install time, but if it is provided at link time dmsetup 
could be linked against the wrong system libraries


  install: dmsetup
-	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< $(sbindir)/$<
+	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< 
$(DESTDIR)$(sbindir)/$<

*** see comments for make_tmpl below

  .PHONY: install

Only in device-mapper.new/dmsetup: Makefile.in~
Only in device-mapper.new/lib: .export.sym
diff -ur device-mapper.1.00.08/lib/Makefile.in 
device-mapper.new/lib/Makefile.in
--- device-mapper.1.00.08/lib/Makefile.in	Tue Feb 24 11:46:20 2004
+++ device-mapper.new/lib/Makefile.in	Thu Mar 11 20:33:43 2004
@@ -22,29 +22,29 @@


  install: install_@interface@
-	$(LN_S) -f libdevmapper.so.$(LIB_VERSION) $(libdir)/libdevmapper.so
+	$(LN_S) -f libdevmapper.so.$(LIB_VERSION) 
$(DESTDIR)$(libdir)/libdevmapper.so
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 444 libdevmapper.h \
-		$(includedir)/libdevmapper.h
+		$(DESTDIR)$(includedir)/libdevmapper.h

  install_static: install_@interface@_static
-	$(LN_S) -f libdevmapper.a.$(LIB_VERSION) $(libdir)/libdevmapper.a
+	$(LN_S) -f libdevmapper.a.$(LIB_VERSION) 
$(DESTDIR)$(libdir)/libdevmapper.a
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 444 libdevmapper.h \
-		$(includedir)/libdevmapper.h
+		$(DESTDIR)$(includedir)/libdevmapper.h


  .PHONY: install install_@interface@ install_static 
install_@interface@_static

  install_fs: fs/libdevmapper.so
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< \
-		$(libdir)/libdevmapper.so.$(LIB_VERSION)
+		$(DESTDIR)$(libdir)/libdevmapper.so.$(LIB_VERSION)

  install_ioctl: ioctl/libdevmapper.so
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< \
-		$(libdir)/libdevmapper.so.$(LIB_VERSION)
+		$(DESTDIR)$(libdir)/libdevmapper.so.$(LIB_VERSION)

  install_ioctl_static: ioctl/libdevmapper.a
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< \
-		$(libdir)/libdevmapper.a.$(LIB_VERSION)
+		$(DESTDIR)$(libdir)/libdevmapper.a.$(LIB_VERSION)

  distclean_lib:
  	$(RM) libdm-common.h
Only in device-mapper.new/lib: Makefile.in~
diff -ur device-mapper.1.00.08/make.tmpl.in device-mapper.new/make.tmpl.in
--- device-mapper.1.00.08/make.tmpl.in	Tue Feb 24 12:23:27 2004
+++ device-mapper.new/make.tmpl.in	Thu Mar 11 20:31:08 2004
@@ -31,8 +31,8 @@
  LD_DEPS += @LD_DEPS@

  # Setup directory variables
-prefix = $(DESTDIR)@prefix@
-exec_prefix = $(DESTDIR)@exec_prefix@
+prefix = @prefix@
+exec_prefix = @exec_prefix@

*** this works very poorly; first, autoconf substitutes ${prefix} for 
@exec_prefix@ if the user does not provide --exec-prefix on the 
configure command line, so exec_prefix ends up being 
"$(DESTDIR)$(DESTDIR)${prefix}", and installation fails

*** second, if the user specifies any of --bindir/--sbindir/etc. on the 
configure command line, those exact values are substituted into this 
file, and ${prefix}/${exec_prefix} are not part of the substituted 
values. this means that DESTDIR=/temp_install will have no effect if, 
for example, --bindir=/bin was specified on the command line, but the 
installation should be done to /temp_install/bin

*** changing all the Makefiles to used $(DESTDIR) as a prefix to these 
autoconf-generated variables solves this problem

  bindir = @bindir@
  includedir = @includedir@
  libdir = @libdir@
@@ -80,10 +80,6 @@

  INCLUDES+=-I. -I$(top_srcdir)/include

-ifdef DESTDIR
-  INCLUDES+=-I$(DESTDIR)/usr/include
-endif
-

** again, this is bad; DESTDIR should not even be supplied@compile 
time, so I can't see how this is useful

  ifneq ("@missingkernel@", "yes")
    INCLUDES+=-I$(kerneldir)/include
  endif
Only in device-mapper.new: make.tmpl.in~
diff -ur device-mapper.1.00.08/man/Makefile.in 
device-mapper.new/man/Makefile.in
--- device-mapper.1.00.08/man/Makefile.in	Wed Jan  2 06:40:49 2002
+++ device-mapper.new/man/Makefile.in	Thu Mar 11 20:32:42 2004
@@ -21,7 +21,7 @@
  VPATH = @srcdir@

  MANUALS=$(wildcard *.8)
-MAN8DIR=${mandir}/man8
+MAN8DIR=$(DESTDIR)${mandir}/man8

  include ../make.tmpl

Only in device-mapper.new/man: Makefile.in~

--- snip patch for LVM2 ---

*** same general comments regarding make_tmpl and use of $(DESTDIR) in 
install targets apply here as well

diff -ur LVM2.2.00.08/lib/format1/Makefile.in 
LVM2.new/lib/format1/Makefile.in
--- LVM2.2.00.08/lib/format1/Makefile.in	Wed Aug 20 08:48:25 2003
+++ LVM2.new/lib/format1/Makefile.in	Thu Mar 11 20:42:18 2004
@@ -24,8 +24,8 @@

  install: liblvm2format1.so
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< \
-		$(libdir)/liblvm2format1.so.$(LIB_VERSION)
-	$(LN_S) -f liblvm2format1.so.$(LIB_VERSION) $(libdir)/liblvm2format1.so
+		$(DESTDIR)$(libdir)/liblvm2format1.so.$(LIB_VERSION)
+	$(LN_S) -f liblvm2format1.so.$(LIB_VERSION) 
$(DESTDIR)$(libdir)/liblvm2format1.so

  .PHONY: install

diff -ur LVM2.2.00.08/make.tmpl.in LVM2.new/make.tmpl.in
--- LVM2.2.00.08/make.tmpl.in	Tue Oct 21 14:59:42 2003
+++ LVM2.new/make.tmpl.in	Thu Mar 11 20:40:50 2004
@@ -30,8 +30,8 @@
  CFLAGS += @CFLAGS@

  # Setup directory variables
-prefix = $(DESTDIR)@prefix@
-exec_prefix = $(DESTDIR)@exec_prefix@
+prefix = @prefix@
+exec_prefix = @exec_prefix@
  bindir = @bindir@
  libdir = @libdir@
  sbindir = @sbindir@
@@ -73,10 +73,6 @@
  INCLUDES+=-I. -I$(top_srcdir)/include
  INC_LNS=$(top_srcdir)/include/.symlinks_created

-ifdef DESTDIR
-  INCLUDES+=-I$(DESTDIR)/usr/include
-endif
-
  STRIP=
  #STRIP=-s

diff -ur LVM2.2.00.08/man/Makefile.in LVM2.new/man/Makefile.in
--- LVM2.2.00.08/man/Makefile.in	Fri Nov 14 09:17:55 2003
+++ LVM2.new/man/Makefile.in	Thu Mar 11 20:44:30 2004
@@ -28,8 +28,8 @@
  	vgconvert.8 vgdisplay.8 vgexport.8 vgextend.8 vgimport.8 \
  	vgmerge.8 vgmknodes.8 vgreduce.8 vgremove.8 vgrename.8 \
  	vgs.8 vgscan.8 vgsplit.8
-MAN5DIR=${mandir}/man5
-MAN8DIR=${mandir}/man8
+MAN5DIR=$(DESTDIR)${mandir}/man5
+MAN8DIR=$(DESTDIR)${mandir}/man8

  include ../make.tmpl

diff -ur LVM2.2.00.08/tools/Makefile.in LVM2.new/tools/Makefile.in
--- LVM2.2.00.08/tools/Makefile.in	Wed Nov 12 12:16:48 2003
+++ LVM2.new/tools/Makefile.in	Thu Mar 11 20:43:47 2004
@@ -79,7 +79,7 @@

  lvm: $(OBJECTS) $(top_srcdir)/lib/liblvm.a
  	$(CC) -o lvm $(OBJECTS) $(LD_FLAGS) -L$(top_srcdir)/lib \
-	      -L$(DESTDIR)/lib $(LVMLIBS) $(LIBS)
+	      $(LVMLIBS) $(LIBS)

  .commands: commands.h cmdnames.h Makefile
  	$(CC) -E -P cmdnames.h 2> /dev/null | \
@@ -87,11 +87,11 @@

  install: $(TARGETS)
  	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) lvm \
-		$(sbindir)/lvm
-	@echo Creating symbolic links for individual commands in $(sbindir)
+		$(DESTDIR)$(sbindir)/lvm
+	@echo Creating symbolic links for individual commands in 
$(DESTDIR)$(sbindir)
  	@( \
  		for v in `cat .commands`; do \
-			cd $(sbindir); \
+			cd $(DESTDIR)$(sbindir); \
  			$(LN_S) -f lvm $$v; \
  		done; \
  	)
