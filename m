Return-Path: <lewis@sistina.com>
Date: Mon, 18 Jun 2001 09:55:33 -0500
From: AJ Lewis <lewis@sistina.com>
Message-ID: <20010618095533.A32072@sistina.com>
References: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu>; from dice@mfa.kfki.hu on Sun, Jun 17, 2001 at 03:38:58PM +0200
Subject: [linux-lvm] Re: another nice feature for packagers ...
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

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 17, 2001 at 03:38:58PM +0200, Gergely Tamas wrote:
> First of all, thanks for the ${DESTDIR} definition.

No problem, I'm still trying to decide if we should move ${DESTDIR} into th=
e =20
individual 'install' targets or not...  =20

> Another nice feature for packagers would be to split the installation of
> liblvm.a and liblvm.so parts.
>=20
> This would be good because liblvm.a's destination should be e.g. /usr/lib
> and liblvm.so's destination should be /lib (because of lvm utils).
>=20
> So I thought about the introduction of a new variable in make.tmpl.in (I
> called it ``sharedlibdir''). Its default value is equal to ``libdir''.

Hmm...I think it should be the other way around.  We've hacked up the      =
  =20
install targets so that the default ${sbindir} and ${libdir} are /sbin and =
  =20
/lib respectively.  Therefore, we should define a variable called          =
  =20
${staticlibdir} and have it equal to ${prefix}/lib by default perhaps?     =
  =20
It makes sense to put liblvm.a into /usr/lib to me; it just the way we're  =
  =20
doing it that I'm questioning.  I'd like to prevent installation problems  =
  =20
because the user didn't type 'make -e sharedlibdir=3D/lib install', which i=
s   =20
what would happen if we made the default libdir point to /usr/lib.  =20

Just FYI, the entire build system is going to get an overhaul after the 1.0=
  =20
release, so I will definitely be making sure these detail are kept in mind =
  =20
for that.

> So if somebody installs the package with ``make install'' or ``make -e
> DESTDIR=3D... install'' the installation procedure will be the same as the
> current. But if the installer (script) defines a sharedlibdir value other
> than the default ``make -e sharedlibdir=3D... DESTDIR=3D... install'' the
> installation of the shared libraries will go into that directory.
>=20
> Note, that sharedlibdir needs to be specified with the DESTDIR value e.g.
> ``make -e sharedlibdir=3D$DESTDIR/$CPID/lib DESTDIR=3D$DESTDIR/$CPID inst=
all''
>=20
> If you like this feature please include ...
>=20
> Thanks,
> Gergely
>=20
> ps: I also attached my compile/package script; maybe somebody is
>     interested in it...
>=20
> diff -ur LVM-orig/make.tmpl.in LVM/make.tmpl.in
> --- LVM-orig/make.tmpl.in	Fri Jun 15 16:16:02 2001
> +++ LVM/make.tmpl.in	Sun Jun 17 12:45:36 2001
> @@ -37,6 +37,7 @@
>  exec_prefix =3D @exec_prefix@
>  bindir =3D ${DESTDIR}/@bindir@
>  libdir =3D ${DESTDIR}/@libdir@
> +sharedlibdir =3D ${libdir}
>  sbindir =3D ${DESTDIR}/@sbindir@
>  infodir =3D ${DESTDIR}/@infodir@
>  mandir =3D ${DESTDIR}/@mandir@
> diff -ur LVM-orig/tools/lib/Makefile.in LVM/tools/lib/Makefile.in
> --- LVM-orig/tools/lib/Makefile.in	Tue Apr 24 16:29:21 2001
> +++ LVM/tools/lib/Makefile.in	Sun Jun 17 12:48:41 2001
> @@ -44,18 +44,24 @@
>  	@echo ""
>=20
>  install_this:
> -	@echo "*** Installing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
> -	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(AR=
CHIVE);
> +	@echo "*** Installing $(ARCHIVE) in ${libdir} ***"
> +	@rm -f ${libdir}/$(ARCHIVE);
>  	@INSTALL@ -d ${libdir}
> -	@INSTALL@ -o ${OWNER} -g ${GROUP} $(ARCHIVE) $(SOV) ${libdir}
> +	@INSTALL@ -o ${OWNER} -g ${GROUP} $(ARCHIVE) ${libdir}
>  	chmod 444 ${libdir}/$(ARCHIVE)
> -	chmod 555 ${libdir}/$(SOV)
> -	ln -s $(SOV) ${libdir}/${SO}
> -	ln -s $(SOV) ${libdir}/${SOM}
> +	@echo "*** Installing $(SO) in ${sharedlibdir} ***"
> +	@rm -f ${sharedlibdir}/${SO} ${sharedlibdir}/${SOV} ${sharedlibdir}/${S=
OM};
> +	@INSTALL@ -d ${sharedlibdir}
> +	@INSTALL@ -o ${OWNER} -g ${GROUP} $(SOV) ${sharedlibdir}
> +	chmod 555 ${sharedlibdir}/$(SOV)
> +	ln -s $(SOV) ${sharedlibdir}/${SO}
> +	ln -s $(SOV) ${sharedlibdir}/${SOM}
>=20
>  remove_this:
> -	@echo "*** Removing $(ARCHIVE) and $(SO) in ${prefix}/lib ***"
> -	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM} ${libdir}/$(AR=
CHIVE);
> +	@echo "*** Removing $(ARCHIVE) in ${libdir} ***"
> +	@rm -f ${libdir}/$(ARCHIVE);
> +	@echo "*** Removing $(SO) in ${sharedlibdir} ***"
> +	@rm -f ${libdir}/${SO} ${libdir}/${SOV} ${libdir}/${SOM};
>=20
>  $(ALL_SOURCES):	liblvm.h $(OTHER_DEP)
>=20

