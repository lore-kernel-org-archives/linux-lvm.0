Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBB38Pan019166
	for <linux-lvm@redhat.com>; Sun, 10 Dec 2006 22:08:25 -0500
Received: from vms042pub.verizon.net (vms042pub.verizon.net [206.46.252.42])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBB38OM1007416
	for <linux-lvm@redhat.com>; Sun, 10 Dec 2006 22:08:24 -0500
Received: from pool-72-72-61-136.bstnma.east.verizon.net ([72.72.61.136])
	by vms042.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0JA3000R3A1VLR3C@vms042.mailsrvcs.net> for
	linux-lvm@redhat.com; Sun, 10 Dec 2006 21:08:20 -0600 (CST)
Date: Sun, 10 Dec 2006 22:08:19 -0500
From: Ivan Adzhubey <iadzhubey@rics.bwh.harvard.edu>
Message-id: <200612102208.19182.iadzhubey@rics.bwh.harvard.edu>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] Misbehaving physical volume
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I have a 8-disk RAID 0 device with 6 partitions and managed under LVM 1.0.3 
(RH8, kernel 2.4.18-27.8.0smp):

Disk /dev/sda: 255 heads, 63 sectors, 218789 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1     36449 292776561   8e  Linux LVM
/dev/sda2         36450     72898 292776592+  8e  Linux LVM
/dev/sda3         72899    109347 292776592+  8e  Linux LVM
/dev/sda4        109348    218789 879092865    5  Extended
/dev/sda5        109348    145796 292776561   8e  Linux LVM
/dev/sda6        145797    182245 292776561   8e  Linux LVM
/dev/sda7        182246    207245 200812468+  8e  Linux LVM

The following physical volumes are reported by pvscan:

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda1" of VG "vgt9"    [279.21 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sda2" of VG "vgt10"   [279.21 GB / 11.98 GB free]
pvscan -- ACTIVE   PV "/dev/sda3" of VG "vgt9"    [279.21 GB / 105.57 GB free]
pvscan -- inactive PV "/dev/sda5" of VG "vgt9"    [279.21 GB / 279.21 GB free]
pvscan -- ACTIVE   PV "/dev/sda6" of VG "vgBulyk" [279.19 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sda7" of VG "vgBulyk" [191.48 GB / 688 MB free]
pvscan -- total: 6 [1.55 TB] / in use: 6 [1.55 TB] / in no VG: 0 [0]

This setup I inherited from the previous sysadmin, so I don't know the history 
details, but I assumed /dev/sda5 was never used. Now I want to add it to vgt9 
volume group or move it to vgt10 one. This does not work:

# vgextend -v vgt9 /dev/sda5
vgextend -- locking logical volume manager
vgextend -- checking volume group name "vgt9"
vgextend -- checking volume group "vgt9" existence
vgextend -- checking for inactivity of volume group
vgextend -- reading data of volume group "vgt9" from lvmtab
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- reading data for all physical volumes from disk(s)
vgextend -- extending VGDA structures of volume group "vgt9"
vgextend -- ERROR: "/dev/sda5" is not a new physical volume

# vgreduce vgt9 /dev/sda5
vgreduce -- physical volume "/dev/sda5" doesn't belong to volume group "vgt9"

# vgextend vgt10 /dev/sda5
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- ERROR: "/dev/sda5" is not a new physical volume

However:

# pvdisplay /dev/sda5
--- Physical volume ---
PV Name               /dev/sda5
VG Name               vgt9
PV Size               279.21 GB [585553122 secs] / NOT usable 4.44 MB [LVM: 
407 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              71477
Free PE               71477
Allocated PE          0
PV UUID               YXRHyO-Ykl0-t7v1-iesS-WjJs-EadK-XRYQQY

Am I doing something wrong? What else to try?

Thanks,
Ivan
