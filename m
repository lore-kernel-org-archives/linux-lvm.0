Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Date: Sat, 16 Dec 2000 19:51:42 +0100
MIME-Version: 1.0
Message-Id: <00121619514201.00774@lyta>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Patches for 0.8.1
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
To: linux-lvm@sistina.com

This one removes an unnecessary library check (which doesn't work) and ad=
ds=20
version data to the config file (this is so handy).

--- lvm-0.8.orig/configure.in   Sun Nov 12 19:52:12 2000
+++ lvm-0.8.1/configure.in      Sat Dec 16 16:02:54 2000
@@ -31,10 +31,6 @@
 AC_PROG_LN_S
 AC_PROG_MAKE_SET
=20
-dnl Checks for libraries.
-dnl Replace `main' with a function in -llvm:
-AC_CHECK_LIB(lvm, main)
-
 dnl Checks for header files.
 AC_HEADER_DIRENT
 AC_HEADER_STDC
@@ -58,6 +54,9 @@
 AC_CHECK_FUNCS(mkdir rmdir uname)
=20
 AC_SUBST(JOBS)
+
+AC_SUBST(VERSION)
+VERSION=3D0.8final
=20
 dnl First and last lines should not contain files to generate in order t=
o
 dnl keep utility scripts running properly

The following makes it the library compile as a versioned shared object=20
(allowing multiple versions to be on the machine at the same time).
Later I'll submit a patch that adds this and a ./configure option to sele=
ct=20
shared object or static linking.

diff -ru lvm-0.8.orig/tools/lib/Makefile.in lvm-0.8.1/tools/lib/Makefile.=
in
--- lvm-0.8.orig/tools/lib/Makefile.in  Sun Nov 12 19:52:12 2000
+++ lvm-0.8.1/tools/lib/Makefile.in     Sat Dec 16 16:12:08 2000
@@ -30,11 +30,14 @@
=20
 include ../../make.tmpl
 include ../tools_and_lib.make.tmpl
+CFLAGS +=3D -fPIC
=20
+VERSION=3D@VERSION@
 ARCHIVE =3D liblvm.a
-SO =3D liblvm.so
+BASESO =3D liblvm.so
+SO =3D ${BASESO}.${VERSION}
=20
-ALL_RM =3D $(ALL_OBJECTS) $(ARCHIVE) $(SO)
+ALL_RM =3D $(ALL_OBJECTS) $(ARCHIVE) $(SO) ${BASESO}
=20
 all_this: $(ARCHIVE) $(SO) Makefile
        @echo ""
@@ -45,9 +48,10 @@
        @echo "*** Installing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
        @rm -f ${libdir}/${SO} ${libdir}/$(ARCHIVE);
        @INSTALL@ -d ${libdir}
-       @INSTALL@ $(ARCHIVE) $(SO) ${libdir}
-       chmod 444 ${libdir}/$(ARCHIVE)
+       @INSTALL@ $(SO) ${libdir}
        chmod 555 ${libdir}/$(SO)
+#      @INSTALL@ $(ARCHIVE) ${libdir}
+#      chmod 444 ${libdir}/$(ARCHIVE)
=20
 remove_this:
        @echo "*** Removing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
@@ -64,7 +68,8 @@
        ranlib $@
=20
 $(SO): $(ALL_OBJECTS)
-       ld -shared -o $(SO) $(ALL_OBJECTS)
+       ld -shared -soname=3D${SO} -o $(SO) $(ALL_OBJECTS)
+       ln -sf ${SO} ${BASESO}
=20
 clean_this:
        rm -f $(ALL_RM)




--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
