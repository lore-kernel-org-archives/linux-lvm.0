From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing an old disk, and some vgexport/import love..
Message-ID: <20020919115935.A32578@sistina.com>
References: <002001c25fa7$482b2740$ccc67140@ownage>
Mime-Version: 1.0
In-Reply-To: <002001c25fa7$482b2740$ccc67140@ownage>; from lightning@aci.net on Wed, Sep 18, 2002 at 11:39:19PM -0700
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
Date: Thu Sep 19 05:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 18, 2002 at 11:39:19PM -0700, Matt wrote:
> Helu,
> 
>  
> 
> I am in dire need of some help.I recently removed an old disk from my PV
> and added a new one  
> 
>  in place of the old one.
> 
> e.g.
> 
>             
> 
> pvmove garage /dev/hdj1 /dev/hde1 (hde1 being the new drive)
> 
>  
> 
> The physical extents moved over to the new drive and everything was
> looking good until
> 
> I made a pretty big mistake, I figured I'd need to export the group
> 'garage' and import it.
> 
> Wrong! Now when I go and try to import my group it freaks stating:
> 
>             
> 
>             # vgimport garage /dev/hde1 /dev/hdg1 /dev/hdf1
> 
> vgimport -- ERROR: wrong number of physical volumes to import volume
> group "garage"

Matt,

you didn't need to export the volume group unless you want to move it to 
a different system. It looks like you exported the VG and removed /dev/hdj1,
right?

If that assumption is true, you still need /dev/hdj1 in order to get your
VG back.

Then do the following:

# vgimport garage /dev/hd[efgj]1
# vgchange -ay garage
# vgreduce garage /dev/hdj1

That should bring your VG back and reduce it by the empty /dev/hdj1
physical volume.

You can physically remove /dev/hdj1 afterwards if you want to.

Regards,
Heinz    -- The LVM Guy --

> 
>  
> 
> I can't do a vgcfgrestore either, because it is currently exported and I
> am not sure if that would
> fix anything anyways. Here is some more information:
> 
>  
> 
>             # pvscan
> 
> pvscan -- reading all physical volumes (this may take a while...)
> 
> pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "garage" [74.55 GB
> / 0 free]
> 
> pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "garage" [76.33 GB
> / 0 free]
> 
> pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "garage" [74.52 GB
> / 60.21 GB free]
> 
> pvscan -- total: 3 [225.42 GB] / in use: 3 [225.42 GB] / in no VG: 0 [0]
> 
>  
> 
>             vgscan -d output can be found at:
> http://www.planetgarage.net/vgscan.txt (long)
> 
>  
> 
> root@deify:~ # vgdisplay -Dv
> 
> vgdisplay -- WARNING: volume group "garagePV_EXP" is exported
> 
> --- Volume group ---
> 
> VG Name               garagePV_EXP
> 
> VG Access             read/write
> 
> VG Status             NOT available/exported/resizable
> 
> VG #                  0
> 
> MAX LV                256
> 
> Cur LV                1
> 
> Open LV               0
> 
> MAX LV Size           255.99 GB
> 
> Max PV                256
> 
> Cur PV                3
> 
> Act PV                3
> 
> VG Size               225.41 GB
> 
> PE Size               4 MB
> 
> Total PE              57705
> 
> Alloc PE / Size       42290 / 165.20 GB
> 
> Free  PE / Size       15415 / 60.21 GB
> 
> VG UUID               fs8lXY-bca9-tFHT-yv8g-HP7U-Ssh7-v13m9h
> 
>  
> 
> --- Logical volume ---
> 
> LV Name                /dev/garage/LLAMA
> 
> VG Name                garage
> 
> LV Write Access        read/write
> 
> LV Status              NOT available
> 
> LV #                   1
> 
> # open                 0
> 
> LV Size                165.20 GB
> 
> Current LE             42290
> 
> Allocated LE           42290
> 
> Allocation             next free
> 
> Read ahead sectors     120
> 
> Block device           58:0
> 
>  
> 
>  
> 
> --- Physical volumes ---
> 
> PV Name (#)           /dev/hde1 (1)
> 
> PV Status             available / allocatable
> 
> Total PE / Free PE    19541 / 0
> 
>  
> 
> PV Name (#)           /dev/hdg1 (3)
> 
> PV Status             available / allocatable
> 
> Total PE / Free PE    19086 / 0
> 
>  
> 
> PV Name (#)           /dev/hdf1 (4)
> 
> PV Status             available / allocatable
> 
> Total PE / Free PE    19078 / 15415
> 
>  
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
