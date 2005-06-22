Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5M1I0u22002
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 21:18:00 -0400
Received: from leviathan.gurski.org
	(user32164@dsl093-100-200.wdc2.dsl.speakeasy.net [66.93.100.200])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5M1Hqhe019693
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 21:17:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by leviathan.gurski.org (Postfix) with ESMTP id 98759587C8
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 21:17:50 -0400 (EDT)
Received: from leviathan.gurski.org ([127.0.0.1])
	by localhost (leviathan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14812-08 for <linux-lvm@redhat.com>;
	Tue, 21 Jun 2005 21:17:50 -0400 (EDT)
Date: Tue, 21 Jun 2005 21:17:49 -0400
From: Michael Gurski <linux-lvm@gurski.org>
Subject: Re: [linux-lvm] LVM2 Volume and Volume group naming nomenclature
Message-ID: <20050622011749.GD4784@gurski.org>
References: <42B6F00D.3060801@redshift.com>
	<ufa8y15nfco.fsf@epithumia.math.uh.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <ufa8y15nfco.fsf@epithumia.math.uh.edu>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 11:49:11AM -0500, Jason L Tibbitts III wrote:
> >>>>> "SR" =3D=3D Sam Rogers <srogers@redshift.com> writes:
>=20
> SR> But there is a major problem. LVM2 will not (from what I can see)
> SR> recognize volume group names like VG00.
>=20
> I think you must be confused, or you're not talking about what I think
> you are:
>=20
> # vgdisplay
>=20
>   --- Volume group ---
>   VG Name               vg0
> [...]
>=20
> Heck, you can call them whatever you want.  I use "sys" and "data" on
> some of my machines.  You can even rename them with vgrename.

Ditto here....

machines 1 & 2:

# vgdisplay
  --- Volume group ---
  VG Name               raidvg
=2E..

machine 3:

# vgdisplay=20
--- Volume group ---
VG Name               Volume00


No idea what the O.P. is talking about.


--=20
Michael A. Gurski (opt. [first].)[last]@pobox.com  http://www.pobox.com/~[l=
ast]
1024R/39B5BADD PGP: 34 93 A9 94 B1 59 48 B7  17 57 1E 4E 62 56 45 70
1024D/1166213E GPG: 628F 37A4 62AF 1475 45DB  AD81 ADC9 E606 1166 213E
4096R/C0B4F04B GPG: 5B3E 75D7 43CF CF34 4042  7788 1DCE B5EE C0B4 F04B
Views expressed by the host do not reflect the staff, management or sponsor=
s.

"Wherever a man comes, there comes revolution. The old is for slaves."
--Ralph Waldo Emerson

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCuLw6SfEA4VjuFKURAq5yAKDeyl7jD5c09+y8AbAb2IyGKFgtvwCdGiPb
xdGL4MWjTFi9kD5yCKqeNbc=
=lZ0r
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
