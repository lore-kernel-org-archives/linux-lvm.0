Return-Path: <hopper@omnifarious.mn.org>
Date: Wed, 15 Aug 2001 15:24:32 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
Message-ID: <20010815152432.A27984@omnifarious.org>
References: <20010815175659.A29749@sistina.com> <20010815182548.U3941@gum01m.etpnet.phys.tue.nl> <20010815185005.A32239@sistina.com> <20010815190428.A11146@athlon.random> <20010815210622.A1221@btconnect.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20010815210622.A1221@btconnect.com>; from thornber@btconnect.com on Wed, Aug 15, 2001 at 09:06:22PM +0100
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

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2001 at 09:06:22PM +0100, Joe Thornber wrote:
>=20
> From looking at the metadata I have no way of knowing which version of
> software the PV was created with.  This is a sorry state of affairs,
> but sadly true.  So the upgrade script does the following:
>=20
> o interrogate the existing tools that created the PV to find where they p=
ut
>   the PE's
>=20
> o write this value into the new field.
>=20
> At this point the new driver, and tools should be installed.

	So, has the metadata also been updated to have a version number
field in an easily found location?  This is a very unpleasant state of
affairs, and it will happen again if you haven't done this.

	This helps my peace of mind about doing the upgrade.  Perhaps
now I will do it with confidence that it will work and I'll get the
order of operations right.

	One question I have:

	Does it hurt for the old drivers to be in the kernel at the time
you run the upgrade script if none of the VGs are 'active'?

	I compiled LVM into my kernel instead of leaving it as a module,
so if it were a problem, I'd have to compile a new kernel that didn't
have the drivers.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7etqAjtsvlOwvazYRAmqDAJ4tsyNOYdRjLjzQXEGMDLpLKPhN5gCggtOq
f18o1NbkUCa1Jw/XY5BLeBs=
=Ze9o
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
