Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.4 available at
	www.sistina.com
From: Gregory Ade <gkade@bigbrother.net>
In-Reply-To: <20020502215808.GA492@antimony.sistina.com>
References: <20020502215808.GA492@antimony.sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-RXMgjErkS6Y0HR+2v5r4"
Message-Id: <1021940894.3438.20.camel@pslgregory>
Mime-Version: 1.0
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
Date: Mon May 20 19:29:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-RXMgjErkS6Y0HR+2v5r4
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2002-05-02 at 14:58, AJ Lewis wrote:
> To clarify, this is a stable release with bugfixes for 1.0.3 only.  Try L=
VM2
> if you want to track the latest developments in LVM.
>=20
> LVM 1.0.4 supports both version 1 and 2 of the metadata.
>=20
> There's *no* need to run any metadata update tools.


So, just to be sure, if I have a system that is running LVM 0.91.beta-7,
I can install LVM 1.0.4 without worries?

I'm running a SuSE 7.2 install, which uses that version of LVM & their
own SuSE-fied kernel rpm, but due to other requirements, I'm going to
need to compile my own kernel from virgin sources.  I'm going to be
building 2.4.18, specifically with the linux-abi (formerly known as
iBCS) patch, and figured I'd update everything with the latest LVM code
while I was at it.  I also remembered that I need the VFS-lock patch,
since I want to do snapshots and we're running ReiserFS.

Anything I need to beware of, before doing this?

Thanks!

--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-RXMgjErkS6Y0HR+2v5r4
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA86ZSaeQUEYOr0hEsRAmDVAKCGqsSYbdHUNBN9q+U+ImuHz4k7MACgm4/4
IVMYrg6Jm4cSU/wrJw5U9+Y=
=Jns2
-----END PGP SIGNATURE-----

--=-RXMgjErkS6Y0HR+2v5r4--
