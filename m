Return-Path: <lewis@sistina.com>
Date: Tue, 21 Aug 2001 07:04:03 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010821070403.A16248@sistina.com>
References: <20010821130033.D402@sky.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20010821130033.D402@sky.net>; from U.Wiederhold@gmx.net on Tue, Aug 21, 2001 at 01:00:33PM +0200
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

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2001 at 01:00:33PM +0200, Ulrich Wiederhold wrote:
> Hello,
> if I reboot, the file /etc/rcS.d/S25lvm failed to find and activate my
> vg.
> I suppose that=B4s because the shutdown of the vg fails. (Not umounted all
> before?)

Hmm...the shutdown shouldn't matter.  I rarely run vgchange -an on my
systems (I have LVM as root, so there really is no way to do it...)

> Anybody else had this problems with debian unstable?

There's a good chance that your startup script is running either before root
is mounted read/write (in which case the LVM tools can't write to /etc) or
before /proc is mounted (which is less likely because this usually just
makes vgscan really slow, not fail).  Check your init scripts and verify
that root is writable before the S25lvm script runs.

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
Bad command or file name. Bad, bad command! Sit! Stay! Staaaay...
-----End Obligatory Humorous Quote------------------------------------------

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7gk4zpE6/iGtdjLERAiYyAJ48Akspc6veqYAaxXbtbw4t6wZCOACfbA9n
T8Hlo5dxKIUAl1uP9A2eF3g=
=sSz+
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
