Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Wed, 20 Dec 2000 16:30:22 -0600
Subject: Re: [linux-lvm] Debian packaging
Message-ID: <20001220163022.A5042@sistina.com>
References: <XFMail.20001219212422.fionn@unix-ag.org> <0012210853290U.08762@lyta>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <0012210853290U.08762@lyta>; from bofh@coker.com.au on Thu, Dec 21, 2000 at 08:53:29AM +1100
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

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2000 at 08:53:29AM +1100, Russell Coker wrote:
> > > Think PATH - this is really easy, and shells already support it.  No =
more
> > > work to be done, and it's not ugly.  The IOP version will probably ne=
ver
> > > change within a boot (unless LVM is a module and it gets upgraded wit=
hout
> > > upgrading the kernel - unlikely).
> >
> > Shouldnt the debian alternatives mechanism (see "man 8
> > update-alternatives") be most appropriate for this task?
>=20
> Update-alternatives doesn't work when the file-system in question is moun=
ted=20
> read-only.  Also it's not really designed to be run at every boot.
>=20
> PATH is a bad idea IMHO.  It is set in too many places and has too many=
=20
> possibilities to be stuffed up.

Doesn't the liblvm.so versioning in the cvs code take care of this problem?

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
No-one suspects the butterfly!
-----End Obligatory Humorous Quote------------------------------------------

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6QTL+pE6/iGtdjLERAhayAJ9O4VyPOaorO0RLQhOWGgVxxgUOnACfXYQa
+g0kSUB4iHN21iby90dyoew=
=cE2F
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
