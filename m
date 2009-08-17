Date: Mon, 17 Aug 2009 13:50:28 +0200
From: Bastian Blank <bastian@waldi.eu.org>
Message-ID: <20090817115028.GA23288@wavehammer.waldi.eu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] Drop unused realtime support
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
To: linux-lvm@redhat.com, agk@redhat.com


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch removes the unused realtime support completely.

Bastian

--- a/lib/Makefile.in
+++ b/lib/Makefile.in
@@ -81,7 +81,6 @@
 	misc/lvm-globals.c \
 	misc/lvm-string.c \
 	misc/lvm-wrappers.c \
-	misc/timestamp.c \
 	misc/util.c \
 	mm/memlock.c \
 	report/report.c \
--- a/lib/misc/timestamp.c
+++ /dev/null
@@ -1,130 +0,0 @@
-/*
- * Copyright (C) 2006 Rackable Systems All rights reserved.
- *
- * This file is part of LVM2.
- *
- * This copyrighted material is made available to anyone wishing to use,
- * modify, copy, or redistribute it subject to the terms and conditions
- * of the GNU Lesser General Public License v.2.1.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program; if not, write to the Free Software Foundation,
- * Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
-
-/*
- * Abstract out the time methods used so they can be adjusted later -
- * the results of these routines should stay in-core.  This implementation
- * requires librt.
- */
-
-#include "lib.h"
-#include <stdlib.h>
-
-#include "timestamp.h"
-
-/*
- * The realtime section uses clock_gettime with the CLOCK_MONOTONIC
- * parameter to prevent issues with time warps
- */
-#ifdef HAVE_REALTIME
-
-#include <time.h>
-#include <bits/time.h>
-
-struct timestamp {
-	struct timespec t;
-};
-
-struct timestamp *get_timestamp(void)
-{
-	struct timestamp *ts =3D NULL;
-
-	if (!(ts =3D dm_malloc(sizeof(*ts))))
-		return_NULL;
-
-	if (clock_gettime(CLOCK_MONOTONIC, &ts->t)) {
-		log_sys_error("clock_gettime", "get_timestamp");
-		return NULL;
-	}
-
-	return ts;
-}
-
-/* cmp_timestamp: Compare two timestamps
- *
- * Return: -1 if t1 is less than t2
- *          0 if t1 is equal to t2
- *          1 if t1 is greater than t2
- */
-int cmp_timestamp(struct timestamp *t1, struct timestamp *t2)
-{
-	if(t1->t.tv_sec < t2->t.tv_sec)
-		return -1;
-	if(t1->t.tv_sec > t2->t.tv_sec)
-		return 1;
-
-	if(t1->t.tv_nsec < t2->t.tv_nsec)
-		return -1;
-	if(t1->t.tv_nsec > t2->t.tv_nsec)
-		return 1;
-
-	return 0;
-}
-
-#else /* ! HAVE_REALTIME */
-
-/*
- * The !realtime section just uses gettimeofday and is therefore subject
- * to ntp-type time warps - not sure if should allow that.
- */
-
-#include <sys/time.h>
-
-struct timestamp {
-	struct timeval t;
-};
-
-struct timestamp *get_timestamp(void)
-{
-	struct timestamp *ts =3D NULL;
-
-	if (!(ts =3D dm_malloc(sizeof(*ts))))
-		return_NULL;
-
-	if (gettimeofday(&ts->t, NULL)) {
-		log_sys_error("gettimeofday", "get_timestamp");
-		return NULL;
-	}
-
-	return ts;
-}
-
-/* cmp_timestamp: Compare two timestamps
- *
- * Return: -1 if t1 is less than t2
- *          0 if t1 is equal to t2
- *          1 if t1 is greater than t2
- */
-int cmp_timestamp(struct timestamp *t1, struct timestamp *t2)
-{
-	if(t1->t.tv_sec < t2->t.tv_sec)
-		return -1;
-	if(t1->t.tv_sec > t2->t.tv_sec)
-		return 1;
-
-	if(t1->t.tv_usec < t2->t.tv_usec)
-		return -1;
-	if(t1->t.tv_usec > t2->t.tv_usec)
-		return 1;
-
-	return 0;
-}
-
-#endif /* HAVE_REALTIME */
-
-void destroy_timestamp(struct timestamp *t)
-{
-	if (t)
-		dm_free(t);
-}
--- a/lib/misc/timestamp.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/*
- * Copyright (C) 2006 Rackable Systems All rights reserved. =20
- *
- * This file is part of LVM2.
- *
- * This copyrighted material is made available to anyone wishing to use,
- * modify, copy, or redistribute it subject to the terms and conditions
- * of the GNU Lesser General Public License v.2.1.
- *
- * You should have received a copy of the GNU Lesser General Public License
- * along with this program; if not, write to the Free Software Foundation,
- * Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
-
-#ifndef _LVM_TIMESTAMP_H
-#define _LVM_TIMESTAMP_H
-
-struct timestamp;
-
-struct timestamp *get_timestamp(void);
-
-/* cmp_timestamp: Compare two timestamps
- *=20
- * Return: -1 if t1 is less than t2
- *  	    0 if t1 is equal to t2
- *          1 if t1 is greater than t2
- */
-int cmp_timestamp(struct timestamp *t1, struct timestamp *t2);
-
-void destroy_timestamp(struct timestamp *t);
-
-#endif /* _LVM_TIMESTAMP_H */
-
--- a/configure.in
+++ b/configure.in
@@ -39,7 +39,6 @@
 		ODIRECT=3Dyes
 		DM_IOCTLS=3Dyes
 		SELINUX=3Dyes
