Return-Path: <bluca@comedia.it>
Date: Mon, 12 Feb 2001 10:26:49 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
Message-ID: <20010212102649.D18830@colombina.comedia.it>
References: <3A85CE89.67D252D7@wrkhors.com> <17316403266.20010211154237@lopez.at> <20010211193524.B5840@colombina.comedia.it> <3A86F85C.ADEE5C04@wrkhors.com> <20010211224053.B6755@colombina.comedia.it> <3A870FAB.5BA5E49@wrkhors.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A870FAB.5BA5E49@wrkhors.com>; from lembark@wrkhors.com on Sun, Feb 11, 2001 at 04:18:19PM -0600
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Feb 11, 2001 at 04:18:19PM -0600, Steven Lembark wrote:
> 
> > i requote myself:
> > if you want to change the behaviour do this
> > and rerun autoconf
> > ^^^^^^^^^^^^^^^^^^
> 
> oops. 
> 
> any reason that the install has to set the ownership & mods?
> i don't remember anything in the code that explicitly checks
> file ownership (vs euid of proc execing them), but may have
> missed something.
> 

sigh,

--- LVM/kernel/Makefile.bluca.orig	Mon Nov 13 01:04:57 2000
+++ LVM/kernel/Makefile	Mon Feb 12 10:22:45 2001
@@ -47,7 +47,7 @@
 
 install-module:	lvm.o
 	rm -f $(LVM_DEST)
-	install -o root -g root -m 644 lvm.o $(LVM_DEST)
+	install -m 644 lvm.o $(LVM_DEST)
 	rm -f /dev/lvm; mknod /dev/lvm c $(LVM_MAJOR) 0; chmod 640 /dev/lvm
 
 remove-module:	lvm.o
@@ -88,8 +88,8 @@
 	then \
            cp -p $(KSYMS_DEST) $(KSYMS_DEST).ORG; \
 	fi
-	install -o root -g root -m 555 $(LL_RW_BLK) $(LL_RW_BLK_DEST)
-	install -o root -g root -m 555 $(KSYMS) $(KSYMS_DEST)
+	install -m 755 $(LL_RW_BLK) $(LL_RW_BLK_DEST)
+	install -m 755 $(KSYMS) $(KSYMS_DEST)
 
 install_this:	install-ll_rw_blk install-module
 
--- LVM/tools/man8/Makefile.in.bluca.orig	Sat Jan 27 11:36:30 2001
+++ LVM/tools/man8/Makefile.in	Mon Feb 12 10:21:38 2001
@@ -40,7 +40,7 @@
 	@for f in $(ALL_MANUALS); \
 	do \
 	   rm -f $(MAN8DIR)/$$f; \
-	   @INSTALL@ -D -o root -g root -m 444 $$f $(MAN8DIR)/$$f; \
+	   @INSTALL@ -D -m 644 $$f $(MAN8DIR)/$$f; \
 	done
 
 remove-man8:
--- LVM/tools/Makefile.in.bluca.orig	Sat Feb 10 13:00:50 2001
+++ LVM/tools/Makefile.in	Mon Feb 12 10:20:37 2001
@@ -77,13 +77,13 @@
 	do \
   	   rm -f ${sbindir}/$$f; \
 	   @INSTALL@ -d ${sbindir}; \
-	   @INSTALL@ -o root -g root -m 555 -s $$f ${sbindir}/$$f; \
+	   @INSTALL@ -m 755 -s $$f ${sbindir}/$$f; \
 	done
 	@for f in $(ALL_SCRIPTS); \
 	do \
 	   rm -f ${sbindir}/$$f; \
 	   @INSTALL@ -d ${sbindir}; \
-	   @INSTALL@ -o root -g root -m 555 $$f ${sbindir}/$$f; \
+	   @INSTALL@ -m 755 $$f ${sbindir}/$$f; \
 	done
 
 remove-bin:	$(ALL_TARGETS) $(ALL_SCRIPTS)
--- LVM/configure.in.bluca.orig	Sat Feb 10 13:00:50 2001
+++ LVM/configure.in	Sun Feb 11 19:22:22 2001
@@ -74,8 +74,8 @@
                           statically.  Default is dynamic linking],  STATIC_LINK=$enableval, STATIC_LINK=no)
 
 dnl Mess with default exec_prefix
-if [[ "x$exec_prefix" = xNONE ]];
- then  exec_prefix="/";
+if [[ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ]];
+ then  exec_prefix="";
 fi;
 
 dnl Checks for library functions.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
