Return-Path: <lewis@sistina.com>
Date: Tue, 10 Jul 2001 14:24:57 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vg gone after vgextend
Message-ID: <20010710142457.A3047@sistina.com>
References: <20010710093902.B30416@zendo.net> <20010710110656.A24243@sistina.com> <20010710113917.A30933@zendo.net> <20010710121206.A31966@sistina.com> <20010710135732.A31208@zendo.net> <20010710140538.A2327@sistina.com> <20010710141332.B31208@zendo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20010710141332.B31208@zendo.net>; from eli@zendo.net on Tue, Jul 10, 2001 at 02:13:32PM -0500
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

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2001 at 02:13:32PM -0500, Eli Criffield wrote:
> #vgcfgrestore -n rootvg /dev/hda3                                     =20
> vgcfgrestore -- "/etc/lvmconf/rootvg.conf" doesn't exist             =20
> vgcfgrestore -- a backup for volume group rootvg is not available    =20
>=20
> Yeah tried that already? Is there any hope?

Have you looked in /etc/lvmconf?  Are there any conf files in there?  You
can specify the file to vgcfgrestore on the command line. If there isn't a
file there, don't give up hope yet.  Some of the folks on this list might
still respond with other options.

Regards
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
A program is a device used to convert data into error messages.
-----End Obligatory Humorous Quote------------------------------------------

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7S1aJpE6/iGtdjLERAisJAKCBTEsNcdZjr5ABB4RZdHesnq+5RACdGM2o
ZNY2gdPEgpgmO8SCwMMbIlg=
=LSFl
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
