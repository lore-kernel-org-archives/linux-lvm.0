Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6L8Wqa03902
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 04:32:52 -0400
Received: from mail-new.rz.uni-ulm.de (mail-new.rz.uni-ulm.de [134.60.1.1])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6L8Wpe1011456
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 04:32:51 -0400
Received: from uiuc.edu (adsl-68-77-116-31.dsl.chmpil.ameritech.net
	[68.77.116.31])
	by mail.uni-ulm.de (8.12.11/8.12.11) with ESMTP id i6L8Wnhl021765
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 10:32:49 +0200 (MEST)
Message-ID: <40FE2A30.60404@uiuc.edu>
Date: Wed, 21 Jul 2004 03:32:48 -0500
From: Stephanus Fengler <fengler@uiuc.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm 1.0.3 kernel panic
References: <e864da97.629bdce6.81c4000@expms1.cites.uiuc.edu>
In-Reply-To: <e864da97.629bdce6.81c4000@expms1.cites.uiuc.edu>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ok, finally I have managed it.
So if I am not too much mistaken following scenario happened:
I added the new hard disk  to volume group vg01 which contains my 
logical root partition.
Therefore the configuration file in /etc/lvmconf/vg01.conf and the 
runtime configuration /etc/lvmtab.d/vg01.tmp grew in size (from 1.5MB to 
2.6 MB).
But I did not rerun lvmcreate_initrd to increase the initial ramdisk 
size. During the boot process the ramdisk is used to load and/or create 
/etc/lvmtab.d/vg01.tmp.
But it did not fit anymore into the ramdisk. Therefore it stopped 
booting with the kernel panic. The same reason why the knoppix cd wasn't 
able to create it, but fortunately the redhat linux rescue cd.

Solution:
reboot with rescue cd,
vgscan
vgchange -a y
mount /dev/vg01/lv_root /mnt/sysimage
chroot /mnt/sysimage /bin/bash
lvremove /dev/vg01/lv_data
reboot

Rerun of lvmcreate_initrd in chroot environment did not work for me at 
least.
Anyway, I stopped using lvm on my system hence it is not really 
necessary but was preinstalled.

Well, thanks for let me figure that out by myself.
At least a statement if understood the behaviour correctly would be fine.

Thanks,
Stephanus

Stephanus Fengler wrote:

