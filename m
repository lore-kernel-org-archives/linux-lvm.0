From: "David Orman" <orman@iastate.edu>
Message-Id: <007c01c19947$3637d140$18c8ba81@ormanpc>
MIME-Version: 1.0
Content-Type: multipart/mixed;
    boundary="----=_NextPart_000_007D_01C19914.EB9D6140"
In-Reply-To: <001201c1987d$858e8b50$18c8ba81@ormanpc>
Subject: [linux-lvm] ERROR "pv_read(): PV identifier invalid
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
Date: Sat Jan 12 18:11:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_007D_01C19914.EB9D6140
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a followon to my previous message, but noone seems to think it's
a large drive issue so I changed the subject!

I get the subject error when tring to vgcreate on a new drive.
pvcreate seems to go fine, but vgcreate then fails.

Vgcreate deebug logs is attached.

David Orman
Network Administrator
ISU Center for NDE


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
On
> Behalf Of David Orman
> Sent: Tuesday, January 08, 2002 1:49 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] LVM on large drives
> 
> 
> 
> David Orman
> Network Administrator
> ISU Center for NDE
> 
> 
> Are there Issue on LVM and very large drives?
> 
> Im trying to play with it on a Maxtor 160G IDE and cant hardly get
> started..
> 
> 
> [root@habenero /root]# pvcreate /dev/hdc1
> pvcreate -- physical volume "/dev/hdc1" successfully created
> [root@habenero /root]# vgcreate test /dev/hdc1
> vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical
> volumes
> 
> 
> A little drive info if that helps:
> 
> [root@habenero /root]# cat /proc/ide/ide1/hdc/geometry
> physical     266305/16/63
> logical      266305/16/63
> [root@habenero /root]# cat /proc/ide/ide1/hdc/model
> Maxtor 4G160J8
> 
> Disk /dev/hdc: 16 heads, 63 sectors, 266305 cylinders
> Units = cylinders of 1008 * 512 bytes
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdc1             1    133000  67031968+  83  Linux
> /dev/hdc2        133001    266305  67185720   83  Linux
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

------=_NextPart_000_007D_01C19914.EB9D6140
Content-Type: text/plain;
	name="vgcreate_output.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="vgcreate_output.txt"

