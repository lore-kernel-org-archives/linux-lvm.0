Subject: Re: [linux-lvm] raid and lvm
From: SI Reasoning <si@mindspring.com>
In-Reply-To: <20030128145317.G11767@zealot.blacknet.de>
References: <1043751787.3989.20.camel@sidell.home.network>
	 <20030128145317.G11767@zealot.blacknet.de>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fgn/Xnk4iqkS48w4EM+t"
Message-Id: <1043775290.23550.4.camel@sidereal.home.network>
Mime-Version: 1.0
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
Date: Tue Jan 28 11:34:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

--=-fgn/Xnk4iqkS48w4EM+t
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-01-28 at 07:53, Goetz Bock wrote:
> On Tue, Jan 28 '03 at 05:03, SI Reasoning wrote:
> > I was reading back in 1999 mailing list about trying to merge in some
> > raid functions into lvm. Did this ever happen?
> except for striping (some call it RAID0) it did not happen
>=20
> > Is it possible to use lvm to safeguard data (like raid 5) so that if a
> > hard drive fails, the data is picked up by another volume group/or
> > parts of the volume group not on the failed drive?
> Why do people always want to bloat everything? LVM is one funcunality
> and RAID a different one, you can layer tham as you please and get the
> benefit of both with out any efford. So why should anyone integrate
> them.
>=20
I was following an old list and at that time they felt that it would be
more efficient to merge either lvm into raid or vice-versa.

> I know that the device mapper allows to add RAID5 functionality, but in
> a different way (not as part of LVM, but as a plugin into DM)
what is DM? Is this part of lvm2 or is it in 1.0.6 (or earlier)? Is
there a how-to for creating raid5 through this plugin?


--=20
SI Reasoning <si@mindspring.com>

--=-fgn/Xnk4iqkS48w4EM+t
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+Nr86Q3BM1ElJCVIRAo+IAKC0uF/FcPGvZgtwSXF6ZkQ2lLzTlACdGMFo
YcFxWL1SH0XJflSRCp4qXuE=
=Dr5Y
-----END PGP SIGNATURE-----

--=-fgn/Xnk4iqkS48w4EM+t--
