Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Mon, 11 Dec 2000 08:32:58 -0600
Subject: Re: [linux-lvm] Linux 2.4.0-test12-pre7 LVM .9 vs .8final
Message-ID: <20001211083258.A19073@sistina.com>
References: <Pine.OSF.4.21.0012081042590.14388-100000@mail.mnsu.edu> <3A3477D0.94BC1D88@twc.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <3A3477D0.94BC1D88@twc.de>; from ulf@twc.de on Mon, Dec 11, 2000 at 07:44:32AM +0100
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

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2000 at 07:44:32AM +0100, Ulf Bartelt wrote:
> Ricardo Muggli wrote:
> >=20
> > I have noticed that Linux 2.4.0-test12-pre7 still comes with .8final. Is
> > there a plan to have .9 incorporated at some future time into the stock
> > 2.4 kernels? Will this happen before 2.4 comes out?
> >=20
> > Also is there a transition path between .8final and .9? (short of save
> > everything to tape and restore?)
>=20
> I was wondering =B4bout the same question yesterday...
>=20
> A set of lvm tools for multiple versions of the io protocol could help a
> lot...
>=20
> Sure this can be faked using links, wrappers etc...

I dunno if this is what you guys are asking for or not, but...as I've been
testing LVM-0.8.1. and LVM-0.9, I've used the same VG and LV.  For the
transition, all I need to do is do a 'vgchange -ay' to reactivate the volume
group using the other version of LVM.  I haven't done anything too complica=
ted
with this, but for my very basic testing, this has worked fine.  So basical=
ly
the transition path (If I am correct) between 0.8final and 0.9 is:

1) patch a kernel with the 0.9 patches
2) compile lvm-0.9
3) install the new kernel and lvm-0.9
4) run lilo
5) reboot

Of course, if you are using LVM as your root filesystem, this is a bit
trickier I guess...you probably have to make a lvm-0.9 bootdisk and use that
to activate the VG...

I am definitely not an expert on this though, so take it with a grain of
salt...

Can anyone else comment on this?

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648

Over and over I find being redundant is key to success
in the art of redundancy - Jay Armstrong

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6NOWapE6/iGtdjLERAnDIAJ0cpBlmK7OKcUtzVSO6i0U4n6skPwCcDCv9
X0qkdVhXPxdwgZi3/9zGBQk=
=HNa4
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
