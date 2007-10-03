Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l939BKuO030827
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 05:11:20 -0400
Message-ID: <47035C3D.2010901@redhat.com>
Date: Wed, 03 Oct 2007 10:09:17 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backuping "special" snapshots
References: <4703572F.8020604@es.clara.net>
In-Reply-To: <4703572F.8020604@es.clara.net>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marc Patino G=EF=BF=BDmez wrote:
> Hi  list,
>=20
> I am searching a way to backup a "special" logical volume. This special
> lv doesn't contains a filesystem, it contains a hole image disk of a
> running server (MBR,Partition Table, Partitions and filesystems), in
> fact it is a VBD (Virtual Block Device) of a HVM Xen Guest.
>=20
> I want to be able to make the backup without shutting down the Virtual
> Machine, but the traditional way :
>=20
> - make a snapshot
> - mount snapshot
> - backup the snapshots
> - umount snapshot
> - remove snapshot
>=20
> is not suitable for this kind of logical volumes.
>=20
> I search some information about it, but the only clue is:
>=20
> fdisk -l -u /dev/vg00/lv00

Hi Marc,

You can use the kpartx tool for this. It was originally written as part
of multipath-tools and it allows you to map the partitions on a
device-mapper device like an LVM2 logical volume.

E.g. you would run:

# kpartx -a /dev/vg00/lv00

And that will scan lv00 for partitions and create new devices in
/dev/mapper named lv00p1, lv00p2, ... that you can then use to access
the content of the partitions.

When you're done, run:

# kpartx -d /dev/vg00/lv00

To remove the temporary kpartx maps.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHA1w96YSQoMYUY94RAhW3AKC9n8+5tzN/FW38+qIUj0a82vvAMQCg0qYb
bAWnKGAuyZnMoZZz089I2qg=3D
=3D+xgZ
-----END PGP SIGNATURE-----
