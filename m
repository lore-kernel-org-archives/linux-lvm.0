Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24J7nK12392
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 14:07:49 -0500
Received: from anchor-post-31.mail.demon.net (anchor-post-31.mail.demon.net
	[194.217.242.89])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j24J7h8Z015502
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 14:07:43 -0500
Date: Fri, 4 Mar 2005 19:07:16 +0000
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] df doesn't display increased available disk space
Message-ID: <20050304190716.GC9723@pob>
References: <1109885756.6400.16.camel@localhost.localdomain>
	<20050303214732.GD4141@pob>
	<1109961331.6079.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <1109961331.6079.7.camel@localhost.localdomain>
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
To: robert.buick@btconnect.com, LVM general discussion and development <linux-lvm@redhat.com>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I think you are making a potentially very dangerous mistake!

Type 8e is a partition type. You don't want to use resize2fs on the PARTITION,
which is not an ext2 partition, but an lvm partition. You want
to resize the filesystem on the logical VOLUME.

And yes, resize2fs is appropriate for logical volumes. But resize the VOLUME
(e.g. /dev/VolGroup00/LogVol00), not the partition or volume group.

On Fri, Mar 04, 2005 at 06:35:31PM +0000, Robert Buick wrote:
> I'm using type 8e, does anyone happen to know if resize2fs is
> appropriate for this type; the man page only mentions type2.

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFCKLHktPCt67UksSYRAuhlAJ4vPIPzUmco87UnDerR9Vr3zv/tlgCfVaK7
7HVDGh1k7e/t+5VgKMcKu5U=
=EN3x
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
