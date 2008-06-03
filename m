Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m53NcPqr025116
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 19:38:26 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m53Nc9nf015843
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 19:38:09 -0400
Received: from linux.interlinx.bc.ca (unknown [67.193.220.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 05EAF2803
	for <linux-lvm@redhat.com>; Tue,  3 Jun 2008 19:38:08 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 006508710
	for <linux-lvm@redhat.com>; Tue,  3 Jun 2008 19:38:06 -0400 (EDT)
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of
	snapshot merging
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <1212525819.19122.16.camel@behemoth.csg.stercomm.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525819.19122.16.camel@behemoth.csg.stercomm.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-OfBhZd6dlofbEnQWYesu"
Date: Tue, 03 Jun 2008 19:38:06 -0400
Message-Id: <1212536286.29076.202.camel@pc.ilinx>
Mime-Version: 1.0
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


--=-OfBhZd6dlofbEnQWYesu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-06-03 at 15:43 -0500, Chris Cox wrote:
>=20
> I would think this would be VERY hard to do since both the "origin" and
> "snapshot" change (file deletes, etc).

I don't think it's as difficult as you are thinking it is.  You are
thinking of synchronizing filesystems, at the filesystem level, but
merging a snapshot back up into the origin does not deal with files or
even filesystems.  It deals with block devices and blocks, and is really
nothing more than a coordinated:

for each COW_block in snapshot; do
    for other_snapshot of origin; do
        copy origin[COW_block] to other_snapshot[COW_block]
        copy snapshot[COW_block] to origin[COW_block]
    done
done

> Do you have a set of rules you
> use for the merge?

There is no filesystem level merge.  There are no rules needed.

b.


--=-OfBhZd6dlofbEnQWYesu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIRdXel3EQlGLyuXARAsdHAJ9mhqY6F/boW1skZ07gNjgl0nHsbgCdENwn
2moZx0aTD8v8gfVOE1jElGg=
=XrCA
-----END PGP SIGNATURE-----

--=-OfBhZd6dlofbEnQWYesu--
