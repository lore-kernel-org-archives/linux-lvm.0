Return-Path: <root@srv.sistina.com>
Date: Mon, 23 Jul 2001 10:00:43 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] snapshot creation bug?
Message-ID: <20010723100043.B10807@sistina.com>
References: <20010721040657.E17654@sanity.dhs.org>
Mime-Version: 1.0
In-Reply-To: <20010721040657.E17654@sanity.dhs.org>; from marijn@sanity.dhs.org on Sat, Jul 21, 2001 at 04:06:58AM -0400
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Marijn,

a snapshot bug in the early 0.9 series of LVM caused metadata corruption.

Hopefully you still have the metadata backup, which is created automatically
in /etc/lvmconf/ (or on a backup media).

Choose the last valid one taken before the failing change, deactivate
your VG and vgcfgrestore(8) it to *all* of the PVs belonging to the VG
in question, scan in the metadata and activate your VG again.

If your metadata (VGDA) backup file is named /etc/lvmconf/host_vg.conf
and your PVs are /dev/sdc1, /dev/sdd3 and /dev/sdf5 you need to run:

for pv in /dev/sdc1 /dev/sdd3 /dev/sdf5
do
   vgcfgrestore -n host_vg -f /etc/lvmconf/host_vg.conf $pv
done
vgscan
vgchange -a y host_vg


Regards,
Heinz    -- The LVM Guy --



