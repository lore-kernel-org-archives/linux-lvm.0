Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5RNxAu06832
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 19:59:10 -0400
Received: from ofb3.ofb.net (h34-aclarke.sv.meer.net [205.217.153.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5RNx5Il003630
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 19:59:09 -0400
Date: Mon, 27 Jun 2005 16:59:04 -0700
From: Jason Heiss <jheiss-lvm@ofb.net>
Message-ID: <20050627235904.GA16989@ofb.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
Subject: [linux-lvm] Export an LV?
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


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

OK, having looked through the code for vgreduce it's clear that the
important parts of the --removemissing code aren't getting called for
some reason.  Probably some sort of bug, I'll try to look at it later if
I get a chance.

In the meantime, I've put the two drives for the LV I'm trying to move
back into my server.  Now I'd like to find out if there is a right way
to move an LV to another machine.  As before I've got a VG with two
LVs.  One LV is on one physical drive, the other LV is spread over two
drives.  I'd like to move the second LV to another system.  I don't see
an obvious way to do that.  vgexport/vgimport would allow me to move the
entire VG, but I don't want to do that.  I could use vgreduce to kick
the two associated physical volumes out of the VG, but I don't see any
way to reconstruct the volume on the new machine with my data intact.
Is there a way to do this?  (I'm guessing no, but thought I'd check.)

Jason

--=20
Jason Heiss
PGP key:  http://ofb.net/~jheiss/jheiss.pgp.txt


--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwJLHmyNX8sTTeO0RArE4AJ4htl8WN7eIVXxZ8OU25PgPCsgvbgCaA6Gt
zSQGkgi7qRjcfxCkXc73Ux4=
=3rq9
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