<1> vg_check_name -- CALLED with VG: aaa=0A=
<22> lvm_check_chars -- CALLED with name: "aaa"=0A=
<22> lvm_check_chars -- LEAVING with ret: 0=0A=
<1> vg_check_name -- LEAVING with ret: 0=0A=
<1> vg_check_dir -- CALLED with VG: aaa=0A=
<22> vg_check_name -- CALLED with VG: aaa=0A=
<333> lvm_check_chars -- CALLED with name: "aaa"=0A=
<333> lvm_check_chars -- LEAVING with ret: 0=0A=
<22> vg_check_name -- LEAVING with ret: 0=0A=
<1> vg_check_dir -- vg_name: "aaa"=0A=
<1> vg_check_dir -- LEAVING with ret: 0=0A=
<1> lvm_lock -- CALLED=0A=
<22> lvm_check_special -- CALLED=0A=
<22> lvm_check_special -- LEAVING=0A=
<1> lvm_lock -- LEAVING with ret: 0=0A=
<1> lvm_get_iop_version -- CALLED=0A=
<22> lvm_check_special -- CALLED=0A=
<22> lvm_check_special -- LEAVING=0A=
<1> lvm_get_iop_version -- AFTER ioctl ret: 0=0A=
<1> lvm_get_iop_version -- LEAVING with ret: 10=0A=
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: "aaa"=0A=
<22> vg_check_name -- CALLED with VG: aaa=0A=
<333> lvm_check_chars -- CALLED with name: "aaa"=0A=
<333> lvm_check_chars -- LEAVING with ret: 0=0A=
<22> vg_check_name -- LEAVING with ret: 0=0A=
<22> lvm_tab_read -- CALLED=0A=
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804D3D8  size: 1=0A=
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0=0A=
<1> lvm_tab_vg_check_exist_all_vg -- CALLED=0A=
<22> lvm_tab_read -- CALLED=0A=
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804D3D8  size: 1=0A=
<1> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0=0A=
<1> pv_read_all_pv -- CALLED=0A=
<1> pv_read_all_pv -- calling lvm_dir_cache=0A=
<22> lvm_dir_cache -- CALLED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/scsi/host0/bus0/target3/lun0/disc=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/scsi/host0/bus0/target3/lun0/part1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/scsi/host0/bus0/target3/lun0/part2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/scsi/host0/bus0/target3/lun0/part3=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus1/target0/lun0/disc=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus1/target0/lun0/part1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus1/target0/lun0/part2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target0/lun0/disc=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target0/lun0/part1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target0/lun0/part2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target0/lun0/part3=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target0/lun0/part5=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target0/lun0/part6=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target1/lun0/disc=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target1/lun0/part1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target1/lun0/part2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target1/lun0/part3=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target1/lun0/part4=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED=0A=
<333> lvm_add_dir_cache -- CALLED with =
/dev/ide/host0/bus0/target1/lun0/part4=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED=0A=
<22> lvm_dir_cache -- LEAVING with ret: 18=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/scsi/host0/bus0/target3/lun0/disc"=0A=
<22> pv_read -- CALLED with /dev/scsi/host0/bus0/target3/lun0/disc=0A=
<333> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/disc"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/disc"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/scsi/host0/bus0/target3/lun0/disc=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/scsi/host0/bus0/target3/lun0/disc=0A=
<4444> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/disc"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/disc"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 1=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/scsi/host0/bus0/target3/lun0/disc=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 1=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804e0b0=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 8:0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/scsi/host0/bus0/target3/lun0/disc=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/scsi/host0/bus0/target3/lun0/part1"=0A=
<22> pv_read -- CALLED with /dev/scsi/host0/bus0/target3/lun0/part1=0A=
<333> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/part1"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/part1"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/scsi/host0/bus0/target3/lun0/part1=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/scsi/host0/bus0/target3/lun0/part1=0A=
<4444> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/part1"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/part1"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 1=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/scsi/host0/bus0/target3/lun0/part1=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 1=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804e2b8=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 8:1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/scsi/host0/bus0/target3/lun0/part1=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/scsi/host0/bus0/target3/lun0/part2"=0A=
<22> pv_read -- CALLED with /dev/scsi/host0/bus0/target3/lun0/part2=0A=
<333> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/part2"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/part2"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/scsi/host0/bus0/target3/lun0/part2=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/scsi/host0/bus0/target3/lun0/part2=0A=
<4444> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/part2"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/part2"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 1=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/scsi/host0/bus0/target3/lun0/part2=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 1=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804e648=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 8:2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/scsi/host0/bus0/target3/lun0/part2=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/scsi/host0/bus0/target3/lun0/part3"=0A=
<22> pv_read -- CALLED with /dev/scsi/host0/bus0/target3/lun0/part3=0A=
<333> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/part3"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/part3"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/scsi/host0/bus0/target3/lun0/part3=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/scsi/host0/bus0/target3/lun0/part3=0A=
<4444> pv_check_name -- CALLED with =
"/dev/scsi/host0/bus0/target3/lun0/part3"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/scsi/host0/bus0/target3/lun0/part3"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 1=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/scsi/host0/bus0/target3/lun0/part3=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 1=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804ea58=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 8:3=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 1=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/scsi/host0/bus0/target3/lun0/part3=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus1/target0/lun0/disc"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target0/lun0/disc=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/disc"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/disc"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus1/target0/lun0/disc=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target0/lun0/disc=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/disc"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/disc"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus1/target0/lun0/disc=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804e850=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 22:0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus1/target0/lun0/disc=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target0/lun0/part1=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus1/target0/lun0/part1=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target0/lun0/part1=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus1/target0/lun0/part1=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804ef68=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 22:1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus1/target0/lun0/part1=0A=
<333> system_id_check_exported -- CALLED=0A=
<333> system_id_check_exported -- LEAVING with ret: 0=0A=
<22> pv_read -- LEAVING with ret: 0=0A=
<22> pv_get_size -- CALLED with /dev/ide/host0/bus1/target0/lun0/part1 =
and 0xbfffeea0=0A=
<333> lvm_dir_cache -- CALLED=0A=
<333> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> lvm_dir_cache_find -- CALLED with =
/dev/ide/host0/bus1/target0/lun0/part1=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/part1"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> lvm_dir_cache_find -- LEAVING with entry: 5=0A=
<333> lvm_check_partitioned_dev -- CALLED=0A=
<4444> lvm_get_device_type called=0A=
<4444> lvm_get_device_type leaving with 0=0A=
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_partition_count -- CALLED for 0x1601=0A=
<4444> lvm_get_device_type called=0A=
<4444> lvm_get_device_type leaving with 0=0A=
<333> lvm_partition_count -- LEAVING with ret: 64=0A=
<22> pv_get_size -- BEFORE llseek 0:0=0A=
<22> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 134063937=0A=
<22> pv_get_size -- first =3D=3D 1=0A=
<22> pv_get_size -- part_i =3D=3D part_i_tmp=0A=
<22> pv_get_size -- LEAVING with ret: 134063937=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus1/target0/lun0/part2=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus1/target0/lun0/part2=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus1/target0/lun0/part2=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus1/target0/lun0/part2=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804ec60=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 22:2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus1/target0/lun0/part2=0A=
<333> system_id_check_exported -- CALLED=0A=
<333> system_id_check_exported -- LEAVING with ret: 0=0A=
<22> pv_read -- LEAVING with ret: 0=0A=
<22> pv_get_size -- CALLED with /dev/ide/host0/bus1/target0/lun0/part2 =
and 0xbfffeea0=0A=
<333> lvm_dir_cache -- CALLED=0A=
<333> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> lvm_dir_cache_find -- CALLED with =
/dev/ide/host0/bus1/target0/lun0/part2=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus1/target0/lun0/part2"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> lvm_dir_cache_find -- LEAVING with entry: 6=0A=
<333> lvm_check_partitioned_dev -- CALLED=0A=
<4444> lvm_get_device_type called=0A=
<4444> lvm_get_device_type leaving with 0=0A=
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_partition_count -- CALLED for 0x1602=0A=
<4444> lvm_get_device_type called=0A=
<4444> lvm_get_device_type leaving with 0=0A=
<333> lvm_partition_count -- LEAVING with ret: 64=0A=
<22> pv_get_size -- BEFORE llseek 0:0=0A=
<22> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 134063937=0A=
<22> pv_get_size -- first =3D=3D 1=0A=
<22> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 134371440=0A=
<22> pv_get_size -- first =3D=3D 1=0A=
<22> pv_get_size -- part_i =3D=3D part_i_tmp=0A=
<22> pv_get_size -- LEAVING with ret: 134371440=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target0/lun0/disc"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/disc=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/disc"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/disc"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target0/lun0/disc=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/disc=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/disc"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/disc"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/disc=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804f578=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target0/lun0/disc=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target0/lun0/part1"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part1=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part1"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part1"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target0/lun0/part1=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part1=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part1"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part1"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part1=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804f170=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:1=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target0/lun0/part1=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target0/lun0/part2"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part2=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part2"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part2"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target0/lun0/part2=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part2=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part2"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part2"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part2=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804fc88=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:2=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target0/lun0/part2=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target0/lun0/part3"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part3=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part3"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part3"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target0/lun0/part3=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part3=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part3"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part3"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part3=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804f780=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:3=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target0/lun0/part3=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target0/lun0/part5"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part5"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part5"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target0/lun0/part5=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part5=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part5"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part5"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804f988=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:5=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target0/lun0/part5=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target0/lun0/part6"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part6"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part6"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target0/lun0/part6=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part6=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target0/lun0/part6"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target0/lun0/part6"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part6=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x8050518=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:6=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target0/lun0/part6=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target1/lun0/disc"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/disc=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/disc"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/disc"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target1/lun0/disc=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/disc=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/disc"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/disc"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/disc=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x804fe90=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:64=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target1/lun0/disc=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target1/lun0/part1"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/part1=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part1"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part1"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target1/lun0/part1=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/part1=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part1"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part1"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/part1=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x8050098=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:65=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target1/lun0/part1=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target1/lun0/part2"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/part2=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part2"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part2"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target1/lun0/part2=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/part2=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part2"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part2"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/part2=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x80502a0=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:66=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target1/lun0/part2=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target1/lun0/part3"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/part3=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part3"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part3"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target1/lun0/part3=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/part3=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part3"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part3"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/part3=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x8050fa8=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:67=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target1/lun0/part3=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- calling stat with =
"/dev/ide/host0/bus0/target1/lun0/part4"=0A=
<22> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/part4=0A=
<333> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part4"=0A=
<4444> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part4"=0A=
<4444> lvm_check_chars -- LEAVING with ret: 0=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_read_already_red -- CALLED with PV =
/dev/ide/host0/bus0/target1/lun0/part4=0A=
<333> pv_read_already_red -- LEAVING with ret: 0=0A=
<333> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/part4=0A=
<4444> pv_check_name -- CALLED with =
"/dev/ide/host0/bus0/target1/lun0/part4"=0A=
<55555> lvm_check_chars -- CALLED with name: =
"/dev/ide/host0/bus0/target1/lun0/part4"=0A=
<55555> lvm_check_chars -- LEAVING with ret: 0=0A=
<55555> lvm_check_dev -- CALLED=0A=
<666666> lvm_check_partitioned_dev -- CALLED=0A=
<7777777> lvm_get_device_type called=0A=
<7777777> lvm_get_device_type leaving with 0=0A=
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<55555> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> pv_check_name -- LEAVING with ret: 0=0A=
<333> pv_flush -- LEAVING with ret: 0=0A=
<22> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/part4=0A=
<333> lvm_check_dev -- CALLED=0A=
<4444> lvm_check_partitioned_dev -- CALLED=0A=
<55555> lvm_get_device_type called=0A=
<55555> lvm_get_device_type leaving with 0=0A=
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<333> lvm_check_dev -- LEAVING with ret: 1=0A=
<333> pv_copy_from_disk -- CALLED=0A=
<333> pv_copy_from_disk -- LEAVING ret =3D 0x8050720=0A=
<333> pv_create_name_from_kdev_t -- CALLED with 3:68=0A=
<4444> lvm_check_dev -- CALLED=0A=
<55555> lvm_check_partitioned_dev -- CALLED=0A=
<666666> lvm_get_device_type called=0A=
<666666> lvm_get_device_type leaving with 0=0A=
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE=0A=
<4444> lvm_check_dev -- LEAVING with ret: 1=0A=
<4444> lvm_dir_cache -- CALLED=0A=
<4444> lvm_dir_cache -- LEAVING with ret: 18=0A=
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/ide/host0/bus0/target1/lun0/part4=0A=
<22> pv_read -- LEAVING with ret: -268=0A=
<1> pv_read_all_pv -- pv_read returned: -268=0A=
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0=0A=
<1> pv_read_all_pv -- LEAVING with ret: -268=0A=
<1> lvm_error -- CALLED with: -268=0A=
<1> lvm_error -- LEAVING with: "pv_read(): PV identifier invalid"=0A=
vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical =
volumes=0A=
=0A=
<1> lvm_unlock -- CALLED=0A=
<1> lvm_unlock -- LEAVING with ret: 0=0A=

------=_NextPart_000_007D_01C19914.EB9D6140--
