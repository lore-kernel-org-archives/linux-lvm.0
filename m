Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5OA2V013252
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 06:02:31 -0400
Received: from bluebottle-fe1.bluebottle.com (bluebottle-fe1.bluebottle.com
	[209.223.237.195])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5OA2Te1011854
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 06:02:29 -0400
Received: from localhost.localdomain (modem-3733.cheetah.dialup.pol.co.uk
	[217.134.110.149]) (authenticated bits=0)
	by bluebottle-fe1.bluebottle.com (8.12.11/8.12.11) with ESMTP id
	i5O9sMGS005189
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 04:54:24 -0500
Date: Thu, 24 Jun 2004 11:02:19 +0100
From: Robin Green <greenrd@greenrd.org>
Message-ID: <20040624100039.GE2900@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="73fGQZLCrFzENemP"
Content-Disposition: inline
Subject: [linux-lvm] Boot failure remounting rootfs on kernel 2.6.6 - kernel
	2.6.3 worked
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
To: linux-lvm@redhat.com


--73fGQZLCrFzENemP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm using lvm2 on Fedora Core, and when I upgraded to kernel 2.6.6 from 2.6=
.3
the boot process failed on remounting the / filesystem ("bread failed" was
mentioned).

/ is: /dev/mapper/Volume00-LogVol02 on / type reiserfs (rw)

I tried remounting manually at the rescue prompt, but that also didn't work
("bread failed" again).

What's changed:
- Working kernel: 2.6.3 + skas patch + kdb patch
- Failed kernel: 2.6.6 + skas patch

What's not changed:
- Same initrd (built for 2.6.0)

I tried passing selinux=3D0 in case it was selinux but this made no differe=
nce.

--=20
Robin

--73fGQZLCrFzENemP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFA2qaqtPCt67UksSYRAmQfAJ0S7u4DjFpuGTgmQ+93kOHEvEv7KwCfTWc+
vsDNxTFULUrACR3agFzB5Vs=
=mCl/
-----END PGP SIGNATURE-----

--73fGQZLCrFzENemP--
