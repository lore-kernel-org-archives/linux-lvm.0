Return-Path: <dice@mfa.kfki.hu>
Date: Fri, 15 Jun 2001 12:12:09 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.33.0106151209260.29617-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Subject: [linux-lvm] $(DESTDIR) inclusion into Makefile.in files
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

It would be probably a good idea to insert a $(DESTDIR) in front of all
installation targets. This would make packagers life easyer.

The following patch does this.

Thanks,
Gergely

diff -ur 0.9.1_beta7-orig/tools/Makefile.in 0.9.1_beta7/tools/Makefile.in
--- 0.9.1_beta7-orig/tools/Makefile.in	Wed Feb 14 19:28:06 2001
+++ 0.9.1_beta7/tools/Makefile.in	Wed Jun 13 12:40:40 2001
@@ -72,18 +72,18 @@
 l:	list

 install-bin:	$(ALL_TARGETS) $(ALL_SCRIPTS)
-	@echo "*** Installing $(ALL_TARGETS) $(ALL_SCRIPTS) in ${sbindir} ***"
+	@echo "*** Installing $(ALL_TARGETS) $(ALL_SCRIPTS) in $(DESTDIR)${sbindir} ***"
 	@for f in $(ALL_TARGETS); \
 	do \
-  	   rm -f ${sbindir}/$$f; \
-	   @INSTALL@ -d ${sbindir}; \
-	   @INSTALL@ -o ${OWNER} -g ${GROUP} -m 555 -s $$f ${sbindir}/$$f; \
+  	   rm -f $(DESTDIR)${sbindir}/$$f; \
+	   @INSTALL@ -d $(DESTDIR)${sbindir}; \
+	   @INSTALL@ -o ${OWNER} -g ${GROUP} -m 555 -s $$f $(DESTDIR)${sbindir}/$$f; \
 	done
 	@for f in $(ALL_SCRIPTS); \
 	do \
-	   rm -f ${sbindir}/$$f; \
-	   @INSTALL@ -d ${sbindir}; \
-	   @INSTALL@ -o ${OWNER} -g ${GROUP} -m 555 $$f ${sbindir}/$$f; \
+	   rm -f $(DESTDIR)${sbindir}/$$f; \
+	   @INSTALL@ -d $(DESTDIR)${sbindir}; \
+	   @INSTALL@ -o ${OWNER} -g ${GROUP} -m 555 $$f $(DESTDIR)${sbindir}/$$f; \
 	done

 remove-bin:	$(ALL_TARGETS) $(ALL_SCRIPTS)
diff -ur 0.9.1_beta7-orig/tools/lib/Makefile.in 0.9.1_beta7/tools/lib/Makefile.in
--- 0.9.1_beta7-orig/tools/lib/Makefile.in	Fri Mar  2 17:34:03 2001
+++ 0.9.1_beta7/tools/lib/Makefile.in	Wed Jun 13 12:41:37 2001
@@ -44,14 +44,14 @@
 	@echo ""

 install_this:
-	@echo "*** Installing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
-	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(ARCHIVE);
-	@INSTALL@ -d ${libdir}
-	@INSTALL@ -o ${OWNER} -g ${GROUP} $(ARCHIVE) $(SOV) ${libdir}
-	chmod 444 ${libdir}/$(ARCHIVE)
-	chmod 555 ${libdir}/$(SOV)
-	ln -s $(SOV) ${libdir}/${SO}
-	ln -s $(SOV) ${libdir}/${SOM}
+	@echo "*** Installing $(ARCHIVE) and $(SO) in $(DESTDIR)${prefix}/lib ***"
+	@rm -f $(DESTDIR)${libdir}/${SO} $(DESTDIR)${libdir}/${SOV} $(DESTDIR)${libdir}/${SOM} $(DESTDIR)${libdir}/$(ARCHIVE);
+	@INSTALL@ -d $(DESTDIR)${libdir}
+	@INSTALL@ -o ${OWNER} -g ${GROUP} $(ARCHIVE) $(SOV) $(DESTDIR)${libdir}
+	chmod 444 $(DESTDIR)${libdir}/$(ARCHIVE)
+	chmod 555 $(DESTDIR)${libdir}/$(SOV)
+	ln -s $(SOV) $(DESTDIR)${libdir}/${SO}
+	ln -s $(SOV) $(DESTDIR)${libdir}/${SOM}

 remove_this:
 	@echo "*** Removing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
diff -ur 0.9.1_beta7-orig/tools/man8/Makefile.in 0.9.1_beta7/tools/man8/Makefile.in
--- 0.9.1_beta7-orig/tools/man8/Makefile.in	Wed Feb 14 19:28:07 2001
+++ 0.9.1_beta7/tools/man8/Makefile.in	Wed Jun 13 12:41:59 2001
@@ -36,11 +36,11 @@
 	@true

 install-man8:
-	@echo "*** Installing $(ALL_MANUALS) in $(MAN8DIR) ***"
+	@echo "*** Installing $(ALL_MANUALS) in $(DESTDIR)$(MAN8DIR) ***"
 	@for f in $(ALL_MANUALS); \
 	do \
-	   rm -f $(MAN8DIR)/$$f; \
-	   @INSTALL@ -D -o ${OWNER} -g ${GROUP} -m 444 $$f $(MAN8DIR)/$$f; \
+	   rm -f $(DESTDIR)$(MAN8DIR)/$$f; \
+	   @INSTALL@ -D -o ${OWNER} -g ${GROUP} -m 444 $$f $(DESTDIR)$(MAN8DIR)/$$f; \
 	done

 remove-man8:
