Return-Path: <lewis@sistina.com>
Date: Tue, 10 Jul 2001 12:12:06 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vg gone after vgextend
Message-ID: <20010710121206.A31966@sistina.com>
References: <20010710093902.B30416@zendo.net> <20010710110656.A24243@sistina.com> <20010710113917.A30933@zendo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20010710113917.A30933@zendo.net>; from eli@zendo.net on Tue, Jul 10, 2001 at 11:39:17AM -0500
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

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2001 at 11:39:17AM -0500, Eli Criffield wrote:
> It didn't work :(
>=20
> when i ran=20
> ./uuid_fixer /dev/hda2 /dev/hda3    i got
> /dev/hda2 - pv_read{}: PV identifier invalid

are you *sure* that /dev/hda2 is the other PV?  What happens when you run
'pvdata -U /dev/hda2'?  You might also try recompiling the uuid_fixer
against the beta2 source, and running it again.  It should work as is, but
that might be an issue.

> but if i run=20
> ./uuid_fixer /dev/hda3 i get
> Error: number of PVs passed in does not match number of PVs in /dev/hda3s
> VG
> 1 PVs where passed in and 2 where expected
>=20
> So it thinks /dev/hda2 is part of the vg but /dev/hda2 had no info on it
> saying that it is.
>=20
> oh btw im using LVM 0.9.1_beta2 as it came with kernel 2.4.5 and LVM
> tools 0.9.1_beta2.
>=20
> Now what?
>=20
> eli
>=20
> On Tue, Jul 10, 2001 at 11:06:56AM -0500, AJ Lewis wrote:
> > Goto ftp://ftp.sistina.com/pub/LVM/contrib and get
> > uuid_fixer-0.3-IOP10.tar.gz
> >=20
> > Read the README.  Run it on your system, then run vgscan.  It should fix
> > your problem.  If not, let me know.
> >=20
> > On Tue, Jul 10, 2001 at 09:39:02AM -0500, Eli Criffield wrote:
> > > I had LVM up and working great, even on the / filesystem. I had a
> > > /dev/hda1 that was a 4 gig filesystem that i tared my distribution to=
 and
> > > /dev/hda2 that use to be my / filesystem and /dev/hda3 that was my vo=
lume
> > > group. I resized /dev/hda1 down to around 30 megs and made /dev/hda2
> > > 4+gig. I made /dev/hda1 /boot and had a initrd to turn on LVM and boo=
t to
> > > the / filesystem on /dev/rootvg/root_lv. That all worked fine.
> > >=20
> > > Until i added /dev/hda2 (now about 4gig) to the volumegroup rootvg. A=
ll
> > > looked ok when i went to reboot. On the reboot it died in the ramdisk=
 when
> > > it ran vgscan.
> > > "vgscan -- no volume groups found"
> > >=20
> > > I was then stuck with a none bootable machine. I'll save you the long
> > > story about the trouble i had making some kind of rescue disk, but i
> > > finally got one to work off a cd i had a friend burn for me.
> > >=20
> > > Now when i run pvscan i get=20
> > > "pvscan -- inactive PV "/dev/hda3" is associated to an unknown VG (run
> > > vgscan)
> > > pvscan -- total: 14.4GB / in use 1 [14.4GB] / in no VG 0 [0]"
> > >=20
> > > it doesn't see /dev/hda2 that i added to the vg right before reboot, =
but
> > > thats not a problem because there was nothing on it yet anyway.
> > >=20
> > > pvscan -vv gives
> > >=20
> > > -- Physical volume ---
> > > PV Name		/dev/hda3
> > > VG Name		rootvg
> > > PV Size		14.4 GB / NOT usable 3.48 MB [LVM: 135KB]
> > > PV#		1
> > > PV Status	available
> > > Allocatable	yes
> > > CurLV		6
> > > P ESize (KByte)	4096
> > > Total PE	3685
> > > Free PE		1261
> > > Allocated PE	2424
> > > PV UUID		elhLo-Mw5J-8qaE-gN2D-zEYo-Woqh-qH7H5a
> > > System Id	eli.custom-edge.com993738446
> > >=20
> > >=20
> > > from what i can tell from the archives to do a vgcfgrestore is the ne=
xt
> > > logical thing but it doesn't work for me
> > >=20
> > > vgcfgrestore -n rootvg /dev/hda3
> > > vgcfgrestore -- "/etc/lvmconf/rootvg.conf" doesn't exist
> > > vgcfgrestore -- a backup for volume group rootvg is not available
> > >=20
> > > which makes since because i booted off a rescue disk in a ram disk.
> > >=20
> > > vgscan still gives
> > > vgscan -- no volume groups found
> > >=20
> > > i did find this answer in the archives for a similar problem:
> > >=20
> > > > You need to edit the disk signatures and for each PV, insert all the
> > > > _other_ PV signatures in the right place.
> > >=20
> > > but no explanation on how to do that?
> > >=20
> > > Is that what i should be doing? If so how do i do that? If not what c=
an i
> > > do to save this box?
> > >=20
> > > thanks a ton it will save a lot of hassle if i don't have to reinstal=
l.
> > >=20
> > > eli
> >=20
> >=20
> >=20
> > --=20
> > AJ Lewis
> > Sistina Software Inc.                  Voice:  612-638-0500
> > 1313 5th St SE, Suite 111              Fax:    612-638-0500
> > Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> > http://www.sistina.com
> >=20
> > Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 00=
29 2648
> > Get my key at: http://www.sistina.com/~lewis/gpgkey
> >  (Unfortunately, the PKS-type keyservers do not work with multiple sub-=
keys)
> >=20
> > -----Begin Obligatory Humorous Quote-----------------------------------=
-----
> > Hey! It compiles! Ship it!
> > -----End Obligatory Humorous Quote-------------------------------------=
-----
>=20
>=20



--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Computers make very fast, very accurate mistakes.
-----End Obligatory Humorous Quote------------------------------------------

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7SzdmpE6/iGtdjLERAsJpAJwKhnuVmG1MM1FX81PUZOM9i52q5wCeM71E
64wNsAff+G8X/cRRD2qeBfg=
=u2Vj
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
