Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i4SE2pBw032325
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 10:02:51 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i4SE2oEG028594
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 09:02:50 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i4SE2oDF028593
	for linux-lvm@redhat.com; Fri, 28 May 2004 09:02:50 -0500
Date: Fri, 28 May 2004 09:02:50 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] dd of a used part of a logical volume?
Message-ID: <20040528140250.GD13545@null.msp.redhat.com>
References: <20040528064553.GA1007%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline
In-Reply-To: <20040528064553.GA1007%alexy.khrabrov@setup.org>
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


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2004 at 02:45:53AM -0400, Alexy Khrabrov wrote:
> Now I'd like to play with the dd copying of the whole reiserfs (I'm
> avoiding the word partition since it covers the whole logical volume
> which spans the whole RAID device).  I simply do not have space to copy
> the whole RAID, but the size of the used space on this reiserfs volume was
> under about 9 GB.  I wonder how can I copy just about that -- I assume it
> fills the logical volume contiguously, so I can dd the first 9 GB and then
> try the loopback mount/rebuild.

ReiserFS tells where on the LV to write, LVM has nothing to do with it.  So
you really need to talk to the Reiserfs people to find out where metadata
and data would be written to on a 150GB volume.  It could be that some of
the data is at the front of the LV, and some is at the end.  LVM has nothing
to do with that - it just tells reiserfs it has 150GB to work with, write
stuff to it.

Regards,
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

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAt0aJ9QxUqFeMhxURAsupAJ9jkhsOoVyeb7OYBCFisjUoDar10wCgg8BL
Q0Wz8QJF/fsA7n69z6+gdgM=
=rlXh
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
