From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Q: allocation of PEs to LVs
Message-Id: <20020204151025.A30150@sistina.com>
References: <m2wuxtie4o.fsf@isnogud.escape.de>
MIME-Version: 1.0
In-Reply-To: <m2wuxtie4o.fsf@isnogud.escape.de>; from
    urs@isnogud.escape.de on Mon, Feb 04, 2002 at 02:13:27PM +0100
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
Date: Mon Feb  4 08:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs,

that is a display related bug.
Thanks for pointing this out.

Please try the following patch:
diff -u -B -r1.3.2.9 lv_show.c
--- LVM/tools/lib/lv_show.c     12 Mar 2001 16:21:21 -0000      1.3.2.9
+++ LVM/tools/lib/lv_show.c     4 Feb 2002 14:07:34 -0000
@@ -327,16 +327,18 @@
             "   LE    PV                        PE     reads      writes\n");
    dev = 0;
    for ( pe = 0; pe < lv->lv_allocated_le; pe++) {
+      int pv_index;
+
       if ( lv->lv_current_pe[pe].dev != dev) {
          pv_name = pv_create_name_from_kdev_t ( lv->lv_current_pe[pe].dev);
          dev = lv->lv_current_pe[pe].dev;
       }
+      pv_index = pv_get_index_by_kdev_t ( vg, lv->lv_current_pe[pe].dev);
       printf ( "   %05d %-25s %05u  %-9u  %-9u\n",
                pe,
                pv_name,
                ( lv->lv_current_pe[pe].pe -
-                 vg->pv[pv_get_index_by_kdev_t
-                        ( vg, lv->lv_current_pe[pe].dev)]->pe_on_disk.base /
+                 LVM_VGDA_SIZE(vg->pv[pv_index]) /
                  SECTOR_SIZE) /
                  ( lv->lv_size / lv->lv_allocated_le),
                  lv->lv_current_pe[pe].reads,


Regards,
Heinz    -- The LVM Guy --


On Mon, Feb 04, 2002 at 02:13:27PM +0100, Urs Thuermann wrote:
> How are PEs allocated when LVs are created using lvcreate?  I created
> a LV unsing lvcreate from LVM-1.0.1 on an empty VG and was surprised
> that PEs are allocated starting with PE 1 and not PE 0 as I expected:
> 
>     isnogud:root# pvcreate /dev/sdd1
>     pvcreate -- physical volume "/dev/sdd1" successfully created
>     
>     isnogud:root# vgcreate vg1 /dev/sdd1
>     vgcreate -- INFO: using default physical extent size 4.00 MB
>     vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
>     vgcreate -- doing automatic backup of volume group "vg1"
>     vgcreate -- volume group "vg1" successfully created and activated
>     
>     isnogud:root# lvcreate -n test vg1 -L32M
>     lvcreate -- doing automatic backup of "vg1"
>     lvcreate -- logical volume "/dev/vg1/test" successfully created
>     
>     isnogud:root# lvdisplay -v /dev/vg1/test
>     --- Logical volume ---
>     LV Name                /dev/vg1/test
>     VG Name                vg1
>     LV Write Access        read/write
>     LV Status              available
>     LV #                   1
>     # open                 0
>     LV Size                32.00 MB
>     Current LE             8
>     Allocated LE           8
>     Allocation             next free
>     Read ahead sectors     10000
>     Block device           58:11
>     
>        --- Distribution of logical volume on 1 physical volume  ---
>        PV Name                  PE on PV     reads      writes
>        /dev/sdd1                8            0          4        
>     
>        --- logical volume i/o statistic ---
>        0 reads  4 writes
>     
>        --- Logical extents ---
>        LE    PV                        PE     reads      writes
>        00000 /dev/sdd1                 00001  0          4        
>        00001 /dev/sdd1                 00002  0          0        
>        00002 /dev/sdd1                 00003  0          0        
>        00003 /dev/sdd1                 00004  0          0        
>        00004 /dev/sdd1                 00005  0          0        
>        00005 /dev/sdd1                 00006  0          0        
>        00006 /dev/sdd1                 00007  0          0        
>        00007 /dev/sdd1                 00008  0          0        
>     
>     
>     isnogud:root# 
> 
> 
> The first LV in my other VG starts at PE 0 as expected.  I created
> that VG and LVs using vgcreate and lvcreate from LVM-0.9.1_beta7:
> 
>     isnogud:root# lvdisplay -v /dev/vg0/root
>     --- Logical volume ---
>     LV Name                /dev/vg0/root
>     VG Name                vg0
>     LV Write Access        read/write
>     LV Status              available
>     LV #                   1
>     # open                 1
>     LV Size                128.00 MB
>     Current LE             32
>     Allocated LE           32
>     Stripes                2
>     Stripe size (KByte)    4
>     Allocation             next free
>     Read ahead sectors     120
>     Block device           58:0
>     
>        --- Distribution of logical volume on 2 physical volumes  ---
>        PV Name                  PE on PV     reads      writes
>        /dev/sda2                16           41814      100298   
>        /dev/sdb2                16           42184      161941   
>     
>        --- logical volume i/o statistic ---
>        83998 reads  262239 writes
>     
>        --- Logical extents ---
>        LE    PV                        PE     reads      writes
>        00000 /dev/sda2                 00000  2814       663      
>        00001 /dev/sda2                 00001  978        24114    
>        ...
>        00014 /dev/sda2                 00014  1955       223      
>        00015 /dev/sda2                 00015  4050       277      
>        00016 /dev/sdb2                 00000  2835       634      
>        00017 /dev/sdb2                 00001  946        72276    
>        ...
>        00030 /dev/sdb2                 00014  1984       205      
>        00031 /dev/sdb2                 00015  4083       311      
>     
>     
>     isnogud:root# 
> 
> 
> Can someone explain this, please?  Is it intentional?
> 
> 
> Also, the "Read ahead sectors" seem to have changed from 120 to 10000,
> which seems quite a lot to me.  10000 sectors is roughly 5 MB.  Does
> every read really cause the next 5 MB to be read from the disk(s)?
> 
> 
> urs
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
