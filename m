Date: Thu, 22 Apr 1999 12:54:26 +0200
From: Toni Andjelkovic <toni@telecom.at>
Subject: [linux-lvm] dazed and confused
Message-ID: <19990422125426.A12508@overlord.telecom.at>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

hi to all,

i was greatly impressed when i stumbled across LVM, so i decided
to try it immediately:

i have 3 empty scsi-disks with 8.5 gigs each (/dev/sdc /dev/sdd /dev/sde)
64 heads, 32 sectors, 8678 cylinders.

i created some partitions on each disk as follows:

> (root@demon):[/usr/src/LVM/0.6/tools] # fdisk -l /dev/sdc
> 
> Disk /dev/sdc: 64 heads, 32 sectors, 8678 cylinders
> Units = cylinders of 2048 * 512 bytes
> 
>    Device Boot   Start      End   Blocks   Id  System
> /dev/sdc2         8551     8678   131072   82  Linux swap

the first primary partition (cyl 1-8550) has an id of 0xfe.

> (root@demon):[~] # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: you may not have an actual backup of your volume group

wonderful.

> (root@demon):[~] # pvcreate /dev/sd[cde]1
> pvcreate -- reinitializing physical volume
> pvcreate -- physical volume "/dev/sdc1" successfully created
> pvcreate -- reinitializing physical volume
> pvcreate -- physical volume "/dev/sdd1" successfully created
> pvcreate -- reinitializing physical volume
> pvcreate -- physical volume "/dev/sde1" successfully created

i'm quite happy ... this looks good.

> (root@demon):[~] # pvdisplay /dev/sd[cde]1
> pvdisplay -- "/dev/sdc1" is a new physical volume of 8.35 GB
> pvdisplay -- "/dev/sdd1" is a new physical volume of 8.35 GB
> pvdisplay -- "/dev/sde1" is a new physical volume of 8.35 GB

and this looks even better.

> (root@demon):[~] # vgcreate test_vg /dev/sd[cde]1
> vgcreate -- no valid physical volumes in command line
> 

*ouch* ok, let's give it a try with the debug-switch on:

> (root@demon):[~] # vgcreate -d test_vg /dev/sd[cde]1
> vg_check_name -- CALLED
> vg_check_name -- vg_name: "test_vg"
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> vg_check_name -- LEAVING with ret: 0
> lvm_iop_version -- CALLED
> .
> .
> vgcreate -- no valid physical volumes in command line

the interesting fact is that it'll scan every partition
available, (from /dev/sd[cde]10 to /dev/sd[cde]20), but somehow
it omits to mention /dev/sd[cde]1, where my physical volumes
are located.

never mind. i'll try to define the whole physical disk
as a PV. i remove all existing partitions on /dev/sdc,

> (root@demon):[/usr/src/LVM/0.6/tools] # fdisk -l /dev/sdc
> 
> Disk /dev/sdc: 64 heads, 32 sectors, 8678 cylinders
> Units = cylinders of 2048 * 512 bytes
> 
>    Device Boot   Start      End   Blocks   Id  System

and try

> (root@demon):[/usr/src/LVM/0.6/tools] # pvcreate -d /dev/sdc
> lvm_iop_version -- CALLED
> lv_status_internal -- AFTER ioctl ret: 0
> lvm_iop_version -- LEAVING with ret: 0
> pv_check_name -- CALLED
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> pv_check_name -- CALLED  pv_name: "/dev/sdc"
> pv_check_name -- LEAVING with ret: 0
> pv_get_size -- CALLED with /dev/sdc and BFFFF3AC
> pv_check_name -- CALLED
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> pv_check_name -- CALLED  pv_name: "/dev/sdc"
> pv_check_name -- LEAVING with ret: 0
> pv_check_part -- CALLED with /dev/sdc
> pv_check_name -- CALLED
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> pv_check_name -- CALLED  pv_name: "/dev/sdc"
> pv_check_name -- LEAVING with ret: 0
> pv_check_part -- LEAVING with -237
> pv_get_size -- BEFORE llseek 0:0
> pv_get_size -- part[0].sys_ind: 0  part[0].nr_sects: 0
> pv_get_size -- first == 1
> pv_get_size -- part[1].sys_ind: 0  part[1].nr_sects: 0
> pv_get_size -- first == 1
> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
> pv_get_size -- first == 1
> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
> pv_get_size -- first == 1
> pv_get_size -- LEAVING with ret: -242
> pvcreate -- extended partition "/dev/sdc" doesn't exist

*scream* is it my fault?

thx & cu,
-- 
Toni Andjelkovic       |       (TA627-RIPE)      | Tel: (+43 1) 21717-58990
toni@telecom.at        |        iT Austria       | Fax: (+43 1) 21717-58900
---------------------------------------------------------------------------
