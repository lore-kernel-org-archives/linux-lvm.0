Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5M07vSK016270
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 20:07:57 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5M07t8k030521
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 20:07:56 -0400
Received: from pc (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 5B022E1C31
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 20:07:54 -0400 (EDT)
Subject: Re: [linux-lvm] LVM2 Error when creating snapshot
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <44985AF7.20704@fastenal.com>
References: <44985AF7.20704@fastenal.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Z9+OrGKxpclwyThztUcE"
Date: Wed, 21 Jun 2006 20:07:51 -0400
Message-Id: <1150934873.32034.107.camel@pc>
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
To: linux-lvm@redhat.com


--=-Z9+OrGKxpclwyThztUcE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-06-20 at 15:30 -0500, Kelly Sauke wrote:
>=20
>=20
> I get this error whenever I create a bunch of snapshots.  I have 36 files=
ystems
> in my vg.  If I walk through them creating a snapshot on each one, the la=
st 4
> fail.  They fail with the below error.  I did the order backwards and got=
 the
> same results so its not dependant on the lv I'm snapshotting, it appears =
to be
> dependant upon the number of snapshots I'm creating.
>=20
>=20
> /usr/sbin/lvcreate -L 1G -p r -s -n save_perpet2-20060619161740
> /dev/svg/save_perpet2lv
>   device-mapper: reload ioctl failed: Cannot allocate memory

Sadly, you are getting about as much response as I got to both a posting
here and a bug filed with redhat about this issue.

This appears to be a "mis-use" of a particular kernel memory allocation
function that is used to reallocate a pool until it reaches the maximum
size that that particular function is capable of allocating.  I don't
recall the details at the moment however.  The bug in redhat's bugzilla
has a pretty good accounting IIRC.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-Z9+OrGKxpclwyThztUcE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEmd9Xl3EQlGLyuXARAp3XAJ9NvN6sFO1CXbIne/fGHB48cVUcZACfYMU8
36hAJE9MErO6tfYvkuBLXww=
=HN7g
-----END PGP SIGNATURE-----

--=-Z9+OrGKxpclwyThztUcE--
