Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24CnZK01223
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 07:49:35 -0500
Message-ID: <CEEE90D87043AA4487634844B31B03631141B17B@ukspkem01.corp.hds.com>
From: Matthias Rudolph <Matthias.Rudolph@hds.com>
Date: Fri, 4 Mar 2005 12:49:00 -0000 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Question
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Linux-LVM@Sistina.com

Hello all,
 
how can I force to activate a VG on a special device file?
One FC Storage Disk is visible over two pathes (sda and sdb). We use our
Path Management Software. It creates sddlmaa. After creating the VG the
sddlmaa is ACTIVE - OK. But after deactivating and activating sdb is ACTIVE.
This means: no pathfailover.
 
Here a typescript:
 
# fdisk -l /dev/sd*
-> scannt nach neuen disks und zeigt sie an

# fdisk /dev/sddlmaa
-> Partition 1 anlegen �ber gesmten Bereich
-> Partitions System ID von 83 (Linux) auf 8e (Linux LVM) �ndern

[root@D-SRV-L-43 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): read" reading physical volumes

[root@D-SRV-L-43 root]# pvcreate /dev/sddlmaa1
pvcreate -- physical volume "/dev/sddlmaa1" successfully created

[root@D-SRV-L-43 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sddlmaa1" is in no VG  [6.87 GB]
pvscan -- inactive PV "/dev/sda1"     is in no VG  [6.87 GB]
pvscan -- inactive PV "/dev/sdb1"     is in no VG  [6.87 GB]
pvscan -- total: 3 [20.61 GB] / in use: 0 [0] / in no VG: 3 [20.61 GB]

[root@D-SRV-L-43 root]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/sddlmaa1 [       6.87 GB] new LVM whole disk
lvmdiskscan -- /dev/sda1     [       6.87 GB] new LVM whole disk
lvmdiskscan -- /dev/sdb1     [       6.87 GB] new LVM whole disk
lvmdiskscan -- /dev/hda1     [     103.33 MB] free whole disk
lvmdiskscan -- 4 disks
lvmdiskscan -- 4 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 6 partitions
lvmdiskscan -- 0 LVM physical volume partitions

[root@D-SRV-L-43 root]# vgcreate vg00 /dev/sddlmaa1
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vg00"
vgcreate -- volume group "vg00" successfully created and activate

[root@D-SRV-L-43 root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg00"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

[root@D-SRV-L-43 root]# vgdisplay -v
--- Volume group ---
VG Name               vg00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               6.87 GB
PE Size               4 MB
Total PE              1758
Alloc PE / Size       0 / 0
Free  PE / Size       1758 / 6.87 GB
VG UUID               INPtDi-kBhS-USzo-WuCW-xQWZ-DFkq-NerC0u

--- No logical volumes defined in "vg00" ---


--- Physical volumes ---
PV Name (#)           /dev/sddlmaa1 (1)
PV Status             available / allocatable
Total PE / Free PE    1758 / 1758

[root@D-SRV-L-43 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sddlmaa1" of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- inactive PV "/dev/sda1"     of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- inactive PV "/dev/sdb1"     of VG "vg00" [6.87 GB / 6.87 GB free]

[root@D-SRV-L-43 root]# vgchange -an vg00
vgchange -- volume group "vg00" successfully deactivated

[root@D-SRV-L-43 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sddlmaa1" of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- inactive PV "/dev/sda1"     of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- inactive PV "/dev/sdb1"     of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- total: 3 [20.61 GB] / in use: 3 [20.61 GB] / in no VG: 0 [0]

[root@D-SRV-L-43 root]# vgchange -ay vg00
vgchange -- volume group "vg00" successfully activated

[root@D-SRV-L-43 root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sddlmaa1" of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- inactive PV "/dev/sda1"     of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- ACTIVE   PV "/dev/sdb1"     of VG "vg00" [6.87 GB / 6.87 GB free]
pvscan -- total: 3 [20.61 GB] / in use: 3 [20.61 GB] / in no VG: 0 [0]
 

Best Regards

Matthias Rudolph
Country Software Specialist 

HITACHI DATA SYSTEMS GmbH
Im Steingrund 10
D-63303 Dreieich-Buchschlag
Tel:   +49 (0)6103 804 1208
Mob: +49 (0)171 240 9326
matthias.rudolph@hds.com <mailto:matthias.rudolph@hds.com>  


This e-mail may contain confidential and/or privileged information. If you
are not the intended recipient (or have received this e-mail in error)
please notify the sender immediately and destroy this e-mail. Any
unauthorised copying, disclosure or distribution of the material in this
e-mail is strictly forbidden.
