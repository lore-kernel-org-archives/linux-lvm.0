Return-Path: <eli@zendo.net>
Date: Tue, 10 Jul 2001 14:13:32 -0500
From: Eli Criffield <eli@zendo.net>
Subject: Re: [linux-lvm] vg gone after vgextend
Message-ID: <20010710141332.B31208@zendo.net>
References: <20010710093902.B30416@zendo.net> <20010710110656.A24243@sistina.com> <20010710113917.A30933@zendo.net> <20010710121206.A31966@sistina.com> <20010710135732.A31208@zendo.net> <20010710140538.A2327@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <20010710140538.A2327@sistina.com>; from lewis@sistina.com on Tue, Jul 10, 2001 at 02:05:38PM -0500
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

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hmm...have you tried 'vgcfgrestore'?  It looks like you managed to corrupt
> the PV somehow...without the exact steps you took to get to this state, i=
t's
> gonna be hard to determine what happened.  LVM 0.9.1 beta2 has some pretty
> odd problems.

#vgcfgrestore -n rootvg /dev/hda3                                     =20
vgcfgrestore -- "/etc/lvmconf/rootvg.conf" doesn't exist             =20
vgcfgrestore -- a backup for volume group rootvg is not available    =20

Yeah tried that already? Is there any hope?

eli

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7S1Pcm2VvYlVjW2oRAl+pAJ9Xax+Pn8ETB+67SH2hezqqRG25HQCggpkh
A1OvAKSTuYhFTcfHmqbFeO8=
=CkeM
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
