Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i7UFkkN5007579
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 11:46:46 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i7UFkjou026350
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 10:46:46 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i7UFkjAq026349
	for linux-lvm@redhat.com; Mon, 30 Aug 2004 10:46:45 -0500
Date: Mon, 30 Aug 2004 10:46:45 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] pvmove wont work
Message-ID: <20040830154645.GD6798@null.msp.redhat.com>
References: <4130F495.90806@home.se> <1093728865.4130fa61689cf@sms.ed.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline
In-Reply-To: <1093728865.4130fa61689cf@sms.ed.ac.uk>
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


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2004 at 10:34:25PM +0100, Rupert Hair wrote:
> Quoting Andreas Dahlgren <andreas.dahlgren@home.se>:
>=20
> > Just upgraded to 2.6.8.1 and got much less errors but pvmove still wont
> > work.
> > # pvmove -t /dev/hdc
> >   Test mode: Metadata will NOT be updated.
> >   mirror: Required device-mapper target(s) not detected in your kernel
> >
> > anyone knows why this wont work?
> Hi Andreas,
>=20
> I think I posted exactly the same quiestion to the list some time ago.  T=
he
> answer is that you need the Device Mapper Mirror Target compiled into (or=
 as a
> module in) your kernel.  You will need to get the "unstable" patches from=
 the
> following URL:
>=20
> http://sources.redhat.com/dm/patches.html
>=20
> Feel free to mail me if you need any more info on this.

Erm...the mirror target is available in 2.6.8.1 now I believe - you just ne=
ed
to make sure it's enabled in your .config when you compile your kernel.  I
believe the dm-mirror target is all that's required for pvmove.

regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBM0vl9QxUqFeMhxURAqVPAKCrK6Vh+99lD4JdAagV8asY1679dwCeLnBU
L1w6jJskxAs1a3xEfpysGTM=
=b1o/
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
