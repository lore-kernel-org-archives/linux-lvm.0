Date: Thu, 20 Sep 2001 11:03:40 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] 1.0.1-rc2 config & kernel question
Message-ID: <20010920110340.A18661@sistina.com>
References: <550C100A8350CE4BBD3DD2D7788FD0CA481FBD@fcmail1.FC.COM> <20010920083116.C551@tykepenguin.com> <1000997517.3baa028d1105c@mail.foobarhouse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <1000997517.3baa028d1105c@mail.foobarhouse.com>; from jamesp@foobarhouse.com on Thu, Sep 20, 2001 at 03:51:57PM +0100
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

--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2001 at 03:51:57PM +0100, James Pattinson wrote:
> I've just downloaded LVM 1.0.1-rc2 and tried to configure it ready for ke=
rnel
> 2.4.9. However I get this output:
>=20
> [root@fuse 1.0.1-rc2]# ./configure=20
> .
> . (omitted)
> .
> checking for st_rdev in struct stat... (cached) yes
> checking whether time.h and sys/time.h may both be included... (cached) y=
es
> ./scripts/linuxver: [: =3D=3D: binary operator expected
> ./configure: [: =3D=3D: binary operator expected
> checking whether gcc needs -traditional... (cached) no
> checking return type of signal handlers... (cached) int
> checking for vprintf... (cached) yes
> checking for mkdir... (cached) yes
> checking for rmdir... (cached) yes
> checking for uname... (cached) yes
> creating ./config.status
> creating Makefile
> creating make.tmpl
> creating PATCHES/Makefile
> creating tools/Makefile
> creating tools/tools_and_lib.make.tmpl
> creating tools/lib/Makefile
> creating tools/man8/Makefile
> ./configure: ${srcdir/#\/*}: bad substitution
>=20
> The patch seems to build OK however.

The following patch fixes that issue with configure.  I was
using an up-to-date version of bash when i wrote those in
originally, and older versions don't like the operators i used.
The following patch should fix the problem:

Index: configure.in
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/configure.in,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -b -B -u -r1.6 -r1.7
--- configure.in	2001/08/23 19:34:14	1.6
+++ configure.in	2001/09/06 13:02:34	1.7
@@ -75,7 +75,7 @@
 fi
 dnl -- get the version of the specified kernel
 kernel_ver=3D`$srcdir/scripts/linuxver -d $kernel_dir`;
-if [[ "x${kernel_ver}" =3D=3D "x" ]]; then
+if [[ "x${kernel_ver}" =3D "x" ]]; then
  	echo -n "*** Unable to determine version of linux to build "
 	echo "patches for ***";
  	echo -n "*** Consider using the --with-kernel_dir flag     "
@@ -131,7 +131,8 @@
 tools/lib/Makefile							\
 tools/man8/Makefile							\
 )
-test=3D${srcdir/#\/*}
+# if there's a leading '/', assign test the null string...
+test=3D`echo ${srcdir} | sed -e '/^\/.*/d'`
 if [[ -z $test ]] ; then
 ln -sf $srcdir/kernel/lvm.h tools/lib/lvm.h;
 else
Index: configure
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/LVM/configure,v
retrieving revision 1.8
retrieving revision 1.9
diff -u -b -B -u -r1.8 -r1.9
--- configure	2001/08/23 19:34:14	1.8
+++ configure	2001/09/06 13:02:34	1.9
@@ -1594,7 +1594,7 @@
 	kernel_dir=3D${topobjdir}/${kernel_dir};
 fi
 kernel_ver=3D`$srcdir/scripts/linuxver -d $kernel_dir`;
-if [ "x${kernel_ver}" =3D=3D "x" ]; then
+if [ "x${kernel_ver}" =3D "x" ]; then
  	echo -n "*** Unable to determine version of linux to build "
 	echo "patches for ***";
  	echo -n "*** Consider using the --with-kernel_dir flag     "
@@ -2184,7 +2184,8 @@
 rm -fr confdefs* $ac_clean_files
 test "$no_create" =3D yes || ${CONFIG_SHELL-/bin/sh} $CONFIG_STATUS || exi=
t 1
=20
-test=3D${srcdir/#\/*}
+# if there's a leading '/', assign test the null string...
+test=3D`echo ${srcdir} | sed -e '/^\/.*/d'`
 if [ -z $test ] ; then
 ln -sf $srcdir/kernel/lvm.h tools/lib/lvm.h;
 else

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
Quitters never win, and winners never quit,
but those who never quit AND never win are idiots.
-----End Obligatory Humorous Quote------------------------------------------

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7qhNcb2fpvETN3pURAjltAJ40h/a2b25LJH8n0uAfooIY7Q+ZSwCfWGGO
Lvf68amb8kYmReWpFS7vqYw=
=PLuO
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
