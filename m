From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
Message-ID: <20020918151827.B27535@sistina.com>
References: <00cd01c25f0c$2990ffd0$1c01a8c0@internal.tripnet.int>
Mime-Version: 1.0
In-Reply-To: <00cd01c25f0c$2990ffd0$1c01a8c0@internal.tripnet.int>; from red@tripany.com on Wed, Sep 18, 2002 at 02:07:18PM +0200
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
Date: Wed Sep 18 08:20:52 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 18, 2002 at 02:07:18PM +0200, Robin Edgar - Tripany wrote:
> Hi,
> 
> I had 4 (ide) disks in an array (and 1 vg) of which one (hde) broke. As I was not too sure of the stability of the system, I decided to do a dd of the disk byte by byte to another identical disk. After this was done (with loads of sector unreadable errors) I replaced the old disk with the new disk, rebooted the system and by all standards all seems well (see below):

Robin,

lots of read errors during dd likely left you with a corrupted primary
superblock of the filesystem.

> Unfortunately, only the /dev/tripserv_vol/docu will mount well!
> /dev/tripserv_vol/pages gives the following error:
> 
> # mount /dev/tripserv_vol/pages /c
> mount: you must specify the filesystem type
> 
> # mount /dev/tripserv_vol/pages /c -t ext3
> mount: wrong fs type, bad option, bad superblock on /dev/tripserv_vol/pages,
>        or too many mounted file systems
> 
> Anyone have any ideas why it won't mount?!

You need to figure out, if /dev/tripserv_vol/docu doesn't have *any* extents
allocated on the replaced disk. Try "lvdisplay -v /dev/tripserv_vol/docu"
to achive this. If it has, you'll likely find corrupted files in this one
too.


For the failing mount you might want to try

"mount -r -osb=$ALTERNATE_SUPERBLOCK /dev/tripserv_vol/pages /c".

In case you've got a logical 4k block size of the filesystem,
ALTERNATE_SUPERBLOCK=131072 would access the first backup copy.

See "man mount" and look for the ext2 mount option "sb=" for more information.

In case you have success with using a backup superblock this way, you need to
backup all files you can access successfully first, then recreate the filesystem
and restore. It is unlikely in the case of lots of read errors during dd, that
a fsck will help you. You'll probably end up with piles of lost+found entries.

Regards,
Heinz    -- The LVM Guy --


