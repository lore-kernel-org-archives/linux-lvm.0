References: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6747eb8e-b15c-dfdd-610b-bc5143368a63@redhat.com>
Date: Mon, 13 May 2019 10:37:39 +0200
MIME-Version: 1.0
In-Reply-To: <3f6f98d1b5184853cf48b1f84337af83.squirrel@service.net-works.at>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] recover volume group & locical volumes from PV?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Rainer_F=c3=bcgenstein?= <rfu@oudeis.org>

Dne 12. 05. 19 v 0:52 "Rainer F=EF=BF=BDgenstein" napsal(a):
> hi,
>=20
> I am (was) using Fedora 28 installed in several LVs on /dev/sda5 (=3D PV),
> where sda is a "big" SSD.
>=20
> by accident, I attached (via SATA hot swap bay) an old harddisk
> (/dev/sdc1), which was used about 2 months temporarily to move the volume
> group / logical volumes from the "old" SSD to the "new" SSD (pvadd,
> pvmove, ...)
>=20

Hi

I don't understand how this could have happened by accident.
lvm2 provides strong detection of duplicated devices.
It also detects older metadata.

So you would have to put in 'exact' but just old 'copy' of your device
and at the same time drop out the original one -  is that what you've made =
??

> this combination of old PV and new PV messed up the filesystems. when I
> noticed the mistake, I did a shutdown and physically removed /dev/sdc.
> this also removed VG and LVs on /dev/sda5, causing the system crash on
> boot.
>=20
>=20
> [root@localhost-live ~]# pvs
>    PV         VG              Fmt  Attr PSize    PFree
>    /dev/sda5                  lvm2 ---   <47.30g <47.30g
>    /dev/sdc1  fedora_sh64     lvm2 a--  <298.09g 273.30g
>=20
> is there any chance to get VG and LVs back?


VG & LV are just 'terms' - there is no 'physical-content' behind them - so =
if=20
you've already used your filesystem and modified it's bits on a device - th=
e=20
physical content of your storage is simply overwritten and there is no way =
to=20
recover it's content by just fixing lvm2 metadata.

lvm2 provides command:  'vgcfgrestore' - which can restore your older metad=
ata=20
content (description which devices are used and where the individual LVs us=
e=20
their extents - basically mapping of blocks) - typically in your=20
/etc/lvm/archive directory - and in the worst case - you can obtain older=20
metadata by scanning 1st. MiB of your physical drive - data are there in as=
cii=20
format in ring buffer so for your small set of LVs you likely should have=20
there full history.

When you put back your original 'drive set' - and you restore your lvm2=20
metadata to the point before you started to play with bad drive - then your=
=20
only hope is properly working 'fsck' - but there is nothing how lvm2 can he=
lp=20
with this.

Regards

Zdenek