> #!/bin/sh
>=20
> # =3D=3D generated by mkskel 0.0.2r19, (c) 2001 by DiCE/PsychoMix =3D=3D
>=20
> DIRNAME=3D"LVM";
> PREFIX=3D"/usr";
> DESTDIR=3D"/tmp/pkg";
> BINTST=3D"tools/vgchange";
>=20
> AUTORUN=3Dfalse;
>=20
> error () { echo $1; exit 1; }
>=20
> if [ ! -d $DIRNAME ];
> then
>   gzip -dc lvm-20010616.tar.gz | tar xvf -;
>   $AUTORUN || exit;
> fi
>=20
> cd $DIRNAME;
>=20
> if [ -f ../lvm-20010616.patch.bz2 ] && [ ! -f ../lvm-20010616.patched ];
> then
>   bzip2 -dc  ../lvm-20010616.patch.bz2 | patch -p1;
>   touch ../lvm-20010616.patched;
>   $AUTORUN || exit;
> fi
>=20
> if [ ! -f config.cache ] && [ -x ./configure ];
> then
>   touch config.cache;
>   ./configure --prefix=3D$PREFIX \
>               --sbindir=3D/sbin \
> 	      --libdir=3D$PREFIX/lib \
> 	      --includedir=3D$PREFIX/include \
> 	      --mandir=3D$PREFIX/man \
> 	      --infodir=3D$PREFIX/info
>   $AUTORUN || exit;
> fi
>=20
> if [ ! -x $BINTST ];
> then
>   make;
>   $AUTORUN || exit;
> fi
>=20
> if [ -f ../$0.temp ];
> then
>   CPID=3D`cat ../$0.temp`;
>   [ ! -d $DESTDIR/$CPID ] && error "$DESTDIR/$CPID not found.";
> else
>   CPID=3D$$;
>   if [ ! -d $DESTDIR/$CPID ];
>   then
>     mkdir -p $DESTDIR/$CPID;
>     echo "$CPID" > ../$0.temp
>     make -e sharedlibdir=3D$DESTDIR/$CPID/lib \
>             DESTDIR=3D$DESTDIR/$CPID install 2>&1 | tee ../lvm-20010616.i=
nstall_log;
>     CPWD=3D`pwd`;
>     cd $DESTDIR/$CPID;
>     for i in `find . -type f | grep "/man/" | grep -v ".gz" | grep -v ".b=
z2"`;
>     do
>       MNAME=3D`basename $i`;
>       echo "$MNAME -> $MNAME.gz";
>       gzip $i;
>     done
>     cd $CPWD;
>     $AUTORUN || exit;
>   fi
> fi
>=20
> cd ..;
>=20
> if  [ -d $DESTDIR/$CPID ];
> then
>   CPWD=3D`pwd`;
>   cd $DESTDIR/$CPID;
>   makepkg $CPWD/lvm-20010616.tgz;
>   cd ..;
>   rm -Rf $CPID;
>   cd $CPWD;
> fi
>=20
> rm -f $0.temp lvm-20010616.patched;


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
Programming graphics in X is like finding sqrt(pi) using Roman numerals.
-----End Obligatory Humorous Quote------------------------------------------

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LhZlpE6/iGtdjLERAuHrAJ4+sJyC54uSR1jbhT6us1S52YmIiQCfT6rU
oKroWPUbqpj1G/1GIEwYoxE=
=lJRg
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
