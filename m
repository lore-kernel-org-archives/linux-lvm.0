Date: Mon, 10 Feb 2014 10:30:56 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140210103056.2f2a950f@leda.localdomain>
In-Reply-To: <52F88ED0.8030201@redhat.com>
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
	<52F1198B.8000706@redhat.com>
	<20140207141420.54239977@leda.localdomain>
	<20140208003607.503a44c9@leda.localdomain>
	<20140208005550.6b7e134d@leda.localdomain>
	<52F88ED0.8030201@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_///6+NNUbwtplbURCNb7rh_f";
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

--Sig_///6+NNUbwtplbURCNb7rh_f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2014/02/10 09:33:
> Dne 8.2.2014 00:55, Christian Hesse napsal(a):
> > Christian Hesse <list@eworm.de> on Sat, 2014/02/08 00:36:
> >> Hello everybody,
> >>
> >> I think I nailed it down with git bisect. My first bad commit is:
> >>
> >> 75628f341ad38b68aae33eae0b5700be2a6e5769
> >> configure: enable blkid_wiping by default if the blkid library is pres=
ent
> >>
> >> Looks like this wipes data that is still needed... Building a package
> >> with '--disable-blkid_wipe' now to verify on another system.
> >
> > Uh, this only helps part of...
> >
> > I changed my test setup and used writable snapshots. After that I got:
> >
> > WARNING: DM_snapshot_cow signature detected on /dev/cvg/snap-home at
> > offset 0. Wipe it? [y/n]
> >
> > (see https://bbs.archlinux.org/viewtopic.php?id=3D176504 for another re=
port)
> >
> > Looks like disabling blkid_wiping fixes this. My snapshot corruption st=
ill
> > occurs though. :-/
> > Bad thing about it is that the corruption does not occur reliable when
> > doing simple tests in 'git bisect'... Out of ideas for now - Will go to
> > bed now.
>=20
> Now this was helpful, I guess I think what is going on.

Great! Waiting for patches then. :D

I could provide some more information when needed:

* This happens with read only snapshots only.
* I could reproduce with commit eaa23d32732c9bc3dd4f948781b5764cf21d84ba
  (wiping: add support for blkid wiping), so it was introduced there or
  before.

Should I investigate further or wait for something to test from you?
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_///6+NNUbwtplbURCNb7rh_f
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS+JxUAAoJEIlFIdfMgPR2a0EH/1A8LuZNzm6qNNw9mnBp99I6
PoJPjiVGINQQZj5LS3Qd8u3T27d69rNLmhWy5byeriFd+YfKZEgV9KzsKOOqlk2O
+QTIpmXbmm9M5IQyAryg1B12rFora+KOTbXK/rjV3NlZkT4GlEERWyu5VtiNS1w1
TRxF3/8NaK/QhQT+q1gNimvWAwVDPQLDjKzIq4dS32rsgO2BK5rIeZWocY4qBkib
AmSrUv2B07LduCRCgx2WigeDyI/NG4K3kYPDjGHErftzVTtTqPWrwgzRvjGXpS6g
RxZUXrrSdGmkVI0Uh6SBXCE5Es0SAvc2wCUPXQ1hY4UuLfJIPHazx/+XWFeVfqc=
=2COT
-----END PGP SIGNATURE-----

--Sig_///6+NNUbwtplbURCNb7rh_f--
