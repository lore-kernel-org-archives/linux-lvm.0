From: Urs Thuermann <urs@isnogud.escape.de>
Message-Id: <m2wuxtie4o.fsf@isnogud.escape.de>
Subject: [linux-lvm] Q: allocation of PEs to LVs
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
Date: Mon Feb  4 07:15:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

How are PEs allocated when LVs are created using lvcreate?  I created
a LV unsing lvcreate from LVM-1.0.1 on an empty VG and was surprised
that PEs are allocated starting with PE 1 and not PE 0 as I expected:

    isnogud:root# pvcreate /dev/sdd1
    pvcreate -- physical volume "/dev/sdd1" successfully created
    
    isnogud:root# vgcreate vg1 /dev/sdd1
    vgcreate -- INFO: using default physical extent size 4.00 MB
    vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
    vgcreate -- doing automatic backup of volume group "vg1"
    vgcreate -- volume group "vg1" successfully created and activated
    
    isnogud:root# lvcreate -n test vg1 -L32M
    lvcreate -- doing automatic backup of "vg1"
    lvcreate -- logical volume "/dev/vg1/test" successfully created
    
    isnogud:root# lvdisplay -v /dev/vg1/test
    --- Logical volume ---
    LV Name                /dev/vg1/test
    VG Name                vg1
    LV Write Access        read/write
    LV Status              available
    LV #                   1
    # open                 0
    LV Size                32.00 MB
    Current LE             8
    Allocated LE           8
    Allocation             next free
    Read ahead sectors     10000
    Block device           58:11
    
       --- Distribution of logical volume on 1 physical volume  ---
       PV Name                  PE on PV     reads      writes
       /dev/sdd1                8            0          4        
    
       --- logical volume i/o statistic ---
       0 reads  4 writes
    
       --- Logical extents ---
       LE    PV                        PE     reads      writes
       00000 /dev/sdd1                 00001  0          4        
       00001 /dev/sdd1                 00002  0          0        
       00002 /dev/sdd1                 00003  0          0        
       00003 /dev/sdd1                 00004  0          0        
       00004 /dev/sdd1                 00005  0          0        
       00005 /dev/sdd1                 00006  0          0        
       00006 /dev/sdd1                 00007  0          0        
       00007 /dev/sdd1                 00008  0          0        
    
    
    isnogud:root# 


The first LV in my other VG starts at PE 0 as expected.  I created
that VG and LVs using vgcreate and lvcreate from LVM-0.9.1_beta7:

    isnogud:root# lvdisplay -v /dev/vg0/root
    --- Logical volume ---
    LV Name                /dev/vg0/root
    VG Name                vg0
    LV Write Access        read/write
    LV Status              available
    LV #                   1
    # open                 1
    LV Size                128.00 MB
    Current LE             32
    Allocated LE           32
    Stripes                2
    Stripe size (KByte)    4
    Allocation             next free
    Read ahead sectors     120
    Block device           58:0
    
       --- Distribution of logical volume on 2 physical volumes  ---
       PV Name                  PE on PV     reads      writes
       /dev/sda2                16           41814      100298   
       /dev/sdb2                16           42184      161941   
    
       --- logical volume i/o statistic ---
       83998 reads  262239 writes
    
       --- Logical extents ---
       LE    PV                        PE     reads      writes
       00000 /dev/sda2                 00000  2814       663      
       00001 /dev/sda2                 00001  978        24114    
       ...
       00014 /dev/sda2                 00014  1955       223      
       00015 /dev/sda2                 00015  4050       277      
       00016 /dev/sdb2                 00000  2835       634      
       00017 /dev/sdb2                 00001  946        72276    
       ...
       00030 /dev/sdb2                 00014  1984       205      
       00031 /dev/sdb2                 00015  4083       311      
    
    
    isnogud:root# 


Can someone explain this, please?  Is it intentional?


Also, the "Read ahead sectors" seem to have changed from 120 to 10000,
which seems quite a lot to me.  10000 sectors is roughly 5 MB.  Does
every read really cause the next 5 MB to be read from the disk(s)?


urs
