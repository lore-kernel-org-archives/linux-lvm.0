Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Thu, 14 Dec 2000 10:46:41 -0600
Subject: Re: [linux-lvm] Debian packaging
Message-ID: <20001214104641.A15193@sistina.com>
References: <0012132115222N.00826@lyta>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <0012132115222N.00826@lyta>; from russell@coker.com.au on Wed, Dec 13, 2000 at 09:15:22PM +0100
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

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2000 at 09:15:22PM +0100, Russell Coker wrote:
> I plan to take over the Debian package of lvm because the current maintai=
ner=20
> hasn't fixed serious bugs for quite a while.

A couple of questions.  Have you tried contacting Tom Lees <tal26@cam.ac.uk=
>?  I have talked to him and he is working on LVM 0.9 packages for sure.  H=
as this transfer of maintainers been approved by the powers that be at Debi=
an yet?

> I have created packages for lvm 0.8.1 and lvm 0.9.  One change I think sh=
ould=20
> be done is an option for ./configure to specify whether a shared library=
=20
> should be used or whether the programs should be statically linked.  If t=
his=20
> is desired then someone please tell me which version I should create a pa=
tch=20
> against and I'll send it in.

Since the configure.in scripts are essentially the same, you can just submi=
t a
patch to one or the other to the lvm-devel list and we'll get it in on the
next release.  I am the one responsible for the conversion of LKM to the au=
toconf system, so I'd be interested to see how you intend to accomplish thi=
s.

> Also as part of the Debian packaging I have put the following patch in to=
=20
> make it clean up all files after compiling:
> diff -ruN ../LVM.orig/lvm-0.8.1.orig/Makefile.in lvm-0.8.1-0/Makefile.in
> --- ../LVM.orig/lvm-0.8.1.orig/Makefile.in      Sun Nov 12 19:52:12 2000
> +++ lvm-0.8.1-0/Makefile.in     Wed Dec 13 15:40:06 2000
> @@ -39,4 +39,5 @@
>  distclean: clean
>         $(MAKE) -C tools distclean
>         rm -f config.cache config.log config.status
> -       rm -f Makefile make.tmpl
> +       rm -f Makefile make.tmpl tools/Makefile tools/tools_and_lib.make.=
tmpl=20
> \
> +              tools/lib/Makefile tools/man8/Makefile=20
>=20
> Also I have put in the following patch to work with the way Debian packag=
es=20
> have different compile and install directories:
> --- ../LVM.orig/lvm-0.8.1.orig/make.tmpl.in     Sun Nov 12 19:52:12 2000
> +++ lvm-0.8.1-0/make.tmpl.in    Wed Dec 13 15:40:06 2000
> @@ -35,11 +35,16 @@
>  # Setup directory variables
>  prefix =3D @prefix@
>  exec_prefix =3D @exec_prefix@
> -bindir =3D @bindir@
> -sbindir =3D @sbindir@
> -libdir =3D @libdir@
> -infodir =3D @infodir@
> -mandir =3D @mandir@
> +bindir =3D ${PREFIX}@bindir@
> +sbindir =3D ${PREFIX}@sbindir@
> +libdir =3D ${PREFIX}@libdir@
> +infodir =3D ${PREFIX}@infodir@
> +mandir =3D ${PREFIX}@mandir@
> +
> +ifeq ($(TOP),)
> +TOP :=3D $(shell cd `for i in . .. ../..; do if [ -f $$i/LVM-HOWTO ]; th=
en=20
> echo $$i; break; fi; done`; pwd)
> +export TOP
> +endif
> =20
>  # helper scripts
>  UNINSTALL =3D ${TOP}/autoconf/uninstall.pl

Are you saying you want this patch applied to the upstream source?  That
really doesn't make much sense to me.  The Makefile.in patch is completely
unnecessary because the subdirectories Makefile.in files handle those
cleanups.  And it doesn't make any sense to me to put the ${PREFIX} stuff in
the upstream version, as it is not necessary.  That is what the
package.diff.gz file is created for when you build Debian packages.  That w=
ay
when you make a new version, the changes you made to the source are applied=
 to
the new code.

> Also I would prefer to have the Debian packaging files in the upstream=20
> source.  They are about 5K of data in 11 files in a separate sub-director=
y. =20
> Please let me know if this would be desired/accepted as part of the LVM=
=20
> upstream source and I will send the relevant patch to you.

One question.  Why?  Seems completely unnecessary to me.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648

No-one suspects the butterfly!

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6OPlxpE6/iGtdjLERArDcAJ9lpY9QhmQkc4Vih+sccTUM3KYTyQCfe4Y1
wQg7vRvxYdTvfsr3eBthyBo=
=m6u9
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
