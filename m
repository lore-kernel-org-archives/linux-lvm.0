Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i81FJW320950
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 11:19:32 -0400
Received: from bluebottle-fe2.bluebottle.com (bluebottle-fe2.bluebottle.com
	[209.223.237.199])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i81FJUS0028939
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 11:19:31 -0400
Received: from localhost.localdomain (modem-4031.chimpanzee.dialup.pol.co.uk
	[217.134.127.191]) (authenticated bits=0)
	by bluebottle-fe2.bluebottle.com (8.12.11/8.12.11) with ESMTP id
	i81FJPv9032067
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 10:19:27 -0500
Date: Wed, 1 Sep 2004 16:22:34 +0100
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] LVM2 and Software RAID
Message-ID: <20040901152234.GB4300@localhost.localdomain>
References: <63BAEF7DCB973A469B1A60CBE113C1650872A631@cmss-mail.Tickets.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <63BAEF7DCB973A469B1A60CBE113C1650872A631@cmss-mail.Tickets.com>
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


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2004 at 05:44:04PM -0700, Yang, Daniel wrote:
> Finally, the combination does not support bad-block replacement mechanism=
s.

Bad block replacement has been implemented in hardware for years so this
is not an issue. If you get a huge number of bad blocks you should really
consider replacing the drive concerned.
--=20
Robin

Weblog: http://lrp.greenrd.org/

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBNek6tPCt67UksSYRAmj8AKDQy+5HDw/YhFdf+9Zb2AnWNfNy+QCg2FsQ
1Z+NS6mHLNB3YGr3zDod1v4=
=7N6u
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
