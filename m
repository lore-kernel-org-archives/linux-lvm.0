Message-ID: <39D82C2E.FEFE5205@attglobal.net>
Date: Mon, 02 Oct 2000 02:33:18 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] need help to recover my system
References: <200010020449.e924nVl11138@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Mauelshagen@sistina.com, linux-lvm@msede.com

Andreas,

Thanks.  That got me one step closer.  For some reason the patch I
clipped from your note would not apply even though it appeared to match
the existing source correctly. I applied it manually and re-compiled. At
this point, running vgchange will activate the volume group. When I list
the content of /proc/lvm it shows the 7 logical volumes i had defined.

All of the various display commands appear to work, but I can't mount
any of the logical volumes. The mount command says the special device
/dev/vg01/xxxx does not exist.  I checked the LVM-HOWTO and the only
thing I see there is the requirement to make a filesystem on the new
logical volume. Is the mkreiserfs/mke2fs the place the special device is
created?  If I do that it will destroy the existing data.  It appears so
close to being recovered yet still so far away.

----------------------------
[root@farpt1 /root]# lvdisplay /dev/vg01/usr
--- Logical volume ---
LV Name               /dev/vg01/usr
VG Name               vg01
LV Write Access       read/write
LV Status             available
LV #                  4
# open                0
LV Size               2.5 GB
Current LE            640
Allocated LE          640
Allocation            next free
Read ahead sectors    120
Block device          58:3

----------------------------------------
[root@farpt1 /root]# mount -t reiserfs /dev/vg01/usr /vg01/usr
mount: special device /dev/vg01/usr does not exist

-----------------------------------------
[root@farpt1 /root]# ls -al /dev/vg01
total 104
dr-xr-xr-x    2 root     root         4096 Oct  2 01:45 ./
drwxr-xr-x   12 root     root        98304 Oct  2 02:09 ../
crw-r-----    1 root     root     109,   0 Oct  2 01:45 group


Les Hazelton

Andreas Dilger wrote:
> 
> You write:
> > When I booted the new 2.2.17 kernel I ran "pvscan -D" & "vgscan -D".  I
> > can now do vgdisplay and lvmdisplay if I use the -D parameter.  I just
> > can't activate the volume group.  When I try, this is the result.
> >
> > [root@farpt1 /root]# vgchange -va y
> > vgchange -- locking logical volume manager
> > vgchange -- finding all volume group(s)
> > vgchange -- checking volume group name "vg01"
> > vgchange -- checking existence of volume group "vg01"
> > vgchange -- reading volume group data for "vg01" from lvmtab
> > vgchange -- checking volume group consistency  of "vg01"
> > vgchange -- checking if all physical volumes of volume group "vg01" are
> > available
> > vgchange -- creating VGDA for "vg01" in kernel
> > vgchange -- can't open logical volume manager to activate volume group
> > "vg01"
> 
> This looks like the same bug that YOSHIDA Daisuke just fixed (see message
> "Re: vgchange.c patch for devfs"):
> 
> Cheers, Andreas
> -------------------------------------------------------------------------
> --- LVM/0.8final/tools/vgchange.c       Tue Feb 22 11:09:33 2000
> +++ LVM.modified/0.8final/tools/vgchange.c      Sun Oct  1 12:50:40 2000
> @@ -391,7 +391,13 @@
>               if ( opt_v > 0) printf ( "%s -- creating VGDA for \"%s\" "
>                                        "in kernel\n",
>                                        cmd, vg_name);
> -             if ( ( ret = vg_create ( vg_name, vg)) == 0)
> +
> +             ret = vg_create( vg_name, vg);
> +             if ( ret == -LVM_EVG_CREATE_REMOVE_OPEN) {
> +                vg_create_dir_and_group( vg);
> +                ret = vg_create ( vg_name, vg);
> +             }
> +             if ( ret == 0)
>                  printf ( "%s -- volume group \"%s\" successfully activated\n",
>                           cmd, vg_name);
>               else {
> 
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

-- 
Les Hazelton
---------------------------------------------
Good journey, longevity and prosperity to all
