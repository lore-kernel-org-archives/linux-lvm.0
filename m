Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SJmqZ8011990
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 15:48:52 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SJmpl3002944
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 15:48:51 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1GHn6B-0001zx-TA
	for linux-lvm@redhat.com; Mon, 28 Aug 2006 19:48:45 +0000
Date: Mon, 28 Aug 2006 19:48:43 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20060828194843.GS1011@strugglers.net>
References: <20060827044208.GL1011@strugglers.net>
	<7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
	<20060827061642.GN1011@strugglers.net>
	<44F1872D.9030408@mattgillen.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TjYE2yM3tsLSxz5+"
Content-Disposition: inline
In-Reply-To: <44F1872D.9030408@mattgillen.net>
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


--TjYE2yM3tsLSxz5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2006 at 07:51:09AM -0400, Matthew Gillen wrote:
> Andy Smith wrote:
> > On Sun, Aug 27, 2006 at 01:20:26PM +0800, Jim Morgan wrote:
> >> Basically you have to force one disk to fail using the raid=20
> >> administration software. You then remove the disk, replace it with=20
> >> the bigger disk, and rebuild it from the first one. The partition=20
> >> sizes may need adjusting. Then you force the other disk to fail, and=
=20
> >> replace it with the larger one, and then rebuild it from the other lar=
ge=20
> >> disk.
> >=20
> > Well I would then be left with two large disks where sd[ab]5 (and
> > the sd[ab]4 primary partition that sd[ab]5 is the only logical
> > partition within) does not extend all the way to the end of the
> > disk.  I wasn't aware that you could resize RAID-1 md arrays though,
> > I thought it was restricted to RAID-5.  Is this not the case?
>=20
> To add another "I'm not an expert" opinion:
> Supposing you can get all 4 disks in the server at the same time,

I can't; it's a rackmount server with only two disk bays and two
SATA ports on the motherboard.  I could have it open with another
2-port SATA controller on a PCI card, but this seems to be going a
bit far.

Since I only want to give the extra space to the single volume group
then it seems I should be able to follow this method:

http://www.debian-administration.org/articles/424

(basically involves doing what Jim said: failing out one disk,
replacing it with a bigger one, failing the other, replacing it,
then expanding partitions and filesystems.)

Seems that "mdadm --grow" works even with a RAID-1 which I wasn't
aware of.

The only problem then remaining would be how would I grow the single
pv/vg out to the full extent of the new larger block device it would
be on.  There doesn't seem to be a pvresize in Debain Sarge's lvm2
package..

  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.5.0

I see from:

http://www.robot101.net/2005/05/20/resizing-lvm2-physical-volumes/

that lvm2 has had pvresize since 2.02.00 so if I upgrade userland
tools (my kernel is 2.6.16.19) then would I just need to do a
pvresize after expanding the block device that my single pv/vg is
on?

Cheers,
Andy

--TjYE2yM3tsLSxz5+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFE80ibIJm2TL8VSQsRAne3AJwOePl6esN1g+/ISEBvWsYRPLDEGQCgt8Aa
JHs03v6jfdyRkLG59+lCr84=
=xcq7
-----END PGP SIGNATURE-----

--TjYE2yM3tsLSxz5+--
