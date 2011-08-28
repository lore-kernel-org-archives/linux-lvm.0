Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7SDj6hY005204
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2011 09:45:06 -0400
Received: from mr012.hansenet.de (mr0120.hansenet.de [85.183.254.187])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7SDj2Vh026467
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2011 09:45:02 -0400
Received: from [80.171.21.210] (80.171.21.210) by mr012.hansenet.de (8.5.134)
	id 4D25BF4200BEC97C for linux-lvm@redhat.com;
	Sun, 28 Aug 2011 15:45:01 +0200
Received: from sarkovy.localnet (localhost.koeller.dyndns.org [127.0.0.1])
	by mail.koeller.dyndns.org (Postfix) with ESMTP id 6E3C5108001
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2011 15:45:00 +0200 (CEST)
From: Thomas Koeller <thomas@koeller.dyndns.org>
Date: Sun, 28 Aug 2011 15:44:43 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart38671087.gxLUPiWPgM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201108281544.59767.thomas@koeller.dyndns.org>
Subject: [linux-lvm] [PATCH] Fix static build
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--nextPart38671087.gxLUPiWPgM
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

I tried a statically-linked build of LVM2.2.02.86 on Linux 3.0 x86_64
using glibc 2.14, binutils 2.21.1, gcc 4.6.1. The linking step failed
because of "-Wl,--export-dynamic" being present in LDFLAGS. This
patch fixes it:

--- LVM2.2.02.86-orig/configure.in	2011-04-28 18:54:33.000000000 +0200
+++ LVM2.2.02.86/configure.in	2011-08-28 15:18:14.000000000 +0200
@@ -34,7 +34,7 @@ case "$host_os" in
 		CLDWHOLEARCHIVE="-Wl,-whole-archive"
 		CLDNOWHOLEARCHIVE="-Wl,-no-whole-archive"
 		LDDEPS="$LDDEPS .export.sym"
-		LDFLAGS="$LDFLAGS -Wl,--export-dynamic"
+		DYNAMIC_LDFLAGS="-Wl,--export-dynamic"
 		LIB_SUFFIX=so
 		DEVMAPPER=yes
 		ODIRECT=yes
@@ -49,6 +49,7 @@ case "$host_os" in
 		CLDFLAGS="$CLDFLAGS"
 		CLDWHOLEARCHIVE="-all_load"
 		CLDNOWHOLEARCHIVE=
+		DYNAMIC_LDFLAGS=
 		LIB_SUFFIX=dylib
 		DEVMAPPER=yes
 		ODIRECT=no
@@ -153,6 +154,10 @@ AC_ARG_ENABLE(static_link,
 	      STATIC_LINK=$enableval, STATIC_LINK=no)
 AC_MSG_RESULT($STATIC_LINK)

+if test "$STATIC_LINK" != "yes"; then
+	LDFLAGS="$LDFLAGS $DYNAMIC_LDFLAGS"
+fi
+
 ################################################################################
 dnl -- Prefix is /usr by default, the exec_prefix default is setup later
 AC_PREFIX_DEFAULT(/usr)


Thomas

--nextPart38671087.gxLUPiWPgM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAABAgAGBQJOWkZLAAoJEFOuSbSntw2DItYIAJSKBb/s61rS2OJj0ZFSsROn
MttgzNQQpVttNxOlcKSuOmpJjJlE6gZDaSyM66RI/j1j2dqVdwlZVFMiIHd0Q79L
GrbLyEkkxYBOidIZK8EcCWBnxqiLcKjkW7jT2hbbdGYEKb4fENsEJ2fwJSdkIkVu
xef42OjNdantybJP86TE/cKG+lup6LxAVVTTJJyIIrq8mRlY+D0x1HiEyLK/T0CG
X4KFxFjTX41XSutfqzaspyWm9kkuJT5xU8F+ZAAruxF3a5dfdiK6Fns/ChY879KG
twwP/bubPM6xzK+uvDlhfCYt9gZ4FSQMHJ98PXMx675EjhF0sX0BGR1BFzvVvkQ=
=WLM5
-----END PGP SIGNATURE-----

--nextPart38671087.gxLUPiWPgM--
