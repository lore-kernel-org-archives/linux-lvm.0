Return-Path: <dave@searchengine.com>
Message-ID: <3B680D93.53F3122B@searchengine.com>
Date: Wed, 01 Aug 2001 14:09:23 +0000
From: Dave <dave@searchengine.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with vgimport/export
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
To: linux-lvm@sistina.com

Hi,

I have a machine with one boot disk and an LVM (0.9.1_beta2) array of 3
hardware RAID boxes. The boot disk, a non-LVM IDE drive recently started
locking up. I guessed it was about to fail (the clicking noises sort of gave
that away), so I figured I'd install a new disk. I checked out the LVM HOWTOs
with regards to moving the LVM array to a different machine (which I assume
also applies to replacing a broken boot disk in a machine, effectively moving
the array to a new system). I deactivated and exported the array successfully.
As a test, I tried re-importing it right after exporting it. No luck!
"vgimport comms /dev/sd[abc]1" gave error 14 and told me "vgimport -- ERROR
"vg_read(): PV" reading data of volume group "comms".
I didn't have much chance to try anything else as the hard-drive crashed
unrecoverably a few minutes later.

So, I installed SuSE 7.1 (and upgraded the kernel from 2.4.0 to 2.4.7) on a
new IDE drive and booted the machine. I still cannot get the vg to be
recognized. According to the FAQ, the vgimport command should have done
everything for me. Why could it not even import an array it had *just*
exported, never mind doing it on another machine?...

