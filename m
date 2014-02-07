Date: Sat, 8 Feb 2014 00:36:07 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140208003607.503a44c9@leda.localdomain>
In-Reply-To: <20140207141420.54239977@leda.localdomain>
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
	<52F1198B.8000706@redhat.com>
	<20140207141420.54239977@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/u=XbX/D8RYda5C.aMg__kHT";
	protocol="application/pgp-signature"
Subject: [linux-lvm] blkid_wiping breaks snapshots (was: lvm2 2.02.105
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

--Sig_/u=XbX/D8RYda5C.aMg__kHT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello everybody,

I think I nailed it down with git bisect. My first bad commit is:

75628f341ad38b68aae33eae0b5700be2a6e5769
configure: enable blkid_wiping by default if the blkid library is present

Looks like this wipes data that is still needed... Building a package with
'--disable-blkid_wipe' now to verify on another system.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/u=XbX/D8RYda5C.aMg__kHT
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS9W3sAAoJEIlFIdfMgPR2zbUH/R9uqE88VEe8CTd37b686+Fa
MI2md1wSXbERroWi8GOENKXnysvJExzWXityqU8Eh/CMzPFJBFUzH6lJy9MdMgI3
mrthyNla3g/Q31StP+42Fy6PBUSBjbDgRCiv1rQXEM3HyWakr7VItW2GQgXQv/hH
OnXIZHzQ/fJA70QMDk5RJxXlXusvHKwqLYVD9pwLxbqVRaBSeUDN6P8PVBfPO15q
187VTut1E9w94UAkGWD4MpghBxy0w8pPqiPUkf5SxclIaM+wt42/+npAb8FX/P6S
o/+LubtE4g/NRYZUu1Es82K8f0AN8blzVAWbF9jUtIAF9JObjlGiq+ar0gfxbhs=
=yCUJ
-----END PGP SIGNATURE-----

--Sig_/u=XbX/D8RYda5C.aMg__kHT--
