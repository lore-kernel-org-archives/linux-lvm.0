Return-Path: <wish@dumain.com>
Message-ID: <20010821224625.22526.qmail@dumain.com>
From: wish-lvm@dumain.com
Subject: Re: [linux-lvm] Building outside source tree 
In-reply-to: Your message of "Tue, 21 Aug 2001 12:12:29 CDT."
             <20010821121229.A4661@sistina.com> 
Date: Tue, 21 Aug 2001 23:46:25 +0100
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
Cc: LVM-Devel@sistina.com

> > The following patch allows building the lvm utilities in a=20
> > seperate directory from the source.  It is a patch agains 1.0.1rc1
> > and has been tested with linux 2.2.18.
> 
> Committed, with the following changes to make everything work:
>
Applying the following patch on top of your patch & my original patch
allows lvm to be built when the path to the source is specified 
as either an absolute path or a relative path.  It
has been tested in the following situations:

1.Absolute path specified from unrelated directory.
2.Relative path specified from unrelated directory.
3.Relative path specified from child directory (../configure).
4.Relative path specified from source directory (./configure).

All versions appear to work.
NB kernel source must be specified with an absolute path.


diff -u --new-file --recursive 1.0.1-wh2/configure 1.0.1-wh3/configure
--- 1.0.1-wh2/configure	Tue Aug 21 19:14:48 2001
+++ 1.0.1-wh3/configure	Tue Aug 21 23:03:02 2001
@@ -2171,6 +2171,3 @@
 rm -fr confdefs* $ac_clean_files
 test "$no_create" = yes || ${CONFIG_SHELL-/bin/sh} $CONFIG_STATUS || exit 1
 
-
-ln -sf $topobjdir/$srcdir/kernel/lvm.h tools/lib/lvm.h
-
diff -u --new-file --recursive 1.0.1-wh2/configure.in 1.0.1-wh3/configure.in
--- 1.0.1-wh2/configure.in	Tue Aug 21 19:14:48 2001
+++ 1.0.1-wh3/configure.in	Tue Aug 21 22:23:45 2001
@@ -118,4 +118,3 @@
 tools/lib/Makefile							\
 tools/man8/Makefile							\
 )
-AC_OUTPUT_COMMANDS([ln -sf $topobjdir/$srcdir/kernel/lvm.h tools/lib/lvm.h])
diff -u --new-file --recursive 1.0.1-wh2/tools/lib/Makefile.in 1.0.1-wh3/tools/lib/Makefile.in
--- 1.0.1-wh2/tools/lib/Makefile.in	Mon Jul 30 11:52:33 2001
+++ 1.0.1-wh3/tools/lib/Makefile.in	Tue Aug 21 22:30:24 2001
@@ -38,7 +38,7 @@
 
 ALL_RM = $(ALL_OBJECTS) $(ALL_POBJECTS) $(ARCHIVE) $(SO) $(SOM) $(SOV)
 
-all_this: $(ARCHIVE) $(SO) Makefile
+all_this: $(ARCHIVE) $(SO) Makefile lvm.h
 	@echo ""
 	@echo "Done Library parts"
 	@echo ""
@@ -60,11 +60,11 @@
 	@rm -f $(DESTDIR)$(libdir)/${SO} $(DESTDIR)$(libdir)/${SOV} \
 		$(DESTDIR)$(libdir)/${SOM} $(DESTDIR)$(staticlibdir)/$(ARCHIVE);
 
-$(ALL_SOURCES):	liblvm.h $(OTHER_DEP)
+$(ALL_SOURCES):	liblvm.h $(OTHER_DEP) lvm.h
 
-$(ALL_OBJECTS):	liblvm.h $(OTHER_DEP)
+$(ALL_OBJECTS):	liblvm.h $(OTHER_DEP) lvm.h
 
-$(ALL_POBJECTS): liblvm.h $(OTHER_DEP)
+$(ALL_POBJECTS): liblvm.h $(OTHER_DEP) lvm.h
 
 $(ARCHIVE): $(ALL_OBJECTS)
 	@echo "Making User parts"
@@ -77,6 +77,8 @@
 	ln -sf $(SOV) $(SOM)
 	ln -sf $(SOV) $(SO)
 
+lvm.h: 
+	ln -sf $(TOP)/kernel/lvm.h lvm.h
 clean_this:
 	rm -f $(ALL_RM)
 
