Date: Mon, 10 Sep 2001 08:01:24 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM and -ac kernels?
Message-ID: <20010910080124.A8459@sistina.com>
References: <20010909104606.B967@befunk.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20010909104606.B967@befunk.com>; from ranger@befunk.com on Sun, Sep 09, 2001 at 10:46:06AM -0400
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

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 09, 2001 at 10:46:06AM -0400, Benjamin Reed wrote:
> I've tried applying 1.0.1-rc2 to 2.4.9-ac9 and it appears
> that something's not matching up; I was wondering if anyone
> has had any luck with the 2.4.9 ac kernels?
>=20
> I get a reject in the Makefile for something that Alan's
> already added to his tree, and when I build, I get:
>=20
> ---(snip!)---
> make[3]: Entering directory `/usr/src/linux-2.4.9-ac9-eb1/drivers/md'
> gcc -D__KERNEL__ -I/usr/src/linux-2.4.9-ac9-eb1/include -Wall -Wstrict-pr=
ototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-=
common -pipe -mpreferred-stack-boundary=3D2 -march=3Di686    -c -o lvm.o lv=
m.c
> lvm.c: In function `__extend_reduce':
> lvm.c:2329: warning: implicit declaration of function `min'

Yep, this is caused by the great MIN/MAX macro change in the 2.4.9 stock
kernel.   Alan didn't think it was a good idea, so his AC series kernels
still use the old style MIN/MAX macros.  Unfortunately, the way the patches
are currently generated, any kernel above 2.4.9 is assumed to have the new
format.

> Feel free to tell me "don't bother with -ac kernels and LVM", all
> I *truly* care about from the -ac tree is ext3, but it would be nice
> if it's a simple fix.

I'm not sure what the best way to fix this is.  You possibly could go in and
manually change the kernel version in the PATCHES/Makefile file to be
2.4.8-ac9; this shouldn't change anything but which versions of the patches
are put into the patch and the patch name, but it may not work.  I would try
this first...if that doesn't work, we'll have to start looking at
alternatives.

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
Employment tip #127: Never take a beer to a job interview.
-----End Obligatory Humorous Quote------------------------------------------

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7nLmkb2fpvETN3pURAoFaAKCbTQHfTqooWcQYwBsJ2y2u1lIe7gCdHZ5S
ZrUebhM8/L6sgroNd5vJ0Vk=
=hwEt
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
