Message-ID: <5E34D857F6BB704CA3369B7553233A81652029@ntsviemxs0152.connect.at-work.ent>
From: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] RE: Kernel panic during booting using root with LVM on top of RAI
 D solved
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
Date: Wed Nov 28 11:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

The problem has been solved. The SCSI Low level adapter driver was not
compiled into the kernel.

Thank you.

Regards,
Ferenc

>  -----Original Message-----
> From: 	Csuk, Ferenc =20
> Sent:	Montag, 26. November 2001 21:20
> To:	'linux-lvm@sistina.com'
> Subject:	Kernel panic during booting using root with LVM on top of
> RAID
>=20
> Hi LVM experts,
>=20
> I need your help again, becuase I got an error message during booting =
and
> I couldn=B4t find out the reason. I went through several times on the
> archives but there is not exactly the answer I need. To make your =
help
> easier and included lilo.conf, fstab, raidtab file, and df -k result, =
too.
>=20
> First of all the error message at boot time is:=20
>=20
> VFS: Cannot open root device "3a00" or 3a:00
> Please append a correct "root=3D" boot option
> Kernel  Panic: Unable to mount root fs on 3a:00
> My intention is to mirror every device using Linux software RAID, =
plus use
> LVM on top of them. This is the point where we couldn=B4t find exact
> documentation in either the Software RAID HowTO, or the LVM How-To.=20
> We have the following configuration, including a brief summary about =
the
> steps which we preformed.
> I've got a system with four SCSI disks and I use Adaptec SCSI =
adapter. I
> use LILO as the bootloader. We installed Suse 7.1 with Kernel 2.4.0 =
(LVM
> and RAID support in the kernel not as module) using the lvm 1.0.1-rc4
> patches and lvm tools on /dev/sdd. Right now, we partitioned =
/dev/sda1 and
> /dev/sdb1 with 50MB each, and we built out of them /dev/md0 with =
software
> RAID-1. This we would like to use as /boot. The rest of the system on
> /dev/sda and /dev/sdb we partitioned in one huge partition each and =
we
> built out of them /dev/md1 with Software RAID-1 and we created vg00 =
with
> lvm on top of it. Then we put a new root logical volume on
> /dev/vg00/lvol1. We mounted on /mnt and copied / over to it just =
fine,
> then edited /mnt/etc/fstab to put root on /dev/vg00/lvol1. (The rest =
of
> the file systems we left temporary still on /dev/sdd like /usr, /var,
> etc.) We created the new filesystems for /boot, / with mke2fs.
> We used lvmcreate_initrd to make /boot/initrd-lvm-2.4.3.gz, and can =
boot
> lilo with initrd. At boot time, it boots the kernel, loads the ram =
disk,
> runs /linuxrc and when it tries to mount the root file system we get =
the
> error message, see above.=20
>=20
> We think this is just a configuration issue, please check the files =
below
> and give us some advice how to get the system up and running.
> We would like to check the possibility if there is a way to =
elliminate
> this small 50M partition for /boot and integrate that also into the =
big
> one under LVM.
>=20
> Thank you in advance.
>=20
> Best Regards,
> Ferenc Csuk=20
>=20
>=20
> -----------------------  config files  --------------------------
>=20
> Content of /etc/lilo.conf:
>=20
> boot    =3D /dev/sda
> vga     =3D normal
> read-only
> menu-scheme =3D Wg:kw:Wg:Wg
> lba32
> prompt
> timeout =3D 80
> message =3D /boot/message
>=20
>   image  =3D /boot/vmlinuz
>   label  =3D linux
>   root   =3D /dev/sdd1
>   initrd =3D /boot/initrd
>=20
>   image  =3D /boot/vmlinuz
>   label  =3D linux_lvm
>   root   =3D /dev/vg00/lvol1
>   initrd =3D /boot/initrd-lvm-2.4.0.gz
>   append =3D "ramdisk_size=3D8192"
>   optional
>=20
>   image  =3D /boot/vmlinuz_24
>   label  =3D linux_2.4
>   root   =3D /dev/sdd1
>   initrd =3D /boot/initrd_24
>   optional
>=20
>   image  =3D /boot/vmlinuz.suse
>   label  =3D suse
>   root   =3D /dev/sdd1
>   initrd =3D /boot/initrd.suse
>   optional
>=20
>   image  =3D /boot/memtest.bin
>   label  =3D memtest86
>=20
>=20
> Content of /etc/raidtab:
>=20
> raiddev /dev/md0                         =20
>         raid-level              1        =20
>         nr-raid-disks           2        =20
>         nr-spare-disks          0        =20
>         chunk-size              4        =20
>         persistent-superblock   1        =20
>         device                  /dev/sda1=20
>         raid-disk               0        =20
>         device                  /dev/sdb1=20
>         raid-disk               1        =20
>                                          =20
> raiddev /dev/md1                         =20
>         raid-level              1        =20
>         nr-raid-disks           2        =20
>         nr-spare-disks          0        =20
>         chunk-size              4        =20
>         persistent-superblock   1        =20
>         device                  /dev/sda2=20
>         raid-disk               0        =20
>         device                  /dev/sdb2=20
>         raid-disk               1        =20
>=20
> Content of /mnt/etc/fstab:
>=20
> #/dev/sdd1      /       ext2    defaults 1 1 =20
> #/dev/sdd2      /boot   ext2    defaults 1 2 =20
> /dev/cdrom      /cdrom  auto    ro,noauto,user,exec 0 0             =20
> devpts  /dev/pts        devpts  defaults 0 0                        =20
> /dev/fd0        /floppy auto    noauto,user 0 0                     =20
> /dev/sdd8       /home   ext2    defaults 1 2                        =20
> /dev/sdd7       /opt    ext2    defaults 1 2                        =20
> proc    /proc   proc    defaults 0 0                                =20
> /dev/sdd9       /tmp    ext2    defaults 1 2                        =20
> /dev/sdd5       /usr    ext2    defaults 1 2                        =20
> /dev/sdd6       /var    ext2    defaults 1 2                        =20
> /dev/sdd3       swap    swap    defaults 0 2                        =20
> #                                                                   =20
> /dev/vg00/lvol1         /       ext2            defaults 1 1        =20
> /dev/md0                /boot   ext2            defaults 1 2        =20
>=20
>=20
>=20