I've looked through the mailing list for solutions to my problem, but nothing
I've tried has been successful. The import/export FAQ said nothing of
/etc/lvmtab or /etc/lvmtab.d/* files, and these are unavailable now as the
previous hard-drive cannot be mounted or even read from. I've tried the
contrib tool "uuid_fixer", and it seemed to run OK, but didn't fix the
problem.

I upgraded LVM to 0.9.1_beta8 (kernel patches and user tools), but then pvscan
wouldn't even work, so I downgraded back to the SuSE-supplied version
(0.9.1_beta2). At least I can see the PVs now!


Some useful data (There's a vgscan -d here, so this email will be pretty
long!) -

> cat /proc/lvm/global

LVM driver version 0.9.1_beta2 (18/01/2001)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 146 bytes malloced   IOP version: 10   1:38:05 active


> pvscan

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda1"  is in EXPORTED VG "comms" [67.83 GB / 0
free]
pvscan -- inactive PV "/dev/sdb1"  is in EXPORTED VG "comms" [67.83 GB / 0
free]
pvscan -- inactive PV "/dev/sdc1"  is in EXPORTED VG "comms" [67.83 GB / 0
free]
pvscan -- total: 3 [203.5 GB] / in use: 3 [203.5 GB] / in no VG: 0 [0]


> pvscan -vv

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- getting data for physical volume "/dev/sda1" from kernel
pvscan -- physical volume "/dev/sda1" is not active
--- Physical volume ---
PV Name               /dev/sda1
VG Name               commsPV_EXP
PV Size               67.83 GB / NOT usable 716 KB [LVM: 188 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              17365
Free PE               0
Allocated PE          17365
PV UUID               6Y6Snq-AZde-xawJ-AOmM-qDzH-ozlE-2JFQMK
System Id             PV_EXPnew-uk-db996593977


pvscan -- getting data for physical volume "/dev/sdb1" from kernel
pvscan -- physical volume "/dev/sdb1" is not active
--- Physical volume ---
PV Name               /dev/sdb1
VG Name               commsPV_EXP
PV Size               67.83 GB / NOT usable 716 KB [LVM: 188 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              17365
Free PE               0
Allocated PE          17365
PV UUID               i66huc-cO93-3g65-jxIk-9dHj-0ITx-5RUrQ5
System Id             PV_EXPnew-uk-db996593977


pvscan -- getting data for physical volume "/dev/sdc1" from kernel
pvscan -- physical volume "/dev/sdc1" is not active
--- Physical volume ---
PV Name               /dev/sdc1
VG Name               commsPV_EXP
PV Size               67.83 GB / NOT usable 716 KB [LVM: 188 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              17365
Free PE               0
Allocated PE          17365
PV UUID               WfKCnN-4pPy-GJW1-ZInL-Ks0e-d7a6-TB6tGJ
System Id             PV_EXPnew-uk-db996593977


pvscan -- total: 3 [203.5 GB] / in use: 3 [203.5 GB] / in no VG: 0 [0]


> vgscan

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found


> vgimport comms /dev/sd[abc]1

vgimport -- ERROR "vg_read(): PV" reading data of volume group "comms"
[returns error 14]


> pvdisplay /dev/sd[abc]1

pvdisplay -- physical volume "/dev/sda1" of volume group "comms" is exported

pvdisplay -- physical volume "/dev/sdb1" of volume group "comms" is exported

pvdisplay -- physical volume "/dev/sdc1" of volume group "comms" is exported



> vgscan -d

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 9
<22> pv_read_all_pv -- calling stat with "/dev/sda"
<333> pv_read -- CALLED with /dev/sda
<4444> pv_check_name -- CALLED with "/dev/sda"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sda
<55555> pv_check_name -- CALLED with "/dev/sda"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sda
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sda1"
<333> pv_read -- CALLED with /dev/sda1
<4444> pv_check_name -- CALLED with "/dev/sda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sda1
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sda1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 1
<333> pv_read -- LEAVING with ret: -279
<333> pv_get_size -- CALLED with /dev/sda1 and BFFFF56C
<4444> pv_check_name -- CALLED with "/dev/sda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/sda1
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED with "/dev/sda1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sda1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<666666> lvm_dir_cache -- LEAVING with ret: 9
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 1
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 9
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 142255512
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 142255512
<333> pv_check_volume -- CALLED  dev_name: "/dev/sda1"  pv: 804BC50
<4444> pv_check_name -- CALLED with "/dev/sda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "commsPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sda1 commsPV_EXP
<22> pv_read_all_pv -- calling stat with "/dev/sdb"
<333> pv_read -- CALLED with /dev/sdb
<4444> pv_check_name -- CALLED with "/dev/sdb"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdb
<55555> pv_check_name -- CALLED with "/dev/sdb"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdb
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:16
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sdb1"
<333> pv_read -- CALLED with /dev/sdb1
<4444> pv_check_name -- CALLED with "/dev/sdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdb1
<55555> pv_check_name -- CALLED with "/dev/sdb1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdb1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:17
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 1
<333> pv_read -- LEAVING with ret: -279
<333> pv_get_size -- CALLED with /dev/sdb1 and BFFFF56C
<4444> pv_check_name -- CALLED with "/dev/sdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/sdb1
<55555> pv_check_name -- CALLED with "/dev/sdb1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED with "/dev/sdb1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<666666> lvm_dir_cache -- LEAVING with ret: 9
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 1
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 9
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sdb1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 142255512
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 142255512
<333> pv_check_volume -- CALLED  dev_name: "/dev/sdb1"  pv: 804C5F8
<4444> pv_check_name -- CALLED with "/dev/sdb1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "commsPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sdb1 commsPV_EXP
<22> pv_read_all_pv -- calling stat with "/dev/sdc"
<333> pv_read -- CALLED with /dev/sdc
<4444> pv_check_name -- CALLED with "/dev/sdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdc
<55555> pv_check_name -- CALLED with "/dev/sdc"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdc
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:32
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/sdc1"
<333> pv_read -- CALLED with /dev/sdc1
<4444> pv_check_name -- CALLED with "/dev/sdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/sdc1
<55555> pv_check_name -- CALLED with "/dev/sdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/sdc1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:33
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc1
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 1
<333> pv_read -- LEAVING with ret: -279
<333> pv_get_size -- CALLED with /dev/sdc1 and BFFFF56C
<4444> pv_check_name -- CALLED with "/dev/sdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_part -- CALLED with /dev/sdc1
<55555> pv_check_name -- CALLED with "/dev/sdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache_find -- CALLED
<666666> pv_check_name -- CALLED with "/dev/sdc1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> lvm_dir_cache -- CALLED
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<7777777> lvm_add_dir_cache -- CALLED
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache_hit -- CALLED
<88888888> lvm_dir_cache_hit -- LEAVING with ret: 1
<7777777> lvm_add_dir_cache -- LEAVING
<666666> lvm_dir_cache -- LEAVING with ret: 9
<55555> lvm_dir_cache_find -- LEAVING
<55555> lvm_partition_count -- CALLED
<55555> lvm_partition_count -- LEAVING with ret: 16
<4444> pv_check_part -- LEAVING with 1
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 9
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sdc1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 142255512
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 142255512
<333> pv_check_volume -- CALLED  dev_name: "/dev/sdc1"  pv: 804CD10
<4444> pv_check_name -- CALLED with "/dev/sdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "commsPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/sdc1 commsPV_EXP
<22> pv_read_all_pv -- calling stat with "/dev/hda"
<333> pv_read -- CALLED with /dev/hda
<4444> pv_check_name -- CALLED with "/dev/hda"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda
<55555> pv_check_name -- CALLED with "/dev/hda"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hda1"
<333> pv_read -- CALLED with /dev/hda1
<4444> pv_check_name -- CALLED with "/dev/hda1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda1
<55555> pv_check_name -- CALLED with "/dev/hda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/hda2"
<333> pv_read -- CALLED with /dev/hda2
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hda2
<55555> pv_check_name -- CALLED with "/dev/hda2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hda2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:2
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<666666> lvm_add_dir_cache -- CALLED
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache_hit -- CALLED
<7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
<666666> lvm_add_dir_cache -- LEAVING
<55555> lvm_dir_cache -- LEAVING with ret: 9
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda2
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 3
<22> pv_read_all_pv -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- checking vg_name: commsPV_EXP[0/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( commsPV_EXP)
<22> vg_check_exist -- CALLED with commsPV_EXP
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "commsPV_EXP"
<4444> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "commsPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "commsPV_EXP"
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "commsPV_EXP"
<666666> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> pv_read_all_pv -- CALLED
<55555> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<55555> pv_read_all_pv -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED with "/dev/sda1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sda1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "commsPV_EXP"
<7777777> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<55555> pv_read_uuidlist -- CALLED with /dev/sda1
<666666> pv_check_name -- CALLED with "/dev/sda1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sda1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read -- CALLED with /dev/sda1
<7777777> pv_check_name -- CALLED with "/dev/sda1"
<88888888> lvm_check_chars -- CALLED with name: "/dev/sda1"
<88888888> lvm_check_chars -- LEAVING with ret: 0
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<7777777> pv_check_name -- LEAVING with ret: 0
<7777777> pv_read_already_red -- CALLED
<7777777> pv_read_already_red -- LEAVING with ret: 1
<666666> pv_read -- going to read /dev/sda1
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> pv_copy_from_disk -- CALLED
<7777777> pv_copy_from_disk -- LEAVING
<7777777> pv_create_name_from_kdev_t -- CALLED with 8:1
<88888888> lvm_check_dev -- CALLED
<88888888> lvm_check_dev -- LEAVING with ret: 1
<88888888> lvm_dir_cache -- CALLED
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<999999999> lvm_add_dir_cache -- CALLED
<AAAAAAAAAA> lvm_check_dev -- CALLED
<AAAAAAAAAA> lvm_check_dev -- LEAVING with ret: 1
<AAAAAAAAAA> lvm_dir_cache_hit -- CALLED
<AAAAAAAAAA> lvm_dir_cache_hit -- LEAVING with ret: 1
<999999999> lvm_add_dir_cache -- LEAVING
<88888888> lvm_dir_cache -- LEAVING with ret: 9
<7777777> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<7777777> system_id_check_exported -- CALLED
<7777777> system_id_check_exported -- LEAVING with ret: 1
<666666> pv_read -- LEAVING with ret: -279
<55555> pv_read_uuidlist -- LEAVING with ret: -279
<4444> pv_read_all_pv_of_vg: /dev/sda1[0] hit commsPV_EXP[0]
<4444> pv_read_all_pv_of_vg: /dev/sdb1[1] hit commsPV_EXP[1]
<4444> pv_read_all_pv_of_vg: /dev/sdc1[2] hit commsPV_EXP[2]
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/sda1"
<333> vg_read -- pv[1]->pv_name: "/dev/sdb1"
<333> vg_read -- pv[2]->pv_name: "/dev/sdc1"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/sda1
<666666> pv_check_name -- CALLED with "/dev/sda1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sda1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/sda1
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING
<666666> pv_create_name_from_kdev_t -- CALLED with 8:1
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<7777777> lvm_dir_cache -- LEAVING with ret: 9
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 1
<55555> pv_read -- LEAVING with ret: -279
<4444> vg_read_from_pv -- LEAVING with ret: -362
<333> vg_read -- LEAVING with ret: -362
<22> vg_check_exist -- LEAVING with ret: -362
<1> vg_check_exist_all_vg -- checking vg_name: commsPV_EXP[1/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( commsPV_EXP)
<22> vg_check_exist -- CALLED with commsPV_EXP
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "commsPV_EXP"
<4444> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "commsPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "commsPV_EXP"
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "commsPV_EXP"
<666666> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/sda1"
<333> vg_read -- pv[1]->pv_name: "/dev/sdb1"
<333> vg_read -- pv[2]->pv_name: "/dev/sdc1"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/sda1
<666666> pv_check_name -- CALLED with "/dev/sda1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sda1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/sda1
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING
<666666> pv_create_name_from_kdev_t -- CALLED with 8:1
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<7777777> lvm_dir_cache -- LEAVING with ret: 9
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 1
<55555> pv_read -- LEAVING with ret: -279
<4444> vg_read_from_pv -- LEAVING with ret: -362
<333> vg_read -- LEAVING with ret: -362
<22> vg_check_exist -- LEAVING with ret: -362
<1> vg_check_exist_all_vg -- checking vg_name: commsPV_EXP[2/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( commsPV_EXP)
<22> vg_check_exist -- CALLED with commsPV_EXP
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "commsPV_EXP"
<4444> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "commsPV_EXP"
<55555> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "commsPV_EXP"
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "commsPV_EXP"
<666666> lvm_check_chars -- CALLED with name: "commsPV_EXP"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/sda1"
<333> vg_read -- pv[1]->pv_name: "/dev/sdb1"
<333> vg_read -- pv[2]->pv_name: "/dev/sdc1"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sda1"
<666666> lvm_check_chars -- CALLED with name: "/dev/sda1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/sda1
<666666> pv_check_name -- CALLED with "/dev/sda1"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sda1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/sda1
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING
<666666> pv_create_name_from_kdev_t -- CALLED with 8:1
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<88888888> lvm_add_dir_cache -- CALLED
<999999999> lvm_check_dev -- CALLED
<999999999> lvm_check_dev -- LEAVING with ret: 1
<999999999> lvm_dir_cache_hit -- CALLED
<999999999> lvm_dir_cache_hit -- LEAVING with ret: 1
<88888888> lvm_add_dir_cache -- LEAVING
<7777777> lvm_dir_cache -- LEAVING with ret: 9
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 1
<55555> pv_read -- LEAVING with ret: -279
<4444> vg_read_from_pv -- LEAVING with ret: -362
<333> vg_read -- LEAVING with ret: -362
<22> vg_check_exist -- LEAVING with ret: -362
<1> vg_check_exist_all_vg -- LEAVING with (null)
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
vgscan -- no volume groups found

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
vgscan -- reading all physical volumes (this may take a while...)



Cheers,
Dave

-- 
Dave Woodhead
Senior Developer, Searchengine.com Limited.
Tel: +44 (0) 20 8213 2300 Fax: +44 (0) 20 8213 2301

"Why not search-enable your web site? It's free and takes
five minutes - http://services.searchengine.com"

Searchengine.com Limited - http://www.searchengine.com
