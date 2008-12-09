Received: from firewall.xsintricity.com (vpn-12-226.rdu.redhat.com
	[10.11.12.226])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB9KuKZY018719
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:56:20 -0500
Subject: Re: [linux-lvm] shift PV from disk to raid device?
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <VA.000034fd.04df9fe8@news.conactive.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com> <493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
	<VA.000034fd.04df9fe8@news.conactive.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-kG0EIUIK94n275RRvRcv"
Date: Tue, 09 Dec 2008 15:56:16 -0500
Message-Id: <1228856177.32405.59.camel@firewall.xsintricity.com>
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
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-kG0EIUIK94n275RRvRcv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-12-09 at 21:49 +0100, Kai Schaetzl wrote:
> Doug Ledford wrote on Tue, 09 Dec 2008 14:56:24 -0500:
>=20
> > One thing that might be happening here (and I'm not sure since I'm not
> > an LVM expert) is that when the lvm stack finds the pv on /dev/sdb3
> > or /dev/sda3, it sees a full size partition (meaning it can access all
> > the way to the end of the device).
>=20
> But this couldn't normally happen if I just created LVM on top of the md=20
> device, correct? However, as I created a PV on /dev/sda3, did not remove=20
> it and then create the md array on it and then the PV on the md device=20
> there might be something going on ... especially in case the array broke.

Correct.  If you created the PV on sda3, then the lvm stack would think
it could write all the way to the end of the partition, including
overwriting the raid superblock you later created by making the raid
array.  If you create the pv on the raid device itself, then it should
be sized to exactly fit within the limits of the md raid device and
never overwrite the raid superblock.

> > The solution to this problem is to create the raid device with a
> > superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).
>=20
> man mdadm gives the difference between 1.1 and 1.2 as 1.2 putting the RAI=
D=20
> superblock 4k after the beginning. Is this another measure against=20
> accidental overwrites? Would you recommend 1.2 if I were to use a newer=20
> superblock version?

The only reason for 1.2 to exist is in the case a future boot loader
(like extlinux) is modified to know about filesystem offsets and boot
from these arrays, then you generally will need a version 1.2 superblock
so that the first 512 bytes of the partition can be used by the boot
loader.  With a version 1.1 superblock, the boot loader sector and the
superblock would both want to occupy that first sector.  However, as we
don't ship extlinux yet, and as it doesn't yet support version 1.1 or
1.2 superblocks (although I was told by HPA, the author of extlinux,
that it would be very easy to do), a version 1.1 superblock is just as
good as a version 1.2 superblock.

--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: CFBFF194
              http://people.redhat.com/dledford

Infiniband specific RPMs available at
              http://people.redhat.com/dledford/Infiniband


--=-kG0EIUIK94n275RRvRcv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkk+23AACgkQTzP9PM7pjw+B4gCdEbdT7Y2OGXIMVO76zeLdvyDd
GTEAn25HiYV1QJH8d+8SCFq+e55GjOxz
=dxLz
-----END PGP SIGNATURE-----

--=-kG0EIUIK94n275RRvRcv--
