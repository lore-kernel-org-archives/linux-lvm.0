From: Anselm Kruis <A.Kruis@science-computing.de>
Message-ID: <Pine.LNX.4.02.10111191450430.23844-100000@murnau.science-computing.de>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Subject: [linux-lvm] [PATCH] writeable snapshots
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
Date: Mon Nov 19 13:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I have made a new writeable snapshot patch against latest cvs. It consists
of a kernel patch and a patch for lvchange. The patch is based on previous=
=20
work from Dale J. Stephenson <steph@connex.com>.

If you create a snapshot, the snapshot is still read-only at first. You
can now use lvchange, to make the snapshot writeable. Use it i.e. to
repair file systems on the snapshot.=20

lvcreate -s -n snap ...
lvchange -p rw /dev/vg00/snap
e2fsck # or something similar
sync
lvchange -p r /dev/vg00/snap
mount -o ro /dev/vg00/snap ....

The kernel patch consists mainly of two parts:
- the actual COW remapping for the snapshot
- an ioctl to let the user space tools detect the presence of the
writeable snapshot support in the kernel.

The later ist required, because current kernels have no protection against=
=20
making a snapshot-LV writeable. The protection is in lvchange. If you
make a snapshot-LV writeable, the writes end on the original volume.
Bad bad bad. :-(
Therefore lvchange needs a way to detect the presence of writeable
snapshot support in the kernel.

I decided to add a new ioctl on the /dev/lvm device: LVM_GET_FEATURE_BITS.
The ioctl returns a bit field. Every set bit indicates the presence of a
feature. If the ioctl is not present, no features are present. For now the
only feature defined is: LVM_FEATURE_WRITEABLE_SNAPSHOTS.

Known Problems:
---------------

- If a writeable snapshot runs out of space, all processes writing to the
snapshot hang.=20

- Needs more testing.

Comments and criticism are very much appreciated.

Anselm Kruis
Software Engineer


The diff is against the current cvs version of VLM as=20
of Mon Nov 19 20:06:03 CET 2001

diff -c -b -B -N -r -x CVS LVM.vanilla/PATCHES/linux-2.4.15-writeable-snaps=
hots.patch LVM/PATCHES/linux-2.4.15-writeable-snapshots.patch
*** LVM.vanilla/PATCHES/linux-2.4.15-writeable-snapshots.patch=09Thu Jan  1=
 01:00:00 1970
--- LVM/PATCHES/linux-2.4.15-writeable-snapshots.patch=09Sun Nov 18 11:05:1=
4 2001
***************
*** 0 ****
--- 1,27 ----
+ diff -u --recursive --new-file linux-2.4.15pre4.vanilla/Documentation/Con=
figure.help linux/Documentation/Configure.help
+ --- linux-2.4.15pre4.vanilla/Documentation/Configure.help=09Sun Nov 18 10=
:46:17 2001
+ +++ linux/Documentation/Configure.help=09Sat Nov 17 22:55:13 2001
+ @@ -1693,6 +1693,13 @@
+    want), say M here and read <file:Documentation/modules.txt>.  The
+    module will be called lvm-mod.o.
+ =20
+ +Support for writeable snapshots
+ +CONFIG_LVM_WRITEABLE_SNAPSHOTS
+ +  The LVM driver allows you to make snapshots of a logocal volume.
+ +  Usually these snapshots are read-only. This options add support for
+ +  writeable snapshots. You can use a writeable snapshot to run a
+ +  filesystem check on the snapshot prior to mounting it.
+ +
+  Multiple devices driver support (RAID and LVM)
+  CONFIG_MD
+    Support multiple physical spindles through a single logical device.
+ diff -u --recursive --new-file linux-2.4.15pre4.vanilla/drivers/md/Config=
=2Ein linux/drivers/md/Config.in
+ --- linux-2.4.15pre4.vanilla/drivers/md/Config.in=09Fri Sep 14 23:22:18 2=
001
+ +++ linux/drivers/md/Config.in=09Sat Nov 17 22:41:02 2001
+ @@ -14,5 +14,6 @@
+  dep_tristate '  Multipath I/O support' CONFIG_MD_MULTIPATH $CONFIG_BLK_D=
EV_MD
+ =20
+  dep_tristate ' Logical volume manager (LVM) support' CONFIG_BLK_DEV_LVM =
$CONFIG_MD
+ +dep_mbool     '  Support for writeable snapshots' CONFIG_LVM_WRITEABLE_S=
NAPSHOTS $CONFIG_BLK_DEV_LVM $CONFIG_EXPERIMENTAL
+ =20
+  endmenu
diff -c -b -B -N -r -x CVS LVM.vanilla/kernel/lvm.c LVM/kernel/lvm.c
*** LVM.vanilla/kernel/lvm.c=09Fri Nov  2 03:11:43 2001
--- LVM/kernel/lvm.c=09Sun Nov 18 11:58:33 2001
***************
*** 214,219 ****
--- 214,220 ----
   *                 in the LV each time.  [AED]
   *    12/10/2001 - Use add/del_gendisk() routines in 2.4.10+
   *    01/11/2001 - Backport read_ahead change from Linus kernel [AED]
