Return-Path: <lewis@sistina.com>
Date: Tue, 10 Jul 2001 11:06:56 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vg gone after vgextend
Message-ID: <20010710110656.A24243@sistina.com>
References: <20010710093902.B30416@zendo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20010710093902.B30416@zendo.net>; from lvm@zendo.net on Tue, Jul 10, 2001 at 09:39:02AM -0500
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

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Goto ftp://ftp.sistina.com/pub/LVM/contrib and get
uuid_fixer-0.3-IOP10.tar.gz

Read the README.  Run it on your system, then run vgscan.  It should fix
your problem.  If not, let me know.

On Tue, Jul 10, 2001 at 09:39:02AM -0500, Eli Criffield wrote:
> I had LVM up and working great, even on the / filesystem. I had a
> /dev/hda1 that was a 4 gig filesystem that i tared my distribution to and
> /dev/hda2 that use to be my / filesystem and /dev/hda3 that was my volume
> group. I resized /dev/hda1 down to around 30 megs and made /dev/hda2
> 4+gig. I made /dev/hda1 /boot and had a initrd to turn on LVM and boot to
> the / filesystem on /dev/rootvg/root_lv. That all worked fine.
>=20
> Until i added /dev/hda2 (now about 4gig) to the volumegroup rootvg. All
> looked ok when i went to reboot. On the reboot it died in the ramdisk when
> it ran vgscan.
> "vgscan -- no volume groups found"
>=20
> I was then stuck with a none bootable machine. I'll save you the long
> story about the trouble i had making some kind of rescue disk, but i
> finally got one to work off a cd i had a friend burn for me.
>=20
> Now when i run pvscan i get=20
> "pvscan -- inactive PV "/dev/hda3" is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 14.4GB / in use 1 [14.4GB] / in no VG 0 [0]"
>=20
> it doesn't see /dev/hda2 that i added to the vg right before reboot, but
> thats not a problem because there was nothing on it yet anyway.
>=20
> pvscan -vv gives
>=20
> -- Physical volume ---
> PV Name		/dev/hda3
> VG Name		rootvg
> PV Size		14.4 GB / NOT usable 3.48 MB [LVM: 135KB]
> PV#		1
> PV Status	available
> Allocatable	yes
> CurLV		6
> P ESize (KByte)	4096
> Total PE	3685
> Free PE		1261
> Allocated PE	2424
> PV UUID		elhLo-Mw5J-8qaE-gN2D-zEYo-Woqh-qH7H5a
> System Id	eli.custom-edge.com993738446
>=20
>=20
> from what i can tell from the archives to do a vgcfgrestore is the next
> logical thing but it doesn't work for me
>=20
> vgcfgrestore -n rootvg /dev/hda3
> vgcfgrestore -- "/etc/lvmconf/rootvg.conf" doesn't exist
> vgcfgrestore -- a backup for volume group rootvg is not available
>=20
> which makes since because i booted off a rescue disk in a ram disk.
>=20
> vgscan still gives
> vgscan -- no volume groups found
>=20
> i did find this answer in the archives for a similar problem:
>=20
> > You need to edit the disk signatures and for each PV, insert all the
> > _other_ PV signatures in the right place.
>=20
> but no explanation on how to do that?
>=20
> Is that what i should be doing? If so how do i do that? If not what can i
> do to save this box?
>=20
> thanks a ton it will save a lot of hassle if i don't have to reinstall.
>=20
> eli



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
Hey! It compiles! Ship it!
-----End Obligatory Humorous Quote------------------------------------------

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7SyggpE6/iGtdjLERAt7NAKCBXZppA7SH7Cei8+hcR3CqZJurhACcCjPf
OAcFbqMvOe0Sxotjy47cWCs=
=+gZ2
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
