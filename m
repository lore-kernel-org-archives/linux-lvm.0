Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Wed, 3 Jan 2001 09:37:15 -0600
Message-ID: <20010103093715.A6969@sistina.com>
References: <20010103030948.I7563@athlon.random>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20010103030948.I7563@athlon.random>; from andrea@suse.de on Wed, Jan 03, 2001 at 03:09:48AM +0100
Subject: [linux-lvm] Re: [jjs@toyota.com: Re: LVM 0_9-1 woes on 2.4.0-prerelease+diffs]
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
To: Andrea Arcangeli <andrea@suse.de>
Cc: linux-lvm@sistina.com

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2001 at 03:09:48AM +0100, Andrea Arcangeli wrote:
> Hello, J Sloan had a problem using a spec file for lvmtools 0.9 package
> that was apparently written by you, so I'm sending you his modified versi=
on.
> He simply needs the libs in /lib (so they overwrite the old libs and
> so he can use lvm on /usr ;).

Yeah, I saw that on the kernel list.  I've been trying to come up with some
scripts to ease the transition between LVM 0.8.x and LVM 0.9.x before I redo
the LVM packages, but perhaps I should just redo them now and make them aga=
in
once a transition solution has been decided on.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
-----Begin Obligatory Humorous Quote----------------------------------------
"Memory is like gasoline. You use it up when you are running. Of
course you get it all back when you reboot..."; Actual explanation
obtained from the Micro help desk.
-----End Obligatory Humorous Quote------------------------------------------

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6U0crpE6/iGtdjLERAku5AJ0dZVxOTvCbFjLy/a9x4WEdYgheigCggAji
mjwD6w0RTbihXI8HEfm1Pk8=
=dMNO
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
