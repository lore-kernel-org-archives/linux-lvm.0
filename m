Received: from antimony.msp.redhat.com (antimony.msp.redhat.com [172.16.30.61])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i1DEccPr030016
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 09:38:39 -0500
Received: from antimony.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by antimony.msp.redhat.com (8.12.8/8.12.8) with ESMTP id i1DEYT9h017322
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 08:34:49 -0600
Received: (from lewis@localhost)
	by antimony.msp.redhat.com (8.12.8/8.12.8/Submit) id i1DEYTh3017318
	for linux-lvm@redhat.com; Fri, 13 Feb 2004 08:34:29 -0600
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] LVM Problems :)
Message-ID: <20040213143429.GB16615@antimony.msp.redhat.com>
References: <402CD9E4.8070402@demonlord.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <402CD9E4.8070402@demonlord.de>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:47:06 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2004 at 03:06:28PM +0100, Christian Reiss wrote:
> I am trying to dissolve a running LVM, so i am doing
> the e2fsadm, lvreduce, pvmove thingy. But ever since I
> removed the first hdd, I am unable to resize the lvm
> any more. The error can be seen below, with e2fsadm.
> I also included the vg&lvdisplay commands.
>=20
> I am running the LVM1 sources (non-cvs, approx mid last
> year), as i am unable to run LVM2 (need to downgrade kernel
> to 2.4.22 (no patch included in lvm2 for 2.4.23)).
> Also, I am (too dumb/unable) to locate a e2fsadm alike
> tool for lvm2, as e2fsadm needs the lvm-tab thingy,
> which lvm2 no longer provides.

Well, AFAIK, the 2.4.22 patches work fine with 2.4.23.  As far as e2fsadm,
there is currently no equivilant for LVM2, so you have to do the resizing by
hand (shrink fs then shrink lv).

regards,
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
Computers make very fast, very accurate mistakes.
-----End Obligatory Humorous Quote------------------------------------------

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFALOB1hn5UyEmEOBMRAmF0AKCHJQSqtl4U9zOWxW1r5Z57p13aJwCglRwI
kp5CJ292kIBLhHj868v0AGE=
=56vH
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