On Sat, Jul 21, 2001 at 04:06:58AM -0400, Marijn Vriens wrote:
> Hello dear list members,
> 
> I have been using LVM on various computers with sucess, but i am
> having a situation with one of them...
> 
> The problem is that once i tried to make a snapshot of one
> of my LVs and ever since then i am having troubles with the
> LVM (the snapshot didn't want to work). It seems that since then, many
> LVM programs die with segfaults, what leads me to be leave that
> somewhere the LVM data is corrupted. 
> 
> When I tried to make the snapshot I was using LVM-0.9.0. It failed for
> some reason (I don't remember what the error was), leaving me with
> some semi finished operation. Since then when I try to add a new LV
> it won't let me. I also upgraded to 0.9.1beta7, but it doesn't make a
> difference. 
> 
> The machine uses the 2.4.4 Linux kernel, with LVM as a module. All LVs
> that are under LVM run on reiserfs. 
> 
> One other thing is that this machine hasn't been rebooted since all of
> this started. I don't know what kind of "refresh" effect this will
> have. But I'd rather leave those solutions to certain commercial OS's :). 
> 
> Could someone please enlighten me, as to what is going on with my LVM?
> and how I can fix it? I really hope it doesn't involve "vgremove" (not
> that i don't have backups.... :) ) 
> 
> Kind regards, 
>      Marijn.
> -----
> Okay, for now for the output of the various tools.
> I tried to create a snapshot I called "snap" and later a new LV "log"
> and "log2"
> 
> When I try to create a new LV: 
> icarus:~# lvcreate -L2G --name log host_vg
> lvcreate -- ERROR "Permission denied" opening logical volume "/dev/host_vg/log"
> 
> but it DOES create a /dev/host_vg/log !
> 
> Then trying to remove it gives me:
> icarus:~# lvremove /dev/host_vg/log 
> lvremove -- do you really want to remove "/dev/host_vg/log"? [y/n]: y
> lvremove -- ERROR "lv_release(): LV number" releasing logical volume "/dev/host_vg/log"
> 
> but the /dev/host_vg/log stays :(
> LVM thinks that the /dev/host_vg/log doesn't exist:
> 
> icarus:~# lvdisplay -v /dev/host_vg/log
> lvdisplay -- logical volume "/dev/host_vg/log" doesn't exist
> 
> Okay, it doesn't exist.
> 
> icarus:~# lvscan -v
> lvscan -- checking volume group name "host_vg"
> lvscan -- checking volume group "host_vg" existence
> lvscan -- checking volume group "host_vg" activity
> lvscan -- getting VGDA of volume group "host_vg" from kernel
> lvscan -- ACTIVE            "/dev/host_vg/lvol1" [1 GB]
> lvscan -- ACTIVE            "/dev/host_vg/www" [2 GB]
> lvscan -- ACTIVE            "/dev/host_vg/vpopmail" [4 GB]
> lvscan -- ACTIVE            "/dev/host_vg/mysql" [1 GB]
> Segmentation fault
> 
> Hmmm, something wicked really IS going on... Tools shouldn't
> segfault.
> 
> The same program, with some more options:
> 
> icarus:~# lvscan -vb
> lvscan -- checking volume group name "host_vg"
> lvscan -- checking volume group "host_vg" existence
> lvscan -- checking volume group "host_vg" activity
> lvscan -- getting VGDA of volume group "host_vg" from kernel
> lvscan -- ACTIVE            "/dev/host_vg/lvol1" [1 GB] 58:0
> lvscan -- ACTIVE            "/dev/host_vg/www" [2 GB] 58:1
> lvscan -- ACTIVE            "/dev/host_vg/vpopmail" [4 GB] 58:2
> lvscan -- ACTIVE            "/dev/host_vg/mysql" [1 GB] 58:3
> lvscan -- ACTIVE   Snapshot "/dev/host_vg/snap" [98.44 MB] 58:4
> lvscan -- ACTIVE            "/dev/host_vg/log" [2 GB] 58:4
> lvscan -- ACTIVE            "/dev/host_vg/log2" [2 GB] 58:4
> lvscan -- 7 logical volumes with 12.1 GB total in 1 volume group
> lvscan -- 7 active logical volumes
> 
> What? lvdisplay just told me the LV "log" it doesn't exist! What is
> also interesting is that /dev/host_vg/snap is there, but that doesn't
> exist in my /dev/host_vg/ . All 3 problematic LVs have 58:4 while the
> others are unique. and if -b is just to show the major-minor numbers,
> why doesn't this segfault? 
> 
> More lvscan fun:
> icarus:~# lvscan -vD
> lvscan -- reading all physical volumes (this may take a while...)
> lvscan -- checking volume group name "host_vg"
> lvscan -- checking volume group "host_vg" existence
> lvscan -- reading volume group data of host_vg from disk(s)
> lvscan -- inactive          "/dev/host_vg/lvol1" [1 GB]
> lvscan -- inactive          "/dev/host_vg/www" [2 GB]
> lvscan -- inactive          "/dev/host_vg/vpopmail" [4 GB]
> lvscan -- inactive          "/dev/host_vg/mysql" [1 GB]
> lvscan -- inactive          "/dev/host_vg/log2" [2 GB]
> lvscan -- 5 logical volumes with 10 GB total in 1 volume group
> lvscan -- 5 inactive logical volumes
> 
> But they're not INACTIVE at all.
> 
> and as a finale: 
> icarus:~# vgdisplay -v
> --- Volume group ---
> VG Name               host_vg
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                7
> Open LV               4
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                1
> Act PV                1
> VG Size               16.73 GB
> PE Size               4 MB
> Total PE              4282
> Alloc PE / Size       3097 / 12.1 GB
> Free  PE / Size       1185 / 4.63 GB
> VG UUID               pTIjgu-WnnS-oLd3-jkhI-kGme-sSJN-7JGX5Y
> 
> --- Logical volume ---
> LV Name                /dev/host_vg/www
> VG Name                host_vg
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                2 GB
> Current LE             512
> Allocated LE           512
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
> 
> --- Logical volume ---
> LV Name                /dev/host_vg/vpopmail
> VG Name                host_vg
> LV Write Access        read/write
> LV Status              available
> LV #                   3
> # open                 1
> LV Size                4 GB
> Current LE             1024
> Allocated LE           1024
> Allocation             next free
> Read ahead sectors     120
> Block device           58:2
> 
> 
> --- Logical volume ---
> LV Name                /dev/host_vg/mysql
> VG Name                host_vg
> LV Write Access        read/write
> LV Status              available
> LV #                   4
> # open                 1
> LV Size                1 GB
> Current LE             256
> Allocated LE           256
> Allocation             next free
> Read ahead sectors     120
> Block device           58:3
> 
> --- Logical volume ---
> LV Name                /dev/host_vg/snap
> VG Name                host_vg
> LV Write Access        read only
> Segmentation fault
> 
> There's something stinky going on.. An other Segfault.
> 
> -- 
> Get loaded from the source: Do Linux!
> Marijn Vriens <marijn@sanity.dhs.org> 
> GPG/PGP: 6895 DF03 73E1 F671 C61D  45F4 5E83 8571 C529 5C15
> 
> 
> 

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
