Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9RHRO17019628
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 13:27:24 -0400
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9RHREMi007151
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 13:27:14 -0400
From: Nicholas Robinson <npr@bottlehall.co.uk>
Date: Tue, 27 Oct 2009 17:27:12 +0000
Message-Id: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing a very old physical drive - revisited
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

Like a moth to a flame, I am having another go at removing a physical
drive (30G) from my one and only volgroup.

I left it last night having recovered my system after pvmove created a
phantom lv that was too big to fit on the pv.

Tonight, I tried plugging a usb external 80G drive and doing a pvcreate
on it. This worked fine.

I then vgextended my volgroup to include this new device thinking the
free space would encourage pvmove to work and it would need to be in the
volgroup. This also appears to have worked.

Finally, the dreaded pvmove command that trashed my system last night.
At least it doesn't seem to have harmed anything tonight, but it still
hasn't worked. I've put a line of asterisks where I think the errors
are. Presumably, the second is a consequence of the first. Should I have
executed some dmsetup command before doing the pvmove as some googling
might suggest?

Thank you for any help you can give me.

Nick

# pvmove -vv /dev/sdb2 /dev/sda2
      Setting global/locking_type to 1
      File-based locking selected.
      Setting global/locking_dir to /var/lock/lvm
      Getting target version for mirror
      Getting target version for mirror
      Getting driver version
      /dev/sdb2: lvm2 label detected
      /dev/ram0: No label detected
      /dev/dm-0: No label detected
      /dev/ram1: No label detected
      /dev/sda1: No label detected
      /dev/dm-1: No label detected
      /dev/ram2: No label detected
      /dev/sda2: lvm2 label detected
      /dev/ram3: No label detected
      /dev/ram4: No label detected
      /dev/ram5: No label detected
      /dev/ram6: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb1: No label detected
      /dev/sdd1: No label detected
      /dev/sdd2: No label detected
      /dev/sdd3: lvm2 label detected
    Finding volume group "VolGroup00"
      Locking /var/lock/lvm/V_VolGroup00 WB
      /dev/sdb2: lvm2 label detected
      /dev/sda2: lvm2 label detected
      /dev/sdd3: lvm2 label detected
    Archiving volume group "VolGroup00" metadata (seqno 37).
      Expiring archive /etc/lvm/archive/VolGroup00_00024.vg
    Creating logical volume pvmove0
      Inserting layer pvmove0 for segments of LogVol00 on /dev/sdb2
      Inserting /dev/sdb2:0-856 of VolGroup00/LogVol00
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Inserting /dev/sdb2:887-887 of VolGroup00/LogVol00
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
    Moving 858 extents of logical volume VolGroup00/LogVol00
      Inserting layer pvmove0 for segments of LogVol01 on /dev/sdb2
      Locking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E (R)
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
    Found volume group "VolGroup00"
    Updating volume group metadata
      Locking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E (W)
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
      /dev/sdb2: lvm2 label detected
      /dev/sda2: lvm2 label detected
      /dev/sdd3: lvm2 label detected
    Found volume group "VolGroup00"
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
    Found volume group "VolGroup00"
      /dev/sdb2: read_ahead is 256 sectors
      Locking memory
    Suspending VolGroup00-LogVol00 (253:0) with device flush
      Locking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC (R)
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
    Found volume group "VolGroup00"
      Setting activation/mirror_region_size to 512
    Creating VolGroup00-pvmove0
    Loading VolGroup00-pvmove0 table
 **********************************************************************
  device-mapper: reload ioctl failed: No such device or address
  Temporary pvmove mirror activation failed.
      Removing layer pvmove0 for segments of LogVol00
      Remove LogVol00:0[0] from the top of LV pvmove0:0
      LogVol00:0 is no longer a user of pvmove0
      Remove LogVol00:857[0] from the top of LV pvmove0:857
      LogVol00:857 is no longer a user of pvmove0
      Removing layer pvmove0 for segments of LogVol01
      Locking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E (W)
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
      /dev/sdb2: lvm2 label detected
      /dev/sda2: lvm2 label detected
      /dev/sdd3: lvm2 label detected
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
    Found volume group "VolGroup00"
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
    Found volume group "VolGroup00"
      Locking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC (W)
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
      Stack LogVol00:0[0] on LV pvmove0:0
      Adding LogVol00:0 as an user of pvmove0
      Stack LogVol00:857[0] on LV pvmove0:857
      Adding LogVol00:857 as an user of pvmove0
    Found volume group "VolGroup00"
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
    Found volume group "VolGroup00"
    Suspending VolGroup00-pvmove0 (253:2) with device flush
      Unlocking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
    Found volume group "VolGroup00"
    Resuming VolGroup00-pvmove0 (253:2)
**********************************************************************  
device-mapper: resume ioctl failed: Invalid argument
  Unable to resume VolGroup00-pvmove0 (253:2)
      Unlocking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgLPxYrNE62mL8uhMs0OvZNIEWM6GlBD4E
    Found volume group "VolGroup00"
      Getting target version for linear
      Getting target version for striped
    Loading VolGroup00-LogVol00 table
    Resuming VolGroup00-LogVol00 (253:0)
      Unlocking memory
      Removing /dev/VolGroup00/LogVol00
      Linking /dev/VolGroup00/LogVol00
-> /dev/mapper/VolGroup00-LogVol00
      Locking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC (NL)
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
    Found volume group "VolGroup00"
      Locking memory
    Removing VolGroup00-pvmove0 (253:2)
      Unlocking memory
      Unlocking LV
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
      Finding volume group for uuid
EdAJKPEfRrbzqXIS8XJAyjzthn0vqAOgo3NFX2qrFUu5HyCI5r7p0sFe2tWrcSHC
    Found volume group "VolGroup00"
    Removing temporary pvmove LV
    Writing out final volume group after pvmove
    Creating volume group backup "/etc/lvm/backup/VolGroup00" (seqno
40).
    Creating volume group backup "/etc/lvm/backup/VolGroup00" (seqno
40).
      Unlocking /var/lock/lvm/V_VolGroup00
