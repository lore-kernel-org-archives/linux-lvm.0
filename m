From: Richard Chan <rspchan@starhub.net.sg>
Message-id: <3DF587F2.5060609@starhub.net.sg>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Error with 2.5.50-dm-2; vanilla OK
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
Date: Tue Dec 10 00:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> Weird, the patch that is causing you the problem will be:
>
> http://people.sistina.com/~thornber/patches/2.5-stable/2.5.50/2.5.50-dm-2/00005.patch <http://people.sistina.com/%7Ethornber/patches/2.5-stable/2.5.50/2.5.50-dm-2/00005.patch>
>
> Though it still looks sane to me.  Can you send me the lvm2 log from
> this vgchange along with the size in sectors of hdb7 please ?
> 
> - Joe

Sure - here is more information about my system - the PVs as below
Disk /dev/hdb: 255 heads, 63 sectors, 7297 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdb1   *         1      1044   8385898+  a5  FreeBSD
/dev/hdb2          1045      7297  50227222+   f  Win95 Ext'd (LBA)
/dev/hdb5          1045      2088   8385898+   7  HPFS/NTFS
/dev/hdb6          2089      4699  20972826   8e  Linux LVM
/dev/hdb7          4700      7297  20868403+  8e  Linux LVM

lvm pvdisplay --verbose
    Scanning for physical volume names
  --- Physical volume ---
  PV Name               /dev/hdb6
  VG Name               vg00
  PV Size               20.00GB / not usable 5.28MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              5119
  Free PE               0
  Allocated PE          5119
  PV UUID               vuszz2-2qjg-ArUm-k1dV-GjHO-86ZM-HGYCZo

  --- Physical volume ---
  PV Name               /dev/hdb7
  VG Name               vg00
  PV Size               19.90GB / not usable 7.30MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              5093
  Free PE               292
  Allocated PE          4801
  PV UUID               p3a5G3-HJjq-L9Gl-KGQN-Pi45-fBJT-RVE2ms


Output of lvm vgchange -ay --verbose
(BTW I just noticed an ioctl complaint - don't know what it means)

lvm vgchange -ay --verbose
 device-mapper ioctl cmd 2 failed: Invalid argument
  Couldn't load device 'vg00-LVmisc'.
    Finding all volume groups
    Finding volume group "vg00"
    3 logical volume(s) in volume group "vg00" already active
    Found volume group "vg00"
    Found volume group "vg00"
    Found volume group "vg00"
    Loading vg00-LVmisc
    Found volume group "vg00"
    Found volume group "vg00"
    Found volume group "vg00"
    Found volume group "vg00"
    Found volume group "vg00"
    Activated logical volumes in volume group "vg00"
  3 logical volume(s) in volume group "vg00" now active

device-mapper: allocating minor 0.
device-mapper: device /dev/hdb7 too small for target
device-mapper: internal error adding target to table
device-mapper: destroying table
device-mapper: allocating minor 1.
device-mapper: allocating minor 2.

There ought to be 4 LVs and minors; when the system is right I get

lvm lvscan
  ACTIVE            '/dev/vg00/LVhome' [10.00GB] next free
  ACTIVE            '/dev/vg00/LVmisc' [20.00GB] next free
  ACTIVE            '/dev/vg00/LVjfs' [8.00GB] next free
  ACTIVE            '/dev/vg00/LVswap' [768.00MB] next free


Thanks
Richard
