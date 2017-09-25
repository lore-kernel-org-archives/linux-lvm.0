Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 874466C1F8
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2017 09:37:58 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0E504E028
	for <linux-lvm@redhat.com>; Mon, 25 Sep 2017 09:37:54 +0000 (UTC)
Message-ID: <59C8CCBD.5080407@strike.wu.ac.at>
Date: Mon, 25 Sep 2017 11:30:37 +0200
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm raid1 metadata on different pv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi!

I tried to move the raid1 metadata subvolumes to different PVs (SSD devices for performance).

Moving with pvmove works fine but activation fails when both legs of the metadata had been moved to external devices. (See below.)

Interestingly moving just one metadata LV to another device works fine. (Raid LV can be activated afterwards.)

I guess raid1 metadata on different PVs is not supported (yet)?

I am using Centos 7.4 and kernel 3.10.0-693.el7.x86_64.

Cheers,
--leo

-------------------- 8< --------------------
modprobe zram num_devices=2
echo 300M > /sys/block/zram0/disksize
echo 300M > /sys/block/zram1/disksize

pvcreate /dev/sda2
pvcreate /dev/sdb2
pvcreate /dev/zram0
pvcreate /dev/zram1

vgcreate vg_sys /dev/sda2 /dev/sdb2 /dev/zram0 /dev/zram1
lvcreate --type raid1 -m 1 --regionsize 64M -L 500m -n lv_boot vg_sys /dev/sda2 /dev/sdb2

pvmove -n 'lv_boot_rmeta_0' /dev/sda2 /dev/zram0
# and maybe
# pvmove -n 'lv_boot_rmeta_1' /dev/sdb2 /dev/zram1

-------------------- 8< --------------------
    Creating vg_sys-lv_boot
        dm create vg_sys-lv_boot LVM-l6Eg7Uvcm2KieevnXDjLLje3wqmSVGa1e56whxycwUR2RvGvcQNLy1GdfpzlZuQk [ noopencount flush ]   [16384] (*1)
    Loading vg_sys-lv_boot table (253:7)
      Getting target version for raid
        dm versions   [ opencount flush ]   [16384] (*1)
      Found raid target v1.12.0.
        Adding target to (253:7): 0 1024000 raid raid1 3 0 region_size 8192 2 253:3 253:4 253:5 253:6
        dm table   (253:7) [ opencount flush ]   [16384] (*1)
        dm reload   (253:7) [ noopencount flush ]   [16384] (*1)
  device-mapper: reload ioctl on  (253:7) failed: Input/output error
-------------------- 8< --------------------
[ 8130.110467] md/raid1:mdX: active with 2 out of 2 mirrors
[ 8130.111361] mdX: failed to create bitmap (-5)
[ 8130.112254] device-mapper: table: 253:7: raid: Failed to run raid array
[ 8130.113154] device-mapper: ioctl: error adding target to table
-------------------- 8< --------------------
# lvs -a -o+devices
  LV                 VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices                                
  lv_boot            vg_sys rwi---r--- 500.00m                                                     lv_boot_rimage_0(0),lv_boot_rimage_1(0)
  [lv_boot_rimage_0] vg_sys Iwi-a-r-r- 500.00m                                                     /dev/sda2(1)                           
  [lv_boot_rimage_1] vg_sys Iwi-a-r-r- 500.00m                                                     /dev/sdb2(1)                           
  [lv_boot_rmeta_0]  vg_sys ewi-a-r-r-   4.00m                                                     /dev/zram0(0)                          
  [lv_boot_rmeta_1]  vg_sys ewi-a-r-r-   4.00m                                                     /dev/zram1(0)                          
-------------------- 8< --------------------

Full vgchange output can be found at:
  http://leo.kloburg.at/tmp/lvm-raid1-ext-meta/


-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at   
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
