Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Wed, 20 Dec 2000 17:23:01 -0600
Subject: Re: [linux-lvm] vgextend segfaults (lvm 0.9, kernel test10)
Message-ID: <20001220172301.A6448@sistina.com>
References: <20001216075237.21034.qmail@nwcst282.netaddress.usa.net> <20001216132801.A381@66bassett.freeserve.co.uk> <20001216171754.J20332@jensbenecke.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20001216171754.J20332@jensbenecke.de>; from lvm@jensbenecke.de on Sat, Dec 16, 2000 at 05:17:54PM +0100
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

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2000 at 05:17:54PM +0100, Jens Benecke wrote:
> On Sat, Dec 16, 2000 at 01:28:01PM +0000, Joe Thornber wrote:
>=20
> > Something like this happens if you are using the latest code from CVS
> > rather than the 0.9 branch.  Did you checkout the correct code ?
> > cvs checkout -r LVM_0-9-patches LVM
>=20
> I used the 0.9 sources to build my own Debian packet (from ftp.sistina.co=
m)
> and under 2.2.17, I have exactly the same problems.
> =20
>=20
> Additionally, (very strange) since I patched my 2.2.17 with ReiserFS and
> LVM I get occasional network outages (rtl8139). ifconfig down ; ifconfig =
up
> with IP addr. etc brings it back up, but that' not a solution for a serve=
r.
>=20
> Any ideas?

Do you have an eepro100 NIC?  If so, 2.2.17+ really doesn't work very well
with it.  I've been having no end of problems with that card, and in fact
replaced it today.

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
Save time... see it my way.
-----End Obligatory Humorous Quote------------------------------------------

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6QT9VpE6/iGtdjLERAjySAKCEqmGUbrIiGjZaVo1VtcA2SrLsIQCfS0en
Kd7vTGo9YntS1kegb5OsG7U=
=aAlk
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
