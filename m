Return-Path: <lewis@sistina.com>
Date: Tue, 29 May 2001 12:01:04 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problem extending a LV
Message-ID: <20010529120104.C29771@sistina.com>
References: <3B136D02.2B4C5178@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <3B136D02.2B4C5178@gmx.de>; from cabalzer@gmx.de on Tue, May 29, 2001 at 11:33:54AM +0200
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

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2001 at 11:33:54AM +0200, Carsten Balzer wrote:
> If I try to extend the LV with:
> lvextend -L+78164M /dev/NVolGroup/nVol
> then I get:
> lvextend -- rounding size 240119808 KB to stripe boundary size 240123904
> KB
> lvextend -- only 19541 free physical extents in volume group "NVolGroup"
>=20
> Next try with: lvextend -l+19541 /dev/NVolGroup/nVol
> lvextend -- rounding size 240119808 KB to stripe boundary size 240123904
> KB
> lvextend -- only 19541 free physical extents in volume group "NVolGroup"

You cannot currently extend a striped LV onto a new disk.  It would involve
completely rearranging the data to account for the new striping
configuration.  The reason you get the error is because the tools know this
and are trying to extend on the two original PVs.  If you want to have the
ability to extend the LV onto new disks, you must use linear LVs.

Regards,
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
A bad random number generator: 1, 1, 1, 1, 1, 4.33e+67, 1, 1, 1...
-----End Obligatory Humorous Quote------------------------------------------

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7E9XQpE6/iGtdjLERAgYYAJ9o3PfQbKQNXkAMXUWQuX5g5uOCQACfa49D
G4wtYpnrjwSF0O/UI+vv19Q=
=YuSL
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
