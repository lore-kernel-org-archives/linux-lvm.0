Message-ID: <1058752778.3f1b490ab9e47@webmail.phys.unsw.edu.au>
From: Melinda Taylor <melinda@phys.unsw.edu.au>
Subject: Re: [linux-lvm] LVM recovery
References: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com> <1058402110.1257.21.camel@neko> <3F164A80.6060301@free.fr>
In-Reply-To: <3F164A80.6060301@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Jul 20 21:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Emmanuel Varagnat <emmanuel.varagnat@free.fr>

Ok I have installed LVM2 with readline support and I tried:

lvm> vgchange --partial -a y
  Partial mode. Incomplete volume groups will be activated read-only.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  2 PV(s) found for VG vg01: expected 4
  Logical volume (lv02) contains an incomplete mapping table.
  4 logical volume(s) in volume group "vg01" now active
  2 logical volume(s) in volume group "vg02" now active

I then tried to mount my VG with the missing PV's (VG01) with the line=20

[root@astro root]# mount -o ro /dev/vg01/lv03 /home2
mount: wrong fs type, bad option, bad superblock on /dev/vg01/lv03,
       or too many mounted file systems


and I see the following in /var/log/messages:

Jul 21 11:53:48 astro kernel: EXT3-fs: INFO: recovery required on readonl=
y
filesystem.
Jul 21 11:53:48 astro kernel: EXT3-fs: write access unavailable, cannot p=
roceed.
Jul 21 11:53:48 astro kernel: EXT2-fs: device-mapper(254,4): couldn't mou=
nt
because of unsupported optional features (4).

Anyone have any ideas on this one? I am getting closer I guess. I just wa=
nt to
grab the data off the remaining 2 LV if possible.

Many Thanks,

melinda







Quoting Emmanuel Varagnat <emmanuel.varagnat@free.fr>:

> Melinda Taylor wrote:
>=20
> > - vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your vol=
ume
> > group
> > - pvcreate /dev/sda2 ; pvcreate /dev/sdb1; pvcreate /dev/sdc2; pvcrea=
te
> > /dev/sdd2
> > - vgcreate vg01 /dev/sda2 /dev/sdb1 /dev/sdc2 /dev/sdd2
> > - check no of LE pvdata -E /dev/sdc2 (5710 LE)
> >  lvcreate -l 5711 -n lv03 vg01 /dev/sdc2
> > - Make ext3 fs on each LV
> >  mkfs.ext3 /dev/vg01/lv01
> >=20
> > /dev/sda2 and /dev/sdb1 are kaput (both drives died within days of
> > eachother).
> >=20
> > I believe I had 4 logical volumes.
>=20
> I would say that it can depend on what is the block allocation policy o=
f=20
> the LVM system...
>=20
> > So I presume this means each LV resided on a separate drive and proba=
bly
> > lv01 and lv02 were the 2 on the 2 dead disk drives.
> >=20
> >     * PVs on four SCSI devices
> >     * A VG called "vg01" comprised of said PVs
> >=20
> > If I reinstall lvm on my newly installed system can I recover lv03 an=
d
> > lv04?
>=20
> You should try LVM2 that can deal with partial/truncated volumes.
>=20
> -=3D( manu )=3D-
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
