Return-Path: <lewis@sistina.com>
Date: Wed, 18 Apr 2001 13:39:14 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Strangenesses with snapshots, 0.9.1-beta6.
Message-ID: <20010418133913.A6156@sistina.com>
References: <20010417234127.B3388@sistina.com> <200104181815.f3IIF9JW030481@webber.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <200104181815.f3IIF9JW030481@webber.adilger.int>; from adilger@turbolinux.com on Wed, Apr 18, 2001 at 12:15:09PM -0600
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

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2001 at 12:15:09PM -0600, Andreas Dilger wrote:
> The same files with IO errors are those missing from the directory listin=
g.
> Based on the file timestamps, I would assume that these files have not
> been changed in a long time, so it is not a metadata consistency issue.

Yep, looks like you're right.  Well, so much for the easy solution.  :(

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

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE63d9RpE6/iGtdjLERAsLBAJ9CPlBDysMAn5z2ntuo+sH5WCitYgCgg2r0
ww3qjrvVuYGmxZTvCYwjOUQ=
=Qfvu
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
