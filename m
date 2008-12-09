Received: from firewall.xsintricity.com (vpn-12-226.rdu.redhat.com
	[10.11.12.226])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB9JuS34009480
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 14:56:28 -0500
Subject: Re: [linux-lvm] shift PV from disk to raid device?
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <VA.000034f7.04a27ead@news.conactive.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com> <493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-1Ac21iWpmAIAd5QzOuvp"
Date: Tue, 09 Dec 2008 14:56:24 -0500
Message-Id: <1228852584.32405.37.camel@firewall.xsintricity.com>
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
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-1Ac21iWpmAIAd5QzOuvp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-12-09 at 20:42 +0100, Kai Schaetzl wrote:
> Stuart D. Gathman wrote on Tue, 9 Dec 2008 13:38:46 -0500 (EST):
>=20
> > 1) create md2 from sda3 and sdb3
> > 2) pvcreate md2
> > 3) add sda3 to VG - LVM complains about dup and uses sdb3 instead
>=20
> A bit different. But thanks for this hint. I checked my bash history now.=
=20
> Short summary:
>=20
> mdadm --create --verbose /dev/md3 --level=3D1 --raid-devices=3D2 /dev/sda=
3 missing
> mdadm --detail /dev/md3
> pvcreate /dev/md3
> pvcreate /dev/md3 -ff
> vgcreate dom1 /dev/md3 (to avoid name clash with dom0 on sdb3)
> .. some lvcreate and other stuff
> mdadm --detail /dev/md3
> reboot
> vgchange dom1 -an
>=20
> vgrename dom1 dom0
>=20
>=20
> vgchange dom0 -ay
> mdadm /dev/md3 -a /dev/sdb3
> reboot
>=20
> So, I did it all alright. I was wrong with my assumption about using the =
wrong=20
> device for the PV. However, I only notice now that /dev/md3 is gone for g=
ood,=20
> mdadm cannot find it. I had not been paying attention and thought that md=
2 was=20
> the array in question. (Thinking md0=3Dsda1/sdb1, md1=3Dsda2/sdb2, md2=3D=
sda3/sdb3, but=20
> I used md0=3Dsda1/sdb1, md2=3Dsda2/sdb2, md3=3Dsda3/sdb3). So I didn't no=
tice it.
>=20
> Going further back in the history, it seems I forgot to pvremove the earl=
ier=20
> existing PV /dev/sda3 (which had the same structure and data) before crea=
ting the=20
> PV on /dev/md3. That's why I had to -ff /dev/md3 I assume. It seems that =
after=20
> adding sdb3 to the array and rebooting the array dissolved completely and=
 the=20
> existing PVs on sda3 and sdb3 came back into existence. And I thought it =
was an=20
> effect of the mirror sync.
>=20
> So, I think I will just start over by removing /dev/sda3 now completely,
> recreating the raid array and then recreating the PV on it. I think I sho=
uld then=20
> be able to pvmove the LVs from /dev/sdb3 to /dev/md3, right? Problem solv=
ed. This=20
> time.
>=20
> However, as this is the second time that this or a similar array just van=
ishes I=20
> wonder if there's something else going on. e.g. some kind of unwanted int=
eraction=20
> between LVM and mdraid partitions. The other two raid arrays on the disk =
are=20
> absolutely stable and don't use LVM.

One thing that might be happening here (and I'm not sure since I'm not
an LVM expert) is that when the lvm stack finds the pv on /dev/sdb3
or /dev/sda3, it sees a full size partition (meaning it can access all
the way to the end of the device).  The md subsystem by default uses
version 0.90 superblocks, which are located in the last 64k of the
physical partition.  This means that when you create a pv on a raid
device, the raid device size information returned by the kernel is
somewhat shorter than the physical partition size in order to reserve
the space at the end for the superblock.  However, accessing the bare
device does not reserve that space and it's possible that filesystem
information is overwriting part of the raid superblock and causing it to
fail its checksum check, making the raid device disappear completely.

The solution to this problem is to create the raid device with a
superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).  This places
the raid superblock at the *beginning* of the partition instead of the
end, and offsets the data in the partition past the superblock.  By so
doing, if you attempt to read an lvm label (or a filesystem label) off
of the bare scsi device, the label won't be found because it will be in
the wrong place in the partition.  This ensures that you will never
accidentally access the device via the bare scsi drive, instead you will
only be able to access it by bringing the raid device up.

Note: superblock format 1.1 and 1.2 can not be used on bootable
partitions as grub doesn't know how to deal with the offset to the
filesystem, but otherwise can be used anywhere else.

It's also worth noting that adding an internal bitmap to the device,
while it slows down writes, will greatly reduce the time to resync the
device in case of an unexpected/unclean shutdown.

--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: CFBFF194
              http://people.redhat.com/dledford

Infiniband specific RPMs available at
              http://people.redhat.com/dledford/Infiniband


--=-1Ac21iWpmAIAd5QzOuvp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkk+zWgACgkQTzP9PM7pjw+2DACfV7pxU8vI3bmaAy0ovrrFc2TN
1+wAnAtMMe8i0HbLjUucfkU8AXWoY+8y
=myih
-----END PGP SIGNATURE-----

--=-1Ac21iWpmAIAd5QzOuvp--
