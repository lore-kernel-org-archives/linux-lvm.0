Return-Path: <lewis@sistina.com>
Date: Mon, 16 Apr 2001 14:28:49 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] disk add means trouble: vgscan -- invalid i/o protocol version 5
Message-ID: <20010416142849.B16508@sistina.com>
References: <3ADB3B2A.B28AC133@mpi-hd.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <3ADB3B2A.B28AC133@mpi-hd.mpg.de>; from stefan.helfert@mpi-hd.mpg.de on Mon, Apr 16, 2001 at 08:34:18PM +0200
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

--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2001 at 08:34:18PM +0200, Stefan Helfert wrote:
> Dear list,
>=20
> I was running a stable configuration until yesterday:
> several SCSI disks with standard partitions, two IDE disks, only one IDE
> disk (Maxtor 40Gig /dev/hda) holding a LVM partition. LVM version that
> of=20
> SuSE 7.0, that was lvm-0.8 Build 111 from SuSE.
>=20
> When I added a 60 GB Maxtor IDE as primary slave, I found that vgscan
> only
> throws an "invalid i/o protocol" error. Upgrading to a SuSE 7.0 update
> lvm did not help. Upgrading to the SuSE 7.1 lvm-0.9.1_beta-3 did not
> help
> except detailing the error "... protocol version 5".
>=20
> When detaching the 60 GB disk, everything works again. (The 60 Gig disk=
=20
> is empty, it did not hold a partition table -- and it does not work with
> a
> partition table and some partition either.)

Can you run vgscan w/o the 60GB disk attached?  If so, that's very
odd...there may be some crud on the front of the disk that the LVM tools are
reading as metadata.

If you've updated the tools, you need to upgrade the kernel as well.  That's
normally why you'd get the invalid IOP protocol message.

> Any ideas ? (The 40Gig disk is in dire need of replacement, and this
> configuration should be used over the weekend to move the data).
>=20
> Let me stress this:
> the configuration had been working flawlessly before, and I checked that
> /dev/lvm is around.
>=20
>=20
> Stefan
>=20
> bash-2.04# vgscan -d                                                  =20
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0=20
> <1> lvm_get_iop_version -- LEAVING with ret: 5  =20
> vgscan -- invalid i/o protocol version 5
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
Hey! It compiles! Ship it!
-----End Obligatory Humorous Quote------------------------------------------

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE620fxpE6/iGtdjLERApa4AJ4jgoDZinc/VDCnZJuI2mL5AyZ33wCffCn5
2I/lGmHd3/IxlojPD6Io630=
=VD4s
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
