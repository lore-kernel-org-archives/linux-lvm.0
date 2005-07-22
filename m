Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6MLq4V03450
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2005 17:52:04 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6MLq4Fp029796
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2005 17:52:04 -0400
From: Ming Zhang <mingz@ele.uri.edu>
Date: Fri, 22 Jul 2005 17:51:57 -0400
Message-Id: <1122069117.24620.51.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend impact on io activity
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM <linux-lvm@redhat.com>

Hi folks

I read the code a bit while still can not understand this. Assume there
are some IO activity to a certain LV while the lvextend is underway, I
wonder how large this impact will be. And from code point of view,
during the extend, in which period, the io is blocked or held?


Thanks!

This is the lvextend activity. could anybody tell me where is the
blocked range? 


#lvmcmdline.c:836         Processing: lvextend -vvvvvvvv -L
+1G /dev/vgtest/test
#lvmcmdline.c:839         O_DIRECT will be used
#config/config.c:773       Setting global/locking_type to 1
#config/config.c:758       Setting global/locking_dir to /var/lock/lvm
#locking/locking.c:139       File-based locking enabled.
#lvresize.c:519     Finding volume group vgtest
#locking/file_locking.c:164       Locking /var/lock/lvm/V_vgtest WB
#device/dev-io.c:425         Opened /dev/md0 RW O_DIRECT
#device/dev-io.c:134         /dev/md0: block size is 4096 bytes
#device/dev-io.c:204         <backtrace>
#label/label.c:135         /dev/md0: Failed to read label area
#label/label.c:194       /dev/md0: No label detected
#label/label.c:286         <backtrace>
#device/dev-io.c:425         Opened /dev/hda1 RW O_DIRECT
#device/dev-io.c:134         /dev/hda1: block size is 1024 bytes
#label/label.c:194       /dev/hda1: No label detected
#label/label.c:286         <backtrace>
#device/dev-io.c:425         Opened /dev/sda1 RW O_DIRECT
#device/dev-io.c:134         /dev/sda1: block size is 512 bytes
#label/label.c:173       /dev/sda1: lvm2 label detected
#cache/lvmcache.c:427         lvmcache: /dev/sda1 now orphaned
#cache/lvmcache.c:427         lvmcache: /dev/sda1 now in VG vgtest
#device/dev-io.c:425         Opened /dev/hda2 RW O_DIRECT
#device/dev-io.c:134         /dev/hda2: block size is 4096 bytes
#label/label.c:194       /dev/hda2: No label detected
#label/label.c:286         <backtrace>
#device/dev-io.c:425         Opened /dev/hda3 RW O_DIRECT
#device/dev-io.c:134         /dev/hda3: block size is 4096 bytes
#label/label.c:194       /dev/hda3: No label detected
#label/label.c:286         <backtrace>
#device/dev-io.c:425         Opened /dev/sdb1 RW O_DIRECT
#device/dev-io.c:134         /dev/sdb1: block size is 512 bytes
#label/label.c:173       /dev/sdb1: lvm2 label detected
#cache/lvmcache.c:427         lvmcache: /dev/sdb1 now orphaned
#cache/lvmcache.c:427         lvmcache: /dev/sdb1 now in VG vgtest
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#format_text/format-text.c:311         Read vgtest metadata (1135)
from /dev/sda1 at 93184 size 978
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#format_text/format-text.c:311         Read vgtest metadata (1135)
from /dev/sdb1 at 9216 size 978
#archiver.c:109     Archiving volume group "vgtest" metadata.
#metadata/pv_map.c:177         Allowing allocation on /dev/sda1 start PE
0 length 25
#metadata/pv_map.c:177         Allowing allocation on /dev/sda1 start PE
1305 length 3813
#metadata/pv_map.c:177         Allowing allocation on /dev/sdb1 start PE
0 length 1023
#metadata/pv_manip.c:231         /dev/sda1 0:      0     25: test
(1280:0)
#metadata/pv_manip.c:231         /dev/sda1 1:     25   1280: test(0:0)
#metadata/pv_manip.c:231         /dev/sda1 2:   1305    231: test
(1305:0)
#metadata/pv_manip.c:231         /dev/sda1 3:   1536   3582: NULL(0:0)
#metadata/pv_manip.c:231         /dev/sdb1 0:      0   1023: NULL(0:0)
#format_text/format-text.c:401         Writing vgtest metadata
to /dev/sda1 at 94208 len 1230
#format_text/format-text.c:401         Writing vgtest metadata
to /dev/sdb1 at 10240 len 1230
#format_text/format-text.c:487         Pre-Committing vgtest metadata
(1136) to /dev/sda1 header at 2048
#format_text/format-text.c:487         Pre-Committing vgtest metadata
(1136) to /dev/sdb1 header at 2048
#archiver.c:333     Creating volume group backup
"/etc/lvm/backup/vgtest"
#format_text/format-text.c:667         Writing vgtest metadata
to /etc/lvm/backup/.lvm_centos4.localdomain_3967_582226307
#format_text/format-text.c:711         Committing vgtest metadata (1136)
#format_text/format-text.c:712
Renaming /etc/lvm/backup/vgtest.tmp to /etc/lvm/backup/vgtest
#locking/file_locking.c:250         Locking LV
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB (W)
#metadata/metadata.c:1153       Finding volume group for uuid
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#format_text/format-text.c:311         Read vgtest metadata (1135)
from /dev/sda1 at 93184 size 978
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#format_text/format-text.c:311         Read vgtest metadata (1135)
from /dev/sdb1 at 9216 size 978
#metadata/metadata.c:1159     Found volume group "vgtest"
#config/config.c:758       Setting activation/missing_stripe_filler
to /dev/ioerror
#activate/dev_manager.c:1040         Getting device info for vgtest-test
#ioctl/libdm-iface.c:1326         dm version   O  
#ioctl/libdm-iface.c:1326         dm info
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB N  
#mm/memlock.c:100       Locking memory
#mm/memlock.c:131         memlock_count inc to 1
#ioctl/libdm-iface.c:1326         dm names   O  
#activate/dev_manager.c:1877         Found existing layer 'vgtest-test'
#activate/dev_manager.c:1120         Getting device info for vgtest-test
#ioctl/libdm-iface.c:1326         dm info vgtest-test  N  
#activate/dev_manager.c:2125         Found active lv test
#activate/dev_manager.c:502       Suspending vgtest-test
#ioctl/libdm-iface.c:1326         dm suspend vgtest-test  N  
#format_text/format-text.c:487         Committing vgtest metadata (1136)
to /dev/sda1 header at 2048
#format_text/format-text.c:487         Committing vgtest metadata (1136)
to /dev/sdb1 header at 2048
#locking/file_locking.c:235         Unlocking LV
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB
#metadata/metadata.c:1153       Finding volume group for uuid
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#format_text/format-text.c:311         Read vgtest metadata (1136)
from /dev/sda1 at 94208 size 1230
#label/label.c:173       /dev/sda1: lvm2 label detected
#label/label.c:173       /dev/sdb1: lvm2 label detected
#format_text/format-text.c:311         Read vgtest metadata (1136)
from /dev/sdb1 at 10240 size 1230
#metadata/metadata.c:1159     Found volume group "vgtest"
#activate/dev_manager.c:1040         Getting device info for vgtest-test
#ioctl/libdm-iface.c:1326         dm info
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB N  
#ioctl/libdm-iface.c:1326         dm names   O  
#activate/dev_manager.c:1877         Found existing layer 'vgtest-test'
#activate/dev_manager.c:1120         Getting device info for vgtest-test
#ioctl/libdm-iface.c:1326         dm info vgtest-test  N  
#activate/dev_manager.c:2125         Found active lv test (suspended)
#activate/dev_manager.c:552     Loading vgtest-test
#activate/dev_manager.c:719         Adding target: 0 10485760
linear /dev/sda1 205184
#activate/dev_manager.c:719         Adding target: 10485760 204800
linear /dev/sda1 384
#activate/dev_manager.c:719         Adding target: 10690560 1892352
linear /dev/sda1 10690944
#ioctl/libdm-iface.c:1326         dm reload
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB N  
#activate/dev_manager.c:634       Activated vgtest-test
CLvaUmVA006uC6Nr1pXXOad2nN1ldecty23Be3lof5n4v6CxFykmOs5Ndv5uC8NB 253:000
#activate/dev_manager.c:502       Resuming vgtest-test
#ioctl/libdm-iface.c:1326         dm resume vgtest-test  N  
#mm/memlock.c:119       Unlocking memory
#mm/memlock.c:138         memlock_count dec to 0
#activate/fs.c:169       Removing /dev/vgtest/test
#activate/fs.c:176       Linking /dev/vgtest/test -> /dev/mapper/vgtest-
test
#misc/selinux.c:25       Setting SELinux context for /dev/vgtest/test
#locking/file_locking.c:59       Unlocking /var/lock/lvm/V_vgtest
#device/dev-io.c:456         Closed /dev/md0
#device/dev-io.c:456         Closed /dev/hda1
#device/dev-io.c:456         Closed /dev/sda1
#device/dev-io.c:456         Closed /dev/hda2
#device/dev-io.c:456         Closed /dev/hda3
#device/dev-io.c:456         Closed /dev/sdb1
  Extending logical volume test to 6.00 GB
  Logical volume test successfully resized
