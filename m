Message-ID: <39D850FD.7E9684C9@attglobal.net>
Date: Mon, 02 Oct 2000 05:10:21 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] need help to recover my system
References: <200010020449.e924nVl11138@webber.adilger.net> <39D82C2E.FEFE5205@attglobal.net> <20001002102626.B7806@srv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@Sistina.com
Cc: linux-lvm@msede.com

"Heinz J. Mauelshagen" wrote:
> 
> On Mon, Oct 02, 2000 at 02:33:18AM -0400, Les Hazelton wrote:
> > Andreas,
> >
> > Thanks.  That got me one step closer.  For some reason the patch I
> > clipped from your note would not apply even though it appeared to match
> > the existing source correctly. I applied it manually and re-compiled. At
> > this point, running vgchange will activate the volume group. When I list
> > the content of /proc/lvm it shows the 7 logical volumes i had defined.
> >
> > All of the various display commands appear to work, but I can't mount
> > any of the logical volumes. The mount command says the special device
> > /dev/vg01/xxxx does not exist.
> 
> Even though it seems you have devfs in place, the device nodes for the
> logical volumes are not created.
> 
> Does a vgscan run help you to create them?

Yes,  that appears to have done it.  I could have sworn I did that
originally to create the /etc/lvmtab.d before I did the vgchange -ay.
Still, I just did vgscan again and now the /dev/vg01/xxx nodes are
there. It looks like vgscan was required to get the database established
so the other tools would run and again after the vgchange had activated
the VG to create the nodes.

[root@farpt1 lrh]# ls -l /dev/vg01
total 0
crw-r-----    1 root     root     109,   0 Oct  2 04:40 group
brw-r-----    1 root     root      58,   1 Oct  2 04:40 home
brw-r-----    1 root     root      58,   2 Oct  2 04:40 local
brw-r-----    1 root     root      58,   6 Oct  2 04:40 main
brw-r-----    1 root     root      58,   4 Oct  2 04:40 mp3
brw-r-----    1 root     root      58,   5 Oct  2 04:40 src
brw-r-----    1 root     root      58,   3 Oct  2 04:40 usr
brw-r-----    1 root     root      58,   0 Oct  2 04:40 var

Now the mount also works.

[root@farpt1 lrh]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda7             2.9G  2.8G  2.6M 100% /
/dev/hda8             2.9G  1.3G  1.5G  47% /Archives
/dev/hda1             2.0G  1.6G  449M  78% /mnt/win_c
/dev/sda5             2.0G  1.2G  803M  61% /mnt/win_c2
/dev/hda6             2.0G  387M  1.6G  19% /mnt/win_d
/dev/vg01/usr         2.5G  1.9G  574M  78% /vg01/usr
/dev/vg01/main        512M  321M  190M  63% /vg01/main
/dev/vg01/local       800M  600M  200M  75% /vg01/local
/dev/vg01/var         252M  117M  134M  47% /vg01/var
/dev/vg01/home       1020M  414M  606M  41% /vg01/home
/dev/vg01/src         600M  368M  232M  61% /vg01/src
/dev/vg01/mp3         1.5G  1.4G   98M  94% /vg01/mp3


Thank you all so very much for all your help.  You bailed me out of a
stupid mistake. While I don't have the old system running just yet, I
now have a real chance. I plan to copy the "/" partition
(/dev/vg01/main) back to the hda drive, modify its /etc/fstab and the
grub entries on the original /boot partition and go from there.

Andreas, thanks for pointing out the vgchange patch.  I really do
appreciate all the help you both have provided.

Les Hazelton

