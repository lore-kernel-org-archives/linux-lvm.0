Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r6A9w9np004141
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2013 05:58:09 -0400
Received: from pax.zz.de (pax.zz.de [88.198.69.77])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6A9w882019442
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2013 05:58:08 -0400
Date: Wed, 10 Jul 2013 11:58:07 +0200
From: Florian Lohoff <f@zz.de>
Message-ID: <20130710095807.GB12116@pax.zz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
Subject: [linux-lvm] seperate snapshot from ORIGIN
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,
is it possible to seperate a snapshot from its ORIGIN?

I use snapshots as a quick COW startup for KVMs - is it possible
to break up the snapshot to be an independent LV?

Flo
--=20
Florian Lohoff                                                 f@zz.de

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUBUd0wL5DdQSDLCfIvAQiRMA/7BpgSHfpGLOgrbM5Jic8Lusvwak/OXuu0
/fAZI4LMJgtHWppHuZr/ckYwnm/BkiU4H7NH81zm5cebltvOszHR/oxATi7ntq8F
7u/97+wWCfJqtJy8OLk46pqGlpkhghXPJZ5h2DwFbeFSW3q7qOCs+jmWR4eJgWxF
fwhNEu3YZIdkMTQtZ3OpTaMD3Kt6KA3/4GrSeqAj+XrXDNOrcz+x0C3Y/a71v1z9
uKWVPN3nZ5Pu5fML0jG8TjVL2FyUyEL0CLWQzJn9l0qW8ov1vPzZQpNyjo8ap+B3
lk1/RYokeUpOK5KhYRUgkeKzfku1J59lHFtBghrfU/qypqoRaIeuKJO6Ag4IohJs
yVth16Qtrd9wGyfk7yJER4DKDH+K5t+nJ2T6TcNlsXjQI93gmiYgjfUrqjIQuHHk
HAK7pEaf4DvmV7kbP4voET1IzWBOsQXUGK16QRzgsMPbqf4ZmU4hNZ/gz7YsQ01z
d1xsHLdUaPrV0BDbGLBhnhwP8B8uWxiSN084YkkKujfqdnFXABDkXZ6ZzvnIAhcG
arp4zbTIiarYLt2jJcgvfHYyYvPKkDQ0O/t7p1yA/xm+r0WOvJZkAWlX+8XVVBVT
k+pRyBRMMPO2m9deAR+K7Of8njKoe+ynNSTfly3/eDQj5OwRKbsgM3NO4rq9U3lP
oxP+h0YQMsQ=
=ACT1
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
