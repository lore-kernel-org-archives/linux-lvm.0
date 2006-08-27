Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7R4gGZp031414
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 00:42:16 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7R4gFn3028366
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 00:42:15 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1GHCTJ-0004sK-00
	for linux-lvm@redhat.com; Sun, 27 Aug 2006 04:42:09 +0000
Date: Sun, 27 Aug 2006 04:42:08 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20060827044208.GL1011@strugglers.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="roa66YERhF4KTV8c"
Content-Disposition: inline
Subject: [linux-lvm] Best way to image devices in an LVM environment
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


--roa66YERhF4KTV8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I have a server I'm currently finalising the setup of, which uses
two 80G SATA drives in a RAID-1 (md) with LVM on top.  When I've got it
how I want it I need to replace the 80G drives with a much larger
pair.

Now, I've kept notes about my setup of course so I can just put the
new disks in and do it all over again, but that strikes me as a big
waste of time.

I also of course have space elsewhere to take an image of the md
devices with dd and I could copy them back over the top once md is
set up again on the new disks.  The majority of space though is in
my single LVM volume group and only 18.5G of this 72.5G is used, so
taking an 80G image seems to also be rather a waste of time.

Here's the setup:

/dev/md0 (sda1, sdb1) is swap
/dev/md1 (sda2, sdb2) is /boot
/dev/md2 (sda3, sdb3) is /
/dev/md4 (sda5, sdb5) is an LVM PV and VG 'mainvg'

Everything else is LVs within mainvg and all filesystems are ext3.

So how would you accomplish the task of replacing sda and sdb with
larger disks in the least amount of effort?  Downtime is not a
problem, taking backups of the data is not a problem, booting off a
live cd is not a problem; the goal is to find the least
labour-intensive way to do this.

The best I can think of booting off a live cd, taking a dd of each
md device to another server, installing the new drives, setting up
the md devices again and then overwriting them with the images.
Will I run into problems with their UUIDs being overwritten?

Cheers,
Andy

--roa66YERhF4KTV8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFE8SKgIJm2TL8VSQsRAskGAKDK/foWneeOPVoDD57tfU5Bgx+3jwCfUg2L
A+bdgXNup8ljQLBE81524dA=
=kU9h
-----END PGP SIGNATURE-----

--roa66YERhF4KTV8c--
