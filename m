Return-Path: <lewis@sistina.com>
Date: Fri, 27 Apr 2001 17:00:05 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
Message-ID: <20010427170005.D1632@sistina.com>
References: <DC5B1A21E9E7D211B0020090273AD628242BBB@summit15.corvallis.summit>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline
In-Reply-To: <DC5B1A21E9E7D211B0020090273AD628242BBB@summit15.corvallis.summit>; from Evan.Day@SUMMITSITE.COM on Fri, Apr 27, 2001 at 02:39:12PM -0700
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
To: linux-lvm@sistina.com

--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2001 at 02:39:12PM -0700, Day, Evan wrote:
> I hosed things up good at lunch and started a reinstall before I went back
> to work.  I'll finish it up as soon as I get home and see what I can come=
 up
> with.  The only thing I see different in your linuxrc is the raidstart -a.
> I'm not doing that, and didn't think it would be necessary (my RAIDS are
> type fd in the partmap and have persistent-superblock 1 in /etc/raidtab).
>=20
> Except for using GRUB instead of LILO (and kernel modules for raid/lvm), =
my
> setup looks almost identical to yours.  I'm not using devfs, but that
> shouldn't matter.

I have seen problems with GRUB that are fixed by using LILO.  I'm not sure
what the issues are.  GRUB seems to be a lot more touchy though.  Have you
tried using LILO?

> What I really don't get is that I can put a mount /dev/vg00/lvol1 in
> /linuxrc and it mounts!  I can also boot with a root of /dev/sda2 (old ro=
ot
> partition), with /etc/fstab pointing / at /dev/vg00/lvol1 (from sda2) and=
 it
> mounts okay.
>=20
> I'll have to see if I can run a serial cable from the linux machine to
> another PC to capture logs.
>=20
> Thanks for the help
> -Evan
>=20
> -----Original Message-----
> From: Luca Berra [mailto:bluca@comedia.it]
> Sent: Friday, April 27, 2001 2:12 PM
> To: 'linux-lvm@sistina.com'
> Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and
> I must scream"
>=20
>=20
> On Fri, Apr 27, 2001 at 01:48:23PM -0700, Day, Evan wrote:
> > I've tried both setting root=3D/dev/vg00/lvol1 and root=3D0x3a00 - neit=
her
> > worked.  I'm probably just going to put / as the first device (including
> > /boot) on RAID-1 and make the rest of the system LVM.  I've spent too m=
any
> > days trying to make root on LVM work and I need my system back...
> >=20
> can you send me some more details on what happens,
> a log would be great if you can log on a serial device
>=20
> it *should* work
>=20
> here is what i have (i dun use lvmcreate_initrd)
>=20
> [vc/2]bluca@Moskowskaya:~% df
> /dev/vg01/lvol1         253920     60104    180712  25% /
> /dev/md/0                29621     10798     17294  38% /boot
> /dev/vg01/lvol3        2064208   1675988    283364  86% /usr
> /dev/vg01/lvol4         507848    255632    226004  53% /var
> /dev/vg01/lvol5         253920      9428    231388   4% /tmp
> /dev/vg01/lvol6        2064208   1673716    285636  85% /opt
> /dev/vg01/lvol7        4128448   3137540    781196  80% /home
>=20
> [vc/3]root@Moskowskaya:~# cat /etc/lilo.conf
> boot =3D /dev/md/0
> timeout =3D 50
> prompt
> root =3D 0x3a00 #/dev/vg01/lvol1
> read-only
> map =3D /boot/map
> install=3D/boot/boot.b
> default =3D linux
> optional
> append =3D "panic=3D60 devfs=3Dsymlinks video=3Dtdfx:800x600-32@72
> root=3D/dev/vg01/lvol1"
> vga=3Dnormal
> restricted
>=20
> image =3D /boot/vmlinuz-2.4.3-ac3
> label =3D 243ac3
> initrd =3D /boot/initrd-2.4.3-ac3
> alias =3D linux
>=20
> [vc/3]root@Moskowskaya:~# cat /boot/initrd-source/linuxrc
> #!/bin/sh -x
> mount -t proc /proc /proc
> echo "" > /proc/sys/kernel/modprobe
> insmod -k /lib/modules/*/kernel/drivers/scsi/aic7xxx/aic7xxx.o
> aic7xxx=3Dverbose
> insmod -k /lib/modules/*/kernel/drivers/md/raid1.o
> insmod -k /lib/modules/*/kernel/drivers/md/xor.o
> insmod -k /lib/modules/*/kernel/drivers/md/raid5.o
> raidstart -a
> vgchange -a y
> sulogin -t 10
> umount /proc
>=20
> [vc/3]root@Moskowskaya:~# find /boot/initrd-source -type f
> /boot/initrd-source/bin/BusyBox
> /boot/initrd-source/bin/insmod
> /boot/initrd-source/bin/raidstart
> /boot/initrd-source/bin/sulogin
> /boot/initrd-source/bin/vgchange
> /boot/initrd-source/bin/vgscan
> /boot/initrd-source/etc/lvmtab.d/vg01
> /boot/initrd-source/etc/passwd
> /boot/initrd-source/etc/raidtab
> /boot/initrd-source/lib/ld-linux.so.2
> /boot/initrd-source/lib/libc.so.6
> /boot/initrd-source/lib/libcrypt.so.1
> /boot/initrd-source/lib/liblvm-11.so.0
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/block/floppy.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/raid1.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/raid5.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/xor.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/scsi/aic7xxx/aic=
7xx
> x.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/scsi/sym53c8xx.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/fs/reiserfs/reiserfs.o
> /boot/initrd-source/linuxrc
>=20
> L.
>=20
> --=20
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
To know recursion, you must first know recursion.
-----End Obligatory Humorous Quote------------------------------------------

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE66evlpE6/iGtdjLERAlzyAJ9gNNGgtvtyv+41peiibndLNwf1lgCdGpFK
kP+3iwCqlaj+zNbhvOJ/3/Q=
=wz8s
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
