Date: Fri, 7 Feb 2014 14:14:20 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140207141420.54239977@leda.localdomain>
In-Reply-To: <52F1198B.8000706@redhat.com>
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
	<52F1198B.8000706@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/P_/2HPRWJ4+Q4XuIMPF=8C6";
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

--Sig_/P_/2HPRWJ4+Q4XuIMPF=8C6
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
>=20
> Ok -  could you test this:
>=20
> Create an lv  -  ('lvcreate -Lsmallsize  vg'
> mount this lv somewhere
> modify this filesystem (via dd)
>=20
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

Ok, here we go:

root@leda ~ # lvcreate -n test -L 2G cvg
  Logical volume "test" created
root@leda ~ # mkfs.ext4 -L test /dev/cvg/test
mke2fs 1.42.9 (28-Dec-2013)
Discarding device blocks: done
Filesystem label=3Dtest
OS type: Linux
Block size=3D4096 (log=3D2)
Fragment size=3D4096 (log=3D2)
Stride=3D0 blocks, Stripe width=3D0 blocks
131072 inodes, 524288 blocks
26214 blocks (5.00%) reserved for the super user
First data block=3D0
Maximum filesystem blocks=3D536870912
16 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done

root # mount /dev/cvg/test /mnt/ext
root # dd if=3D/dev/urandom bs=3D1M count=3D1500 of=3D/mnt/ext/testfile
1500+0 records in
1500+0 records out
1572864000 bytes (1,6 GB) copied, 116,697 s, 13,5 MB/s
root # fsfreeze --freeze /mnt/ext
root # dd if=3D/dev/cvg/test of=3D/tmp/test.img
4194304+0 records in
4194304+0 records out
2147483648 bytes (2,1 GB) copied, 6,15333 s, 349 MB/s
root # fsfreeze --unfreeze /mnt/ext
root # umount /mnt/ext
root # lvremove cvg/test
Do you really want to remove active logical volume test? [y/n]: y
  Logical volume "test" successfully removed
root # file -s /tmp/test.img
/tmp/test.img: Linux rev 1.0 ext4 filesystem data,
UUID=3D18e5dba2-6d04-4d8f-b448-31bbcfbc1462, volume name "test" (extents)
(large files) (huge files)
root # losetup -f /tmp/test.img
root # mount /dev/loop0 /mnt/ext
root # losetup -f /tmp/test.img
root # mount /dev/loop0 /mnt/ext
root # umount /mnt/ext
root # losetup -d /dev/loop0

Mounting the dumped filesystem image just gives:

kernel: EXT4-fs (loop0): mounted filesystem with ordered data mode. Opts:
(null)

Please note that file does report a clean filesystem, there is no "(needs
journal recovery)" flag set.

And just another hint... If the LVM problem occurs I can not mount the
snapshot at all. Freezer problems should not be that bad, no? (e.g. a journ=
al
replay could be required, but it should not end up with a completely broken
filesystem.)

BTW, I found a second report with exactly this problem:
https://bugs.archlinux.org/task/38710
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/P_/2HPRWJ4+Q4XuIMPF=8C6
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS9Nw0AAoJEIlFIdfMgPR2wGoH/iWFNBPZ4N2b/hCaj5Yeb6tU
Dax6TPWu3WUAfsRI0i3M1JRZlA1VYDdZ54hNK3Gr4OrLEsyy3iJuwCDfYoRHd5f6
UYALTol3VTUEEiEDZ3gVLDg3xE76zilXR3VpIbCBMPwZPeiSzx0h4LZOTTFOtkEe
ZdB0WmdO8DJdlu9XCsQxnJxIjDv9PBSo0zFvYX0IZdW37638NcTTfQZZBterh2YF
6xDBPD49ka+tomCOsVM1doFRo/NrDbcCNUVAOLzptqUtEUmXY7DGNvJ0HGPH3oBu
ONuQiBkRZT1Hz9M6pk7CfjPFo/5Bt5yUuCzRx4MTiUcBeowYmIyuvNl9u4VpR7Y=
=V62Y
-----END PGP SIGNATURE-----

--Sig_/P_/2HPRWJ4+Q4XuIMPF=8C6--
