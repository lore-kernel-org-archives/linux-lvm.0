From: Matthew Kennedy <mkennedy@opushealthcare.com>
Content-Type: multipart/mixed; boundary="=-2zdP1D4igH5oBr/SCySs"
Message-Id: <1010527606.19493.46.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] ERROR "pv_read(): PV identifier invalid" reading physical volumes
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
Date: Tue Jan  8 16:00:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-2zdP1D4igH5oBr/SCySs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I'm having some trouble getting LVM to work on a Debian system. The
actions I performed are bellow (--verbose --debug versions are
attached). Bascically, I get "ERROR "pv_read(): PV identifier invalid"
reading physical volumes" when I run vgcreate even though the PV I
initialized succeeded.

My user tools are IOP10. Kernel is 2.4.17.

Thanks

Matt


debian:~# fdisk -l /dev/hda
Disk /dev/hda: 255 heads, 63 sectors, 2431 cylinders
Units = cylinders of 16065 * 512 bytes
   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1        16    128488+  83  Linux
/dev/hda2            17       140    996030   83  Linux
/dev/hda3           141      2431  18402457+  8e  Linux LVM

debian:~# uname -a
Linux debian 2.4.17-686 #2 Sat Dec 22 21:58:49 EST 2001 i686 unknown

debian:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

debian:~# pvcreate /dev/hda3
pvcreate -- physical volume "/dev/hda3" successfully created

debian:~# vgcreate vgroup0 /dev/hda3
vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical
volumes

debian:~# lvmdiskscan 
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hdc [     530.60 MB] free whole disk
lvmdiskscan -- no valid disks / partitions found
lvmdiskscan -- please check your disk device special files!


--=-2zdP1D4igH5oBr/SCySs
Content-Disposition: attachment; filename=lvm-debug.txt
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1

debian:~# fdisk -l /dev/hda

Disk /dev/hda: 255 heads, 63 sectors, 2431 cylinders
Units =3D cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1        16    128488+  83  Linux
/dev/hda2            17       140    996030   83  Linux
/dev/hda3           141      2431  18402457+  8e  Linux LVM




debian:~# uname -a
Linux debian 2.4.17-686 #2 Sat Dec 22 21:58:49 EST 2001 i686 unknown







debian:~# vgscan --verbose --debug
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
<1> lvm_dont_interrupt -- LEAVING
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: 0
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING with ret: 0
vgscan -- reading all physical volumes (this may take a while...)
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED with /dev/hdc
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING with ret: ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/di=
sc
<4444> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/pa=
rt1
<4444> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/pa=
rt2
<4444> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/pa=
rt3
<4444> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<4444> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/pa=
rt3
<4444> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_dir_cache -- LEAVING with ret: 1
<22> pv_read_all_pv -- calling stat with "/dev/hdc"
<333> pv_read -- CALLED with /dev/hdc
<4444> pv_check_name -- CALLED with "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdc
<55555> pv_check_name -- CALLED with "/dev/hdc"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING ret =3D 0x804bf60
<4444> pv_create_name_from_kdev_t -- CALLED with 22:0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 1
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<22> pv_read_all_pv -- LEAVING with ret: -268
<1> vg_check_exist_all_vg -- LEAVING with 0 VGs
<1> vg_free -- CALLED
<1> vg_free -- LEAVING with ret: -99
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume gr=
oup

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104







