Return-Path: <lewis@sistina.com>
Date: Mon, 30 Jul 2001 08:35:50 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] [BUG] segmentation fault on snapshot with beta8
Message-ID: <20010730083550.A20819@sistina.com>
References: <20010726122738.E052917573@oscar.casa.dyndns.org> <20010727102132.A4314@sistina.com> <20010727162747.9542515354@oscar.casa.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20010727162747.9542515354@oscar.casa.dyndns.org>; from tomlins@cam.org on Fri, Jul 27, 2001 at 12:27:47PM -0400
Resent-To: linux-lvm@sistina.com
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
To: Ed Tomlinson <tomlins@cam.org>

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2001 at 12:27:47PM -0400, Ed Tomlinson wrote:
> My impression with the above bug is that the snapshot is filling much too=
 quickly
> and getting disabled.  At this point seg faults start happening.

I saw some Oopses and segfaults on 2.4.6 on Friday, but after I put the kdb
into the kernel I can't reproduce it.  I never see this with 2.4.7. =20

This was with LVM 0.9.1 Beta8 and the patches you previously mentioned.
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
File not found. Should I fake it? (Y/N)
-----End Obligatory Humorous Quote------------------------------------------

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ZWK2pE6/iGtdjLERAl19AJ41yqlb597HVuEFHoGXYBHoPD8+mACdGT8j
RtZcG1dOANNWarVIkjQKGxs=
=+8xI
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
