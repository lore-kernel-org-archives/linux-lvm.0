Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KDa1u06560
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:36:01 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KDa1Qd006535
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:36:01 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1DkMRA-0000xr-MF
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 13:35:41 +0000
Date: Mon, 20 Jun 2005 13:35:40 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050620133540.GS754@strugglers.net>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<36801.64.233.242.196.1119274009.squirrel@www.echohome.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45nhIriPRwzWsBkh"
Content-Disposition: inline
In-Reply-To: <36801.64.233.242.196.1119274009.squirrel@www.echohome.org>
Subject: Re: [linux-lvm] Is LVM safe?
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


--45nhIriPRwzWsBkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2005 at 09:26:49AM -0400, Erik Ohrnberger wrote:
> The thought just crossed my mind that the failure rate of the LVM would be
> the sum of the failure rates of all the disks in your LVM.

You can run LVM on top of software RAID... (or indeed hardware RAID
of course)

--45nhIriPRwzWsBkh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCtsYsIJm2TL8VSQsRAtygAKDrQ3OILWBLcP//A//9PNncshRsEgCfVKlZ
Jd3HHEZMTdY0obTef6+R98E=
=9bht
-----END PGP SIGNATURE-----

--45nhIriPRwzWsBkh--
