Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r62F95NK024057
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 11:09:05 -0400
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62F93Hf011746
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 11:09:04 -0400
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.80.1)
	(envelope-from <mwood@IUPUI.Edu>) id 1Uu2CU-0003Vf-MB
	for linux-lvm@redhat.com; Tue, 02 Jul 2013 11:09:02 -0400
Date: Tue, 2 Jul 2013 11:09:02 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Message-ID: <20130702150902.GD27779@IUPUI.Edu>
References: <CAFrGbuWP-aqh8MvGND=0rvuvXtpXqApBXAWxp-yi_ftnoxasWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline
In-Reply-To: <CAFrGbuWP-aqh8MvGND=0rvuvXtpXqApBXAWxp-yi_ftnoxasWw@mail.gmail.com>
Subject: Re: [linux-lvm] Forcing the lvconvert copy to be on a different
 physical disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2013 at 12:48:14PM +0200, Alessandro MACUZ wrote:
> in my company they want to use LVM to handle a transition period while
> moving VM guests from local datastore to a NAS (via iSCSI)
>=20
> An example with numbers is worth thousands of words.
> The idea is to have one leg locally and one leg on the NAS, then we'll
> remove the local leg and tha machine will run with the leg on the NAS.
>=20
> So there are two MBR-partitioned vdisks, 10G each, and with one big LVM
> partition (0x8e)
>=20
> I have created one VG spanning both disks and one LV hosted on the local
> disk.
>=20
> How to tell lvconvert that the mirror, of the LV I want, must entirely be
> hosted on the second disk?

It looks as though you simply specify the PV from which you want to
allocate the new extents, after the LV you are mirroring.  That is, if
you have a logical volume "LV" on /dev/sda1 and you want to mirror it
onto /dev/sdb1:

  lvconvert -m1 LV /dev/sdb1

Later I think you would do likewise to remove the local image from
/dev/sda1, leaving the image on /dev/sdb1:

  lvconvert -m0 LV /dev/sda1

*I have not yet done this*.  Please try it out on a test machine
before risking production data.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Machines should not be friendly.  Machines should be obedient.

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEAREIAAYFAlHS7Q4ACgkQs/NR4JuTKG8l1gCfVz71JhJxLU96yDW4h7/IFEO5
cIUAn0t5XgK3kc1h57OygEXGPtkYvFQZ
=h6Jh
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
