Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20020206145137.J427@kluge.net>
References: <20020206145137.J427@kluge.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-kapEUGZO8qjNApU775jQ"
Message-Id: <1013031906.18276.4.camel@UberGeek>
MIME-Version: 1.0
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
Date: Wed Feb  6 15:45:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-kapEUGZO8qjNApU775jQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thing about AIT2 though, you can store your data for 50 years without
degradation. Longer if you take care of it properly(not that you'd need
to anyway, you'll have to re-spin your tapes once in a while)

AIT2 is 50/100, not just 50. Most of the time I can get about 110GB per
tape. AIT3 is 200+ however. :) Not to mention, you can get 80MB/s/drive
if you have 4 dedicated scsi controllers.=20

And 80 of them only take up a smallamount of space.=20

On Wed, 2002-02-06 at 13:51, Theo Van Dinter wrote:
> On Wed, Feb 06, 2002 at 02:14:05PM -0500, Benjamin Scott wrote:
> >   Here are some prices from a recent Datacomm Warehouse catalog:
> >=20
> >   Item            GB   Cost  $/GB
> >   --------------  ---  ----  ----
> >   IDE HDD         100   270  2.70
> >   AIT2             50    90  1.80
> >   SuperDLT        110   150  1.36
> >   LTO Ultrium     100   130  1.30
> >   DDS-4            20    24  1.20
> >=20
> >   As you can see, hard disk is actually the most expensive media, not
> the
> > least.  This whole "hard disks are cheaper" thing is a myth propagated
> by
> > people who have never actually looked at the numbers.
>=20
> Pot, kettle, black.
>=20
> Yes, a AIT2 _TAPE_ is $90, but you need to factor in the drive,
> otherwise
> the media is useless.  A $270 IDE drive is ready to go.  A quick look at
> warehouse.com (to keep the numbers on-par):
>=20
> AIT2 drive/Sony		2800 + 90 (tape) / 50GB   =3D 57.80
> SuperDLT drive/LaCie	5000 + 150 (tape) / 110GB =3D 46.82
> LTO Ultrium drive/HP	3650 + 130 (tape) / 100GB =3D 37.80
> DDS-4 drive/Seagate	970 + 24 (tape) / 20GB    =3D 49.70
>=20
>=20
> So yes, not surprisingly, tape is more expensive than disk everytime.
> Even if you halfed the prices assuming full (2x) compression on the
> tape. Now over time, the per GB price of tape will come down since you
> only need the large outlay of cash once, but you can only use one tape
> at a time at any given moment.
>=20
>=20
> --=20
> Randomly Generated Tagline:
> "perl is awesome, perl is great
>   perl gets my programs running without all the wait,
>   perl lets me do my job smooth as silk,
>   it even stays crispy in milk.." - Greg London
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb

--=-kapEUGZO8qjNApU775jQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8YaPi94g6ZVmFMoIRAjytAJ4+DTuJh4CKS0H6Y1C8pX28MWL/kgCggucv
nkHT5H76SuTAdaRb0ylzZfs=
=Grxh
-----END PGP SIGNATURE-----

--=-kapEUGZO8qjNApU775jQ--
