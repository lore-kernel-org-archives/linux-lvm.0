Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2JHirj26847
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 12:44:53 -0500
Received: from eclectic.kluge.net (eclectic.kluge.net [66.92.69.221])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2JHipWA011709
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 12:44:51 -0500
Date: Fri, 19 Mar 2004 12:44:45 -0500
From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] How to associate two paths for each EMC device?
Message-ID: <20040319174445.GA7265@kluge.net>
References: <OFD5F31608.F9CF6213-ON85256E5C.005E60DA@db.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wb7/gK2L7nBZNzVm"
Content-Disposition: inline
In-Reply-To: <OFD5F31608.F9CF6213-ON85256E5C.005E60DA@db.com>
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


--wb7/gK2L7nBZNzVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2004 at 12:21:51PM -0500, Shan Jing wrote:
> I have 22  EMC symmetrix disks on two HBA links.  At this moment, there i=
s no working copy of EMC powerpath or HP Securepath available for my kernel=
 (2.4.21-112-itanium2-smp); therefore, I have to use the luns directly with=
 lvm without any DMP software in the middle.
>=20
> Without DMP software, there are two set of 22 luns, each representing one=
 HBA path.  See blow.

Can you set your HBA driver to do failover?   ie: something like this
in modules.conf:

options qla2300 ql2xfailover=3D1 ql2xmaxqdepth=3D64


This works well for my servers connected to a CX-series array. :)   The
driver handles failing between HBAs (active-passive), and only has the
LUN presented once to the system.

--=20
Randomly Generated Tagline:
"I didn't know Allman was a stand-up comedian ..."
         - Theo about laughter from sendmail tutorial

--wb7/gK2L7nBZNzVm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAWzGN7tgKAJaXVyoRAvmvAJ0TqmnABOLlzS2NxT77TgiXOEBoLgCfWJlx
ycpoBECkVcVNh6fpZud56rg=
=9nbn
-----END PGP SIGNATURE-----

--wb7/gK2L7nBZNzVm--
