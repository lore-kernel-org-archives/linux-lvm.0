From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Recovering from a disk failure
Message-ID: <20030318100351.A30525@sistina.com>
References: <BAY2-DAV22tTyHMktV100016cfa@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <BAY2-DAV22tTyHMktV100016cfa@hotmail.com>; from thien_vu@hotmail.com on Sat, Mar 15, 2003 at 01:29:50PM -0800
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
Date: Tue Mar 18 03:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Mar 15, 2003 at 01:29:50PM -0800, Thien Vu wrote:
> Hi all,
> 
> I was preparing to move data residing on a LV to a RAID5 array when the
> cruel hand of irony slapped me, and one of the drives in my LV died. I have
> not migrated any data off of the LV.
> 
> Here is my setup:
> * Linear lvm: 80GB, 80GB, 40GB ( I think in this order also, but I"m not
> 100percent sure
> * The 40GB died: doesn't power on, isn't detected by BIOS.
> 
> I've searched the archives, and there seems to be 2 solutions:
> * Bottom up solution- get a replacement drive, do pvcreate, restore the vg
> data onto the drive, run vgscan and hope
> 
> I tried this, but I can't find the UUID for the missing drive (because I
> can't read off of it) so there's no way for me to assign the replacement
> drive the correct UUID. I've tried using vgcfgbackup/restore (from LVM2
> with -P flag) but it doesn't record the UUID for the missing drive.

Run LVM1's "pvdata -U" on one of the accesable drives to get the list of all
PV UUIDs.

> 
> * Top down solution -get device-mapper and LVM2, vgscan, vgchange -ay -P,
> mount the filesystem and hope
> 
> I tried this, but the filesystem on the LV is reiserfs and it won't allow me
> to mount the LV. I would try reiserfsck and other tools, but the VG is
> incomplete and is only accessible read-only.

The LVs are writable still so you should be able to run the filesystem check.
You probably want to do a block level backup before that.

Regards,
Heinz    -- The LVM Guy --

> 
> Below is the output of vgdisplay -v -P (from LVM2):
> 
> Thanks for any assistance,
> 
> Thien
> 
> -------------------------
>   Partial mode. Incomplete volume groups will be activated read-only.
>     Finding all volume groups
>     Finding volume group "vg_home"
>   2 PV(s) found for VG vg_home: expected 3
>   Logical volume (lv_home) contains an incomplete mapping table.
>   --- Volume group ---
>   VG Name               vg_home
>   System ID             lisa1026448546
>   Format                lvm1
>   VG Access             read
>   VG Status             resizable
>   MAX LV                256
>   Cur LV                1
>   Open LV               0
>   Max PV                256
>   Cur PV                2
>   Act PV                2
>   VG Size               188.12 GB
>   PE Size               4.00 MB
>   Total PE              48160
>   Alloc PE / Size       48160 / 188.12 GB
>   Free  PE / Size       0 / 0
>   VG UUID               BHXFw1-6juI-h8jW-fxBQ-H7EW-ng14-6iGQX2
> 
>   --- Logical volume ---
>   LV Name                /dev/vg_home/lv_home
>   VG Name                vg_home
>   LV UUID                000000-0000-0000-0000-0000-0000-000000
>   LV Write Access        read/write
>   LV Status              NOT available
>   LV Size                188.12 GB
>   Current LE             48160
>   Segments               9544
>   Allocation             next free
>   Read ahead sectors     1024
> 
>   --- Physical volumes ---
>   PV Name               /dev/discs/disc1/disc
>   PV UUID               OUcSLF-p0XM-5Qhc-qViC-hhZG-ALcl-pkdc00
>   PV Status             allocatable
>   Total PE / Free PE    19540 / 0
> 
>   PV Name               /dev/discs/disc2/disc
>   PV UUID               24IIKM-aegb-RuxL-27ro-AMLZ-bU9K-XFsHGS
>   PV Status             allocatable
>   Total PE / Free PE    19078 / 0
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