> 
> > I checked the LVM-HOWTO and the only
> > thing I see there is the requirement to make a filesystem on the new
> > logical volume. Is the mkreiserfs/mke2fs the place the special device is
> > created?
> 
> No, it is created by a library routine either called by lvcreate, vgscan
> or vgmknodes.
> 
> > If I do that it will destroy the existing data.
> 
> Yes, you would. Don't do that.
> You just want to have your device nodes back and access the existing data.
> 
> Try vgmknodes after "vgchange -ay" on the volume group.
> 
> We need to figure out though, why the nodes are not created in the first
> place by devfs.
> 
> Heinz
> 
> > It appears so
> > close to being recovered yet still so far away.
> >
> > ----------------------------
> > [root@farpt1 /root]# lvdisplay /dev/vg01/usr
> > --- Logical volume ---
> > LV Name               /dev/vg01/usr
> > VG Name               vg01
> > LV Write Access       read/write
> > LV Status             available
> > LV #                  4
> > # open                0
> > LV Size               2.5 GB
> > Current LE            640
> > Allocated LE          640
> > Allocation            next free
> > Read ahead sectors    120
> > Block device          58:3
> >
> > ----------------------------------------
> > [root@farpt1 /root]# mount -t reiserfs /dev/vg01/usr /vg01/usr
> > mount: special device /dev/vg01/usr does not exist
> >
> > -----------------------------------------
> > [root@farpt1 /root]# ls -al /dev/vg01
> > total 104
> > dr-xr-xr-x    2 root     root         4096 Oct  2 01:45 ./
> > drwxr-xr-x   12 root     root        98304 Oct  2 02:09 ../
> > crw-r-----    1 root     root     109,   0 Oct  2 01:45 group
> >
> >
> > Les Hazelton
> >
> > Andreas Dilger wrote:
> > >
> > > You write:
> > > > When I booted the new 2.2.17 kernel I ran "pvscan -D" & "vgscan -D".  I
> > > > can now do vgdisplay and lvmdisplay if I use the -D parameter.  I just
> > > > can't activate the volume group.  When I try, this is the result.
> > > >
> > > > [root@farpt1 /root]# vgchange -va y
> > > > vgchange -- locking logical volume manager
> > > > vgchange -- finding all volume group(s)
> > > > vgchange -- checking volume group name "vg01"
> > > > vgchange -- checking existence of volume group "vg01"
> > > > vgchange -- reading volume group data for "vg01" from lvmtab
> > > > vgchange -- checking volume group consistency  of "vg01"
> > > > vgchange -- checking if all physical volumes of volume group "vg01" are
> > > > available
> > > > vgchange -- creating VGDA for "vg01" in kernel
> > > > vgchange -- can't open logical volume manager to activate volume group
> > > > "vg01"
> > >
> > > This looks like the same bug that YOSHIDA Daisuke just fixed (see message
> > > "Re: vgchange.c patch for devfs"):
> > >
> > > Cheers, Andreas
> > > -------------------------------------------------------------------------
> > > --- LVM/0.8final/tools/vgchange.c       Tue Feb 22 11:09:33 2000
> > > +++ LVM.modified/0.8final/tools/vgchange.c      Sun Oct  1 12:50:40 2000
> > > @@ -391,7 +391,13 @@
> > >               if ( opt_v > 0) printf ( "%s -- creating VGDA for \"%s\" "
> > >                                        "in kernel\n",
> > >                                        cmd, vg_name);
> > > -             if ( ( ret = vg_create ( vg_name, vg)) == 0)
> > > +
> > > +             ret = vg_create( vg_name, vg);
> > > +             if ( ret == -LVM_EVG_CREATE_REMOVE_OPEN) {
> > > +                vg_create_dir_and_group( vg);
> > > +                ret = vg_create ( vg_name, vg);
> > > +             }
> > > +             if ( ret == 0)
> > >                  printf ( "%s -- volume group \"%s\" successfully activated\n",
> > >                           cmd, vg_name);
> > >               else {
> > >
> > > --
> > > Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
> > >                  \  would they cancel out, leaving him still hungry?"
> > > http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> >
> > --
> > Les Hazelton
> > ---------------------------------------------
> > Good journey, longevity and prosperity to all
> 
> --
> 
> Regards,
> Heinz      -- The LVM guy --
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Bartningstr. 12
>                                                   64289 Darmstadt
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 6151 7103 86
>                                                        FAX 7103 96
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

-- 
Les Hazelton
---------------------------------------------
Good journey, longevity and prosperity to all
