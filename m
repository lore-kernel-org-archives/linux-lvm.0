Return-Path: <lewis@sistina.com>
Date: Thu, 5 Jul 2001 11:46:18 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Message-ID: <20010705114618.A5662@sistina.com>
References: <20010705083402.D11805@vestdata.no> <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com>; from bcrl@redhat.com on Thu, Jul 05, 2001 at 03:35:31AM -0400
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

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2001 at 03:35:31AM -0400, Ben LaHaise wrote:
> On Thu, 5 Jul 2001, Ragnar Kj=F8rstad wrote:
> > What do you mean?
> > Is it not feasible to fix this in LVM as well, or do you just not know
> > what needs to be done to LVM?
>=20
> Fixing LVM is not on the radar of my priorities.  The code is sorely in
> need of a rewrite and violates several of the basic planning tenents that
> any good code in the block layer should follow.  Namely, it should have 1)
> planned on supporting 64 bit offsets, 2) never used multiplication,
> division or modulus on block numbers, and 3) don't allocate memory
> structures that are indexed by block numbers.  LVM failed on all three of
> these -- and this si just what I noticed in a quick 5 minute glance
> through the code.  Sorry, but LVM is obsolete by design.  It will continue
> to work on 32 bit block devices, but if you try to use it beyond that, it
> will fail.  That said, we'll have to make sure these failures are graceful
> and occur prior to the user having a chance at loosing any data.

So are these tenents written down somewhere, or is it just understood that
this is how it needs to be?

Getting LVM 64-bit ready is certainly a priority for the LVM team, but this
is the first I've seen of concrete requirements for doing so.  Of course, I
could just be blind and have missed everything too.  ;)

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
The three most dangerous things are a programmer with a soldering iron, a
manager who codes, and a user who gets ideas.
-----End Obligatory Humorous Quote------------------------------------------
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
Linux: Because rebooting is for adding new hardware.
-----End Obligatory Humorous Quote------------------------------------------

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7RJnapE6/iGtdjLERAi4gAJwIl1t1qoyWxjn+iXj78Snvydp62wCgl+jJ
MqmkhnuqjcMAPdFRbmHcbOE=
=v2m/
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
