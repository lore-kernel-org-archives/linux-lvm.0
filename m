Date: Tue, 6 Jun 2000 12:33:35 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000606123335.A28566@omnifarious.mn.org>
References: <H0000aed07d348ed@MHS>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <H0000aed07d348ed@MHS>; from holger_zecha@hp.com on Tue, Jun 06, 2000 at 05:44:21PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: holger_zecha@hp.com
Cc: linux-lvm@msede.com


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2000 at 05:44:21PM +0200, holger_zecha@hp.com wrote:
> Hello,
>=20
> unfortunately, LVM 0.8final (in the following only called LVM) is not
> usable in production environments.
> We're thinking about using Linux in SAP mixed environments. Now we use
> NT as plattform for applikationservers and HP-UX as database server. We
> are doing some tests with Linux as Applikation Server in the near
> future.
> Are you going to implement mirroring in Linux LVM ? Why is it such a big
> problem to have the root filesystem on a LVM volume ?
> There is no easy way to get mirrored disks with LVM, only without LVM,
> but there it's not possible to resize partitions.
> So we see these two points as big disadvantages:
> a) root Filesystem not on LVM
> b) no mirroring.
>=20
> Are there any solutions in the near future ?

	I have no idea, but here are a few thoughts you may find useful.

	I have a strong suspicion that have a root partition under LVM
would actually be kind of easy.  There are two issues, one is booting
from an LVM partition, the other is having a root partition under LVM.
I think these two are actually seperate issues, though they're often
confused.

	I think you could get a root partition under LVM by using initrd
carefully and doing the vgscan and vgchange from a ramdisk.  I haven't
tested this, but I will when I get a chance.

	As for the mirroring thing, why do you want LVM to do this?  Why
not just have a hardware RAID 0 array?  Are you wanting to do periodic
disk image dumps to tape or something?

	If I'm not understanding the mirroring thing, tell me how you'd
do it without LVM.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5PTXvG4QeWBeRdS8RAlY4AKDQjvMqVMhJclWiR4NIj9A0wGKMYACffTT7
84Hd5Iq4m7KaCVwNOo2anhk=
=DntD
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
