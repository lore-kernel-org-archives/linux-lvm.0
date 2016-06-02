References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
	<fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
	<5750371C.2070201@partidopirata.com.ar>
	<603e0110-8de8-3c03-bf93-db0c19c2d4e0@redhat.com>
From: fauno <fauno@partidopirata.com.ar>
Message-ID: <57504C3B.70303@partidopirata.com.ar>
Date: Thu, 2 Jun 2016 12:09:47 -0300
MIME-Version: 1.0
In-Reply-To: <603e0110-8de8-3c03-bf93-db0c19c2d4e0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="BTtbwQCTWkI89GW2Sp1SWMh7NSPo7OGK1"
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BTtbwQCTWkI89GW2Sp1SWMh7NSPo7OGK1
Content-Type: multipart/mixed; boundary="lMQorHLblScSCl2V3DluMgX2fkAOq7Li1"
From: fauno <fauno@partidopirata.com.ar>
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com
Message-ID: <57504C3B.70303@partidopirata.com.ar>
Subject: Re: [dm-crypt] LVM on LUKS: volumes missing
References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
	<fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
	<5750371C.2070201@partidopirata.com.ar>
	<603e0110-8de8-3c03-bf93-db0c19c2d4e0@redhat.com>
In-Reply-To: <603e0110-8de8-3c03-bf93-db0c19c2d4e0@redhat.com>

--lMQorHLblScSCl2V3DluMgX2fkAOq7Li1
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/06/16 11:50, Zdenek Kabelac wrote:

>=20
> Hi
>=20
> This was not a full lvm2 -vvvv trace output - unless you would be using=

> a modified lvm2 source code base.
>=20
> 'pvscan -vvvv --cache device  &>out'
>=20
>=20
> Also please provide full lvm2 package version eventually reference to
> package
> with sources (and extra patches) (link).


i can't confirm the version now, but it was lvm2 from trisquel belenos
(ubuntu trusty, lvm2 2.02.98 it seems[^0]), the hd was running archlinux
with latest lvm2 from repos.  i can try later with a more modern lvm2.

the pvscan output was exactly that though, i just selected it from the
terminal i was using.  see it finished with error 5, perhaps that's why
it's incomplete?


thanks!


[^0]: http://packages.trisquel.info/belenos/lvm2

--=20
:D


--lMQorHLblScSCl2V3DluMgX2fkAOq7Li1--

--BTtbwQCTWkI89GW2Sp1SWMh7NSPo7OGK1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQF8BAEBCgBmBQJXUEw7XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ0OUY3MDdBMUNCMzY2QzU4MEU2MjVCM0M0
NTYwMzJENzE3QTRDRDlDAAoJEEVgMtcXpM2cTOkIALDbj4pz+vQvHZkaOKSKaHVP
ZIal8AFtRQOkG+f+u2xzv8YCvBNSHYnT1odY9UE5z4TUFfr07AvV5LUw0GLZHg5g
1c2L08qAGLG95+8UIs6scnnlp17TKEIZcELcAQsNvFUbw5gq+FmwDijO2HEnQNAt
5xaPOJXd4BxhWeuQRylOfw/Dheye03JVhpG1qcJSXU18S8skltaIwfo5i76f3Lc8
6FHB6Yd9gTRSvMhEcJ1el5Eq8O1OmnkEQRIKNijmm1ULRXeshCE61AR3NPgvDzEl
RT6AYUN74Ub5wVM1gSzosjof5xIa0Ooe2CDyME2fl/Vqx878IhtvSw50Dm/xijY=
=ihGt
-----END PGP SIGNATURE-----

--BTtbwQCTWkI89GW2Sp1SWMh7NSPo7OGK1--
