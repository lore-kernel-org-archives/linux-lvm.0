Return-Path: <eli@zendo.net>
Date: Wed, 11 Jul 2001 14:37:45 -0500
From: Eli Criffield <eli@zendo.net>
Subject: Re: [linux-lvm] about to give up
Message-ID: <20010711143745.A2450@zendo.net>
References: <20010711134123.D1863@zendo.net> <265770000.994879251@duke.wrkhors.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <265770000.994879251@duke.wrkhors.com>; from lembark@wrkhors.com on Wed, Jul 11, 2001 at 02:20:51PM -0500
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

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

nope=20
ERROR: physical volume "/dev/hda3" doesn't belong to an exported volume
group

eli

On Wed, Jul 11, 2001 at 02:20:51PM -0500, lembark@wrkhors.com wrote:
>=20
>=20
> -- Eli Criffield <eli@zendo.net> on 07/11/01 13:41:23 -0500
>=20
> >> try:
> >>=20
> >>     vgexport blah;
> >>     vgimport blah PV PV PV;
> >>=20
> >=20
> > I can't export it because it doesn't know it exists because vgscan can't
> > find it.
>=20
> Peachy.  Now just try vgimporting it.  The PV's themselves
> may have sufficient metadata to get away with it.
>=20
> sl
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7TKsJm2VvYlVjW2oRAuPXAKCHZCuc7bbiRYwPjdI5XV+1G7OYZACgvKhf
T89ETRGg3B6BZuo1XrnjoRo=
=YtHZ
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
