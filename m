Return-Path: <jackmc-linux-lvm@lorentz.com>
From: "Jack McKinney" <jackmc-linux-lvm@lorentz.com>
Date: Tue, 5 Jun 2001 10:48:43 -0500
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010605104843.A9845@stocks.pillory.com>
References: <20010604190123.C2560@pc.ilinx> <3B1CC8D5.9F227A36@wrkhors.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <3B1CC8D5.9F227A36@wrkhors.com>; from lembark@wrkhors.com on Tue, Jun 05, 2001 at 06:56:05AM -0500
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

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Big Brother tells me that Steven Lembark wrote:
>=20
> It is seriously less hassle to have the root volume (with /boot
> on it) as a simple file system.  Main point is that any error
> in LVM will prevent you from booting to the point where you can
> come up far enough to clean up the LVM system.  "Doable" and=20
> "make sense" aren't necessarly the same thing.  If you want to
> use LVM for nearly everything create a 128MB root, 64MB swap and
> few-hundred MB /var and use the 4th partition as pv00.  This=20
> will usually get you far enough up to fix anything that gets=20
> broken.  Until the PC BIOS mfr's include a sane boot system w/
> console prompt that allows you to boot w/o LVM for damaged system
> this will be much safer.

    More importantly, it needs to be a lot more stable.  I will probably
wait on having a LV for root until Linux LVM is a robust as AIX's LVM.
Under AIX, all of your 'system' volumes (root,usr,var) are in rootvg.
You can add a disk to rootvg, and then issue pvmove to move all of the
blocks on the first disk to the new one, run bosboot (LILO, roughly
speaking) to make the second drive bootable, and then reduce the first
disk from the VG.  Thus, if your drives are hot-swappable, you can change
out a drive completely (even if your / is mounted on it and it has active
swap!) without every shutting down.
    Under Linux LVM, there are issues.  I did a demo to a local unix group
in which I created a volume and copied a bunch of files to it.  Then, I
started a pvmove command on that volume (while mounted) and copied files
into it while it was moving.  md5sums before and after verified that the
files were all intact.
    However, I did the same presentation on the same system a week later
to a local linux group, and one of the files got corrupted.  Moral: you
need to umount the FS in order to move the LV.  This means that you have
to reboot into single user mode in order to move the root volume.  Since
you have to umount an ext2 FS in order to move it, this means that the
root volume cannot use any of the benefits of LVM (except perhaps snapshots
and striping).  If you boot to single user mode, you could have moved/resiz=
ed
root even as a regular partition.
    The only good reason to put root into an LV is that it is the cool
way to do things.  When LVM is more robust, it will even be the right
way to do things.

--
"There is no parameter that makes it impossible        Jack McKinney
     for you to perform still more excellently."       jackmc@lorentz.com
   -Mario Cuomo, on the lack of a clock in baseball    http://www.lorentz.c=
om
1024D/D68F2C07 4096g/38AEF076

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjsc/1sACgkQimeon9aPLAfUzwCg2a5kNxU3+73cTKu96acqaJvw
c00AoL/FK6ssZBKStqnaRd18TmrxpZT7
=D+qt
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