> 
> Cheers,
> Robin Edgar
> 
> #pvscan:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hdg1" of VG "tripserv_vol" [38.16 GB / 7.93 GB free]
> pvscan -- ACTIVE   PV "/dev/hdh1" of VG "tripserv_vol" [38.16 GB / 8.01 GB free]
> pvscan -- ACTIVE   PV "/dev/hde1" of VG "tripserv_vol" [55.91 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdf1" of VG "tripserv_vol" [55.91 GB / 3.37 GB free]
> pvscan -- total: 4 [188.16 GB] / in use: 4 [188.16 GB] / in no VG: 0 [0]
> 
> (identical output to before changing the disks around)
> 
> #pvdisplay /dev/hde1
> --- Physical volume ---
> PV Name               /dev/hde1
> VG Name               tripserv_vol
> PV Size               55.92 GB [117266625 secs] / NOT usable 4.18 MB [LVM: 179 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                20
> PE Size (KByte)       4096
> Total PE              14313
> Free PE               0
> Allocated PE          14313
> PV UUID               KCIKwa-3lvx-k7bj-27ks-hGlI-oZRo-5q7CjM
> 
> (also identical)
> 
> #vgck -v
> vgck -- locking logical volume manager
> vgck -- finding all volume group(s)
> vgck -- checking volume group name "tripserv_vol"
> vgck -- checking existence of volume group "tripserv_vol"
> vgck -- reading volume group data for "tripserv_vol" from lvmtab
> vgck -- checking volume group consistency  of "tripserv_vol" in lvmtab
> vgck -- VGDA of "tripserv_vol" in lvmtab is consistent
> vgck -- reading volume group data for "tripserv_vol" from physical volume(s)
> vgck -- checking volume group consistency  of "tripserv_vol" on physical volumes
> vgck -- VGDA of "tripserv_vol" on physical volumes is consistent
> vgck -- unlocking logical volume manager
> 
> # vgdisplay
> --- Volume group ---
> VG Name               tripserv_vol
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                22
> Open LV               1
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                4
> Act PV                4
> VG Size               188.13 GB
> PE Size               4 MB
> Total PE              48162
> Alloc PE / Size       43220 / 168.83 GB
> Free  PE / Size       4942 / 19.30 GB
> VG UUID               KDiCWx-ae2w-oDnx-Hl5O-Amhd-fIM3-y51bIX
> 
> # vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- found active volume group "tripserv_vol"
> vgscan -- reading data of volume group "tripserv_vol" from physical volume(s)
> vgscan -- inserting "tripserv_vol" into lvmtab
> vgscan -- backing up volume group "tripserv_vol"
> vgscan -- checking volume group name "tripserv_vol"
> vgscan -- checking volume group consistency of "tripserv_vol"
> vgscan -- checking existence of "/etc/lvmtab.d"
> vgscan -- storing volume group data of "tripserv_vol" in "/etc/lvmtab.d/tripserv_vol.tmp"
> vgscan -- storing physical volume data of "tripserv_vol" in "/etc/lvmtab.d/tripserv_vol.tmp"
> vgscan -- storing logical volume data of volume group "tripserv_vol" in "/etc/lvmtab.d/tripserv_vol.tmp"
> vgscan -- renaming "/etc/lvmtab.d/tripserv_vol.tmp" to "/etc/lvmtab.d/tripserv_vol"
> vgscan -- removing special files and directory for volume group "tripserv_vol"
> vgscan -- creating directory and group character special file for "tripserv_vol"
> vgscan -- creating block device special files for tripserv_vol
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> #lvscan
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/docu" [512 MB] striped[4]
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/install" [10 GB] striped[4]
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/pages" [20 GB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/gfx" [10 GB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/sfx" [10 GB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/people" [20 GB] striped[4]
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/dim" [2 GB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/mp3" [20 GB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/applications" [2 GB] striped[4]
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/code" [512 MB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/dumpdir" [10 GB] striped[4]
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/homes" [10 GB] striped[4]
> lvscan -- ACTIVE   Original "/dev/tripserv_vol/info" [5 GB] striped[4]
> lvscan -- ACTIVE            "/dev/tripserv_vol/log" [252 MB] striped[3]
> lvscan -- ACTIVE            "/dev/tripserv_vol/store" [608 MB] striped[4]
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/docusnap" [492.19 MB] of /dev/tripserv_vol/docu
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/installsnap" [9.84 GB] of /dev/tripserv_vol/install
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/dimsnap" [1.97 GB] of /dev/tripserv_vol/dim
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/codesnap" [504 MB] of /dev/tripserv_vol/code
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/pagessnap" [19.69 GB] of /dev/tripserv_vol/pages
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/infosnap" [4.92 GB] of /dev/tripserv_vol/info
> lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/homessnap" [9.84 GB] of /dev/tripserv_vol/homes
> lvscan -- 22 logical volumes with 168.08 GB total in 1 volume group
> lvscan -- 22 active logical volumes
> 
> # lvdisplay /dev/tripserv_vol/docu
> --- Logical volume ---
> LV Name                /dev/tripserv_vol/docu
> VG Name                tripserv_vol
> LV Write Access        read/write
> LV snapshot status     source of
>                        /dev/tripserv_vol/docusnap [active]
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                512 MB
> Current LE             128
> Allocated LE           128
> Stripes                4
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> # lvdisplay /dev/tripserv_vol/people
> --- Logical volume ---
> LV Name                /dev/tripserv_vol/people
> VG Name                tripserv_vol
> LV Write Access        read/write
> LV Status              available
> LV #                   6
> # open                 0
> LV Size                20 GB
> Current LE             5120
> Allocated LE           5120
> Stripes                4
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:5
> 
> # lvdisplay /dev/tripserv_vol/pages
> --- Logical volume ---
> LV Name                /dev/tripserv_vol/pages
> VG Name                tripserv_vol
> LV Write Access        read/write
> LV snapshot status     source of
>                        /dev/tripserv_vol/pagessnap [active]
> LV Status              available
> LV #                   3
> # open                 0
> LV Size                20 GB
> Current LE             5120
> Allocated LE           5120
> Stripes                4
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:2
> 
> tripserv:/# lvdisplay /dev/tripserv_vol/pagessnap
> --- Logical volume ---
> LV Name                /dev/tripserv_vol/pagessnap
> VG Name                tripserv_vol
> LV Write Access        read only
> LV snapshot status     active destination for /dev/tripserv_vol/pages
> LV Status              available
> LV #                   20
> # open                 0
> LV Size                20 GB
> Current LE             5120
> Allocated LE           5120
> snapshot chunk size    64 KB
> Allocated to snapshot  0.00% [0/19.69 GB]
> Allocated to COW-table 320 MB
> Stripes                4
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:19
> 
> # lvdisplay /dev/tripserv_vol/docusnap
> --- Logical volume ---
> LV Name                /dev/tripserv_vol/docusnap
> VG Name                tripserv_vol
> LV Write Access        read only
> LV snapshot status     active destination for /dev/tripserv_vol/docu
> LV Status              available
> LV #                   16
> # open                 0
> LV Size                512 MB
> Current LE             128
> Allocated LE           128
> snapshot chunk size    64 KB
> Allocated to snapshot  0.05% [256 KB/492.19 MB]
> Allocated to COW-table 7.81 MB
> Stripes                4
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:15
> 
> So it all looks good!

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
