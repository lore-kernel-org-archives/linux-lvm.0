Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9UHRnr20259
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 13:27:49 -0400
Received: from eclectic.kluge.net (eclectic.kluge.net [66.92.69.221])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9UHRilE029352
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 13:27:49 -0400
Date: Sat, 30 Oct 2004 13:27:38 -0400
From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
Message-ID: <20041030172738.GF13737@kluge.net>
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
	<41814060.4040400@mikebabcock.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xpm60Y6NLyZIvZnU"
Content-Disposition: inline
In-Reply-To: <41814060.4040400@mikebabcock.ca>
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


--xpm60Y6NLyZIvZnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2004 at 02:54:24PM -0400, Michael T. Babcock wrote:
> >You'd usually want to make your raid devices first, then put LVM on
> >top of it.  I can't really think of any benefits of doing it the other
> >way around.
>=20
> I've thought about this numerous times -- there is the distinct resizing=
=20
> advantage.  Namely, if I create a software RAID partition, I can't=20
> resize it afterward without destroying it.  I have for example, on=20

There's no resizing advantage at all -- if you add another disk to the LVM,
you can just as easily add it to a RAID array instead.

Never mind the fact that if you lose any disk in the LVM, your RAID groups =
are
dead (unless you split up your LVM disk, but that's what RAID does ...)

LVM gives you flexibility in your disk layout, RAID gives you performance
+ reliability.  LVM builds on RAID's features, but the other way around,
RAID is undercut by LVM.

> I understand this may not be optimal in some situations, but some of us=
=20
> don't have thousands of dollars for SCSI HW RAID controllers.

Neither do I, but this is irrelevent to the conversation.

--=20
Randomly Generated Tagline:
"A bride must be carried over this, but a vampire must be invited into
 it."                                            - Jeopardy Answer
 "What is a Supermarket Spacer, Alex?"           - Theo's Response

--xpm60Y6NLyZIvZnU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBg88K7tgKAJaXVyoRAtCeAKCSn1PcYWPurtoXGT5bKlI8l+q8kgCfYrQm
p6AyWCz73sL2HBEV5wiHsLg=
=bp2N
-----END PGP SIGNATURE-----

--xpm60Y6NLyZIvZnU--