-		REALTIME=3Dyes
 		CLUSTER=3Dinternal
 		FSADM=3Dyes
 		;;
@@ -54,7 +53,6 @@
 		ODIRECT=3Dno
 		DM_IOCTLS=3Dno
 		SELINUX=3Dno
-		REALTIME=3Dno
 		CLUSTER=3Dnone
 		FSADM=3Dno
 		;;
@@ -314,13 +312,6 @@
 AC_MSG_RESULT($READLINE)
=20
 ##########################################################################=
######
-dnl -- Disable realtime clock support
-AC_MSG_CHECKING(whether to enable realtime support)
-AC_ARG_ENABLE(realtime, [  --disable-realtime      Disable realtime clock =
support],
-REALTIME=3D$enableval)
-AC_MSG_RESULT($REALTIME)
-
-##########################################################################=
######
 dnl -- Build cluster LVM daemon
 AC_MSG_CHECKING(whether to build cluster LVM daemon)
 AC_ARG_WITH(clvmd,
@@ -557,19 +548,6 @@
 fi
=20
 ##########################################################################=
######
-dnl -- Check for realtime clock support
-if test x$REALTIME =3D xyes; then
-	AC_CHECK_LIB(rt, clock_gettime, HAVE_REALTIME=3Dyes, HAVE_REALTIME=3Dno)
-
-	if test x$HAVE_REALTIME =3D xyes; then
-		AC_DEFINE([HAVE_REALTIME], 1, [Define to 1 to include support for realti=
me clock.])
-		LIBS=3D"-lrt $LIBS"
-	else
-		AC_MSG_WARN(Disabling realtime clock)
-	fi
-fi
-
-##########################################################################=
######
 dnl -- Check for getopt
 AC_CHECK_HEADERS(getopt.h, AC_DEFINE([HAVE_GETOPTLONG], 1, [Define to 1 if=
 getopt_long is available.]))
=20
@@ -778,7 +756,6 @@
 AC_SUBST(FSADM)
 AC_SUBST(GROUP)
 AC_SUBST(HAVE_LIBDL)
-AC_SUBST(HAVE_REALTIME)
 AC_SUBST(HAVE_SELINUX)
 AC_SUBST(INTL)
 AC_SUBST(INTL_PACKAGE)
--=20
Respect is a rational process
		-- McCoy, "The Galileo Seven", stardate 2822.3

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqJRAAACgkQnw66O/MvCNEi8wCfWJlpMHMtU3gvz3gy8KJ5Zswy
YpwAnRC+Inrlwe+L4MlMFJ+YbusW8KMc
=dwDv
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
