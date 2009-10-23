Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NKDWwO027286
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 16:13:32 -0400
Received: from mail02.worldspice.net (mail02.worldspice.net [216.37.95.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NKDD53014772
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 16:13:14 -0400
Message-ID: <4AE20E43.2060006@worldspice.net>
Date: Fri, 23 Oct 2009 15:12:51 -0500
From: Ryan Anderson <ryan@worldspice.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
References: <c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
In-Reply-To: <a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig11BF6CB714A49DFAAF33A149"
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
--------------enig11BF6CB714A49DFAAF33A149
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Your best bet for resizing the root FS will be to use a LiveCD with LVM2
support. sysrescuecd works well, but likely your distribution install
disk can be booted with "linux rescue" or something similar.

Lou Arnold wrote:
> Luca, your comments make sense. After my last message I considered just=

> what you said, but I don't know how to prove it.
> =EF=BF=BD
> I know there is no data on the drive that I added, because I just added=

> the drive and never put data on it. I am sure "busy" means that it is
> mounted.=EF=BF=BDBecause it is=EF=BF=BDincluded in the default group/vo=
lume (VolGroup00
> - LogVol00) and because that LV is mounted at root ("/"), I cannot
> reduce the filesystem with resize2fs; there is no way to unmount "/",
> that I know of, anyway.=EF=BF=BD=EF=BF=BD Unless of course someone know=
s how?
> On Thu, Oct 22, 2009 at 11:52 PM, Luca Berra <bluca@comedia.it
> <mailto:bluca@comedia.it>> wrote:
>=20
>     On Wed, Oct 21, 2009 at 03:03:24PM -0400, Lou Arnold wrote:
>=20
>         I read the How-To. It doesn't talk about the specific case or
>         being mounted
>=20
>     I hate how-tos, they are a collection of particular cases and leave=
 the
>     luser with a feeling of knowledge. which is not.
>=20
>=20
>         at root, so I had to experiment. It is likely that commands wer=
e
>         in the
>         wrong order, but I don't know what the right order is.
>         I have attached the terminal session I used. In the end it did
>         not work.
>=20
>=20
>     the commands were not in the wrong order,
>     they were just the wrong commands, unless your aim was reinstalling=
=2E
>=20
>=20
>         There was still 66 GB free, and when I rebooted, the file syste=
m
>         failed. The
>         superblock was too big.
>=20
>         I obviously don't understand the difference between pvresize,
>         lvreduce and
>         vgreduce, and how =EF=BF=BDresize2fs =EF=BF=BDis related to the=
se commands.
>=20
>=20
>     I think you need to go over the basics again
>     LVM is used to abstract storage management
>     it is done by creating layers
>     Physical Volumes: which represent disks (or partitions, or whatever=

>     block device...)
>     Volume Group: which is a collection of disks
>     Logical Volume: which is a portion of a volume group
>=20
>     LVM allows to add/remove PVs to/from a VG. Add/remove/increase/shri=
nk
>     LVs in a VG.
>     This is done by dividing each PV in Physical Extents (PE), and then=

>     mapping those to Logical Extenst (LE) in a LV, so a LV is composed =
of
>     chunks of disk taken from one or more PV in a VG.
>=20
>     When using lvm you create filesystems over logical volumes instead =
of
>     creating them on disk (or partition....)
>=20
>     Lvm has no knowledge of what lays over it, a logical volume
>     is just a block device.
>=20
>     The above sentence means that if you use a logical volume to host a=

>     filesystem and want to resize the lv, you have to deal with the
>     filesystem yourself.
>     i.e.
>     if you enlarge a LV, you have to tell the filesystem that the space=

>     available has increased.
>     if you want to reduce an LV, you have to ensure _before_ doing it t=
hat
>     the space removed does not contain any data.
>     so if you want to reduce an LV containing a filesystem you _have_ t=
o
>     tell the filesystem _before_ to let that space alone. if you fail t=
o do
>     this you will loose all data that was on the portion of disk you
>     removed, and the filesystem will still think it can use that portio=
n of
>     data, until it will actually try, then sudden realization will hit =
like
>     a brick. as you just discovered.
>=20
>     btw, let pvresize alone, it is used only in the particular case in =
which
>     you are able to resize the disk underlying a volume group, which is=

>     impossible for a plain disk.
>=20
>     L.
>=20
>=20
>=20
>=20
>=20
>     _______________________________________________
>     linux-lvm mailing list
>     linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>     https://www.redhat.com/mailman/listinfo/linux-lvm
>     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
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
Ryan Anderson
(901) 843 9300
Systems Engineer
WorldSpice Technologies


--------------enig11BF6CB714A49DFAAF33A149
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkriDkMACgkQl5OMrcBhHhKznQCggFeRm5uOKGrP+Fmw8mQqOPsE
8dMAn1aPeSobJdBgD80MxWoBeog4N42u
=YG17
-----END PGP SIGNATURE-----

--------------enig11BF6CB714A49DFAAF33A149--
