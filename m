Return-Path: <lewis@sistina.com>
Date: Mon, 26 Feb 2001 08:27:18 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Slackware init
Message-ID: <20010226082718.B1481@sistina.com>
References: <20010225175246.A31937@sistina.com> <Pine.LNX.4.20.0102260707190.27918-100000@rdb.linux-help.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.20.0102260707190.27918-100000@rdb.linux-help.org>; from ardy@rdb.linux-help.org on Mon, Feb 26, 2001 at 07:08:55AM -0500
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

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2001 at 07:08:55AM -0500, ardy@rdb.linux-help.org wrote:
> On Sun, 25 Feb 2001, AJ Lewis wrote:
>=20
> > Are you by chance using a 2.4.x kernel with devfs support compiled in, =
but
> > not being mounted?  I am seeing the same thing with that setup.
>=20
> Yes, 2.4.2, no devfs.

I think the issue is that /proc is not yet mounted when you call vgscan.
If you look at the tools/lib/lvm_dir_cache.c file at line 90, you will
see that it checks for /proc/partitions.  If it finds that, it only scans
the files in /proc/partitions.  Otherwise, it goes through all the possible
devices LVM recognizes.=20

So if you can get /proc mounted before you call vgscan, it should not take
so long, nor should it scan for all those devices you do not have on your
system.

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
Sometimes I have a difficult time handling myself in social situations.
I just start scampering around neurotically, frantically jumping all
over guests. I think it all goes back to when I was raised in the wild
by miniature schnauzers.
-----End Obligatory Humorous Quote------------------------------------------

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6mmfGpE6/iGtdjLERAi9iAJ9wic3dGz5/C/TRrNfveJ33Nx0IegCfYrka
td79ssOIRcCbqTtuwo5ah+k=
=tte1
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
