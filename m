Message-ID: <37AFFA45.FAF773E@ep-ag.com>
Date: Tue, 10 Aug 1999 12:09:09 +0200
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PATCH: volume drivers in ll_rw_block
References: <Pine.LNX.4.10.9908091418060.9796-100000@orinoco.lcse.umn.edu>
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: David Teigland <teigland@lcse.umn.edu>
Cc: linux-raid@vger.rutgers.edu, linux-lvm@msede.com, gfs-devel@lcse.umn.edu

David Teigland wrote:
> This eliminates repetitious driver-specific code and provides a clean way
> to make MD, LVM and Pool modular.  MD devices can currently be used within
> LVM, but this patch, in a general sense, imposes no limit on the number or
> order in which volumes are built on one another.
>=20
> Unaddressed by this method is more than one stacked volume driver using
> makerq_fn.  If stacking volume drivers, only the bottom one can use a
> make_request function.
>=20
> The patch below to 2.2.10+raid0145 implements the generic mapping. Two
> other patches can be found at ftp://globalfilesystem.org/pub/GFS/patches/
>=20
>  - modular_md-2.2.10 adds module support for MD using this method.
>  - lvm_map-0.7 allows LVM to be used with generic_map.

Hi all,

the lvm_map-0.7 lacks one thing in ll_rw_blk.c, i show below in
generic_map-2.2.10-raid what and where.

> --------------------Cut Here---------------- generic_map-2.2.10-raid
>=20
> diff -urN linux-raid-1/drivers/block/ll_rw_blk.c linux-raid-2/drivers/blo=
ck/ll_rw_blk.c
> --- linux-raid-1/drivers/block/ll_rw_blk.c      Mon Aug 16 14:42:42 1999
> +++ linux-raid-2/drivers/block/ll_rw_blk.c      Mon Aug 16 14:46:08 1999
...
> @@ -619,15 +622,17 @@
>                 /* Md remaps blocks now */
>                 bh[i]->b_rdev =3D bh[i]->b_dev;
>                 bh[i]->b_rsector=3Dbh[i]->b_blocknr*(bh[i]->b_size >> 9);
-#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE
-                major =3D MAJOR(bh[i]->b_dev);
-                if ( major =3D=3D LVM_BLK_MAJOR) {
-                   int ret;
-
-                   if ( lvm_map_ptr =3D=3D NULL) {
-                              printk ( KERN_ERR
-                               "Bad lvm_map_ptr in ll_rw_block\n");
-                      goto sorry;
-                   }
-                   if ( ( ret =3D ( lvm_map_ptr) ( MINOR ( bh[i]->b_dev),
-                                                 &bh[i]->b_rdev,
-                                                 &bh[i]->b_rsector,
-                                                 bh[i]->b_size >> 9,
-                                                 rw)) !=3D 0) {
-                      printk ( KERN_ERR
-                               "Bad lvm_map in ll_rw_block\n");
-                      goto sorry;
-                   }
-                   /* remap major too ... */
-                   major =3D MAJOR(bh[i]->b_rdev);
-               }
-#endif
> -#ifdef CONFIG_BLK_DEV_MD
> -               if (major=3D=3DMD_MAJOR &&
> -                       md_map (bh[i]->b_dev, &bh[i]->b_rdev,
> -                           &bh[i]->b_rsector, bh[i]->b_size >> 9)) {
> -                       printk (KERN_ERR
> -                               "Bad md_map in ll_rw_block\n");
> -                       goto sorry;
> -               }
> -#endif
> +
> +               tdev =3D dev;
> +               while (tdev->map_fn) {
> +                       if (tdev->map_fn (bh[i]->b_rdev, &bh[i]->b_rdev,
> +                                         &bh[i]->b_rsector,
> +                                         bh[i]->b_size >> 9)) {
> +                              printk (KERN_ERR "Bad map in ll_rw_block\n=
");
> +                              goto sorry;
> +                       }
> +                       tdev =3D blk_dev + MAJOR(bh[i]->b_rdev);
> +               }
>         }
>=20
>         if ((rw =3D=3D WRITE || rw =3D=3D WRITEA) && is_read_only(bh[0]->=
b_dev)) {

or : in my 1st effort i just did this :

-#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE
+#if defined CONFIG_BLK_DEV_LVM_NEVER || defined
CONFIG_BLK_DEV_LVM_MODULE_NEVER

at that place in ll_rw_block. Whithout it, you=EF=BF=BDll get the "Bad lvm_=
map
in ll_rw_block" when fsck tries to read the superblock!

Ciao
Klaus

BTW: I use lvm since release 0.5alpha and had (almost ;-)) never any
problems with it!
--=20
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
