Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0OBpN120517
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 06:51:23 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0OBpLBn005102
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 06:51:22 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1F1Mhd-0007XY-3u
	for linux-lvm@redhat.com; Tue, 24 Jan 2006 12:51:13 +0100
Received: from empire.tau.ac.il ([132.66.152.50])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 12:51:13 +0100
Received: from romm by empire.tau.ac.il with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 12:51:13 +0100
From: "Roman M. Parparov" <romm@empire.tau.ac.il>
Message-ID: <dr53tf$acg$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Volume Group lost
Reply-To: romm@empire.tau.ac.il,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Tue, 24 Jan 2006 11:51:24 -0000
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Dear community,

I had the following problem with my lvm raid:
Jan 22 10:51:08 sky kernel: jfs_lookup: iget returned bad inode, inum = 249888
Jan 22 10:51:08 sky kernel: jfs_lookup: iget returned bad inode, inum = 229376
Jan 22 10:51:08 sky kernel:  I/O error: dev 08:41, sector 40845696
Jan 22 10:51:08 sky kernel:  I/O error: dev 08:41, sector 19874184

The LVM (LVM 1) consists of six SCSI disks, each one 36Gb size.

I decided to reboot the machine and see what happens. The reboot was the
first one since I configured the LVM a few _months_ ago.

After the reboot the system can't bring the LVM back online and reports:

[root]sky: ~>pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1"  is associated to unknown VG "softraid" (run
vgscan)
pvscan -- inactive PV "/dev/sdc1"  is associated to unknown VG "softraid" (run
vgscan)
pvscan -- inactive PV "/dev/sdd1"  is associated to unknown VG "softraid" (run
vgscan)
pvscan -- inactive PV "/dev/sde1"  is associated to unknown VG "softraid" (run
vgscan)
pvscan -- inactive PV "/dev/sdf1"  is associated to unknown VG "softraid" (run
vgscan)
pvscan -- inactive PV "/dev/sdg1"  is associated to unknown VG "softraid" (run
vgscan)
pvscan -- total: 6 [205.09 GB] / in use: 6 [205.09 GB] / in no VG: 0 [0]

and

[root]sky: ~>vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume
group "softraid" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

vgcfgrestore reported success, but no change to pvscan and vgscan .

/dev/softraid/ disappeared after the reboot 

/etc/lvmconf/softraid exists and has size of 1375404 bytes .
/etc/lvmtab and /etc/lvmtab.d are empty.

I have valuable data on the raid I do not want to go through restoring
from a backup again.

Any advice how to recover and reconfigure the volume group?

Thanks in advance,

Roman.

-- 
Roman M. Parparov - NASA EOSDIS project node at TAU technical manager.
Email: romm@empire.tau.ac.il		   http://www.nasa.proj.ac.il/
Phone/Fax: +972-(0)3-6405205 (work),        +972-(0)50-734-18-34 (home)
