Return-Path: <lewis@sistina.com>
Date: Fri, 19 Jan 2001 13:51:15 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Patch for Kernel 2.2.16
Message-ID: <20010119135115.C9398@sistina.com>
References: <615A249B783CD41192F400D0B747AC8601A001EB@hesse.bbn.hp.com> <20010119101757.K23203@sistina.com> <20010119104932.L23203@sistina.com> <20010119172240.B2093@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <20010119172240.B2093@66bassett.freeserve.co.uk>; from joe@66bassett.freeserve.co.uk on Fri, Jan 19, 2001 at 05:22:40PM +0000
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

--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2001 at 05:22:40PM +0000, Joe Thornber wrote:
> On Fri, Jan 19, 2001 at 10:49:32AM -0600, AJ Lewis wrote:
> > After testing a bit more, I have found a bug in the snapshot creation.
> > Under load, you can get a=20
> > 'kernel panic: brw_kiovec: iobuf not locked for I/O'
> >=20
> > Joe, is this the same as the problem you discussed in the=20
> > "[linux-lvm] Kernel panic while snapshotting."
> > thread?
>=20
> Sounds like it.  Can you try reversing that patch as well please ?

I reversed that patch and it fixed the panic.  I 'spose we should pull that
out of the CVS.  Does it need to be in there for 2.4.x?

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
A morning without coffee is like something without something else.
-----End Obligatory Humorous Quote------------------------------------------

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6aJqzpE6/iGtdjLERAifZAJwMwGLSUQP2kxtz6SdpoYBJEYkwcgCeMthI
Bje1F9MErF9mf44sF8nblmI=
=W7Qr
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
