Message-ID: <011401c25f21$b15f7da0$1c01a8c0@internal.tripnet.int>
From: "Robin Edgar - Tripany" <red@tripany.com>
References: <00cd01c25f0c$2990ffd0$1c01a8c0@internal.tripnet.int> <00f001c25f1b$3a24ef50$1c01a8c0@internal.tripnet.int> <20020918155938.A28041@sistina.com>
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Sep 18 09:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Doing the lvdisplay -v shows that pv /dev/hde1 had bits of all of the lv's
on it (including the docu lv, which I *can* mount).

----- Original Message -----
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: <linux-lvm@sistina.com>
Sent: Wednesday, September 18, 2002 3:59 PM
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!


> On Wed, Sep 18, 2002 at 03:56:36PM +0200, Robin Edgar - Tripany wrote:
> > I've discovered that there is a problem with /all/ the superblocks
except for those of the /docu lv (see below). It does lead me to another
question though - only one of the HDs crashed: is it possible that LVM wrote
all the superblocks on 1 HD?! If so this seems like a pretty serious bug in
LVM...
>
> No, LVs are just block devices with a certain amount of blocks.
> It is up to the filesystem make tool what it lays out where.
>
> In my other related email I mentioned "lvdisplay -v" to display the
allocation
> of extents. Maybe all the unmountable filesystems were in LVs on the
failed
> drive?
>
> Regards,
> Heinz    -- The LVM Guy --
>
> >
> > Robin
> >
> > ./tune2fs -l /dev/tripserv_vol/docu
> > tune2fs 1.28 (31-Aug-2002)
> > Filesystem volume name:   <none>
> > Last mounted on:          <not available>
> > Filesystem UUID:          7746644b-c83d-447f-9562-18dff7634d94
> > Filesystem magic number:  0xEF53
> > Filesystem revision #:    1 (dynamic)
> > Filesystem features:      has_journal filetype needs_recovery
sparse_super
> > Filesystem state:         clean
> > Errors behavior:          Continue
> > Filesystem OS type:       Linux
> > Inode count:              131072
> > Block count:              524288
> > Reserved block count:     26214
> > Free blocks:              318873
> > Free inodes:              129020
> > First block:              1
> > Block size:               1024
> > Fragment size:            1024
> > Blocks per group:         8192
> > Fragments per group:      8192
> > Inodes per group:         2048
> > Inode blocks per group:   256
> > Last mount time:          Wed Sep 18 17:13:48 2002
> > Last write time:          Wed Sep 18 17:13:48 2002
> > Mount count:              33
> > Maximum mount count:      25
> > Last checked:             Sun Mar  3 20:45:33 2002
> > Check interval:           15552000 (6 months)
> > Next check after:         Fri Aug 30 21:45:33 2002
> > Reserved blocks uid:      0 (user root)
> > Reserved blocks gid:      0 (group root)
> > First inode:              11
> > Inode size:               128
> > Journal UUID:             <none>
> > Journal inode:            8
> > Journal device:           0x0000
> > First orphan inode:       0
> >
> > # ./tune2fs -l /dev/tripserv_vol/pages
> > tune2fs 1.28 (31-Aug-2002)
> > ./tune2fs: Bad magic number in super-block while trying to open
/dev/tripserv_vol/pages
> > Couldn't find valid filesystem superblock.
> > You have new mail in /var/spool/mail/root
> >
> > # mke2fs -n /dev/tripserv_vol/pages
> > mke2fs 1.27 (8-Mar-2002)
> > Filesystem label=
> > OS type: Linux
> > Block size=4096 (log=2)
> > Fragment size=4096 (log=2)
> > 2621440 inodes, 5242880 blocks
> > 262144 blocks (5.00%) reserved for the super user
> > First data block=0
> > 160 block groups
> > 32768 blocks per group, 32768 fragments per group
> > 16384 inodes per group
> > Superblock backups stored on blocks:
> >         32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
2654208,
> >         4096000
> >
> >   ----- Original Message -----
> >   From: Robin Edgar - Tripany
> >   To: linux-lvm@sistina.com
> >   Sent: Wednesday, September 18, 2002 2:07 PM
> >   Subject: [linux-lvm] Help! unable to mount lv's - can't see why!
> >
> >
> >   Hi,
> >
> >   I had 4 (ide) disks in an array (and 1 vg) of which one (hde) broke.
As I was not too sure of the stability of the system, I decided to do a dd
of the disk byte by byte to another identical disk. After this was done
(with loads of sector unreadable errors) I replaced the old disk with the
new disk, rebooted the system and by all standards all seems well (see
below):
> >   Unfortunately, only the /dev/tripserv_vol/docu will mount well!
> >   /dev/tripserv_vol/pages gives the following error:
> >
> >   # mount /dev/tripserv_vol/pages /c
> >   mount: you must specify the filesystem type
> >
> >   # mount /dev/tripserv_vol/pages /c -t ext3
> >   mount: wrong fs type, bad option, bad superblock on
/dev/tripserv_vol/pages,
> >          or too many mounted file systems
> >
> >   Anyone have any ideas why it won't mount?!
> >
> >   Cheers,
> >   Robin Edgar
> >
> >   #pvscan:
> >   pvscan -- reading all physical volumes (this may take a while...)
> >   pvscan -- ACTIVE   PV "/dev/hdg1" of VG "tripserv_vol" [38.16 GB /
7.93 GB free]
> >   pvscan -- ACTIVE   PV "/dev/hdh1" of VG "tripserv_vol" [38.16 GB /
8.01 GB free]
> >   pvscan -- ACTIVE   PV "/dev/hde1" of VG "tripserv_vol" [55.91 GB / 0
free]
> >   pvscan -- ACTIVE   PV "/dev/hdf1" of VG "tripserv_vol" [55.91 GB /
3.37 GB free]
> >   pvscan -- total: 4 [188.16 GB] / in use: 4 [188.16 GB] / in no VG: 0
[0]
> >
> >   (identical output to before changing the disks around)
> >
> >   #pvdisplay /dev/hde1
> >   --- Physical volume ---
> >   PV Name               /dev/hde1
> >   VG Name               tripserv_vol
> >   PV Size               55.92 GB [117266625 secs] / NOT usable 4.18 MB
[LVM: 179 KB]
> >   PV#                   1
> >   PV Status             available
> >   Allocatable           yes (but full)
> >   Cur LV                20
> >   PE Size (KByte)       4096
> >   Total PE              14313
> >   Free PE               0
> >   Allocated PE          14313
> >   PV UUID               KCIKwa-3lvx-k7bj-27ks-hGlI-oZRo-5q7CjM
> >
> >   (also identical)
> >
> >   #vgck -v
> >   vgck -- locking logical volume manager
> >   vgck -- finding all volume group(s)
> >   vgck -- checking volume group name "tripserv_vol"
> >   vgck -- checking existence of volume group "tripserv_vol"
> >   vgck -- reading volume group data for "tripserv_vol" from lvmtab
> >   vgck -- checking volume group consistency  of "tripserv_vol" in lvmtab
> >   vgck -- VGDA of "tripserv_vol" in lvmtab is consistent
> >   vgck -- reading volume group data for "tripserv_vol" from physical
volume(s)
> >   vgck -- checking volume group consistency  of "tripserv_vol" on
physical volumes
> >   vgck -- VGDA of "tripserv_vol" on physical volumes is consistent
> >   vgck -- unlocking logical volume manager
> >
> >   # vgdisplay
> >   --- Volume group ---
> >   VG Name               tripserv_vol
> >   VG Access             read/write
> >   VG Status             available/resizable
> >   VG #                  0
> >   MAX LV                255
> >   Cur LV                22
> >   Open LV               1
> >   MAX LV Size           255.99 GB
> >   Max PV                255
> >   Cur PV                4
> >   Act PV                4
> >   VG Size               188.13 GB
> >   PE Size               4 MB
> >   Total PE              48162
> >   Alloc PE / Size       43220 / 168.83 GB
> >   Free  PE / Size       4942 / 19.30 GB
> >   VG UUID               KDiCWx-ae2w-oDnx-Hl5O-Amhd-fIM3-y51bIX
> >
> >   # vgscan -v
> >   vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> >   vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
> >   vgscan -- reading all physical volumes (this may take a while...)
> >   vgscan -- scanning for all active volume group(s) first
> >   vgscan -- found active volume group "tripserv_vol"
> >   vgscan -- reading data of volume group "tripserv_vol" from physical
volume(s)
> >   vgscan -- inserting "tripserv_vol" into lvmtab
> >   vgscan -- backing up volume group "tripserv_vol"
> >   vgscan -- checking volume group name "tripserv_vol"
> >   vgscan -- checking volume group consistency of "tripserv_vol"
> >   vgscan -- checking existence of "/etc/lvmtab.d"
> >   vgscan -- storing volume group data of "tripserv_vol" in
"/etc/lvmtab.d/tripserv_vol.tmp"
> >   vgscan -- storing physical volume data of "tripserv_vol" in
"/etc/lvmtab.d/tripserv_vol.tmp"
> >   vgscan -- storing logical volume data of volume group "tripserv_vol"
in "/etc/lvmtab.d/tripserv_vol.tmp"
> >   vgscan -- renaming "/etc/lvmtab.d/tripserv_vol.tmp" to
"/etc/lvmtab.d/tripserv_vol"
> >   vgscan -- removing special files and directory for volume group
"tripserv_vol"
> >   vgscan -- creating directory and group character special file for
"tripserv_vol"
> >   vgscan -- creating block device special files for tripserv_vol
> >   vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> >   vgscan -- WARNING: This program does not do a VGDA backup of your
volume group
> >
> >   #lvscan
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/docu" [512 MB]
striped[4]
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/install" [10 GB]
striped[4]
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/pages" [20 GB]
striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/gfx" [10 GB] striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/sfx" [10 GB] striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/people" [20 GB]
striped[4]
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/dim" [2 GB] striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/mp3" [20 GB] striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/applications" [2 GB]
striped[4]
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/code" [512 MB]
striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/dumpdir" [10 GB]
striped[4]
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/homes" [10 GB]
striped[4]
> >   lvscan -- ACTIVE   Original "/dev/tripserv_vol/info" [5 GB] striped[4]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/log" [252 MB]
striped[3]
> >   lvscan -- ACTIVE            "/dev/tripserv_vol/store" [608 MB]
striped[4]
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/docusnap" [492.19 MB]
of /dev/tripserv_vol/docu
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/installsnap" [9.84 GB]
of /dev/tripserv_vol/install
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/dimsnap" [1.97 GB] of
/dev/tripserv_vol/dim
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/codesnap" [504 MB] of
/dev/tripserv_vol/code
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/pagessnap" [19.69 GB]
of /dev/tripserv_vol/pages
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/infosnap" [4.92 GB] of
/dev/tripserv_vol/info
> >   lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/homessnap" [9.84 GB] of
/dev/tripserv_vol/homes
> >   lvscan -- 22 logical volumes with 168.08 GB total in 1 volume group
> >   lvscan -- 22 active logical volumes
> >
> >   # lvdisplay /dev/tripserv_vol/docu
> >   --- Logical volume ---
> >   LV Name                /dev/tripserv_vol/docu
> >   VG Name                tripserv_vol
> >   LV Write Access        read/write
> >   LV snapshot status     source of
> >                          /dev/tripserv_vol/docusnap [active]
> >   LV Status              available
> >   LV #                   1
> >   # open                 1
> >   LV Size                512 MB
> >   Current LE             128
> >   Allocated LE           128
> >   Stripes                4
> >   Stripe size (KByte)    4
> >   Allocation             next free
> >   Read ahead sectors     120
> >   Block device           58:0
> >
> >   # lvdisplay /dev/tripserv_vol/people
> >   --- Logical volume ---
> >   LV Name                /dev/tripserv_vol/people
> >   VG Name                tripserv_vol
> >   LV Write Access        read/write
> >   LV Status              available
> >   LV #                   6
> >   # open                 0
> >   LV Size                20 GB
> >   Current LE             5120
> >   Allocated LE           5120
> >   Stripes                4
> >   Stripe size (KByte)    4
> >   Allocation             next free
> >   Read ahead sectors     120
> >   Block device           58:5
> >
> >   # lvdisplay /dev/tripserv_vol/pages
> >   --- Logical volume ---
> >   LV Name                /dev/tripserv_vol/pages
> >   VG Name                tripserv_vol
> >   LV Write Access        read/write
> >   LV snapshot status     source of
> >                          /dev/tripserv_vol/pagessnap [active]
> >   LV Status              available
> >   LV #                   3
> >   # open                 0
> >   LV Size                20 GB
> >   Current LE             5120
> >   Allocated LE           5120
> >   Stripes                4
> >   Stripe size (KByte)    4
> >   Allocation             next free
> >   Read ahead sectors     120
> >   Block device           58:2
> >
> >   tripserv:/# lvdisplay /dev/tripserv_vol/pagessnap
> >   --- Logical volume ---
> >   LV Name                /dev/tripserv_vol/pagessnap
> >   VG Name                tripserv_vol
> >   LV Write Access        read only
> >   LV snapshot status     active destination for /dev/tripserv_vol/pages
> >   LV Status              available
> >   LV #                   20
> >   # open                 0
> >   LV Size                20 GB
> >   Current LE             5120
> >   Allocated LE           5120
> >   snapshot chunk size    64 KB
> >   Allocated to snapshot  0.00% [0/19.69 GB]
> >   Allocated to COW-table 320 MB
> >   Stripes                4
> >   Stripe size (KByte)    4
> >   Allocation             next free
> >   Read ahead sectors     120
> >   Block device           58:19
> >
> >   # lvdisplay /dev/tripserv_vol/docusnap
> >   --- Logical volume ---
> >   LV Name                /dev/tripserv_vol/docusnap
> >   VG Name                tripserv_vol
> >   LV Write Access        read only
> >   LV snapshot status     active destination for /dev/tripserv_vol/docu
> >   LV Status              available
> >   LV #                   16
> >   # open                 0
> >   LV Size                512 MB
> >   Current LE             128
> >   Allocated LE           128
> >   snapshot chunk size    64 KB
> >   Allocated to snapshot  0.05% [256 KB/492.19 MB]
> >   Allocated to COW-table 7.81 MB
> >   Stripes                4
> >   Stripe size (KByte)    4
> >   Allocation             next free
> >   Read ahead sectors     120
> >   Block device           58:15
> >
> >   So it all looks good!
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
