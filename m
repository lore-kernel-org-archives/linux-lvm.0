Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2TFPCj00826
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 10:25:12 -0500
Received: from anor.ics.muni.cz (root@anor.ics.muni.cz [147.251.4.35])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2TFPB1X022929
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 10:25:11 -0500
Received: from anxur.fi.muni.cz (IDENT:0@anxur.fi.muni.cz [147.251.48.3])
	by anor.ics.muni.cz (8.12.1/8.12.1) with ESMTP id i2TFPAh2029497
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 17:25:10 +0200
Received: from anxur.fi.muni.cz (IDENT:11561@localhost [127.0.0.1])
	by anxur.fi.muni.cz (8.12.10/8.12.8) with ESMTP id i2TFP9uw006119
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 17:25:09 +0200 (MEST)
Received: (from kas@localhost)
	by anxur.fi.muni.cz (8.12.10/8.12.8/Submit) id i2TFP9Oq006116
	for linux-lvm@redhat.com; Mon, 29 Mar 2004 17:25:09 +0200 (MEST)
Date: Mon, 29 Mar 2004 17:25:09 +0200
From: Jan Kasprzak <kas@informatics.muni.cz>
Message-ID: <20040329152509.GA27@fi.muni.cz>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 over RAID-5 (AMD64)
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

	Hello,

	I have problems creating a LV on top of SW RAID-5 volume.
I have Fedora Core 1/AMD64, and LVM2 utils 2.00.08-5 RPM from the latest
Fedora Core beta (1.90, I think). My kernel is 2.6.4. The problem is that
1) Metadata version 2 does not work at all, and
2) If I use version 1, I cannot create LV once the VG is created -
	"lvm lvcreate" tries to write metadata to /dev/sda4 (one of the parts
	of my SW RAID-5 volume) instead of the /dev/md5 itself.

	Details are attached. Thanks for any help.

-Yenya

ad 1)
# lvm pvcreate /dev/md5
  Physical volume "/dev/md5" successfully created
# lvm vgcreate -s 64M data_vg /dev/md5
  Volume group "data_vg" successfully created
# lvm lvcreate -l 4534 -n test_lv data_vg
  Volume group "data_vg" doesn't exist
# lvm vgs
#

ad 2)
# lvm pvcreate -M1 /dev/md5
  Physical volume "/dev/md5" successfully created
# lvm vgcreate -M1 -s 64M data_vg /dev/md5
  Volume group "data_vg" successfully created
# lvm vgdisplay
  --- Volume group ---
  VG Name               data_vg
  System ID             hostname.domain.cz1080572966
  Format                lvm1
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                0
  Open LV               0
  Max PV                255
  Cur PV                1
  Act PV                1
  VG Size               283.38 GB
  PE Size               64.00 MB
  Total PE              4534
  Alloc PE / Size       0 / 0
  Free  PE / Size       4534 / 283.38 GB
  VG UUID               cqall8-M9B6-BUJM-uAs6-Ykn3-WSCc-pW6bXm
# lvm lvcreate -l 4534 -n test_lv data_vg
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'data_vg-test_lv'.
  Failed to activate new LV.
# dmesg|tail -2
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table
# lvm lvremove /dev/data_vg/test_lv
Do you really want to remove active logical volume "test_lv"? [y/n]: y
  Logical volume "test_lv" successfully removed
# lvm lvcreate -l 4534 -n test_lv data_vg -v -v
      global/locking_type not found in config: defaulting to 1
      global/locking_dir not found in config: defaulting to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/V_data_vg WB
    Finding volume group "data_vg"
      /dev/sda: No label detected
      [...]
      /dev/sda4: lvm1 label detected
      /dev/md5: lvm1 label detected
      Duplicate PV wqQ2AyMMX3z1or14EvqOwLEL3RKaldUf on /dev/sda4 - using md /dev/md5
      /dev/sdb: No label detected
      /dev/sdb1: No label detected
      [...]
      Found /dev/sda4 in VG data_vg
    Creating logical volume test_lv
    Archiving volume group "data_vg" metadata.
      Failed to read PV data from /dev/loop0
      /dev/sda does not have a valid LVM1 PV identifier
      /dev/md0 does not have a valid LVM1 PV identifier
      [...]
      Found /dev/sda4 in VG data_vg
      Duplicate PV wqQ2AyMMX3z1or14EvqOwLEL3RKaldUf on /dev/sda4 - using md /dev/md5
      Found /dev/md5 in VG data_vg
      Duplicate PV wqQ2AyMMX3z1or14EvqOwLEL3RKaldUf - using md /dev/md5
      [...]
      format1: Unknown metadata version 18881 found on /dev/sdd4
      Successfully wrote data to /dev/sda4
    Creating volume group backup "/etc/lvm/backup/data_vg"
      Finding volume group for uuid ll8M9B6BUJMuAs6Ykn3WSCcpW6bXm00000000000000000000000000000000
      Found /dev/sda4 in VG data_vg
    Found volume group "data_vg"
      activation/missing_stripe_filler not found in config: defaulting to /dev/ioerror
      activation/mirror_region_size not found in config: defaulting to 512
      Locking memory
    Loading data_vg-test_lv
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'data_vg-test_lv'.
      Unlocking memory
  Failed to activate new LV.
      Unlocking /var/lock/lvm/V_data_vg

-- 
| Jan "Yenya" Kasprzak  <kas@{fi.muni.cz - work | yenya.net - private}> |
| GPG: ID 1024/D3498839      Fingerprint 0D99A7FB206605D7 8B35FCDE05B18A5E |
| http://www.fi.muni.cz/~kas/   Czech Linux Homepage: http://www.linux.cz/ |
 Any compiler or language that likes to hide things like memory allocations
 behind your back just isn't a good choice for a kernel.   --Linus Torvalds