+  *    18/11/2001 - Support for writeable snapshots [A.Kruis@science-compu=
ting.de]
   *
   */
 =20
***************
*** 374,379 ****
--- 375,385 ----
  ushort lvm_iop_version =3D LVM_DRIVER_IOP_VERSION;
  int loadtime =3D 0;
  const char *const lvm_name =3D LVM_NAME;
+ ushort lvm_feature_bits =3D
+ #ifdef CONFIG_LVM_WRITEABLE_SNAPSHOTS
+         LVM_FEATURE_WRITEABLE_SNAPSHOTS |
+ #endif
+ 0;
 =20
 =20
  /* volume group descriptor area pointers */
***************
*** 711,716 ****
--- 717,729 ----
 =20
  =09/* Main command switch */
  =09switch (command) {
+ =09case LVM_GET_FEATURE_BITS:
+ =09=09/* return a the feature bits. These bits indicate particular
+ =09=09   features supported by this kernel. */
+ =09=09if (copy_to_user(arg, &lvm_feature_bits, sizeof(ushort)) !=3D 0)
+ =09=09=09return -EFAULT;
+ =09=09return 0;
+=20
  =09case LVM_LOCK_LVM:
  =09=09/* lock the LVM */
  =09=09return lvm_do_lock_lvm();
***************
*** 1375,1382 ****
  =09=09goto out;
 =20
  =09if (lv->lv_access & LV_SNAPSHOT) { /* remap snapshot */
  =09=09if (lvm_snapshot_remap_block(&rdev_map, &rsector_map,
! =09=09=09=09=09     pe_start, lv) < 0)
  =09=09=09goto bad;
 =20
  =09} else if (rw =3D=3D WRITE || rw =3D=3D WRITEA) { /* snapshot origin *=
/
--- 1388,1415 ----
  =09=09goto out;
 =20
  =09if (lv->lv_access & LV_SNAPSHOT) { /* remap snapshot */
+ =09=09int ret;
+ =09=09ret =3D lvm_snapshot_remap_block(&rdev_map, &rsector_map,
+ =09=09=09=09=09=09pe_start, lv);
+ =09=09if (ret < 0)=20
+ =09=09=09goto bad;
+ =09=09if (ret > 0 || !(rw =3D=3D WRITE || rw =3D=3D WRITEA))
+ =09=09=09goto out; /* already remapped or read access */
+=20
+ #ifdef CONFIG_LVM_WRITEABLE_SNAPSHOTS
+ =09=09/* remap the block */
+=20
+ =09=09/* Serializes the COW with the accesses to the
+ =09=09   snapshot device.
+ =09=09   If the snapshot runs out of space,=20
+ =09=09   it will be disabled */
+ =09=09_remap_snapshot(rdev_map, rsector_map,
+ =09=09=09=09 pe_start, lv, vg_this);
+=20
  =09=09if (lvm_snapshot_remap_block(&rdev_map, &rsector_map,
! =09=09=09=09=09=09 pe_start, lv) > 0)
! =09=09=09goto out;
! #endif
  =09=09goto bad;
 =20
  =09} else if (rw =3D=3D WRITE || rw =3D=3D WRITEA) { /* snapshot origin *=
/
diff -c -b -B -N -r -x CVS LVM.vanilla/kernel/lvm.h LVM/kernel/lvm.h
*** LVM.vanilla/kernel/lvm.h=09Tue Nov 13 10:54:42 2001
--- LVM/kernel/lvm.h=09Sun Nov 18 11:46:03 2001
***************
*** 72,77 ****
--- 72,78 ----
   *    22/06/2001 - added Andreas Dilger's PE on 4k boundary alignment enh=
ancements
   *    19/07/2001 - added rwsem compatibility macros for 2.2 kernels
   *    13/11/2001 - reduced userspace inclusion of kernel headers to a min=
imum
+  *    18/11/2001 - added defines for LVM_GET_FEATURE_BITS ioctl [A.Kruis]
   *
   */
 =20
***************
*** 368,374 ****
--- 369,384 ----
  /* This is actually the same as _IO ( 0xff, 0x00), oops.  Remove for IOP =
12+ */
  #define=09LVM_LOCK_LVM            _IO ( 0xfe, 0x100)
  #endif
+ /* get lvm feature bits */
+ #define LVM_GET_FEATURE_BITS    _IOR ( 0xfe, 0x9b, 1)
  /* END ioctls */
+=20
+=20
+ /*
+  * Feature Bits
+  */
+ /* makeing a snapshot witeable is save */
+ #define LVM_FEATURE_WRITEABLE_SNAPSHOTS 0x01
 =20
 =20
  /*
diff -c -b -B -N -r -x CVS LVM.vanilla/tools/lib/liblvm.h LVM/tools/lib/lib=
lvm.h
*** LVM.vanilla/tools/lib/liblvm.h=09Wed Oct 31 13:01:01 2001
--- LVM/tools/lib/liblvm.h=09Sat Nov 17 23:40:31 2001
***************
*** 409,414 ****
--- 409,415 ----
  void   lvm_dont_interrupt ( int);
  int    lvm_get_col_numbers ( char *, long **);
  int    lvm_get_iop_version ( void);
+ int    lvm_get_feature_bits ( void);
  void   lvm_init(int argc, char **argv);
  void   lvm_interrupt ( void);
  int    lvm_lock ( void);
diff -c -b -B -N -r -x CVS LVM.vanilla/tools/lib/lvm_get_feature_bits.c LVM=
/tools/lib/lvm_get_feature_bits.c
*** LVM.vanilla/tools/lib/lvm_get_feature_bits.c=09Thu Jan  1 01:00:00 1970
--- LVM/tools/lib/lvm_get_feature_bits.c=09Mon Nov 19 19:49:11 2001
***************
*** 0 ****
--- 1,60 ----
+ /*
+  * tools/lib/lvm_get_iop_version.c
+  *
+  * Copyright (C) 2001 Anselm Kruis
+  *
+  * November 2001
+  *
+  *
+  * This LVM library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Library General Public
+  * License as published by the Free Software Foundation; either
+  * version 2 of the License, or (at your option) any later version.
+  *
+  * This LVM library is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+  * Library General Public License for more details.
+  *
+  * You should have received a copy of the GNU Library General Public
+  * License along with this LVM library; if not, write to the Free
+  * Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
+  * MA 02111-1307, USA
+  *
+  */
+=20
+ /*
+  * Changelog
+  *
+  *    18/11/2001 - created
+  *
+  */
+=20
+ #include <liblvm.h>
+=20
+ int lvm_get_feature_bits ( void) {
+    int group =3D -1;
+    int ret =3D 0;
+    ushort lvm_feature_bits =3D 0;
+=20
+    debug_enter ( "lvm_get_feature_bits -- CALLED\n");
+=20
+    /* just to ensure existance of /dev/lvm interface special */
+    lvm_check_special ();
+=20
+    if ( ( group =3D open ( LVM_DEV, O_RDONLY)) =3D=3D -1)
+       ret =3D -LVM_ELVM_IOP_VERSION_OPEN;
+    else if ( ( ret =3D ioctl ( group, LVM_GET_FEATURE_BITS,
+                              &lvm_feature_bits)) =3D=3D -1) ret =3D -errn=
o;
+    debug ( "lvm_get_feature_bits -- AFTER ioctl ret: %d\n", ret);
+    if ( group !=3D -1) close ( group);
+    /* older kernels didn't have this IOCTL */
+    if ( -ret =3D=3D EINVAL ) {
+      ret =3D 0;
+      lvm_feature_bits =3D 0; /* no special features */
+    }
+    if ( ret =3D=3D 0) ret =3D lvm_feature_bits;
+=20
+    debug_leave ( "lvm_get_feature_bits -- LEAVING with ret: %d\n", ret);
+    return ret;
+ }
diff -c -b -B -N -r -x CVS LVM.vanilla/tools/lvchange.c LVM/tools/lvchange.=
c
*** LVM.vanilla/tools/lvchange.c=09Wed Jul 25 16:52:19 2001
--- LVM/tools/lvchange.c=09Mon Nov 19 19:46:12 2001
***************
*** 323,334 ****
           continue;
        }
    =20
!       if ( lv->lv_access & LV_SNAPSHOT) {
           fprintf ( stderr, "%s -- change on snapshot logical "
                             "volume \"%s\" not allowed\n", cmd, lv_name);
           continue;
        }
 =20
        if ( lv->lv_access & LV_SNAPSHOT_ORG) {
           fprintf ( stderr, "%s -- change on logical volume \"%s\" under "
                             "snapshot not allowed\n", cmd, lv_name);
--- 323,345 ----
           continue;
        }
    =20
!       if ( ( lv->lv_access & LV_SNAPSHOT) &&
!            ( (opt_C) || (opt_a) || (opt_r))) {
           fprintf ( stderr, "%s -- change on snapshot logical "
                             "volume \"%s\" not allowed\n", cmd, lv_name);
           continue;
        }
 =20
+       if ( ( lv->lv_access & LV_SNAPSHOT) && (opt_p)) {
+ =09 int feature_bits =3D lvm_get_feature_bits();
+ =09 if ( feature_bits < 0 || !(feature_bits & LVM_FEATURE_WRITEABLE_SNAPS=
HOTS)) {
+ =09   fprintf ( stderr, "%s -- change on snapshot logical "
+ =09=09     "volume \"%s\" not allowed\n", cmd, lv_name);
+ =09   continue;
+ =09 }
+       }
+      =20
+       /* fixme: opt_p should be save */
        if ( lv->lv_access & LV_SNAPSHOT_ORG) {
           fprintf ( stderr, "%s -- change on logical volume \"%s\" under "
                             "snapshot not allowed\n", cmd, lv_name);
***************
*** 364,370 ****
    =20
           if ( doit > 0) {
              doit_sum++;
!             lv->lv_access =3D lv_access;
              if ( opt_v > 0) printf ( "%s -- changing access permissions "
                                       "of logical volume \"%s\"\n",
                                       cmd, lv_name);
--- 375,383 ----
    =20
           if ( doit > 0) {
              doit_sum++;
!             /* don't clear access flags except for LV_WRITE and LV_READ *=
/
!             lv->lv_access &=3D ~( LV_READ | LV_WRITE ) | lv_access;
!             lv->lv_access |=3D lv_access;
              if ( opt_v > 0) printf ( "%s -- changing access permissions "
                                       "of logical volume \"%s\"\n",
                                       cmd, lv_name);



---
 Anselm Kruis                                 Tel. +49 (0)89-356386-74
 science + computing ag=09=09              FAX  +49 (0)89-356386-37
 Ingolst=E4dter Str. 22             mailto: A.Kruis@science-computing.de
 D-80807 M=FCnchen                 WWW: http://www.science-computing.de/

**********************************************************************
***     CeBIT 2002                                                 ***
***     Besuchen Sie uns auf der CeBIT vom 13.-20.03.2002          ***
***     auf dem Messegel=E4nde in Hannover, Halle 11                 ***
**********************************************************************
