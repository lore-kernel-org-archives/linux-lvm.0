From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004181037.MAA31399@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] pvmove broken?
In-Reply-To: <20000411135841.A30143@home.ds9a.nl> from bert hubert at "Apr 11, 2000  1:58:42 pm"
Date: Tue, 18 Apr 2000 12:37:31 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bert hubert <ahu@ds9a.nl>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Maybe you hit the lvchange bug (see the BUGS file at linux.msede.com)
and pvmove only complained as a followup?

Heinz

> In the course of writing the lvm-manager, I was trying pvmove but it appears
> horribly broken, alternately refusing to work of messing things up. I once
> had to recreate all my physical volumes with -ff to get things working
> again.
> 
> I tried this:
> 
> # vgcreate test /dev/hda3 /dev/hda4
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- doing automatic backup of volume group "test"
> vgcreate -- volume group "test" successfully created and activated
> 
> # lvcreate -n testvol -L 20M test
> lvcreate -- doing automatic backup of "test"
> lvcreate -- logical volume "/dev/test/testvol" successfully created
> 
> # lvchange -a n /dev/test/testvol
> lvchange -- logical volume "/dev/test/testvol" changed
> lvchange -- doing automatic backup of volume group "test"
> 
> # vgchange -a n test
> vgchange -- volume group "test" successfully deactivated
> 
> # pvmove /dev/hda3
> pvmove -- moving physical extents in inactive volume group "test"
> pvmove -- WARNING: moving of active logical volumes may cause data loss!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
> 
> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents
> 
> # pvmove /dev/hda4
> pvmove -- no logical volumes on empty source physical volume "/dev/hda4"
>  
> ##############
> 
> Some data which may be relevant:
> 
> # pvscan -v
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- walking through all physical volumes found
> pvscan -- inactive PV "/dev/hda3" of VG "test" [52 MB / 32 MB free]
> pvscan -- inactive PV "/dev/hda4" of VG "test" [52 MB / 52 MB free]
> pvscan -- inactive PV "/dev/hdb2"  is in no VG  [133.35 MB]
> pvscan -- total: 3 [243.17 MB] / in use: 2 [109.82 MB] / in no VG: 1 [133.35
> MB]
> 
> # lvdisplay -v /dev/test/testvol -D
> --- Logical volume ---
> LV Name               /dev/test/testvol
> VG Name               test
> LV Write Access       read/write
> LV Status             NOT available
> LV #                  1
> # open                0
> LV Size               20 MB
> Current LE            5
> Allocated LE          5
> Allocation            next free
> Read ahead sectors    120
> Block device          58:0
> 
>    --- Distribution of logical volume on 1 physical volume  ---
>    PV Name                  PE on PV     reads      writes
>    /dev/hda3                5            0          0        
> 
>    --- logical volume i/o statistic ---
>    0 reads  0 writes
> 
>    --- Logical extents ---
>    LE    PV                        PE     reads      writes
>    00000 /dev/hda3                 00000  0          0        
>    00001 /dev/hda3                 00001  0          0        
>    00002 /dev/hda3                 00002  0          0        
>    00003 /dev/hda3                 00003  0          0        
>    00004 /dev/hda3                 00004  0          0        
> 
> 
> 
> # uname -a
> Linux debian 2.3.99-pre3 #2 Mon Mar 27 17:48:19 CEST 2000 i686 unknown
> 
> Logical Volume Manager 0.8final by Heinz Mauelshagen  21/02/2000 (IOP 6)
> 
> 
> Regards,
> 
> bert hubert
> 
> 
> -- 
>                        |              http://www.rent-a-nerd.nl
>                        |                     - U N I X -
>                        |          Inspice et cautus eris - D11T'95
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
