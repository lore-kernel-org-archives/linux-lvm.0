Return-Path: <lewis@sistina.com>
Date: Wed, 7 Feb 2001 11:01:40 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvm with raid
Message-ID: <20010207110140.H22166@sistina.com>
References: <Pine.LNX.4.21.0102071441390.16192-100000@munster.noc.fr.clara.net> <Pine.LNX.4.21.0102071730500.16192-100000@munster.noc.fr.clara.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0102071730500.16192-100000@munster.noc.fr.clara.net>; from james@fr.clara.net on Wed, Feb 07, 2001 at 05:31:30PM +0100
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

--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2001 at 05:31:30PM +0100, James wrote:
>=20
> Seems to work a treat :-) (upgraded to 0.9.1 beta1)

Hmm...you should probably use Beta3
=20
> On Wed, 7 Feb 2001, James wrote:
>=20
> >=20
> > Apparantly I need the latest beta, I will give a go and let you know
> >=20
> > On Wed, 7 Feb 2001, Jean-Eric Cuendet wrote:
> >=20
> > >=20
> > > > I created /dev/md0 (raid autodetect)
> > > > Did a pvcreate /dev/md0
> > > > lvcreate'd partitions /usr /home /var
> > >=20
> > > I think it's because of NO "LVM linux" partition ID.
> > > Your md0 partition is "RAID Auto detect" and that's normal.
> > > I'm not a guru of LVM, so I have no idea of what to do, but anyone out
> > > there?
> > > I'm interested too in this thing.
> > > It works for me to have RAID partitions in LVM because I have a mix o=
f hda1
> > > + hda2 + md0 + md1, so vgscan and vgchange works because of the "Linu=
x LVM"
> > > IDs on hda1 and hda2
> > > Thanks for the GURU response.
> > >=20
> > > -jec
> > >=20
> > >=20
> > > >=20
> > > > copied and remounted everything.
> > > > This all goes surprisingly well, until I decided to test with=20
> > > > a reboot.
> > > >=20
> > > > vgscan and vgchange don't find a thing !
> > > >=20
> > > > test:/home/james# vgscan=20
> > > > vgscan -- reading all physical volumes (this may take a while...)
> > > > vgscan -- no volume groups found
> > > >=20
> > > > test:/home/james# vgchange -a y
> > > > vgchange -- no volume groups found
> > > >=20
> > > > but if I try to recreate a PV=20
> > > >=20
> > > > test:/home/james# pvcreate /dev/md0
> > > > pvcreate -- ERROR: can't initialize physical volume=20
> > > > "/dev/md0" of volume
> > > > group "devlvm" without -ff
> > > > =20
> > > > Everything is still there apparantly.
> > > >=20
> > > > I must be missing something fundamental. Thanks fot any help=20
> > > > in advance.
> > > >=20
> > > > James
> > > >=20
> > > >=20
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > >=20
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >=20
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Life's short and hard, kind of like a bodybuilding elf
-----End Obligatory Humorous Quote------------------------------------------

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6gX90pE6/iGtdjLERAm1TAJ4tOufezbR6hX3Ttsba5iZO34AJCwCeKQRs
Sh8GBb+/lMGfhWmO6KRKeXg=
=FRf+
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
