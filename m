Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Date: Wed, 13 Dec 2000 21:15:22 +0100
MIME-Version: 1.0
Message-Id: <0012132115222N.00826@lyta>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Debian packaging
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
To: Linux-LVM@sistina.com

I plan to take over the Debian package of lvm because the current maintai=
ner=20
hasn't fixed serious bugs for quite a while.

I have created packages for lvm 0.8.1 and lvm 0.9.  One change I think sh=
ould=20
be done is an option for ./configure to specify whether a shared library=20
should be used or whether the programs should be statically linked.  If t=
his=20
is desired then someone please tell me which version I should create a pa=
tch=20
against and I'll send it in.

Also as part of the Debian packaging I have put the following patch in to=
=20
make it clean up all files after compiling:
diff -ruN ../LVM.orig/lvm-0.8.1.orig/Makefile.in lvm-0.8.1-0/Makefile.in
--- ../LVM.orig/lvm-0.8.1.orig/Makefile.in      Sun Nov 12 19:52:12 2000
+++ lvm-0.8.1-0/Makefile.in     Wed Dec 13 15:40:06 2000
@@ -39,4 +39,5 @@
 distclean: clean
        $(MAKE) -C tools distclean
        rm -f config.cache config.log config.status
-       rm -f Makefile make.tmpl
+       rm -f Makefile make.tmpl tools/Makefile tools/tools_and_lib.make.=
tmpl=20
\
+              tools/lib/Makefile tools/man8/Makefile=20

Also I have put in the following patch to work with the way Debian packag=
es=20
have different compile and install directories:
--- ../LVM.orig/lvm-0.8.1.orig/make.tmpl.in     Sun Nov 12 19:52:12 2000
+++ lvm-0.8.1-0/make.tmpl.in    Wed Dec 13 15:40:06 2000
@@ -35,11 +35,16 @@
 # Setup directory variables
 prefix =3D @prefix@
 exec_prefix =3D @exec_prefix@
-bindir =3D @bindir@
-sbindir =3D @sbindir@
-libdir =3D @libdir@
-infodir =3D @infodir@
-mandir =3D @mandir@
+bindir =3D ${PREFIX}@bindir@
+sbindir =3D ${PREFIX}@sbindir@
+libdir =3D ${PREFIX}@libdir@
+infodir =3D ${PREFIX}@infodir@
+mandir =3D ${PREFIX}@mandir@
+
+ifeq ($(TOP),)
+TOP :=3D $(shell cd `for i in . .. ../..; do if [ -f $$i/LVM-HOWTO ]; th=
en=20
echo $$i; break; fi; done`; pwd)
+export TOP
+endif
=20
 # helper scripts
 UNINSTALL =3D ${TOP}/autoconf/uninstall.pl


Also I would prefer to have the Debian packaging files in the upstream=20
source.  They are about 5K of data in 11 files in a separate sub-director=
y. =20
Please let me know if this would be desired/accepted as part of the LVM=20
upstream source and I will send the relevant patch to you.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
