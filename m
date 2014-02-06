Date: Thu, 6 Feb 2014 15:48:33 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140206154833.1204c862@leda.localdomain>
In-Reply-To: <52F1198B.8000706@redhat.com>
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
	<52F1198B.8000706@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/3dug/vySwy4UwaMyZcp0vnH";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] lvm2 2.02.105 breaks snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: zkabelac@redhat.com

--Sig_/3dug/vySwy4UwaMyZcp0vnH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Zdenek Kabelac <zkabelac@redhat.com> on Tue, 2014/02/04 17:47:
> Dne 4.2.2014 09:55, Christian Hesse napsal(a):
> > Christian Hesse <list@eworm.de> on Thu, 2014/01/23 14:27:
> >> Hello everybody,
> >>
> >> looks like lvm2 2.02.105 breaks snapshots. This is my block device tre=
e:
> >>
> >> NAME                MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
> >> sda                   8:0    0   477G  0 disk
> >> |-sda1                8:1    0   767M  0 part
> >> | `-vg0-boot        254:0    0    64M  0 lvm   /boot
> >> |-sda2                8:2    0 444,2G  0 part
> >> | `-cvg             254:3    0 444,2G  0 crypt
> >> |   |-cvg-root      254:4    0    40G  0 lvm   /
> >> |   |-cvg-swap      254:5    0     4G  0 lvm   [SWAP]
> >> |   |-cvg-log       254:6    0     1G  0 lvm   /var/log
> >> |   `-cvg-home      254:8    0   320G  0 lvm   /home
> >> |-sda3                8:3    0    32G  0 part
> >> `-sda128            259:0    0     1M  0 part
> >>
> >> Creating a snapshot succeeds, but it is broken and can not be mounted:
> >>
> >> # lvcreate -s -pr -l50%free -n snap-home cvg/home
> >>    Logical volume "snap-home" created
> >> # mount /dev/cvg/snap-home /mnt/tmp
> >> mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-on=
ly
> >> mount: wrong fs type, bad option, bad superblock on
> >> /dev/mapper/cvg-snap--home, missing codepage or helper program, or oth=
er
> >> error
> >>
> >> Syslog has a lot of these messages:
> >>
> >> [ 4823.002220] EXT4-fs (dm-7): ext4_check_descriptors: Checksum for gr=
oup
> >> 256 failed (43470!=3D57954)
> >>
> >> Downgrading to lvm2 2.02.104 fixes the problem:
> >>
> >> # lvcreate -s -pr -l50%free -n snap-home
> >> cvg/home Logical volume "snap-home" created
> >> # mount /dev/cvg/snap-home /mnt/tmp
> >> mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-on=
ly
> >>
> >> This is an Arch Linux system with Linux 3.12.8.
> >
> > Hello everybody,
> >
> > did anybody notice my mail? This is a real regression for me and I would
> > like to get this sorted. I will help with whatever is needed to find the
> > problem.
> >
>=20
>=20
> Ok -  could you test this:
>=20
> Create an lv  -  ('lvcreate -Lsmallsize  vg'
> mount this lv somewhere
> modify this filesystem (via dd)

Do you want me to write to the block device here? I am not surprised if
anything break modifying a mounted filesystem.

> 'fsfreeze --freeze  mountpoint'
>=20
> now  - copy whole frozen device somewhere (via dd)
>=20
> 'fsfreeze --unfreeze mountpoint'
>=20
> umount mountpoint
>=20
> losetup -r  /dev/loop_free_number    frozen_copy_of_device
>=20
> and now - try to mount your  read-only loop device copy.
>=20
> Does it work for you ?
>=20
> I've been testing this - and it seem fsfreeze API in kernel is not workin=
g=20
> properly and you need to reply journal.
>=20
> Then try to repeat the same with 3.10 kernel and 3.4 kernel.
>=20
> So far I'm not convinced lvm2 version has anything to do with this problem
>=20
> For 3.10  ext4 seems to work, but xfs is broken.

As said this is perfectly stable with lvm2 2.02.104. It breaks reliable with
lvm2 2.02.105. So I am sure lvm userspace tools are at least involved.

Looks like even the parent volume gets corrupted. My GnuPG keyring got
corrupted after creating a snapshot (with lvm2 2.02.105).

Just wondering... Is this mailing list just about the kernel part of lvm or
does it cover userspace as well?

--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/3dug/vySwy4UwaMyZcp0vnH
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS86DFAAoJEIlFIdfMgPR2Qm0H/RHsTVfCT+bc2Tvzxt7oep7c
proIe9b0JJc5YFQdc8hs/mzqB/5XH+36BwRzAUlDvBGzJIRKUKTouweKUdW04pdR
HK5rCfdGEvOnyvpOdOroz5x9sEBCB16gbjGMmVyrJho0JvWTTEaR2aGThSIlOajp
ha90z7H4XtK0f0cIRFU30jCsDGLWKgqRT1HcckikJuHIqMN1Zy2FK8BmAaQiu/Jj
MgdFR/kUQ5H4Mdc2ybqo/+Ay2rQqZWdcmFDzSu4apdblM2S7UnVWx36Ah31vOgg2
RgOshAdGHqgIQZa+veLhhdQ5025IAcvuBap3ApkeYcFnK9b9QOym+1MSg3o0NQQ=
=ytxP
-----END PGP SIGNATURE-----

--Sig_/3dug/vySwy4UwaMyZcp0vnH--
