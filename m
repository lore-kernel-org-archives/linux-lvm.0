Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BNuiO19818
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 18:56:44 -0500
Received: from zippy.toger.us (zippy.toger.us [65.19.178.247])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1BNuhaX000704
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 18:56:43 -0500
Date: Fri, 11 Feb 2005 15:56:40 -0800
Subject: Re: [linux-lvm] Feature Request (revert a logical volume back to its
	snapshot sta te)
Message-ID: <20050211235640.GB24306@zippy.toger.us>
References: <420D2BC6.3040905@dogpad.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline
In-Reply-To: <420D2BC6.3040905@dogpad.net>
From: Jason Martin <jhmartin@toger.us>
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


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2005 at 05:03:50PM -0500, Joe Harvell wrote:
> It seems like it would make sense for LVM to support a feature to revert=
=20
> the source logical volume to the state it was in when the snapshot was=20
I think it would also be handy to be able to 'roll back' a
filesystem.  Writing to the snapshot isn't always feasible since
the running application isn't in that place. =20

-JM
--=20
Luxuriantly hand-crafted from only the finest ASCII.
This message is PGP/MIME signed.

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: --no-verbose

iD8DBQFCDUY4l2ODWuqVSBMRAkuQAJ0b8HiP85OiHIV3ZdbGXc4elk4BVwCeNbBf
6JusiFlZj8/7LWtdyTixMuo=
=PEvl
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
