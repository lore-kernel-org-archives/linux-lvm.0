From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgimport problem -  wrong number of physical volumes to import volume group
Message-ID: <20030910124936.J2618@sistina.com>
References: <000301c3741a$64dd6af0$3201a8c0@anythings>
Mime-Version: 1.0
In-Reply-To: <000301c3741a$64dd6af0$3201a8c0@anythings>; from anything@starstrike.net on Sat, Sep 06, 2003 at 11:58:38AM +1000
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
Date: Wed Sep 10 05:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You're probably susing an older LVM1 version which had that problem
with PVs numbered out of sequence. Use 1.0.7.

Regards,
Heinz    -- The LVM Guy --


On Sat, Sep 06, 2003 at 11:58:38AM +1000, Anything wrote:
> Hi all.
>  
> Ive got a bit of a problem with re-importing my volume group on this
> system.
>  
> I was removing a few hard drives and moved it to a new system. I
> vgreduced and everything to remove drives, it seemed working okay, so I
> exported in preparation to move to another box.
> Now, I am unable to import it again. I have plugged the drives I removed
> back in, just in case, however they seem to be not related.
>  
>  
> Im pretty new to lvm, so maybe ive missed something obvious?
> Ive been googling and reading howto for a couple of hours, ive still no
> solution (maybe im a noob?). Ive seen some other vgimport related stuff,
> but not as seemingly simple as this?!?
>  
>  
> Does anybody know why vgimport is saying I have the wrong number of
> drives?
> Im 99% sure its wanting 4 drives, but it still isn't liking me very
> much.
>  
> Alternatively, does anybody know how to get data off this exported vg,
> so I can at least not loose everything?
>  
>  
> I noticed people were posting lots of info, so I thought I might do the
> same, just to give a good idea on whats going on
>  
> Pvscan results:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdg"   is in EXPORTED VG "storage_group"
> [93.12 GB / 0 free]
> pvscan -- inactive PV "/dev/hdh"   is in EXPORTED VG "storage_group"
> [111.75 GB / 3.16 GB free]
> pvscan -- inactive PV "/dev/hde"  is in no VG  [37.27 GB]
> pvscan -- inactive PV "/dev/hdf"  is in no VG  [38.35 GB]
> pvscan -- inactive PV "/dev/hdc"   is in EXPORTED VG "storage_group"
> [111.75 GB / 0 free]
> pvscan -- inactive PV "/dev/hda3"  is in EXPORTED VG "storage_group"
> [70.88 GB / 0 free]
> pvscan -- inactive PV "/dev/hdb"  is in no VG  [38.35 GB]
> pvscan -- total: 7 [501.64 GB] / in use: 4 [387.67 GB] / in no VG: 3
> [113.96 GB]
>  
> hde, hdf and hdb were going to be removed. As you can see there they
> seem pretty much unrelated to the problem, but I have plugged them back
> in just in case
>  
>  
> Pvdata /dev/hda3 shows:
> --- Physical volume ---
> PV Name               /dev/hda3
> VG Name               storage_groupPV_EXP
> PV Size               70.93 GB [148751858 secs] / NOT usable 32.19 MB
> [LVM: 136 KB]
> PV#                   3
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       32768
> Total PE              2268
> Free PE               0
> Allocated PE          2268
> PV UUID               5lk3Ei-MLat-sXFg-xCv3-HGll-W5lC-fkXYZq
>  
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/exported/resizable
> VG #                  1
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               387.50 GB
> PE Size               32 MB
> Total PE              12400
> Alloc PE / Size       12299 / 384.34 GB
> Free  PE / Size       101 / 3.16 GB
> VG UUID               1wczAS-BPIW-NdcH-VCRL-DoB5-1fnJ-8yTw97
>  
> Plus a heap of other stuff.
> The "Cur PV" amount to me says my vgremoves were successful, and all I
> should be importing is the 4 drives that are still active.
>  
>  
>  
> "vgimport storage_group /dev/hdg /dev/hdc /dev/hda3 /dev/hdh" shows:
> vgimport -- ERROR: wrong number of physical volumes to import volume
> group "storage_group"
>  
> but:
>  
> "vgimport storage_group /dev/hdg /dev/hdc /dev/hda3" shows:
> vgimport -- ERROR: only 3 physical volumes of 4 given for volume group
> "storage_group"
>  
> and this is a bit weird (notice the ordering of drives)
> "vgimport storage_group /dev/hdg /dev/hdc /dev/hdh"
> vgimport -- ERROR: wrong number of physical volumes to import volume
> group "storage_group"
>  
> I didn't think the ordering of the import command was important?
>  
>  
>  
>  
> any ideas anyone on how to get my group imported>
>  
> Andrew..

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
