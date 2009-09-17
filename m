Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HFYTeg031261
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:34:29 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8HFYHPv016741
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:34:18 -0400
Received: from linux.interlinx.bc.ca (d67-193-217-194.home3.cgocable.net
	[67.193.217.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 23FFF2806
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:34:17 -0400 (EDT)
Received: from [IPv6:2001:4978:161:0:218:f3ff:fee1:65cc] (pc.interlinx.bc.ca
	[IPv6:2001:4978:161:0:218:f3ff:fee1:65cc])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 912838721
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:34:15 -0400 (EDT)
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com> <1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IQtHuraAqGlzeqjoBp7D"
Date: Thu, 17 Sep 2009 11:34:14 -0400
Message-Id: <1253201655.2339.178.camel@pc.interlinx.bc.ca>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-IQtHuraAqGlzeqjoBp7D
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-09-17 at 11:06 -0400, Stuart D. Gathman wrote:
> Using dd from a snapshot does not help the OP.

Right.

> He says the dd will take
> 5-6 hours, and he needs a backup of the system *just before* the upgrade,
> not hours before.

Which a snapshot will achieve.

> The rollback also needs to be quick.

Which a snapshot will achieve.

> A snapshot with dd does the "instant" backup part ok, but rollback
> requires 5-6 hours to copy the snapsnot to a normal LV.

Why would you copy the snapshot anywhere?  If you decided you needed a
roll-back, you boot from the snapshot of the root filesystem and have
the /etc/fstab in that snapshot mount any snapshots of other filesystems
he might have made.  Personally, I keep separate /, /usr, and /var and
so snapshot them all before an upgrade and fix up the /etc/fstab in the
snapshot-of-/ to mount the /usr and /var snapshots (rather than the
origins).

AFAICT, the only issue the OP has with snapshots is that he fears an
upgrade might screw up his LVM configuration.  Personally, I think that
is a low-probability fear, but everyone has to have their own comfort
level I guess.

> The OP is correct that creating and breaking a RAID1 mirror does what
> he needs.

Indeed.

> I always build my VGs on md* devices.

I typically have not.  I typically don't mirror anything except my
backup volume, which fully (as in bare metal restore able) backs up
every filesystem I have in my network.  For that reason I feel that
mirroring the disks in all the machines is overkill.

But granted, building systems on broken mirrors is easy enough and
allows one the flexibility of mirroring at a later date if one wants.

In fact I always thought/felt, that given that the MD superblock is at
the end of a device (or partition), shrinking the filesystem on a
partition and then trying to create an MD mirror with that partition
should be doable.  Never tried though.

b.


--=-IQtHuraAqGlzeqjoBp7D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkqyVvYACgkQl3EQlGLyuXBRbwCeJcKZZYRQyYoCQ8y7r60HR3uz
9G4AnjCkLLHqCjKLkbLizueb8qLOOvEb
=mgVY
-----END PGP SIGNATURE-----

--=-IQtHuraAqGlzeqjoBp7D--
