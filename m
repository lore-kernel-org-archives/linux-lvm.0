Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i43DoPV2000471
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 09:50:25 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i43DoOog022147
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 08:50:24 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i43DoOv0022146
	for linux-lvm@redhat.com; Mon, 3 May 2004 08:50:24 -0500
Date: Mon, 3 May 2004 08:50:24 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] 2.6 upgrade - LVM version ? & root partition access
	problems...
Message-ID: <20040503135024.GA11496@null.msp.redhat.com>
References: <408C2883.5080606@sneakemail.com>
	<20040426135853.GA17309@null.msp.redhat.com>
	<4095715C.3000900@sneakemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <4095715C.3000900@sneakemail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2004 at 12:08:28AM +0200, Peter Valdemar M??rch wrote:
> AJ Lewis alewis-at-redhat.com |Lists| wrote:
> >Someone made a new initrd creation script and posted it here:
> >http://www.poochiereds.net/svn/lvm2/
> >I can't guarentee it'll work, but i've heard good things about it.  Use=
=20
> >it
> >against the 2.6.5 kernel you compiled.
>=20
> Well, I did finally did get it to work. Quite a strenuous road, though.=
=20
> For others that may google later, here are some of the things I ran=20
> into, and their solutions:

Bah - I guess I should have pointed you at the fedora mkinitrd - it might
have saved you the hassle.  :(
http://distro.ibiblio.org/pub/linux/distributions/fedora/linux/core/develop=
ment/i386/Fedora/RPMS/mkinitrd-3.5.21-1.i386.rpm
is the current version AFAIK.  I think this will work better with RH9
systems than the other one (which was originally built around debian)
=20
> I've created a new version (incl. svn diff) of the script here:
> http://wwww.morch.com/postings/lvm2/

K - so if the fedora mkinitrd doesn't work for people using RH9, they can
try that one. :)  Thanks!

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
APATHY ERROR: Don't bother striking any key.
-----End Obligatory Humorous Quote------------------------------------------

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAlk4f9QxUqFeMhxURAiQiAKDhaOr0jRK9PgH4y/gjwpslcGAy9QCfYUvL
9cTPewg8JKcJU1iYtxAdYYI=
=mvOZ
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
