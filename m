Return-Path: <lewis@sistina.com>
Date: Sat, 28 Jul 2001 23:04:02 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] beta7 help
Message-ID: <20010728230401.A26726@sistina.com>
References: <20010729024031.86517.qmail@web13406.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20010729024031.86517.qmail@web13406.mail.yahoo.com>; from plamb_98@yahoo.com on Sat, Jul 28, 2001 at 07:40:31PM -0700
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
Cc: plamb_98@yahoo.com

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2001 at 07:40:31PM -0700, Pierre Lamb wrote:
> I recomplied my kernel to include lvm modules
> (2.4.3-12), added the items to modules.conf and
> included vgscan and vgchange -ay into my rc.sysinit
> (located just before the line "mounting other
> filesystems"). The log files sate that lvm loaded OK,
> /proc/lvm is there, but no data in there, vgscan show
> it ran and created the file/dirs but not populated.
>=20
> If I run thise same commands after logging-in they run
> properly and all works.
>=20
> Why wouldn't it run during boot-up????

Did you patch the kernel with the lvm 0.9.1 beta7 patches?
(see LVM/0.9.1_beta7/PATCHES/README)  It is likely that you are seeing a
problem because the kernel version of LVM does not match up with the beta7
tools.

Regards,
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
Sometimes I have a difficult time handling myself in social situations.
I just start scampering around neurotically, frantically jumping all
over guests. I think it all goes back to when I was raised in the wild
by miniature schnauzers.
-----End Obligatory Humorous Quote------------------------------------------

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Y4sxpE6/iGtdjLERAtH8AJ4kidStbOUV7TzVKAS7Ob+iNJJp0gCfXiJ/
xJFQVnHqmQ4fr+KgOhAIycY=
=J5np
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
