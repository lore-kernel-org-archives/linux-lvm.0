Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k21CHG116945
	for <linux-lvm@redhat.com>; Wed, 1 Mar 2006 07:17:16 -0500
Received: from mail.internode.on.net (bld-mail02.adl2.internode.on.net
	[203.16.214.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k21CHDrJ026371
	for <linux-lvm@redhat.com>; Wed, 1 Mar 2006 07:17:14 -0500
Received: from frog.local (unverified [59.167.56.137]) 
	by mail.internode.on.net (SurgeMail 3.2f) with ESMTP id 206001876 
	for <linux-lvm@redhat.com>; Wed, 01 Mar 2006 22:47:06 +1030 (CDT)
From: Daniel <dragonheart@gentoo.org>
Subject: Re: [linux-lvm] lvextend - device-mapper: create ioctl failed: Device
	or resource busy\nFailed to suspend
Date: Wed, 1 Mar 2006 23:25:02 +1100
References: <200602232345.46437.dragonheart@gentoo.org>
	<200602282202.52038.dragonheart@gentoo.org>
	<200602281450.08563.krakrjak@volumehost.net>
In-Reply-To: <200602281450.08563.krakrjak@volumehost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1433741.QzrUMZznsl";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200603012325.12089.dragonheart@gentoo.org>
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

--nextPart1433741.QzrUMZznsl
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, 1 Mar 2006 07:50 am, Zac Slade wrote:
> On Tuesday 28 February 2006 05:02, Daniel wrote:
> > Guessing the additional info didn't help and there is no easy way to
> > reset the state.
>
> Not really unfortunately.

=46eature request :-)

> I have been thinking about this a lot though. =20
> I've never seen it and I'm not sure what the next move really is.

Tough ones.

> Someone=20
> did suggest (and sorry for not posting sooner) that you should run lsof
> against /dev/mapper/control and see if something is keeping it open.

nothing open.

> Hopefully this will work.  I guess you were able to remove an lv previous=
ly
> so you shouldn't have an issue doing this.=20

Can't remember how I did exactly. I'm sure it was just a lvm learning=20
experience. I should have less problems this time (I'm jinking myself here=
=20
I'm sure)

> One thing you didn't answer=20
> (and I didn't ask) is if you had problems extending any other lvs.=20

Didn't try that until just then. Arg  - same error.

> The=20
> output of all the tools show the devices in a good state, so to me it just
> doesn't make sense.=20

Other suggestions welcome. I'm almost considering a vanilla kernel just to=
=20
try.

Won't be today though. Need to get an alternate going - filesystem full is =
a=20
bad error for a backup program. At least I've got twice the space even if I=
=20
can't extend.

=2D-=20
Daniel Black <dragonheart@gentoo.org>
Gentoo Crypto/dev-embedded/Forensics/NetMon

--nextPart1433741.QzrUMZznsl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.18 (GNU/Linux)

iD8DBQBEBZKohhpKunZncJcRAkpBAJ9Ga9PmBYy2UNxM7WCtaJJHvKH7hgCgg3y1
FONtuy2SBSYLo+F5qSaCt+0=
=iXdj
-----END PGP SIGNATURE-----

--nextPart1433741.QzrUMZznsl--
