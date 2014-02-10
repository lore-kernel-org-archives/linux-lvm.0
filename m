Date: Mon, 10 Feb 2014 14:48:21 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140210144821.65cf1a19@leda.localdomain>
In-Reply-To: <52F8C3FC.6000302@redhat.com>
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
	<52F1198B.8000706@redhat.com>
	<20140207141420.54239977@leda.localdomain>
	<20140208003607.503a44c9@leda.localdomain>
	<20140208005550.6b7e134d@leda.localdomain>
	<52F88ED0.8030201@redhat.com>
	<20140210103056.2f2a950f@leda.localdomain>
	<52F8C3FC.6000302@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/VJW+l2goKnKTYqxWcdm86iY";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] blkid_wiping breaks snapshots
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

--Sig_/VJW+l2goKnKTYqxWcdm86iY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2014/02/10 13:20:
> Dne 10.2.2014 10:30, Christian Hesse napsal(a):
> > Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2014/02/10 09:33:
> >> Dne 8.2.2014 00:55, Christian Hesse napsal(a):
> >>> Christian Hesse <list@eworm.de> on Sat, 2014/02/08 00:36:
> >>>> Hello everybody,
> >>>>
> >>>> I think I nailed it down with git bisect. My first bad commit is:
> >>>>
> >>>> 75628f341ad38b68aae33eae0b5700be2a6e5769
> >>>> configure: enable blkid_wiping by default if the blkid library is
> >>>> present
> >>>>
> >>>> Looks like this wipes data that is still needed... Building a package
> >>>> with '--disable-blkid_wipe' now to verify on another system.
> >>>
> >>> Uh, this only helps part of...
> >>>
> >>> I changed my test setup and used writable snapshots. After that I got:
> >>>
> >>> WARNING: DM_snapshot_cow signature detected on /dev/cvg/snap-home at
> >>> offset 0. Wipe it? [y/n]
> >>>
> >>> (see https://bbs.archlinux.org/viewtopic.php?id=3D176504 for another
> >>> report)
> >>>
> >>> Looks like disabling blkid_wiping fixes this. My snapshot corruption
> >>> still occurs though. :-/
> >>> Bad thing about it is that the corruption does not occur reliable when
> >>> doing simple tests in 'git bisect'... Out of ideas for now - Will go =
to
> >>> bed now.
> >>
> >> Now this was helpful, I guess I think what is going on.
> >
> > Great! Waiting for patches then. :D
> >
> > I could provide some more information when needed:
> >
> > * This happens with read only snapshots only.
> > * I could reproduce with commit eaa23d32732c9bc3dd4f948781b5764cf21d84ba
> >    (wiping: add support for blkid wiping), so it was introduced there or
> >    before.
> >
> > Should I investigate further or wait for something to test from you?
>=20
> Is the patch bellow fixing your problem ?
> (It's still not final - but should help)
>=20
> Zdenek
>=20
>=20
> diff --git a/tools/lvcreate.c b/tools/lvcreate.c
> index 638a868..e8b1a7f 100644
> --- a/tools/lvcreate.c
> +++ b/tools/lvcreate.c
> @@ -772,7 +772,7 @@ static int _read_activation_params(struct
> lvcreate_params *lp, LVM_READ | LVM_WRITE);
>=20
>          /* Must not zero/wipe read only volume */
> -       if (!(lp->permission & LVM_WRITE)) {
> +       if (!lp->snapshot && !(lp->permission & LVM_WRITE)) {
>                  lp->zero =3D 0;
>                  lp->wipe_signatures =3D 0;
>          }

This looks good to me. I've made some backups now without any corruption.

But with blkid_wiping enabled I do have this warning/question now for read
only snapshots as well:

WARNING: DM_snapshot_cow signature detected on /dev/cvg/snap-home
at offset 0. Wipe it? [y/n]

lvm works perfectly only with your patch applied and compiled with
--disable-blkid_wiping.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/VJW+l2goKnKTYqxWcdm86iY
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS+NiqAAoJEIlFIdfMgPR2jrMH/0h8rMfVkNW4mJy7EwFoYv/0
35G6X83/93VnjlgyBYFhwe+4u/6zn2eoz0n68qeS7taOJt1Ox0OTUtQK1hOvjcId
NgsvJF94sjcvo9a1E+f4G5z6ngxL6Z800sCPuW7BIRAt2/S9OEmmH8yVI7fQT05a
JBMsJJ5FpltfS5AZyAwvJCUUQYq27/+UCM/GGPu8A+npKcPq3j/N0qhyDtrDlnBQ
4UbPZ4YK3ZmgspsxgYHqI4b0Y/iNykYtvC/2aoIXcEl1sUzk9VrY03S3AMMZdHW2
vCulQqu0P3yPM4mlZz8g9/DuIHychh/OeKQqFu3V6Z16ZMHWPwn86SWbXmC64iw=
=i3Fa
-----END PGP SIGNATURE-----

--Sig_/VJW+l2goKnKTYqxWcdm86iY--
