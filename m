Message-ID: <3BB306C3.29ECD29F@adelaide.edu.au>
Date: Thu, 27 Sep 2001 20:30:19 +0930
From: Sean Burford <sean.burford@adelaide.edu.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate core dump on large disks, vg name corrupted.
References: <3BB2FBF9.D68BC6D@adelaide.edu.au> <3BB300E1.90809@st-peter.stw.uni-erlangen.de>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I have recompiled with a clean 2.4.9 kernel, using the following
patches:
tar xIf /usr/local/src/linux-2.4.9.tar.bz2
cat /usr/local/src/bonding-2.4.9-20010920 | patch -p1  (used for
etherchannel bonding, nothing to do with filesystems)
patch -p1 <
/usr/local/src/LVM/1.0.1-rc2/PATCHES/lvm-1.0.1-rc2-2.4.9.patch
patch -p1 <
/usr/local/src/LVM/1.0.1-rc2/PATCHES/linux-2.4.9-VFS-lock.patch
I'm also using the HP lpfcdd fiberchannel module to access the SAN
storage.

dmesg now reports:
  LVM version 1.0.1-rc2(30/08/2001) module loaded

I still get segfaults from lvcreate.

And have recreated the partitions as 2*20G, and still get segfaults with
the same symptoms (lv_create() passed junk in lv_name), so disk size
does not appear to be the key.

I might try it against a couple of loopback filesystems without lpfcdd
and bonding loaded, to see if it is a problem interacting with the
lpfcdd module.  I'll try creating filesystems on the SAN LUN's/disks
first.

