Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id iAFL29f32034
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 16:02:11 -0500
Received: from ECCMCBH.cmc.int.ec.gc.ca (ecdor130.cmc.ec.gc.ca
	[199.212.17.130])
	by mx2.redhat.com (8.12.11/8.12.11) with SMTP id iAFKrvNH027808
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 15:53:59 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 15 Nov 2004 15:46:43 -0500
Message-ID: <80EE00A6A780C445BE9CA19F163CEA35059C52@cisxb.cmc.int.ec.gc.ca>
From: "Shea,Dan [CIS]" <Dan.Shea@ec.gc.ca>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] SAN VG not active after boot
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


SAN is an EMC device.
We are using lpcdd modules for an emc fibre optic card. 
PowerPath modules are from EMCpower.LINUX-3.0.7-007.i386.rpm
We are using Red Hat Enterprise Linux AS release 3 (Taroon Update 1).
The lvm version is from lvm-1.0.3-15.

After a reboot, the server pascal comes up and does not see the SAN partition.  It is shared between two servers.
In order to activate the SAN partition I have to vgexport and then vgimport the vg npmu_vg02.
Is there something that can be done so that it will come up cleanly?

[root@pascal root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda5" of VG "npmu_vg01" [192.89 GB / 12.23 GB free]
pvscan -- inactive PV "/dev/sdb1"  is associated to unknown VG "npmu_vg02" (run vgscan)
pvscan -- inactive PV "/dev/sdc1"  is associated to unknown VG "npmu_vg02" (run vgscan)
pvscan -- total: 3 [1.49 TB] / in use: 3 [1.49 TB] / in no VG: 0 [0]

[root@pascal root]# vgexport npmu_vg02
vgexport -- ERROR "lvm_tab_vg_remove(): VG doesn't exist" removing volume group "npmu_vg02" from "/etc/lvmtab"
vgexport -- volume group "npmu_vg02" NOT sucessfully exported

[root@pascal root]# vgimport npmu_vg02 /dev/sdb1
vgimport -- doing automatic backup of volume group "npmu_vg02"
vgimport -- volume group "npmu_vg02" successfully imported and activated

[root@pascal root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda5" of VG "npmu_vg01" [192.89 GB / 12.23 GB free]
pvscan -- inactive PV "/dev/sdb1" of VG "npmu_vg02" [667.55 GB / 299.55 GB free]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "npmu_vg02" [667.55 GB / 299.55 GB free]
pvscan -- total: 3 [1.49 TB] / in use: 3 [1.49 TB] / in no VG: 0 [0]

[root@pascal root]#

If vgscan is run 
[root@pascal etc]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "npmu_vg01"
vgscan -- found inactive volume group "npmu_vg02"
vgscan -- volume group "npmu_vg02" reuses an existing logical volume number; please vgexport/vgimport that VG or use option -f

vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups
