Date: Tue, 21 Aug 2001 12:12:29 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Building outside source tree
Message-ID: <20010821121229.A4661@sistina.com>
References: <20010820205802.29906.qmail@dumain.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20010820205802.29906.qmail@dumain.com>; from wish@dumain.com on Mon, Aug 20, 2001 at 09:58:02PM +0100
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
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2001 at 09:58:02PM +0100, Bill Hay wrote:
> The following patch allows building the lvm utilities in a=20
> seperate directory from the source.  It is a patch agains 1.0.1rc1
> and has been tested with linux 2.2.18.

Committed, with the following changes to make everything work:

diff -Nura --exclude CVS LVM-diff/PATCHES/Makefile.in LVM/PATCHES/Makefile.=
in
--- LVM-diff/PATCHES/Makefile.in	Tue Aug 21 11:47:00 2001
+++ LVM/PATCHES/Makefile.in	Tue Aug 21 11:48:50 2001
@@ -30,7 +30,7 @@
 CLEANED_DIR=3Dcleaned
 CLEANER=3D@top_srcdir@/scripts/select_version
 PATCHER=3D@top_srcdir@/scripts/patch_fragment
-FRAGGER=3D@top_srcdir@/scripts/select_fragments
+FRAGGER=3D../scripts/select_fragments
 LVM_PATCH=3D./lvm-$(LVM_VERSION)-$(KERNEL_VERSION).patch
=20
 ifneq (,$(findstring 2.2,$(KERNEL_VERSION)))
diff -Nura --exclude CVS LVM-diff/configure LVM/configure
--- LVM-diff/configure	Tue Aug 21 11:47:00 2001
+++ LVM/configure	Tue Aug 21 11:42:24 2001
@@ -2172,5 +2172,5 @@
 test "$no_create" =3D yes || ${CONFIG_SHELL-/bin/sh} $CONFIG_STATUS || exi=
t 1
=20
=20
-ln -sf $srcdir/kernel/lvm.h tools/lib/lvm.h
+ln -sf $topobjdir/$srcdir/kernel/lvm.h tools/lib/lvm.h
=20
diff -Nura --exclude CVS LVM-diff/configure.in LVM/configure.in
--- LVM-diff/configure.in	Tue Aug 21 11:47:00 2001
+++ LVM/configure.in	Tue Aug 21 11:42:20 2001
@@ -118,4 +118,4 @@
 tools/lib/Makefile							\
 tools/man8/Makefile							\
 )
-AC_OUTPUT_COMMANDS([ln -sf $srcdir/kernel/lvm.h tools/lib/lvm.h])
+AC_OUTPUT_COMMANDS([ln -sf $topobjdir/$srcdir/kernel/lvm.h tools/lib/lvm.h=
])
diff -Nura --exclude CVS LVM-diff/tools/man8/Makefile.in LVM/tools/man8/Mak=
efile.in
--- LVM-diff/tools/man8/Makefile.in	Tue Aug 21 11:47:00 2001
+++ LVM/tools/man8/Makefile.in	Tue Aug 21 11:29:44 2001
@@ -39,6 +39,7 @@
=20
 install-man8: remove-man8
 	@echo "*** Installing $(MAN_PAGES) in $(DESTDIR)$(MAN8DIR) ***"
+	@INSTALL@ -d $(DESTDIR)$(MAN8DIR)/
 	@INSTALL@  -o $(OWNER) -g $(GROUP) -m 444 $(ALL_MANUALS) $(DESTDIR)$(MAN8=
DIR)/ =20
=20
 remove-man8:

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Quitters never win, and winners never quit,
but those who never quit AND never win are idiots.
-----End Obligatory Humorous Quote------------------------------------------

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7gpZ9pE6/iGtdjLERAtGgAJ9HlZu97pVCwvh8+NVEHLK7kPxmPQCghopa
zDk+dnjOcgHvqtdPXXZNspM=
=+VvT
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