>I got a knoppix rescue cd with lvm version 1.0.8 running now
>and a sshd server to rescue my data. Problem is that this
>version is not compatible with my volume group:
>
>vgscan:
>
>vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
>vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- scanning for all active volume group(s) first
>vgscan -- reading data of volume group "vg01" from physical
>volume(s)
>vgscan -- found inactive volume group "vg01"
>vgscan -- getting block device numbers for logical volumes
>
>vgscan -- checking block device numbers of logical volumes
>
>vgscan -- inserting "vg01" into lvmtab
>vgscan -- backing up volume group "vg01"
>vgscan -- checking volume group name "vg01"
>vgscan -- checking volume group consistency of "vg01"
>vgscan -- checking existence of "/etc/lvmtab.d"
>vgscan -- storing volume group data of "vg01" in
>"/etc/lvmtab.d/vg01.tmp"
>vgscan -- storing physical volume data of "vg01" in
>"/etc/lvmtab.d/vg01.tmp"
>vgscan -- storing logical volume data of volume group "vg01"
>in "/etc/lvmtab.d/vg01.tmp"
>vgscan -- ERROR 2 writing volume group backup file
>/etc/lvmtab.d/vg01.tmp in vg_cfgbackup.c [line 271]
>vgscan -- ERROR: unable to do a backup of volume group "vg01"
>vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume
>group "vg01" from "/etc/lvmtab"
>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>vgscan -- WARNING: This program does not do a VGDA backup of
>your volume group
>
>the error looks the same so I assume that something is
>incompatible in my old system. I never changed lvm version as
>far as I know of... but it might be possible.
>
>Is there a way to access this volume group now?
>
>Any help is really appreciated.
>
>Stephanus
>
>---- Original message ----
>  
>
>>Date: Mon, 19 Jul 2004 16:46:31 -0500
>>From: Stephanus Fengler <fengler@uiuc.edu>  
>>Subject: Re: [linux-lvm] lvm 1.0.3 kernel panic  
>>To: LVM general discussion and development <linux-lvm@redhat.com>
>>
>>Here is additionally an output of:
>>vgcfgrestore -f /mnt/sysimage/etc/lvmconf/vg01.conf -n vg01 -ll
>>
>>--- Volume group ---
>>VG Name               vg01
>>VG Access             read/write
>>VG Status             NOT available/resizable
>>VG #                  0
>>MAX LV                256
>>Cur LV                3
>>Open LV               0
>>MAX LV Size           255.99 GB
>>Max PV                256
>>Cur PV                4
>>Act PV                4
>>VG Size               501.92 GB
>>PE Size               4 MB
>>Total PE              128491
>>Alloc PE / Size       128491 / 501.92 GB
>>Free  PE / Size       0 / 0
>>VG UUID               vsZRhX-6bfh-jqhD-Cn1Z-0h9E-tiE6-isU7hJ
>>
>>--- Logical volume ---
>>LV Name                /dev/vg01/lv_root
>>VG Name                vg01
>>LV Write Access        read/write
>>LV Status              available
>>LV #                   1
>># open                 0
>>LV Size                33.66 GB
>>Current LE             8617
>>Allocated LE           8617
>>Allocation             next free
>>Read ahead sectors     10000
>>Block device           58:0
>>
>>--- Logical volume ---
>>LV Name                /dev/vg01/lv_data2
>>VG Name                vg01
>>LV Write Access        read/write
>>LV Status              available
>>LV #                   2
>># open                 0
>>LV Size                235.38 GB
>>Current LE             60257
>>Allocated LE           60257
>>Allocation             next free
>>Read ahead sectors     10000
>>Block device           58:1
>>
>>--- Logical volume ---
>>LV Name                /dev/vg01/lv_data
>>VG Name                vg01
>>LV Write Access        read/write
>>LV Status              available
>>LV #                   3
>># open                 0
>>LV Size                232.88 GB
>>Current LE             59617
>>Allocated LE           59617
>>Allocation             next free
>>Read ahead sectors     10000
>>Block device           58:2
>>
>>
>>--- Physical volume ---
>>PV Name               /dev/hda3
>>VG Name               vg01
>>PV Size               33.67 GB [70605675 secs] / NOT usable
>>    
>>
>4.19 MB 
>  
>
>>[LVM: 161 KB]
>>PV#                   1
>>PV Status             available
>>Allocatable           yes (but full)
>>Cur LV                1
>>PE Size (KByte)       4096
>>Total PE              8617
>>Free PE               0
>>Allocated PE          8617
>>PV UUID               ouWY4f-vGwm-Rq3p-eX3M-tDaI-BQ3i-D7gT4f
>>
>>--- Physical volume ---
>>PV Name               /dev/hda1
>>VG Name               vg01
>>PV Size               2.50 GB [5253192 secs] / NOT usable
>>    
>>
>4.19 MB [LVM: 
>  
>
>>130 KB]
>>PV#                   2
>>PV Status             available
>>Allocatable           yes (but full)
>>Cur LV                1
>>PE Size (KByte)       4096
>>Total PE              640
>>Free PE               0
>>Allocated PE          640
>>PV UUID               6WZGDT-Sev3-jYXj-VquB-FQj2-Wbeq-cdgNLK
>>
>>--- Physical volume ---
>>PV Name               /dev/hdb
>>VG Name               vg01
>>PV Size               232.89 GB [488397168 secs] / NOT usable
>>    
>>
>4.38 MB 
>  
>
>>[LVM: 360 KB]
>>PV#                   3
>>PV Status             available
>>Allocatable           yes (but full)
>>Cur LV                1
>>PE Size (KByte)       4096
>>Total PE              59617
>>Free PE               0
>>Allocated PE          59617
>>PV UUID               nV1chY-OlRj-tLrb-cdSM-D3IN-Mvwb-U2nxfE
>>
>>--- Physical volume ---
>>PV Name               /dev/hdc
>>VG Name               vg01
>>PV Size               232.89 GB [488397168 secs] / NOT usable
>>    
>>
>4.38 MB 
>  
>
>>[LVM: 360 KB]
>>PV#                   4
>>PV Status             NOT available
>>Allocatable           yes (but full)
>>Cur LV                1
>>PE Size (KByte)       4096
>>Total PE              59617
>>Free PE               0
>>Allocated PE          59617
>>PV UUID               XMs7mJ-PdbD-voTc-IUY7-sLiu-Gg1P-99nwc5
>>
>>I have checked the output of some older config files like 
>>vg01.conf.[1-6].old and have found one without the additional
>>    
>>
>hard disk. 
>  
>
>>Hence no data is stored on that disk yet, I wouldn't mind to
>>    
>>
>overwrite 
>  
>
>>the configuration, but is it save doing it? I definitely
>>    
>>
>worried about 
>  
>
>>data loss then.
>>
>>Thanks,
>>Stephanus
>>
>>
>>Stephanus Fengler wrote:
>>
>>    
>>
>>>Hi experts,
>>>
>>>I added a new hard disk to my system and created it
>>>      
>>>
>entirely as a new 
>  
>
>>>logical volume. Mounting unmounting everything worked until
>>>      
>>>
>reboot. It 
>  
>
>>>stops now with kerel panic and lines like:
>>>
>>>(null) -- ERROR 2 writing volume group backup file
>>>      
>>>
>/etc/lvmtab.d/vg01.tmp
>  
>
>>>      vg_cfgbackup.c [line271]
>>>
>>>vgscan -- ERROR: unable to do a backup of volume group vg01
>>>vgscan -- ERROR: lvm_tab_vg_remove(): unlink" removing
>>>      
>>>
>volume group 
>  
>
>>>"vg01"  from  "/etc/lvmtab"
>>>
>>>...
>>>
>>>Activating volume groups
>>>   vgchange - no volume groups found
>>>
>>>I understand the kernel panic if lvm is unable to find the
>>>      
>>>
>volume 
>  
>
>>>group vg01 because that's my root system. But I don't get
>>>      
>>>
>the first 
>  
>
>>>error.
>>>I rebooted with my Redhat Installation disk: linux rescue
>>>and can activate the volume group by hand and mount the
>>>      
>>>
>file systems. 
>  
>
>>>So it looks to me everything is consistent in the filesystem.
>>>
>>>So since I am pretty new to lvm, which output do you
>>>      
>>>
>additional need 
>  
>
>>>to help me?
>>>
>>>Thanks in advance,
>>>Stephanus
>>>
>>>lvmdiskscan:
>>>lvmdiskscan -- reading all disks / partitions (this may
>>>      
>>>
>take a while...)
>  
>
>>>lvmdiskscan -- /dev/hdc   [     232.89 GB] USED LVM whole disk
>>>lvmdiskscan -- /dev/hda1  [       2.50 GB] Primary  LVM
>>>      
>>>
>partition [0x8E]
>  
>
>>>lvmdiskscan -- /dev/hda2  [     101.97 MB] Primary  LINUX
>>>      
>>>
>native 
>  
>
>>>partition [0x83]
>>>lvmdiskscan -- /dev/hda3  [      33.67 GB] Primary  LVM
>>>      
>>>
>partition [0x8E]
>  
>
>>>lvmdiskscan -- /dev/hda4  [    1019.75 MB] Primary 
>>>      
>>>
>Windows98 extended 
>  
>
>>>partition [0x0F]
>>>lvmdiskscan -- /dev/hda5  [    1019.72 MB] Extended LINUX swap 
>>>partition [0x82]
>>>lvmdiskscan -- /dev/hdb   [     232.89 GB] USED LVM whole disk
>>>lvmdiskscan -- /dev/loop0 [      59.08 MB] free loop device
>>>lvmdiskscan -- 3 disks
>>>lvmdiskscan -- 2 whole disks
>>>lvmdiskscan -- 1 loop device
>>>lvmdiskscan -- 0 multiple devices
>>>lvmdiskscan -- 0 network block devices
>>>lvmdiskscan -- 5 partitions
>>>lvmdiskscan -- 2 LVM physical volume partitions
>>>
>>>pvscan:
>>>pvscan -- reading all physical volumes (this may take a
>>>      
>>>
>while...)
>  
>
>>>pvscan -- inactive PV "/dev/hdc"  of VG "vg01" [232.88 GB /
>>>      
>>>
>0 free]
>  
>
>>>pvscan -- inactive PV "/dev/hda1" of VG "vg01" [2.50 GB / 0
>>>      
>>>
>free]
>  
>
>>>pvscan -- inactive PV "/dev/hda3" of VG "vg01" [33.66 GB /
>>>      
>>>
>0 free]
>  
>
>>>pvscan -- inactive PV "/dev/hdb"  of VG "vg01" [232.88 GB /
>>>      
>>>
>0 free]
>  
>
>>>pvscan -- total: 4 [501.94 GB] / in use: 4 [501.94 GB] / in
>>>      
>>>
>no VG: 0 [0]
>  
>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@redhat.com
>>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>      
>>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>
