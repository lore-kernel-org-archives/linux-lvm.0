Return-Path: <eli@zendo.net>
Date: Wed, 11 Jul 2001 08:30:23 -0500
From: Eli Criffield <eli@zendo.net>
Message-ID: <20010711083022.B1276@zendo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
Subject: [linux-lvm] about to give up
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Well I've run out of things to try and am about to start the process of
reinstalling everything. But i thought I'd give it one last try to see if
anyone had any ideas?

The story goes, I have three partitions on one hard drive /dev/hda1 (a 30
meg /boot) /dev/hda2, and /dev/hda3 are both LVM.

/dev/hda3 was the only LVM partition. I vgextened to include /dev/hda2,
then rebooted and now vgscan finds no volume groups.

pvscan only shoes that /dev/hda3 is part of a volume group and doesn't see
anything about /dev/hda2

uud_fixer gives me=20
#./uuid_fixer /dev/hda2 /dev/hda3
/dev/hda2 - pv_read{}: PV identifier invalid=20

but if i run it just against /dev/hda3 i get
#./uuid_fixer /dev/hda3                                              =20
Error: number of PVs passed in does not match number of PVs in /dev/hda3s  =
    =20
VG                                                                         =
    =20
1 PVs where passed in and 2 where expected       =20

#pvdata -U /dev/hda2 gives
pvdata -- ERROR "pv_read{}: PV identifier invalid" reading physical volume =
     =20
uuid list from physical volume "/dev/hda2"  =20

#pvdata -U /dev/hda3 gives
--- List of physical volume UUIDs ---                                      =
     =20
                                                                           =
    =20
000: elhLXoMw5J8qaEgN2DzEYoWoqhqH7H5a                                      =
    =20
001: 9AoOf5F6c58dcyJ30pfwNp153TI5PjLF=20


So /dev/hda2 has no information about being in volumegroup rootvg but
rootvg thinks it is, or at least thats as near as i can tell what's
wrong. Is there some way to remove /dev/hda2 from the volume group even if
i can't find it with vgscan. Is there some way to change /dev/hda2 so it
thinks there it is part of the volume group?


Thanks again for any help


eli

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7TFTum2VvYlVjW2oRAp/eAKD7M/puIcvq5k5mMjnWDj8VV/t4hwCeM+J4
VeB5OorBwllOlF+ep6zGYOs=
=DhWT
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