debian:~# pvcreate --verbose --debug /dev/hda3
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
pvcreate -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
pvcreate -- checking physical volume name "/dev/hda3"
<1> pv_check_name -- CALLED with "/dev/hda3"
<22> lvm_check_chars -- CALLED with name: "/dev/hda3"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 0
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
pvcreate -- getting physical volume size
<1> pv_get_size -- CALLED with /dev/hda3 and 0xbffff8c0
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/dis=
c
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t2
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t3
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t3
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_dir_cache -- LEAVING with ret: 1
<22> lvm_dir_cache_find -- CALLED with /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 1
<22> lvm_dir_cache_find -- LEAVING with entry: -1
<22> pv_get_dev_size -- CALLED with /dev/hda3 and 0xbffff8c0
<22> pv_get_dev_size -- LEAVING with ret: 36804915
<1> pv_get_size -- LEAVING with ret: 36804915
<1> pv_create_kdev_t -- CALLED with "/dev/hda3"
<22> pv_check_name -- CALLED with "/dev/hda3"
<333> lvm_check_chars -- CALLED with name: "/dev/hda3"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 303
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x303
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_partition_count -- LEAVING with ret: 64
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 1
pvcreate -- checking partition type
<1> pv_read -- CALLED with /dev/hda3
<22> pv_check_name -- CALLED with "/dev/hda3"
<333> lvm_check_chars -- CALLED with name: "/dev/hda3"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_read_already_red -- CALLED with PV /dev/hda3
<22> pv_read_already_red -- LEAVING with ret: 0
<22> pv_flush -- CALLED to flush /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_flush -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/hda3
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 0
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<22> pv_copy_from_disk -- CALLED
<22> pv_copy_from_disk -- LEAVING ret =3D 0x804c500
<22> pv_create_name_from_kdev_t -- CALLED with 3:3
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 1
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: (null)
<1> pv_read -- LEAVING with ret: -278
<1> pv_check_active -- CALLED
<22> pv_status -- CALLED with VG , PV: "/dev/hda3"
<333> vg_check_name -- CALLED with VG:=20
<4444> lvm_check_chars -- CALLED with name: ""
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_status -- LEAVING with ret: -296
<1> pv_check_active -- LEAVING with ret: -296
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: ""
<22> vg_check_name -- CALLED with VG:=20
<333> lvm_check_chars -- CALLED with name: ""
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804BC00  size: 1
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/hda3 with 36804915 sectors
<1> pv_setup_for_create -- CALLED for DEV /dev/hda3, size 36804915
<22> pv_check_name -- CALLED with "/dev/hda3"
<333> lvm_check_chars -- CALLED with name: "/dev/hda3"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> system_id_set -- CALLED
<22> system_id_set -- LEAVING with ret: 0
<22> pv_create_kdev_t -- CALLED with "/dev/hda3"
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_create_kdev_t -- LEAVING with ret: 303
<22> lvm_create_uuid -- CALLED
<22> lvm_create_uuid -- LEAVING with uuidstr: "2SbAsD-bExf-SBkU-mXg5-Dr1X-k=
chv-WhKi0q"
<1> pv_setup_for_create -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
pvcreate -- writing physical volume data to disk "/dev/hda3"
<1> pv_write -- CALLED with /dev/hda3 BFFFF8D0
<22> pv_check_name -- CALLED with "/dev/hda3"
<333> lvm_check_chars -- CALLED with name: "/dev/hda3"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_consistency -- CALLED
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG:=20
<4444> lvm_check_chars -- CALLED with name: ""
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 1
<22> pv_check_consistency -- LEAVING with ret: 0
<22> lvm_check_uuid -- CALLED with uuidstr: "2SbAsDbExfSBkUmXg5Dr1XkchvWhKi=
0q"
<22> lvm_check_uuid -- LEAVING with ret: 0
<22> pv_copy_to_disk -- CALLED
<22> pv_copy_to_disk -- LEAVING
<1> pv_write -- LEAVING with ret: 0
pvcreate -- physical volume "/dev/hda3" successfully created
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
pvcreate -- unlocking logical volume manager
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104










