Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9LJJ3rB010647
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 15:19:03 -0400
Received: from mail02.worldspice.net (mail02.worldspice.net [216.37.95.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9LJIihh015746
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 15:18:45 -0400
Message-ID: <4ADF5E81.4070609@worldspice.net>
Date: Wed, 21 Oct 2009 14:18:25 -0500
From: Ryan Anderson <ryan@worldspice.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
In-Reply-To: <a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF394084AFA7CA0D32C6F3D30"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF394084AFA7CA0D32C6F3D30
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Lou,

I'm new to this list and have not posted here before, so I am not sure
if this is the advice you'd eventually get, but it seems like you should
focus on the basics. You will need to understand the individual
components before a the more task-oriented parts of a how-to will be of
use. Following a step-by-step guide will get you a result, but if you
don't understand the steps the result probably won't be of any use to you=
=2E

The how-to has a good breakdown of the anatomy of LVM; that might be the
best place to start, focusing on the differences between Physical
Volumes, Volume Groups, Logical Volumes and where in that arrangement a
filesystem is placed.


Lou Arnold wrote:
> I read the How-To. It doesn't talk about the specific case or being
> mounted at root, so I had to experiment. It is likely that commands
> were in the wrong order, but I don't know what the right order is.
> =20
> I have attached the terminal session I used. In the end it did not work=
=2E
> There was still 66 GB free, and when I rebooted, the file system failed=
=2E
> The superblock was too big.
> =20
> I obviously don't understand the difference between pvresize, lvreduce
> and vgreduce, and how  resize2fs  is related to these commands.
> =20
> Hope you can help,
> Lou.
>=20
> =20
> On 10/21/09, *Drew* <drew.kay@gmail.com <mailto:drew.kay@gmail.com>> wr=
ote:
>=20
>     > The documentation wasn't specific. I believe the intent was simpl=
y to
>     > migrate the data to another logical volume to temporarily allow
>     the source
>     > volume to be reduced and/or removed. But let's assume that has
>     happened or
>     > that doesn't need to happen. So now we need to unmount LogVol00,
>     reduce it
>     > to its original nunber of extents and then remount it (either
>     before or
>     > after remount we remove the physical drive.) I assume you can't
>     try this or
>     > you'll screw up your computer, but I have a system that I screw u=
p and
>     > easily restore from a OS image. So no need to be too cautious.
>=20
>     I've done this on several occasions.
>=20
>     If you want to play with various scenarios in LVM, I'd recommend
>     reading the LVM How-To @ http://tldp.org/HOWTO/LVM-HOWTO/ . Section=
s
>     11 & 13 cover the most common tasks you'll encounter in LVM. Play
>     around, don't be afraid to break things, and if you have questions
>     feel free to give the list a shout.
>=20
>=20
>     --
>     Drew
>=20
>     "Nothing in life is to be feared. It is only to be understood."
>     --Marie Curie
>=20
>=20
>=20
> -----------------------------------------------------------------------=
-
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=20
Ryan


--------------enigF394084AFA7CA0D32C6F3D30
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkrfXoEACgkQl5OMrcBhHhL9FwCggo95ailXEvugdW0IqgNiXvr3
Jl4AnRJjNpgDSPa9+9xI7EF9TWSyE7Ju
=oeSE
-----END PGP SIGNATURE-----

--------------enigF394084AFA7CA0D32C6F3D30--
