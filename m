Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8RARjV02666
	for <linux-lvm@redhat.com>; Tue, 27 Sep 2005 06:27:45 -0400
Received: from junior.physik.fu-berlin.de (junior.physik.fu-berlin.de
	[160.45.32.227])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8RARXms007466
	for <linux-lvm@redhat.com>; Tue, 27 Sep 2005 06:27:34 -0400
Date: Tue, 27 Sep 2005 12:27:48 +0200
From: Axel Thimm <Axel.Thimm@ATrpms.net>
Message-ID: <20050927102748.GU27884@neu.nirvana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Rh48Y0bnrojh5Wm"
Content-Disposition: inline
Subject: [linux-lvm] pvresize not implemented,
	any way to use pvcreate instead?
Reply-To: linux-lvm@redhat.com
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--/Rh48Y0bnrojh5Wm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

pvresize on RHEL4U1 returns with

> # pvresize --help
>   pvresize: Resize a physical volume in use by a volume group
>=20
> Not implemented.  Use pvcreate options.

Does this imply that I can use pvcreate to resize a pv? Or is there
any other non-destructive way not involving creating new pvs?

My setup is as follows, I have a SAN exported lun that is EFI
partitioned and has only one partition which is used by LVM as a
pv. We will be adding new disks and I would like to extend this one
exported lun, instead of having several luns/pv in one vg later. I
understand that this does not matter for LVM (and is a problem that
LVM solves), but I'd like to keep the management on the SAN side
simple for the adminstrative staff.

AFAIU this was possible with LVM1, and perhaps is also possible with
LVM2 with a workaround until pvresize is written.

And as a side question: Would parted be able to autodetect the new
disk's size and properly resize partition table and partition?

Thanks!
--=20
Axel.Thimm at ATrpms.net

--/Rh48Y0bnrojh5Wm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDOR6kQBVS1GOamfERAkZpAJ0UNduD4GIUjljoBybtBwjOkKttRgCfYHHO
ICg6caWndCm0KmCxlUKWMGo=
=VIWM
-----END PGP SIGNATURE-----

--/Rh48Y0bnrojh5Wm--
