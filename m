Return-Path: <lewis@sistina.com>
Date: Thu, 28 Jun 2001 10:11:05 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problem installing lvm
Message-ID: <20010628101105.A26253@sistina.com>
References: <87d77oefy5.fsf@#maties.sun.ac.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <87d77oefy5.fsf@#maties.sun.ac.za>; from jspies@maties.sun.ac.za on Thu, Jun 28, 2001 at 04:18:10PM +0000
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

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Goto the LVM FTP site: ftp.sistina.com
and get to the directory that you grabbed the tarball from:
/pub/LVM/0.9.1_beta

Grab the file: lvm_0.9.1_beta7-get_hardblocksize.patch

Apply this patch the the 0.9.1 Beta7 source tree as per the README.1st in
that FTP directory.

This should solve your problem.

On Thu, Jun 28, 2001 at 04:18:10PM +0000, Johann Spies wrote:
> I am trying to install lvm_0.9.1_beta7 on a machine with a 2.4.5
> kernel.
>=20
> After following the instructions in LVM/0.9.1_beta7/PATCHES/README a
> patch was created: lvm-0.9.1_beta7-2.4.5.patch
>=20
> I patched the kernel with it and then tried to recompile the kernel.
> The process ended with:
> ------------------------
> /usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a
> /usr/src/linux/arch/i386/lib/lib.a \
>         --end-group \
>         -o vmlinux
> drivers/md/mddev.o: In function `__update_hardblocksize':
> drivers/md/mddev.o(.text+0xcec1): undefined reference to `get_hardblocksi=
ze'
> drivers/md/mddev.o(.text+0xcf0d): undefined reference to `get_hardblocksi=
ze'
> make: *** [vmlinux] Error 1
>=20
> I hope you can help me to get this right.
>=20
> Regards.
>=20
> Johann
> --=20
> Johann Spies
> Informasietegnologie
> Universiteit van Stellenbosch
>=20
>      "The Spirit of the Lord is upon me, because he hath=20
>       anointed me to preach the gospel to the poor; he hath=20
>       sent me to heal the brokenhearted, to preach =20
>       deliverance to the captives, and recovering of sight=20
>       to the blind, to set at liberty them that are =20
>       bruised..."         Luke 4:18=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
"We succeed because our competitors are idiots" - anonymous
-----End Obligatory Humorous Quote------------------------------------------
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

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7O0kJpE6/iGtdjLERAqvfAJkBeb5qdIacRRv10T2ODrSS/3u8RgCghg2+
r22V0/V3DfJJmqTWcB0YNV4=
=I95w
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
