Received: from [172.16.45.118] (dhcp-118.brisbane.redhat.com [172.16.45.118])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	m115MQ6I008469
	for <linux-lvm@redhat.com>; Fri, 1 Feb 2008 15:22:26 +1000
Message-ID: <47A2ACAD.4020406@gmail.com>
Date: Fri, 01 Feb 2008 15:22:53 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] question about install on a new disk
References: <47A19CB9.6030503@math-info.univ-paris5.fr>
In-Reply-To: <47A19CB9.6030503@math-info.univ-paris5.fr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Fran=EF=BF=BDois Patte wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Bonjour,
>=20
> I have presently an install of fedora 6 on a disk sdb with partitions:
>=20
> sdb1 / (ext3)
> sdb2 LVM with lv: /usr, /var, /opt, /tmp, /home
>=20
> I would like to perform a new install on sda with partitions:
>=20
> sda1 / (ext3)
> sda2 LVM with same lv except /home
>=20
>=20
> How can I mount the "old" logical volumes located on sdb when the new
> system will be running on sda?

You just need to make sure that you use a different Volume Group name=20
for the new installation. If both installations have the same Volume=20
Group name you'll run into difficulties. Its easiest to avoid duplicate=20
names at install time.

> As devices /dev/mapper/VolGroup00-LogVol00 etc. are created at boot time
> in the /dev of the running system I will be unable to access the logical
> volumes located on sdb....

You will be able to access them if you use a different volume group=20
name. For example, if you use the volume group name "vg0" on the new=20
installation, and "VolGroup00" on the old installation:

old# mount | grep mapper
/dev/mapper/VolGroup00-root on / type ext3 (rw)
/dev/mapper/VolGroup00-usr on /usr type ext3 (rw)
/dev/mapper/VolGroup00-var on /var type ext3 (rw)
/dev/mapper/VolGroup00-opt on /opt type ext3 (rw)
/dev/mapper/VolGroup00-tmp on /tmp type ext3 (rw)
/dev/mapper/VolGroup00-home on /home type ext3 (rw)


new# mount | grep mapper
/dev/mapper/vg0-root on / type ext3 (rw)
/dev/mapper/vg0-usr on /usr type ext3 (rw)
/dev/mapper/vg0-var on /var type ext3 (rw)
/dev/mapper/vg0-opt on /opt type ext3 (rw)
/dev/mapper/vg0-tmp on /tmp type ext3 (rw)

Now assuming you want to mount the /home filesystem from the old=20
installation:

new# mount /dev/VolGroup00/home /home
new# mount | grep home
/dev/mapper/VolGroup00-home on /home type ext3 (rw)

You could even use the one volume group for all the logical volumes, but=20
that's a bit trickier still.

--Dave
