Date: Fri, 14 Apr 2000 16:32:43 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: [linux-lvm] patch for Makefile of LVM 0.8final
Message-ID: <20000414163242.A21335@home.ds9a.nl>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelsha@ez-darmstadt.telekom.de
Cc: linux-lvm@msede.com

Heinz, people,

With this patch I am able to run 'Make install' on both my Debian and RedHat
6.1 boxes without an error when stripping the initrd script. Please apply.


diff -u -r 0.8final.orig/tools/Makefile 0.8final/tools/Makefile
--- 0.8final.orig/tools/Makefile	Tue Feb 22 03:09:32 2000
+++ 0.8final/tools/Makefile	Fri Apr 14 16:22:21 2000
@@ -63,11 +63,18 @@
 l:	list
 
 install-bin:	$(ALL_TARGETS) $(ALL_SCRIPTS)
-	@echo "*** Installing $(ALL_TARGETS) $(ALL_SCRIPTS) in $(BINDIR) ***"
-	@for f in $(ALL_TARGETS) $(ALL_SCRIPTS); \
+	@echo "*** Installing $(ALL_TARGETS) in $(BINDIR) ***"
+	@for f in $(ALL_TARGETS) ; \
 	do \
-  	   rm -f $(BINDIR)/$$f; \
+  	   rm -f "$(BINDIR)/$$f"; \
 	   install -o root -g root -m 555 -s $$f $(BINDIR)/$$f; \
+	done
+
+	@echo "*** Installing $(ALL_SCRIPTS) in $(BINDIR) ***"
+	@for f in $(ALL_SCRIPTS); \
+	do \
+  	   rm -f "$(BINDIR)/$$f"; \
+	   install -o root -g root -m 555 $$f $(BINDIR)/$$f; \
 	done
 

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
