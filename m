Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7R6GuUv006195
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 02:16:56 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7R6GnZY021251
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 02:16:49 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1GHDwp-0006Kj-4g
	for linux-lvm@redhat.com; Sun, 27 Aug 2006 06:16:43 +0000
Date: Sun, 27 Aug 2006 06:16:42 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20060827061642.GN1011@strugglers.net>
References: <20060827044208.GL1011@strugglers.net>
	<7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DMh6jj/uI/B+Qufx"
Content-Disposition: inline
In-Reply-To: <7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
Subject: Re: [linux-lvm] Best way to image devices in an LVM environment
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


--DMh6jj/uI/B+Qufx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2006 at 01:20:26PM +0800, Jim Morgan wrote:
> At 27/08/2006 12:42, you wrote:
> >So how would you accomplish the task of replacing sda and sdb with
> >larger disks in the least amount of effort?  Downtime is not a
> >problem, taking backups of the data is not a problem, booting off a
> >live cd is not a problem; the goal is to find the least
> >labour-intensive way to do this.
>=20
> As I understand it -- and as I've proved before in this list, my=20
> understanding is fundamentally flawed :-) -- there is a way to do this.
>=20
> Basically you have to force one disk to fail using the raid=20
> administration software. You then remove the disk, replace it with=20
> the bigger disk, and rebuild it from the first one. The partition=20
> sizes may need adjusting. Then you force the other disk to fail, and=20
> replace it with the larger one, and then rebuild it from the other large=
=20
> disk.

Well I would then be left with two large disks where sd[ab]5 (and
the sd[ab]4 primary partition that sd[ab]5 is the only logical
partition within) does not extend all the way to the end of the
disk.  I wasn't aware that you could resize RAID-1 md arrays though,
I thought it was restricted to RAID-5.  Is this not the case?

Cheers,
Andy

--DMh6jj/uI/B+Qufx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFE8TjKIJm2TL8VSQsRAju2AKCwiM2sQGQStI875uQb9N60ud1okwCfXGX9
27uRoAlNoWydG38ltjS+v64=
=KGnf
-----END PGP SIGNATURE-----

--DMh6jj/uI/B+Qufx--
