Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KBRll6019497
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 07:27:47 -0400
Received: from huixtocihuatl.xenguest.geekspirit.net
	(mictlantecuhtli.geekspirit.net [81.56.52.126])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KBRd3o032461
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 07:27:40 -0400
Subject: Re: [linux-lvm] Misleading documentation (was: HDD Failure)
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <20060920032222.GF28043@arvo.suso.org>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<20060918193728.GC28043@arvo.suso.org>
	<4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
	<20060920032222.GF28043@arvo.suso.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-UBxCYzzqHwh/iotalduu"
Date: Wed, 20 Sep 2006 13:27:23 +0200
Message-Id: <1158751643.12030.46.camel@bounty.rider.geekspirit.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, aj@terrascale.com


--=-UBxCYzzqHwh/iotalduu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2006-09-20 at 03:22 +0000, Mark Krenz wrote:
>   Personally I like it when documentation is kept simple and uses simple
> examples.  There is nothing worse than when you are trying to learn
> something and it tells you how to how to intantiate a variable, and then
> it immediately goes on to show you how to make some complicated reference
> to it using some code.
>=20
>   I agree with you though, its probably a good idea to steer newcomers
> in the right direction on disk management and a few notes about doing
> LVM ontop of RAID being a good idea couldn't hurt.  This is especially
> so since I've heard three mentions of people using LVM on a server
> without doing RAID this week alone. :-/
We should add something in faq page
( http://tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html ), like "i've lost one of
my hard drive and i can't mount my lv, did i lost everything ?" followed
by a quick explanation : lvm is NOT faulty tolerant like raid1/5, if you
lose a PV, you lose every LV which was (even partially) on on it.

Adding a recipe with raid can't kill us.

A. Setting up LVM over software RAID on four disks

For this recipe, the setup has four disks that will be put into two raid
arrays which will be used as PV.
The main goal of this configuration is to avoid any data loss if one of
the hard drives fails.

A.1 RAID

A.1.1 Preparing the disks

You must partition your disks and set partition type to Linux raid
autodetect (FD type), if your system can handle it. I recommand to make
only one partition per hard drive. You can use cfdisk to do it.

# cfdisk /dev/sda

If your drives are identicals, you can save time using sfdisk :

# sfdisk -d /dev/sda | sfdisk /dev/sdb
# sfdisk -d /dev/sda | sfdisk /dev/sdc
# sfdisk -d /dev/sda | sfdisk /dev/sdd

This will partition sdb, sdc and sdd using sda partition table scheme.

A.1.2 Creating arrays

You can check if your system can handle raid1 by typing the following :

# cat /proc/mdstat
Personalities : [raid1]

If not (file not found, no raid1 in list), then load raid1 module :

# modprobe raid1

You can now create raid arrays, assuming you have only one raid partiton
per drive :

# mdadm --create /dev/md0 --level=3D1 --raid-devices=3D2 /dev/sda1 /dev/sdb=
1
# mdadm --create /dev/md1 --level=3D1 --raid-devices=3D2 /dev/sdc1 /dev/sdd=
1

You should wait for the raid arrays to be fully synchronized, check it
with :

# cat /proc/mdstat

A.2 LVM

A.2.1 Create Physical Volumes

Run pvcreate on each raid array :

# pvcreate /dev/md0
# pvcreate /dev/md1

This creates a volume group descriptor area (VGDA) at the start of the
raid arrays.

A.2.2 Setup a Volume Group

# vgcreate my_volume_group /dev/md0 /dev/md1

You should now see something like that :

# vgdisplay
  --- Volume group ---
  VG Name               my_volume_group
  System ID            =20
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  37
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.18 TB
  PE Size               4.00 MB
  Total PE              310014
  Alloc PE / Size       0 / 0 TB
  Free  PE / Size       310014 / 1.18 TB
  VG UUID               LI3k9v-MnIA-lfY6-kdAB-nmpW-adjX-A5yKiF

You should check if 'VG Size' matchs your hard drive size (raid1 divide
available space by two, so if you have four 300Go hard drives, you will
have a ~600Go VG).

A.2.3 Create Logical Volumes

You can now create some LV on your VG :

# lvcreate -L10G -nmy_logical_volume my_volume_group
  Logical volume "my_logical_volume" created
# lvcreate -L42G -nmy_cool_lv my_volume_group
  Logical volume "my_cool_lv" created

A.2.4 Create the File System

Create an XFS file system on each logical volume :

# mkfs.xfs /dev/my_volume_group/my_logical_volume
meta-data=3D/dev/my_volume_group/my_logical_volume isize=3D256
agcount=3D16, agsize=3D163840 blks
         =3D                       sectsz=3D512 =20
data     =3D                       bsize=3D4096   blocks=3D2621440, imaxpct=
=3D25
         =3D                       sunit=3D0      swidth=3D0 blks, unwritte=
n=3D1
naming   =3Dversion 2              bsize=3D4096 =20
log      =3Dinternal log           bsize=3D4096   blocks=3D2560, version=3D=
1
         =3D                       sectsz=3D512   sunit=3D0 blks
realtime =3Dnone                   extsz=3D65536  blocks=3D0, rtextents=3D0

# mkfs.xfs /dev/my_volume_group/my_cool_lv
meta-data=3D/dev/my_volume_group/my_cool_lv isize=3D256    agcount=3D16,
agsize=3D688128 blks
         =3D                       sectsz=3D512 =20
data     =3D                       bsize=3D4096   blocks=3D11010048,
imaxpct=3D25
         =3D                       sunit=3D0      swidth=3D0 blks, unwritte=
n=3D1
naming   =3Dversion 2              bsize=3D4096 =20
log      =3Dinternal log           bsize=3D4096   blocks=3D5376, version=3D=
1
         =3D                       sectsz=3D512   sunit=3D0 blks
realtime =3Dnone                   extsz=3D65536  blocks=3D0, rtextents=3D0

A.2.5 Test File System

Mount logical volumes and check if everything is fine :

# mkdir -p /mnt/{my_logical_volume,my_cool_lv}
# mount /dev/my_volume_group/my_logical_volume /mnt/my_logical_volume
# mount /dev/my_volume_group/my_cool_lv /mnt/my_cool_lv
# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1             1.9G   78M  1.8G   5% /
/dev/mapper/my_volume_group-my_logical_volume
                       10G     0   10G   0% /mnt/my_logical_volume
/dev/mapper/my_volume_group-my_cool_lv
                       42G     0   42G   0% /mnt/my_cool_lv

>=20
>   I suppose it could also be said that people who are causually doing
> LVM on their systems using something like a GUI are most likely not
> going to be referencing the man pages or LVM documentation until after
> their system is setup, at which point it is probably too late to put the
> physical volumes on a RAID array.  So I think its more the
> responsibility of the GUI/ncurses installer to alert you to be using
> RAID.
>=20
> Mark
>=20
>=20
> On Tue, Sep 19, 2006 at 10:40:43PM GMT, Scott Lamb [slamb@slamb.org] said=
 the following:
> > On Sep 18, 2006, at 12:37 PM, Mark Krenz wrote:
> > >  LVM !=3D RAID
> > >
> > >  You should have been doing RAID if you wanted to be able to =20
> > >handle the
> > >failure of one drive.
> >=20
> > This is my biggest beef with LVM - why doesn't *any* of the =20
> > documentation point this out? There are very few good reasons to use =20
> > LVM without RAID, and "ignorance" certainly isn't among them. I don't =20
> > see any mention of RAID or disk failures in the manual pages or in =20
> > the HOWTO.
> >=20
> > For example, the recipes chapter [1] of the HOWTO shows a non-trivial =20
> > setup with four volume groups split across seven physical drives. =20
> > There's no mention of RAID. This is a ridiculously bad idea - if =20
> > *any* of those seven drives are lost, at least one volume group will =20
> > fail. In some cases, more than one. This document should be showing =20
> > best practices, and it's instead showing how to throw away your data.
> >=20
> > The "lvcreate" manual page is pretty bad, too. It mentions the =20
> > ability to tune stripe size, which on casual read, might suggest that =20
> > it uses real RAID. Instead, I think this is just RAID-0.
> >=20
> > [1] - http://tldp.org/HOWTO/LVM-HOWTO/recipeadddisk.html
> >=20
--=20
Fabien Jakimowicz <fabien@jakimowicz.com>

--=-UBxCYzzqHwh/iotalduu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFESWbzTD+AjVP2VIRAnLAAKCZmHsN1V5c63Ny4HuAUUTODOaQLwCfXsiD
ixYMG7rYMZXEsBitl6JmZVA=
=o+P4
-----END PGP SIGNATURE-----

--=-UBxCYzzqHwh/iotalduu--
