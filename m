From: Duane Evenson <devenson@shaw.ca>
Message-id: <3EAC2003.5030106@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] vgscan segmentation faults, VG name problems
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
Date: Sun Apr 27 13:17:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm having troubles and can't find the solution in the HOWTO, or the 
archived mailing lists articles.
I installed lvm on an entire hard drive (hde), made one logical group 
with a logical volume of 100G.
I mounted to volume, copied files over OK, but vgscan caused 
segmentation faults.
I rebooted, hoping that it was a conflict between the kernel info and 
physical info. Obviously, it wasn't.
Here are the results of running pvdisplay, pvscan, vgscan, and vgdisplay.

# pvdisplay /dev/hde -v
--- Physical volume ---
PV Name               /dev/hde
VG Name               data_group
PV Size               111.79 GB [234441648 secs] / NOT usable 4.25 MB 
[LVM: 239
KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              28617
Free PE               3017
Allocated PE          25600
PV UUID               x1l2a2-XUzX-XEjZ-hP3k-qAmo-G5jH-U1z1C8

pvdisplay -- "/etc/lvmtab.d/data_group" doesn't exist

# pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hde"  is associated to unknown VG 
"data_group" (run
vgscan)
pvscan -- total: 1 [111.79 GB] / in use: 1 [111.79 GB] / in no VG: 0 [0]

# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "data_group" from physical volume(s)
Segmentation fault

# vgscan -d
...
<55555> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde
<55555> system_id_check_exported -- CALLED
<55555> system_id_check_exported -- LEAVING with ret: 0
<4444> pv_read -- LEAVING with ret: 0
<4444> vg_copy_from_disk -- CALLED
<55555> vg_check_vg_disk_t_consistency -- CALLED
<666666> vg_check_name -- CALLED with VG:
<7777777> lvm_check_chars -- CALLED with name: ""
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> vg_check_vg_disk_t_consistency -- LEAVING with ret: -344
<4444> vg_copy_from_disk -- LEAVING
Segmentation fault

# vgdisplay data_group -h
Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)

vgdisplay -- display volume group information
