Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j29KWTn30383
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2005 15:32:29 -0500
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j29KWS5S008589
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2005 15:32:28 -0500
Date: Wed, 9 Mar 2005 21:32:26 +0100
From: Bastian Blank <bastian@waldi.eu.org>
Message-ID: <20050309203225.GA25309@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] fix clean target
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--xXmbgvnjoT4axfJE
Content-Type: multipart/mixed; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The attached patch fixes the clean target in tools.

Bastian

--=20
Fascinating is a word I use for the unexpected.
		-- Spock, "The Squire of Gothos", stardate 2124.5

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=diff
Content-Transfer-Encoding: quoted-printable

Date: Tue Mar  8 11:40:45 2005
New Revision: 71

Modified:
   lvm2/trunk/tools/Makefile.in
Log:
* tools/Makefile.in: Fix clean.


Modified: lvm2/trunk/tools/Makefile.in
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
--- lvm2/trunk/tools/Makefile.in	(original)
+++ lvm2/trunk/tools/Makefile.in	Tue Mar  8 11:40:45 2005
@@ -20,7 +20,7 @@
   SUBDIRS +=3D fsadm
 endif
=20
-SOURCES =3D\
+lib_SOURCES =3D\
 	archiver.c \
 	dumpconfig.c \
 	formats.c \
@@ -64,6 +64,12 @@
 	vgscan.c \
 	vgsplit.c
=20
+tool_SOURCES =3D lvm.c
+
+lib_OBJECTS =3D $(lib_SOURCES:%.c=3D%.o)
+
+SOURCES =3D $(lib_SOURCES) $(tool_SOURCES)
+
 TARGETS =3D\
 	.commands \
 	lvm
@@ -92,14 +98,14 @@
=20
 include $(top_srcdir)/make.tmpl
=20
-lvm: $(OBJECTS) lvm.o $(top_srcdir)/lib/liblvm.a
-	$(CC) -o $@ $(OBJECTS) lvm.o $(LDFLAGS) $(LVMLIBS) $(LIBS) -rdynamic
+lvm: $(OBJECTS) $(top_srcdir)/lib/liblvm.a
+	$(CC) -o $@ $(OBJECTS) $(LDFLAGS) $(LVMLIBS) $(LIBS) -rdynamic
=20
-lvm.static: $(OBJECTS) lvm.o $(top_srcdir)/lib/liblvm.a
-	$(CC) -o $@ $(OBJECTS) lvm.o -static $(LDFLAGS) $(LVMLIBS) $(LIBS) \
+lvm.static: $(OBJECTS) $(top_srcdir)/lib/liblvm.a
+	$(CC) -o $@ $(OBJECTS) -static $(LDFLAGS) $(LVMLIBS) $(LIBS) \
 		-rdynamic
=20
-liblvm2cmd.a: $(top_srcdir)/lib/liblvm.a $(OBJECTS)
+liblvm2cmd.a: $(top_srcdir)/lib/liblvm.a $(lib_OBJECTS)
 	cat $(top_srcdir)/lib/liblvm.a > $@
 	$(AR) rs $@ $(OBJECTS)
=20

--cWoXeonUoKmBZSoM--

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iEYEARECAAYFAkIvXVkACgkQnw66O/MvCNESoACgkjMMMKUZ8OW36I8mecx9T5t+
NgQAnjunw/ut51hHRlzD9x1ctBBdN4eR
=yU0S
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
