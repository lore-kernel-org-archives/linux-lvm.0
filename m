Received: from firewall.xsintricity.com (vpn-12-27.rdu.redhat.com
	[10.11.12.27])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB9LMlwO022733
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 16:22:47 -0500
Subject: Re: [linux-lvm] shift PV from disk to raid device?
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <Pine.LNX.4.64.0812091558080.18598@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com> <493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
	<VA.000034fb.04c01c18@news.conactive.com>
	<Pine.LNX.4.64.0812091558080.18598@bmsred.bmsi.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-3c4iAS2kN/ZpLU8H/cSR"
Date: Tue, 09 Dec 2008 16:22:44 -0500
Message-Id: <1228857764.32405.69.camel@firewall.xsintricity.com>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: maillists@conactive.com


--=-3c4iAS2kN/ZpLU8H/cSR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-12-09 at 16:03 -0500, Stuart D. Gathman wrote:
> On Tue, 9 Dec 2008, Kai Schaetzl wrote:
>=20
> > > The solution to this problem is to create the raid device with a
> > > superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).
> >=20
> > Is this an option to mdraid? mdadm --create --help doesn't show me this=
=20
> > option. Might mdadm-2.6.4-1.el5 on 5.2 be too old? Or is this an option=
 to=20
> > fdisk/sfdisk?
>=20
> I don't think changing the raid superblock will help.  I generally
> prefer having the superblock at the end - there are times when you
> *do* want sda3/sdb3 to alias md3:

Nope.  This is never true.

>  o many versions of grub will not install on md? - you have to unmount /b=
oot,
>  break mirror, mount sd? on /boot, install grub, unmount /boot, mount md?=
 on
>  /boot again, add back mirror copy of /boot.

Grub will install just fine, however you have to do it manually because
anaconda gets it wrong.  The correct way to install grub on a
raid1 /boot partition is to wait until anaconda gives you the "Done with
install, press the reboot button" prompt, then switch to vt2 where you
have a bash prompt, run grub, then run these commands (assuming that
your /boot raid1 is on partition 1 of disk sda and sdb):

device (hd0) /dev/sda
root (hd0,0)
install --stage2=3D/grub/stage2 /grub/stage1 (hd0) e2fs_stage1_5
p /grub/stage2 /grub/grub.conf
device (hd0) /dev/sdb
root (hd0,0)
install --stage2=3D/grub/stage2 /grub/stage1 (hd0) e2fs_stage1_5
p /grub/stage2 /grub/grub.conf
quit

>  o Also, when recovering a system, it is helpful to be able to mount a
>  partition directly, without setting up the raid devices.  I've had custo=
mers
>  remove a mirror copy and mail me the disk.  I can then mount the filesys=
tems
>  directly, while they keep operating.

Again, this is never true.  For a raid1 array, you can always bring the
array up in degraded mode and access it that way.  Doing what you are
talking about can lead to silent data corruption if you ever bring the
raid drives back together and reassemble the array.

> The key is breaking the aliasing and copying the data to a proper md? PV.
>=20
--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: CFBFF194
              http://people.redhat.com/dledford

Infiniband specific RPMs available at
              http://people.redhat.com/dledford/Infiniband


--=-3c4iAS2kN/ZpLU8H/cSR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkk+4aQACgkQTzP9PM7pjw8kLQCfTI+ca/f2nDoai9z2NcYpuZXp
7aQAnRPvGB1LuSIL0vYphYWfVf3INfPO
=XhO4
-----END PGP SIGNATURE-----

--=-3c4iAS2kN/ZpLU8H/cSR--