svetljo wrote:
>=20
> you can not use lvm-1.0.1rc2 tools with 0.9.1beta2 code in the kernel
>=20
> try to patch the kernel with the lvm code from cvs
>=20
> or befor configuring the lvm code change the kernel version in the top
> Makefile
> /usr/src/linux/Makefile  to 2.4.8-ac14 and after applying the patch bac=
k
> to 2.4.9-ac14
> this should be working with lvm-1.0.1rc2
>=20
> or use lvm-1.0, the patch applies clean to -ac kernel
>=20
> Sean Burford wrote:
>=20
> >Hi,
> >
> >I am attempting to use the LVM tools under Linux 2.4.9-ac14 to set up
> >access to a SAN.  lvcreate is seg faulting because main() is passing a
> >corrupted vg name to lv_create().  I suspect this is due to the large
> >partitions that are being dealt with (4*100G).
> >
> >Using:
> >  LVM 1.0.1-rc2 userland tools
> >  The LVM kernel modules that came with the kernel.  I could not apply
> >the 1.0.x patches as they do not compile with the Alan Cox patches.  I
> >will see if the straight 2.4.9 kernel works with the AMI MegaRAID card
> >in the box soon, because if it does I will be able to patch the kernel
> >for LVM 1.0.1-rc2.
> >
> >Some related output from dmesg is:
> >SCSI device sdh: 209715200 512-byte hdwr sectors (107374 MB)
> > sdh: sdh1
> >SCSI device sdi: 209715200 512-byte hdwr sectors (107374 MB)
> > sdi: sdi1
> >SCSI device sdj: 209715200 512-byte hdwr sectors (107374 MB)
> > sdj: sdj1
> >SCSI device sdk: 209715200 512-byte hdwr sectors (107374 MB)
> > sdk: sdk1
> >LVM version LVM 0.9.1_beta7(ish)(20 June 2001) module loaded
> >
> >Following the LVM-Howto, I have configured the LVM as follows:
> >vgscan
> >pvcreate /dev/sdh1
> >pvcreate /dev/sdi1
> >pvcreate /dev/sdj1
> >pvcreate /dev/sdk1
> >vgcreate san_vg /dev/sd[hijk]1
> >lvcreate -v -L255000 -ndata_lv san_vg
> >
> >lvcreate segfaults:
> ># lvcreate -v -L255000 -ndata_lv san_vg
> >lvcreate -- checking volume group name "san_vg"
> >lvcreate -- checking volume group existence
> >lvcreate -- checking volume group activity
> >lvcreate -- checking logical volume path "/dev/san_vg/data_lv"
> >lvcreate -- checking stripe count
> >lvcreate -- checking stripe size
> >lvcreate -- locking logical volume manager
> >lvcreate -- getting volume group status from VGDA in kernel
> >lvcreate -- checking stripe size against volume group physical extent
> >size
> >lvcreate -- reading volume group data of "san_vg"
> >lvcreate -- checking logical volume maximum size
> >lvcreate -- checking volume group free space
> >lvcreate -- checking stripe count against physical volume count
> >lvcreate -- checking for maximum logical volume count
> >lvcreate -- setting up logical volume
> >lvcreate -- setting read ahead sectors
> >lvcreate -- creating logical volume VGDA in kernel
> >Segmentation fault (core dumped)
> >
> >I recompiled it with debugging, and got the following output:
> >
> >[root@backgammon tools]# gdb ./lvcreate
> >GNU gdb 5.0rh-5 Red Hat Linux 7.1
> >Copyright 2001 Free Software Foundation, Inc.
> >GDB is free software, covered by the GNU General Public License, and y=
ou
> >are
> >welcome to change it and/or distribute copies of it under certain
> >conditions.
> >Type "show copying" to see the conditions.
> >There is absolutely no warranty for GDB.  Type "show warranty" for
> >details.
> >This GDB was configured as "i386-redhat-linux"...
> >(gdb) run -v -L255000 -ndata_lv san_vg
> >Starting program: /usr/local/src/LVM/1.0.1-rc2/tools/./lvcreate -v
> >-L255000 -ndata_lv san_vg
> >lvcreate -- checking volume group name "san_vg"
> >lvcreate -- checking volume group existence
> >lvcreate -- checking volume group activity
> >lvcreate -- checking logical volume path "/dev/san_vg/data_lv"
> >lvcreate -- checking stripe count
> >lvcreate -- checking stripe size
> >lvcreate -- locking logical volume manager
> >lvcreate -- getting volume group status from VGDA in kernel
> >lvcreate -- checking stripe size against volume group physical extent
> >size
> >lvcreate -- reading volume group data of "san_vg"
> >lvcreate -- checking logical volume maximum size
> >lvcreate -- checking volume group free space
> >lvcreate -- checking stripe count against physical volume count
> >lvcreate -- checking for maximum logical volume count
> >lvcreate -- setting up logical volume
> >lvcreate -- setting read ahead sectors
> >lvcreate -- creating logical volume VGDA in kernel
> >
> >Program received signal SIGSEGV, Segmentation fault.
> >lv_create (vg=3D0x5, lv=3D0xbffffa14,
> >    lv_name=3D0xbffffa2c
> >"d=FB=FF=BF\213=FB=FF=BF=B0=FB=FF=BF=E0=FB=FF=BF=F8=FB=FF=BF\032=FC=FF=
=BF&=FC=FF=BF0=FC=FF=BF=F3=FD=FF=BF\022=FE=FF=BF,=FE=FF=BFA=FE=FF=BFX=FE=FF=
=BFc=FE=FF=BF\227=FE=FF=BF=A4=FE=FF=BF=AC=FE=FF=BF=BC=FE=FF=BF=CA=FE=FF=BF=
=D8=FE=FF=BF=E9=FE=FF=BF=F7=FE=FF=BF\002=FF=FF=BF\r=FF=FF=BF@=FF=FF=BF=BB=
=FF=FF=BF")
> >    at lv_create_remove.c:42
> >42      inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
> >(gdb) bt
> >#0  lv_create (vg=3D0x5, lv=3D0xbffffa14,
> >    lv_name=3D0xbffffa2c
> >"d=FB=FF=BF\213=FB=FF=BF=B0=FB=FF=BF=E0=FB=FF=BF=F8=FB=FF=BF\032=FC=FF=
=BF&=FC=FF=BF0=FC=FF=BF=F3=FD=FF=BF\022=FE=FF=BF,=FE=FF=BFA=FE=FF=BFX=FE=FF=
=BFc=FE=FF=BF\227=FE=FF=BF=A4=FE=FF=BF=AC=FE=FF=BF=BC=FE=FF=BF=CA=FE=FF=BF=
=D8=FE=FF=BF=E9=FE=FF=BF=F7=FE=FF=BF\002=FF=FF=BF\r=FF=FF=BF@=FF=FF=BF=BB=
=FF=FF=BF")
> >    at lv_create_remove.c:42
> >#1  0x0804b03d in main (argc=3D5, argv=3D0xbffffa14) at lvcreate.c:791
> >#2  0x4006e177 in __libc_start_main (main=3D0x8049390 <main>, argc=3D5=
,
> >    ubp_av=3D0xbffffa14, init=3D0x8048e88 <_init>, fini=3D0x804b4d0 <_=
fini>,
> >    rtld_fini=3D0x4000e184 <_dl_fini>, stack_end=3D0xbffffa0c)
> >    at ../sysdeps/generic/libc-start.c:129
> >
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
Sean Burford    x34135
ITS Systems Specialist
Adelaide University
