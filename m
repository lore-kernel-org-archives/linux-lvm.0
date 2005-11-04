Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA4LH0V22720
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 16:17:00 -0500
Received: from mail18.bluewin.ch (mail18.bluewin.ch [195.186.19.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA4LGrbQ014188
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 16:16:54 -0500
Received: from vangelis (81.62.238.235) by mail18.bluewin.ch (Bluewin
	7.2.068.1) id 435E01BB002D6AE8 for linux-lvm@redhat.com;
	Fri, 4 Nov 2005 21:16:48 +0000
From: Dan Johansson <Dan.Johansson@dmj.nu>
Subject: Re: [linux-lvm] pvcreate on a dmraid device
Date: Fri, 4 Nov 2005 22:16:37 +0100
References: <200511042005.17392.Dan.Johansson@dmj.nu>
	<20051104192431.GD3517@redhat.com>
In-Reply-To: <20051104192431.GD3517@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1667335.dCXDTGuz2l";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200511042216.44878.Dan.Johansson@dmj.nu>
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

--nextPart1667335.dCXDTGuz2l
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

TANKS!

That did it!!!

Regards,
=2D-Dan
On Friday 04 November 2005 20.24, Heinz Mauelshagen wrote:
> Dan,
>
> change your lvm2 "devices" configuration in /etc/lvm/lvm.conf to include:
>
> types =3D [ "device-mapper", 254 ]
>
> Regards,
> Heinz    -- The LVM Guy --
>
> On Fri, Nov 04, 2005 at 08:05:08PM +0100, Dan Johansson wrote:
> > Hi,
> >
> > I'm new to this list, but not to Linux and LVM.
> > I'm trying to setup a new Linux-server with an on board RAID-controller
> > (Promise PDC20265 FastTrak100 Lite/Ultra100). Now everything goes well
> > until I try to do a pvcreate on one of the raid-partitions, this is the
> > output I get:
> > # pvcreate /dev/mapper/pdc_edcfibbf4
> >   Device /dev/mapper/pdc_edcfibbf4 not found.
> >
> > But the device-file is there (along with the other partitions).
> >
> > # ll /dev/mapper/pdc_edcfibbf*
> > brw-------  1 root root 253,  7 Nov  4 18:22 /dev/mapper/pdc_edcfibbf
> > brw-------  1 root root 253,  8 Nov  4 18:22 /dev/mapper/pdc_edcfibbf1
> > brw-------  1 root root 253,  9 Nov  4 18:22 /dev/mapper/pdc_edcfibbf2
> > brw-------  1 root root 253, 10 Nov  4 18:22 /dev/mapper/pdc_edcfibbf3
> > brw-------  1 root root 253, 11 Nov  4 18:22 /dev/mapper/pdc_edcfibbf4
> >
> > and dmraid shows the raidgroup OK:
> > # dmraid -s
> > *** Active Set
> > name   : pdc_edcfibbf
> > size   : 160086465
> > stride : 128
> > type   : mirror
> > status : ok
> > subsets: 0
> > devs   : 2
> > spares : 0
> >
> > Any suggestions on how I can solve this issue and move on with my
> > installation.
> >
> > Regards,
> > --
> > Dan Johansson, <http://www.dmj.nu>
> > ***************************************************
> > This message is printed on 100% recycled electrons!
> > ***************************************************
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
=2D=3D
>-=3D-
>
> Heinz Mauelshagen                                 Red Hat GmbH
> Consulting Development Engineer                   Am Sonnenhang 11
> Cluster and Storage Development                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@RedHat.com                            +49 2626 141200
>                                                        FAX 924446
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
=2D=3D
>-=3D-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=2D-=20
Dan Johansson, <http://www.dmj.nu>
***************************************************
This message is printed on 100% recycled electrons!
***************************************************

--nextPart1667335.dCXDTGuz2l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDa8+8F+s3Ki+4lK0RAsJzAKDCKmU4yOKase4s6p4cVGeUp3IGGgCgh+MQ
TjllbDqJFBuufPlwOoaqL+Q=
=1FR6
-----END PGP SIGNATURE-----

--nextPart1667335.dCXDTGuz2l--
