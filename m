Return-Path: <bg@blacknet.de>
Date: Fri, 17 Aug 2001 15:05:40 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Problem using lvreduce
Message-ID: <20010817150540.A19093@dragon.blacknet.de>
References: <051DFF3BBA73D3119A5800A0C95BD021C03C32@barracuda.alpha-processor.com> <20010817114344.D450@btconnect.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20010817114344.D450@btconnect.com>; from thornber@btconnect.com on Fri, Aug 17, 2001 at 11:43:44AM +0100
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

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Aug 17 '01 at 11:43, Joe Thornber wrote:
> > --- pv_release_pe.c.old Thu Aug 16 09:23:35 2001
> > +++ pv_release_pe.c     Wed Aug 15 09:09:06 2001
> > @@ -85,7 +85,7 @@
> >           }
> >           pe_index =3D ( vg->lv[l]->lv_current_pe[p].pe -=20
> >                        LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
> > -                      vg->pe_size;
> > +                      vg->pe_size - 1;
> >           debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector: %lu\n=
",
> >                    vg->pv[pv_num]->pv_name,
> >                    pe_index,
>=20
> This patch looks wrong, I cant see why anyone would want to divide by
> pe_size - 1, if it's working it's by accident.
Disclamer: I did not lok at the code, and don't know what I=8Am talking
           about ...

But, what this patch does, is devide by pe_size and substract 1 from the
result.
--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7fRakf5srOMkjkQoRAq9nAKCzCb8u1RFDuCk3lSwJjv3mujI4KwCfeJ/J
M6vKgms+1T9qwQBn1CNkG/Q=
=8MvI
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
