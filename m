Return-Path: <lewis@sistina.com>
Date: Thu, 24 May 2001 09:22:25 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [lastquestion]
Message-ID: <20010524092225.A6632@sistina.com>
References: <NBBBKLKHMJHIJLHOGAOJGENMIOAA.steve.wray@the.net.nz> <200105240641.f4O6fIrW031893@webber.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <200105240641.f4O6fIrW031893@webber.adilger.int>; from adilger@turbolinux.com on Thu, May 24, 2001 at 12:41:18AM -0600
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

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2001 at 12:41:18AM -0600, Andreas Dilger wrote:
> Actually, I posted a similar question to linux-kernel, but I think it was
> lost in the noise.  Basically, it _is_ possible to have a "finitrd" for
> just this situation (at least on 2.4).  You unmount all but root, set up
> a ramfs, and pivot_root into the ramfs.  You can then unmount root (not
> just a read-only remount), and properly shutdown LVM/RAID/etc.  Haven't
> tried it myself, but it should work.

I keep seeing this pivot_root thing.  Is it actually implemented in 2.4, and
if so, how does one go about doing it?

Thanks,
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
"Memory is like gasoline. You use it up when you are running. Of
course you get it all back when you reboot..."; Actual explanation
obtained from the Micro help desk.
-----End Obligatory Humorous Quote------------------------------------------

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7DRkhpE6/iGtdjLERAiV9AJ972wNKMaBWIy1pwaZks4rVmLPGJQCfa3ZQ
yG/z8CK7824vTp0NrQeo8nA=
=2QQo
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
