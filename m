Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3107lj24270
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 19:07:47 -0500
Received: from maja.beep.pl (exim@smtp.sys.beep.pl [195.245.198.13])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3107jjj026291
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 19:07:45 -0500
Received: from [156.17.236.105] (helo=[192.168.2.2])
	by maja.beep.pl with asmtp (TLSv1:RC4-MD5:128) (Exim 4.30)
	id 1B8pj8-00019l-PG
	for linux-lvm@redhat.com; Thu, 01 Apr 2004 02:06:35 +0200
From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Date: Thu, 1 Apr 2004 02:07:38 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_K11aAOoFBLktdwd"
Message-Id: <200404010207.38892.arekm@pld-linux.org>
Subject: [linux-lvm] DESTDIR is broken in 1.00.09
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Boundary-00=_K11aAOoFBLktdwd
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Current testdir support is broken: try
=2E/configure --bindir=3D/usr/bin --mandir=3D/usr/share/man etc
and you will end up with make.tmpl like

# Setup directory variables
prefix =3D $(DESTDIR)/usr
exec_prefix =3D $(DESTDIR)/usr
bindir =3D /usr/bin
includedir =3D /usr/include
libdir =3D /usr/lib
sbindir =3D /sbin
infodir =3D /usr/share/info
mandir =3D /usr/share/man
kerneldir =3D
interface =3D ioctl
interfacedir =3D $(top_srcdir)/lib/$(interface)

bindir, libdir and friends are substituted to ${prefix}/bin only when --bin=
dir=20
is not specified.

Attached patch fixes that properly.

=2D-=20
Arkadiusz Mi=B6kiewicz     CS at FoE, Wroclaw University of Technology
arekm.pld-linux.org, 1024/3DB19BBD, JID: arekm.jabber.org, PLD/Linux

--Boundary-00=_K11aAOoFBLktdwd
Content-Type: text/x-diff; charset="iso-8859-2";
	name="device-mapper-install.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="device-mapper-install.patch"

diff -urN device-mapper.1.00.09.org/dmsetup/Makefile.in device-mapper.1.00.09/dmsetup/Makefile.in
--- device-mapper.1.00.09.org/dmsetup/Makefile.in	2004-04-01 01:58:07.096597280 +0200
+++ device-mapper.1.00.09/dmsetup/Makefile.in	2004-04-01 02:01:38.120516768 +0200
@@ -28,7 +28,7 @@
 	      -ldevmapper
 
 install: dmsetup
-	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< $(sbindir)/$<
+	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 555 $(STRIP) $< $(DESTDIR)$(sbindir)/$<
 
 .PHONY: install 
 
diff -urN device-mapper.1.00.09.org/lib/Makefile.in device-mapper.1.00.09/lib/Makefile.in
--- device-mapper.1.00.09.org/lib/Makefile.in	2004-04-01 01:58:07.179584664 +0200
+++ device-mapper.1.00.09/lib/Makefile.in	2004-04-01 02:02:30.597539048 +0200
@@ -30,29 +30,29 @@
 
 
 install: install_@interface@
-	$(LN_S) -f libdevmapper.so.$(LIB_VERSION) $(libdir)/libdevmapper.so
+	$(LN_S) -f libdevmapper.so.$(LIB_VERSION) $(DESTDIR)$(libdir)/libdevmapper.so
 	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 444 libdevmapper.h \
-		$(includedir)/libdevmapper.h
+		$(DESTDIR)$(includedir)/libdevmapper.h
 
 install_static: install_@interface@_static
-	$(LN_S) -f libdevmapper.a.$(LIB_VERSION) $(libdir)/libdevmapper.a
+	$(LN_S) -f libdevmapper.a.$(LIB_VERSION) $(DESTDIR)$(libdir)/libdevmapper.a
 	$(INSTALL) -D -o $(OWNER) -g $(GROUP) -m 444 libdevmapper.h \
-		$(includedir)/libdevmapper.h
+		$(DESTDIR)$(includedir)/libdevmapper.h
 
 
 .PHONY: install install_@interface@ install_static install_@interface@_static
 
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
diff -urN device-mapper.1.00.09.org/make.tmpl.in device-mapper.1.00.09/make.tmpl.in
--- device-mapper.1.00.09.org/make.tmpl.in	2004-04-01 01:58:07.094597584 +0200
+++ device-mapper.1.00.09/make.tmpl.in	2004-04-01 02:03:19.789060800 +0200
@@ -27,8 +27,8 @@
 LD_DEPS += @LD_DEPS@
 
 # Setup directory variables
-prefix = $(DESTDIR)@prefix@
-exec_prefix = $(DESTDIR)@exec_prefix@
+prefix = @prefix@
+exec_prefix = @exec_prefix@
 bindir = @bindir@
 includedir = @includedir@
 libdir = @libdir@
diff -urN device-mapper.1.00.09.org/man/Makefile.in device-mapper.1.00.09/man/Makefile.in
--- device-mapper.1.00.09.org/man/Makefile.in	2004-04-01 01:58:07.195582232 +0200
+++ device-mapper.1.00.09/man/Makefile.in	2004-04-01 02:02:45.565263608 +0200
@@ -25,7 +25,7 @@
 	@echo "*** Installing $(ALL_MANUALS) in $(MAN8DIR) ***"
 	@for f in $(MANUALS); \
 	do \
-	   $(RM) $(MAN8DIR)/$$f; \
-	   @INSTALL@ -D -o $(OWNER) -g $(GROUP) -m 444 $$f $(MAN8DIR)/$$f; \
+	   $(RM) $(DESTDIR)$(MAN8DIR)/$$f; \
+	   @INSTALL@ -D -o $(OWNER) -g $(GROUP) -m 444 $$f $(DESTDIR)$(MAN8DIR)/$$f; \
 	done
 

--Boundary-00=_K11aAOoFBLktdwd--
