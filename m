Date: Fri, 12 Oct 2001 22:17:59 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] Problems after restarting my debian
Message-ID: <20011012221759.B416@sky.net>
References: <20011011011444.A2302@sky.net> <20011011163029.B8752@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20011011163029.B8752@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

* Heinz J . Mauelshagen <mauelshagen@sistina.com> [011011 16:30]:
>=20
> Ulrich,
>=20
> please use LVM 1.0.1 rc4.
>=20
Hey,
ok. I did. I use 2.4.12 with xfs and LVM 1.0.1 rc4 now, but it=B4s still
not working.

I did:
home:/home/fzzgrr# pvscan=20
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdd1" of VG "vg01" [9.44 GB / 0 free]
pvscan -- inactive PV "/dev/hda2" of VG "vg01" [19.10 GB / 0 free]
pvscan -- inactive PV "/dev/hdb1" of VG "vg01" [7.87 GB / 0 free]
pvscan -- inactive PV "/dev/sdb1" of VG "vg01" [8.51 GB / 0 free]
pvscan -- inactive PV "/dev/sdc1" of VG "vg01" [4.23 GB / 0 free]
pvscan -- total: 5 [49.17 GB] / in use: 5 [49.17 GB] / in no VG: 0 [0]

I did a
home:/home/fzzgrr# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/hdd1

on every partition displayed with pvscan (all I used for vg01).

I got:
home:/home/fzzgrr# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/hdd1=
                                       =20
vgcfgrestore -- VGDA for "vg01" successfully restored to physical volume "/=
dev/hdd1"
vgcfgrestore -- you may not have an actual backup of restored volume group =
"vg01"


Then:
home:/home/fzzgrr# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

home:/home/fzzgrr# vgchange -a y
vgchange -- no volume groups found

So I tryed to make an actual backup using
home:/home/fzzgrr# vgcfgbackup -v vg01
vgcfgbackup -- using volume group(s) on command line
vgcfgbackup -- locking logical volume manager
vgcfgbackup -- checking volume group name "vg01"
vgcfgbackup -- checking existence of volume group "vg01"
vgcfgbackup -- ERROR: volume group "vg01" has an invalid number of physical=
 volumes
vgcfgbackup -- ERROR "vg_cfgbackup(): vg_check_exist" backing up volume gro=
up vg01


I don=B4t know how to continue, because I always used this number of
physical volumes for vg01. The backup "vg01.conf" was created after my
last mounting in August.

Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
