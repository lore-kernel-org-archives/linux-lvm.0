Date: Sat, 25 Sep 1999 09:49:32 +0200 (CEST)
From: Andreas Kostyrka <andreas@mtg.co.at>
Subject: [linux-lvm] Another patch.
Message-ID: <Pine.LNX.4.10.9909250947150.12228-100000@gatekeeper.zwax.mtg.co.at>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailinglist <linux-lvm@msede.com>

I've done this patch to facilate RPM building. It basically allows
to provide a BuildRoot prefix when installing. It is included with my LVM
user tools RPM. (Could this or something similiar be included with the
standard distribution?)

Andreas

diff -uNr LVM.org/0.7/make.tmpl LVM/0.7/make.tmpl
--- LVM.org/0.7/make.tmpl	Mon Jul 12 23:21:26 1999
+++ LVM/0.7/make.tmpl	Sat Sep 25 01:55:26 1999
@@ -34,6 +34,7 @@
 TOP = /root/LVM/0.7
 
 KERNEL_LOCATION = /usr/src/linux
+PREFIX = 
 
 .SUFFIXES =
 .SUFFIXES = .o.c
@@ -49,7 +50,7 @@
 
 CFLAGS = -Wall -I$(TOP)/tools -I$(TOP)/tools/lib -D__KERNEL__ -O2
 
-BINDIR = /sbin
+BINDIR = ${PREFIX}/sbin
 ALL_SOURCES = $(shell ls *.c)
 ALL_TARGETS = $(ALL_SOURCES:.c=)
 ALL_EXECS = $(ALL_TARGETS)
diff -uNr LVM.org/0.7/tools/lib/Makefile LVM/0.7/tools/lib/Makefile
--- LVM.org/0.7/tools/lib/Makefile	Mon Jul 12 23:21:26 1999
+++ LVM/0.7/tools/lib/Makefile	Sat Sep 25 01:56:21 1999
@@ -38,14 +38,14 @@
 
 install_this:
 	@echo "*** Installing $(ARCHIVE) and $(SO) in /lib ***"
-	rm -f /lib/$(ARCHIVE) /lib/$(SO)
-	cp -p $(ARCHIVE) $(SO) /lib
-	chmod 444 /lib/$(ARCHIVE)
-	chmod 555 /lib/$(SO)
+	rm -f /lib/$(ARCHIVE) ${PREFIX}/lib/$(SO)
+	cp -p $(ARCHIVE) $(SO) ${PREFIX}/lib
+	chmod 444 ${PREFIX}/lib/$(ARCHIVE)
+	chmod 555 ${PREFIX}/lib/$(SO)
 
 remove_this:
 	@echo "*** Removing $(ARCHIVE) and $(SO) in /lib ***"
-	rm -f /lib/$(ARCHIVE) /lib/$(SO)
+	rm -f /lib/$(ARCHIVE) ${PREFIX}/lib/$(SO)
 
 $(ALL_SOURCES):	liblvm.h $(OTHER_DEP)
 
diff -uNr LVM.org/0.7/tools/man8/Makefile LVM/0.7/tools/man8/Makefile
--- LVM.org/0.7/tools/man8/Makefile	Mon Jul 12 23:21:27 1999
+++ LVM/0.7/tools/man8/Makefile	Sat Sep 25 01:56:33 1999
@@ -25,7 +25,7 @@
 include ../../make.tmpl
 
 ALL_MANUALS=$(shell ls *.8)
-MAN8DIR=/usr/man/man8
+MAN8DIR=${PREFIX}/usr/man/man8
 
 all_this:
 	@true

--
Andreas Kostyrka                     | andreas@mtg.co.at
phone: +43/1/7070750                 | phone: +43/676/4091256   
MTG Handelsges.m.b.H.                | fax:   +43/1/7065299
Raiffeisenstr. 16/9                  | 2320 Zwoelfaxing AUSTRIA        
