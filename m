Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k441dloe012363
	for <linux-lvm@redhat.com>; Wed, 3 May 2006 21:39:47 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k441de0s021029
	for <linux-lvm@redhat.com>; Wed, 3 May 2006 21:39:41 -0400
Received: from pc.local (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id F2E6ADBBD6
	for <linux-lvm@redhat.com>; Wed,  3 May 2006 21:39:38 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-gASFiyM2RtZ/BOwFfH3O"
Date: Wed, 03 May 2006 21:39:36 -0400
Message-Id: <1146706776.31003.136.camel@pc.local>
Mime-Version: 1.0
Subject: [linux-lvm] VG defragmenting and backing up the extent map
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
To: linux-lvm@redhat.com


--=-gASFiyM2RtZ/BOwFfH3O
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

It has often occurred to me that the fact that a logical volume is not
contiguous will make recovery in the face of a partial disaster more
difficult.

For example, if I happen to lose the logical->physical extent map in the
LVM superblock (the single only place this information is kept AFAIK)
then I am pretty screwed with respect to getting my filesystems back off
the disk.

Compared with just losing the partition table from a traditionally
partitioned disk, I could use a tool like findsuper and losetup the
whole disk with offsets (losetup -o <offset> to retrieve the individual
filesystems.

This technique would even work with LVM given that I had lost the part
of the disk with the extent mapping except that my filesystems are not
contiguous if I have extended any of them.

So, the question is, has anyone developed a tool to "defragment" a
Volume Group so that all of the logical volumes in it are contiguous?

On a somewhat related note, what provisions can I take to mitigate the
loss of the extent map?  I am correct in that only one copy of it exists
at the head of a Physical Volume?  Can I make a backup of it in any way
so that it could be used at a later date to reconstruct logical volumes?

As you might have guessed, I have lost a small portion of a 160GB disk,
the portion which has the extent mapping for the whole PV and I want to
mitigate this problem in the future.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-gASFiyM2RtZ/BOwFfH3O
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEWVtYl3EQlGLyuXARAi8JAJ9fXpj4Wiek7cXZnyeAt4OZOEBX3gCgsr2s
d4LrGINbJwIY0cVWIo3Ll24=
=TRoA
-----END PGP SIGNATURE-----

--=-gASFiyM2RtZ/BOwFfH3O--