debian:~# vgcreate --verbose --debug vgroup0 /dev/hda3
vgcreate -- checking volume group name
<1> vg_check_name -- CALLED with VG: vgroup0
<22> lvm_check_chars -- CALLED with name: "vgroup0"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
vgcreate -- checking volume group directory existence
<1> vg_check_dir -- CALLED with VG: vgroup0
<22> vg_check_name -- CALLED with VG: vgroup0
<333> lvm_check_chars -- CALLED with name: "vgroup0"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<1> vg_check_dir -- vg_name: "vgroup0"
<1> vg_check_dir -- LEAVING with ret: 0
vgcreate -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
vgcreate -- checking volume group "vgroup0" existence
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: "vgroup0"
<22> vg_check_name -- CALLED with VG: vgroup0
<333> lvm_check_chars -- CALLED with name: "vgroup0"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804D458  size: 1
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
vgcreate -- counting all existing volume groups
<1> lvm_tab_vg_check_exist_all_vg -- CALLED
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804D458  size: 1
<1> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
vgcreate -- reading all physical volume data from disks
<1> pv_read_all_pv -- CALLED
<1> pv_read_all_pv -- calling lvm_dir_cache
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/hdc
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/dis=
c
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t1
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t2
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t3
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/par=
t3
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_dir_cache -- LEAVING with ret: 1
<1> pv_read_all_pv -- calling stat with "/dev/hdc"
<22> pv_read -- CALLED with /dev/hdc
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/hdc
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hdc
<4444> pv_check_name -- CALLED with "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804dde0
<333> pv_create_name_from_kdev_t -- CALLED with 22:0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 1
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<1> pv_read_all_pv -- LEAVING with ret: -268
<1> lvm_error -- CALLED with: -268
<1> lvm_error -- LEAVING with: "pv_read(): PV identifier invalid"
vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical volum=
es

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0








debian:~# lvmdiskscan --debug --verbose
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- filling directory cache...
<1> lvm_dir_cache -- CALLED
<22> lvm_add_dir_cache -- CALLED with /dev/hdc
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> lvm_add_dir_cache -- LEAVING with ret: ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/disc
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part=
1
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part=
2
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part=
3
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/ide/host0/bus0/target0/lun0/part=
3
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<1> lvm_dir_cache -- LEAVING with ret: 1
lvmdiskscan -- walking through all found disks / partitions
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_check_whole_disk_dev -- CALLED
<22> lvm_partition_count -- CALLED for 0x1600
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 0
<22> lvm_partition_count -- LEAVING with ret: 64
<1> lvm_check_whole_disk_dev -- LEAVING with ret: TRUE
<1> pv_get_size -- CALLED with /dev/hdc and 0xbffffa9c
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 1
<22> lvm_dir_cache_find -- CALLED with /dev/hdc
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 1
<22> lvm_dir_cache_find -- LEAVING with entry: 0
<22> lvm_check_partitioned_dev -- CALLED
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 0
<22> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_partition_count -- CALLED for 0x1600
<333> lvm_get_device_type called
<333> lvm_get_device_type leaving with 0
<22> lvm_partition_count -- LEAVING with ret: 64
<22> pv_get_dev_size -- CALLED with /dev/hdc and 0xbffffa9c
<22> pv_get_dev_size -- LEAVING with ret: 1086664
<1> pv_get_size -- LEAVING with ret: 1086664
<1> pv_create_kdev_t -- CALLED with "/dev/hdc"
<22> pv_check_name -- CALLED with "/dev/hdc"
<333> lvm_check_chars -- CALLED with name: "/dev/hdc"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: 1600
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<1> lvm_partition_count -- CALLED for 0x1600
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with 0
<1> lvm_partition_count -- LEAVING with ret: 64
<1> lvm_dir_cache -- CALLED
<1> lvm_dir_cache -- LEAVING with ret: 1
<1> pv_read -- CALLED with /dev/hdc
<22> pv_check_name -- CALLED with "/dev/hdc"
<333> lvm_check_chars -- CALLED with name: "/dev/hdc"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_read_already_red -- CALLED with PV /dev/hdc
<22> pv_read_already_red -- LEAVING with ret: 0
<22> pv_flush -- CALLED to flush /dev/hdc
<333> pv_check_name -- CALLED with "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 0
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_flush -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/hdc
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 0
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<22> pv_copy_from_disk -- CALLED
<22> pv_copy_from_disk -- LEAVING ret =3D 0x804b808
<22> pv_create_name_from_kdev_t -- CALLED with 22:0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 0
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 1
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<1> pv_read -- LEAVING with ret: -268
lvmdiskscan -- /dev/hdc [     530.60 MB] free whole disk
lvmdiskscan -- no valid disks / partitions found
lvmdiskscan -- please check your disk device special files!


--=-2zdP1D4igH5oBr/SCySs--
