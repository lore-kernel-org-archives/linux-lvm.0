Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i5EDMaVN004086
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 09:22:36 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i5EDMZDK018600
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 08:22:35 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i5EDMZQk018599
	for linux-lvm@redhat.com; Mon, 14 Jun 2004 08:22:35 -0500
Date: Mon, 14 Jun 2004 08:22:35 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Stripes and PE's
Message-ID: <20040614132235.GI5508@null.msp.redhat.com>
References: <0HZ600B8D5NVF4@l-daemon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9/eUdp+dLtKXvemk"
Content-Disposition: inline
In-Reply-To: <0HZ600B8D5NVF4@l-daemon>
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


--9/eUdp+dLtKXvemk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2004 at 06:07:07PM -0600, Tyler wrote:
> I'm having problems creating a logical volume on a 4 disk SCSI volume gro=
up.
> I want to use the entire space as 1 LV that is striped, but can't seem to=
 do
> it.
>=20
> I get an error telling me I don't have enough Physical Extents, when I
> clearly do.

look at the output of 'pvs' - it will tell you the number of physical
extents free on each disk.  Take the lowest number of physical extents in
the set of PVs in your VG and multiply it by 4, then use that number when
doing your striping.  LVM requires each stripe to be on a separate PV
currently.

=20
> livecd root # vgdisplay
>   --- Volume group ---
>   VG Name               group
>   System ID
>   Format                lvm2
>   Metadata Areas        4
>   Metadata Sequence No  1
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                255
>   Cur LV                0
>   Open LV               0
>   Max PV                255
>   Cur PV                4
>   Act PV                4
>   VG Size               13.91 GB
>   PE Size               4.00 MB
>   Total PE              3560
>   Alloc PE / Size       0 / 0
>   Free  PE / Size       3560 / 13.91 GB
>   VG UUID               DjxWid-oxqx-zol9-Lu8a-CO94-AsBn-c7k3le
>=20
> livecd root # lvcreate -i4 -I16 -l3560 -nstorage group
>   Insufficient allocatable extents suitable for striping for logical volu=
me
> storage: 3560 required
> livecd root # lvcreate -i4 -I16 -l3000 -nstorage group
>   Insufficient allocatable extents suitable for striping for logical volu=
me
> storage: 3000 required
>=20
> Even if I try to use less space then it says I have, it still wont let me.
>=20
> I've had this error before, but never found a solution.  I also have not
> found the solution on the mailing list archives either.  I can create a
> contiguous LV, but without striping.  I'd like to have it striped if I
> could.
>=20
> What am I doing wrong?
>=20
> Tyler
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
665.9238429876 - Number of the Pentium Beast
-----End Obligatory Humorous Quote------------------------------------------

--9/eUdp+dLtKXvemk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAzaaa9QxUqFeMhxURAtyPAKDWVjDe1P6wTKP6SUiFlXcaZ1YgJgCeMbD6
VPEuz+7/3a7mNLD7EP2fQWA=
=362S
-----END PGP SIGNATURE-----

--9/eUdp+dLtKXvemk--
