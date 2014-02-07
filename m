Date: Sat, 8 Feb 2014 00:55:50 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140208005550.6b7e134d@leda.localdomain>
In-Reply-To: <20140208003607.503a44c9@leda.localdomain>
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
	<52F1198B.8000706@redhat.com>
	<20140207141420.54239977@leda.localdomain>
	<20140208003607.503a44c9@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/PObr1883QLKNuAq2ZjgonA4";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] blkid_wiping breaks snapshots (was: lvm2 2.02.105
 breaks snapshots)
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: zkabelac@redhat.com

--Sig_/PObr1883QLKNuAq2ZjgonA4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Christian Hesse <list@eworm.de> on Sat, 2014/02/08 00:36:
> Hello everybody,
>=20
> I think I nailed it down with git bisect. My first bad commit is:
>=20
> 75628f341ad38b68aae33eae0b5700be2a6e5769
> configure: enable blkid_wiping by default if the blkid library is present
>=20
> Looks like this wipes data that is still needed... Building a package with
> '--disable-blkid_wipe' now to verify on another system.

Uh, this only helps part of...

I changed my test setup and used writable snapshots. After that I got:

WARNING: DM_snapshot_cow signature detected on /dev/cvg/snap-home at
offset 0. Wipe it? [y/n]

(see https://bbs.archlinux.org/viewtopic.php?id=3D176504 for another report)

Looks like disabling blkid_wiping fixes this. My snapshot corruption still
occurs though. :-/
Bad thing about it is that the corruption does not occur reliable when doing
simple tests in 'git bisect'... Out of ideas for now - Will go to bed now.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/PObr1883QLKNuAq2ZjgonA4
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS9XKGAAoJEIlFIdfMgPR2QJUIAN2VNP5WAS3EiLF3ZHFm5X8X
1e2VLR2FG4ptAQd5xuGRLVb2+mRovSXIxe4MetOwbFbdWq8epO0ufFu7h0Z7rzhu
Gh9k8kFbpt+OEnMguM0p0NlnsD6j9jwPf6BNSyHsWb3SIcUwOiDjCqOzOwoxNWXb
RiHlVjLn3Ozp99hmh07GWArP8/lrvOG/PdNQcA56r4EOrcRfL0s7Pcs51GqeOn+x
6IaH44q3laz7CwF1mw2Jx8zqukBLk+a5gWAT6ld2ZY58eErCgYRrv9jF3ha+x+kZ
Wt8UR0Fbxb96mB6Cj0ya91YaZ9HARZIXP+jtNrz3nGZLw2dUkpVEREnk23LNIDE=
=kU8W
-----END PGP SIGNATURE-----

--Sig_/PObr1883QLKNuAq2ZjgonA4--
