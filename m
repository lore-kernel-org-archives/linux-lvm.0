Date: Mon, 1 Oct 2001 07:58:55 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problems with 2.4.10 > lvm 1.0
Message-ID: <20011001075855.A29215@sistina.com>
References: <909EA7234316394F80BBB70A85A1EB389609BD@hermes.dimac.net> <20010928172320.A4111@dragon.blacknet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20010928172320.A4111@dragon.blacknet.de>; from bock@blacknet.de on Fri, Sep 28, 2001 at 05:23:20PM +0200
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

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2001 at 05:23:20PM +0200, Goetz Bock wrote:
>=20
> On Fri, Sep 28 '01 at 16:46, Conny Brunnkvist / dimac.net wrote:
> > Making and installing them worked fine. So did the kernel-patch and its
> > compilation, but i get the following when trying to install or newly
> > compiled 1.0 module:
> Are you sure you patched the same kernel you're running?

Yeah, there was a bug in the patch generation scripts that was fixed in
1.0.1-rc1 i believe.  So what is happening is the patch generation thinks
you have kernel 2.4.1

> > depmod:	get_hardblocksize
> >=20
> > I've read somewhere else in the list-archive that changing the
> > get_hardblocksize lines to get_hardsect_size could help, but I have
> There is a 1.0.1rc2 that has fixed this bug, but has a new one with the
> min/max macros. For 2.4.10 you have to change the min/max macros to
> min_t/max_t.

There will be a 1.0.1-rc3 coming out (hopefully) today that addresses the
kernel changes in 2.4.10.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
Sometimes I have a difficult time handling myself in social situations.
I just start scampering around neurotically, frantically jumping all
over guests. I think it all goes back to when I was raised in the wild
by miniature schnauzers.
-----End Obligatory Humorous Quote------------------------------------------

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7uGiPb2fpvETN3pURAo2TAKC0KYdOhum1L7yLEZOlma1j8pup3gCePXl4
JbO8CmshYgZLX32RKxdGRao=
=wYRW
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
