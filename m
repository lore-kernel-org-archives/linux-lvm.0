Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8H8NLV05972
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 04:23:21 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8H8NDD7018710
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 04:23:14 -0400
Received: by zproxy.gmail.com with SMTP id m7so480246nzf
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 01:23:08 -0700 (PDT)
Message-ID: <95bbd190509170123538ba44a@mail.gmail.com>
Date: Sat, 17 Sep 2005 16:23:08 +0800
From: Bear Wolf <sportbear@gmail.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
In-Reply-To: <95bbd1905091623272f7455ec@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <95bbd190509111934b306235@mail.gmail.com>
	<20050912080543.GD25756@barkeeper1.linbit>
	<95bbd19050912014220e457b@mail.gmail.com>
	<95bbd1905091623272f7455ec@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: sportbear@gmail.com,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

here's the verbose log of successful and failed after created snapshot volumes 

verbose log of successful after created snapshot volumes 
*************************************************************************
config/config.c:778   log/activation not found in config: defaulting to 0
commands/toolcontext.c:146   Logging initialised at Sun Sep 18 00:12:57 2005

config/config.c:773   Setting global/umask to 63
commands/toolcontext.c:165   Set umask to 0077
config/config.c:758   Setting devices/dir to /dev
config/config.c:758   Setting global/proc to /proc
config/config.c:773   Setting global/activation to 1
config/config.c:778   global/suffix not found in config: defaulting to 1
config/config.c:764   global/units not found in config: defaulting to h
regex/matcher.c:267   Matcher built with 5 dfa states
config/config.c:758   Setting devices/cache to /etc/lvm/.cache
config/config.c:773   Setting devices/write_cache_state to 1
device/dev-io.c:425   Opened /etc/lvm/.cache RO
device/dev-io.c:456   Closed /etc/lvm/.cache
device/dev-cache.c:228   /dev/sda: Added to device cache
filters/filter-persistent.c:127   Loaded persistent filter cache from /etc/lvm/.
cache
config/config.c:773   Setting activation/reserved_stack to 256
config/config.c:773   Setting activation/reserved_memory to 8192
config/config.c:773   Setting activation/process_priority to -18
format1/format1.c:588   Initialised format: lvm1
format_pool/format_pool.c:355   Initialised format: pool
format_text/format-text.c:1706   Initialised format: lvm2
config/config.c:764   global/format not found in config: defaulting to lvm2
striped/striped.c:231   Initialised segtype: striped
zero/zero.c:100   Initialised segtype: zero
error/errseg.c:100   Initialised segtype: error
snapshot/snapshot.c:165   Initialised segtype: snapshot
mirror/mirrored.c:315   Initialised segtype: mirror
config/config.c:773   Setting backup/retain_days to 30
config/config.c:773   Setting backup/retain_min to 10
config/config.c:758   Setting backup/archive_dir to /etc/lvm/archive
config/config.c:758   Setting backup/backup_dir to /etc/lvm/backup
config/config.c:778   global/fallback_to_lvm1 not found in config: defaulting to
 0
lvmcmdline.c:812   Parsing: lvcreate -s -L64 -n s5 /dev/VG01/lv1
lvmcmdline.c:836   Processing: lvcreate -s -L64 -n s5 /dev/VG01/lv1
lvmcmdline.c:839   O_DIRECT will be used
config/config.c:773   Setting global/locking_type to 1
config/config.c:758   Setting global/locking_dir to /var/lock/lvm
locking/locking.c:139   File-based locking enabled.
lvcreate.c:306   Setting chunksize to 16 sectors.
activate/activate.c:302   Getting target version for snapshot
ioctl/libdm-iface.c:1326   dm version   O
ioctl/libdm-iface.c:1326   dm versions   O
activate/activate.c:302   Getting target version for snapshot-origin
ioctl/libdm-iface.c:1326   dm versions   O
config/config.c:773   Setting activation/mirror_region_size to 512
locking/file_locking.c:164   Locking /var/lock/lvm/V_VG01 WB
lvcreate.c:435   Finding volume group "VG01"
device/dev-io.c:425   Opened /dev/sda RW O_DIRECT
device/dev-io.c:134   /dev/sda: block size is 4096 bytes
label/label.c:168   /dev/sda: lvm2 label detected
cache/lvmcache.c:426   lvmcache: /dev/sda now orphaned
cache/lvmcache.c:426   lvmcache: /dev/sda now in VG VG01
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (10) from /dev/sda at 20480 s
ize 2600
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6    146: NULL(0:0)
metadata/lv_manip.c:1153   Creating logical volume s5
metadata/pv_map.c:47   Allowing allocation on /dev/sda start PE 6 length 146
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7    145: NULL(0:0)
format_text/format-text.c:397   Writing VG01 metadata to /dev/sda at 23552 len 2
826
format_text/format-text.c:483   Pre-Committing VG01 metadata (11) to /dev/sda he
ader at 4096
format_text/archiver.c:364   Creating volume group backup "/etc/lvm/backup/VG01"
 (seqno 11).
format_text/format-text.c:661   Writing VG01 metadata to /etc/lvm/backup/.lvm_pr
oNAS_2497_686647911
format_text/format-text.c:705   Committing VG01 metadata (11)
format_text/format-text.c:706   Renaming /etc/lvm/backup/VG01.tmp to /etc/lvm/ba
ckup/VG01
format_text/format-text.c:483   Committing VG01 metadata (11) to /dev/sda header
 at 4096
locking/file_locking.c:245   Locking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEG
pk4nXxhxd75lDLjzMXKs1nD7 (R)
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (11) from /dev/sda at 23552 s
ize 2826
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7    145: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
config/config.c:758   Setting activation/missing_stripe_filler to /dev/ioerror
activate/dev_manager.c:1048   Getting device info for VG01-s5
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4n
Xxhxd75lDLjzMXKs1nD7 N
ioctl/libdm-iface.c:1326   dm info VG01-s5  N
mm/memlock.c:119   Unlocking memory
mm/memlock.c:138   memlock_count dec to 0
activate/fs.c:176   Linking /dev/VG01/s5 -> /dev/mapper/VG01-s5
toollib.c:1087   Zeroing start of logical volume "s5"
device/dev-cache.c:228   /dev/VG01/s5: Added to device cache
device/dev-io.c:425   Opened /dev/VG01/s5 RW O_DIRECT
device/dev-io.c:584   Wiping /dev/VG01/s5 at sector 0 length 8 sectors
device/dev-io.c:134   /dev/VG01/s5: block size is 4096 bytes
device/dev-io.c:456   Closed /dev/VG01/s5
locking/file_locking.c:240   Locking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEG
pk4nXxhxd75lDLjzMXKs1nD7 (NL)
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (11) from /dev/sda at 23552 s
ize 2826
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7    145: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
activate/dev_manager.c:1048   Getting device info for VG01-s5
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4n
Xxhxd75lDLjzMXKs1nD7 O
mm/memlock.c:119   Unlocking memory
mm/memlock.c:138   memlock_count dec to 0
activate/fs.c:211   Removing link /dev/VG01/s5
locking/file_locking.c:235   Unlocking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5J
EGpk4nXxhxd75lDLjzMXKs1nD7
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (11) from /dev/sda at 23552 s
ize 2826
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7    145: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
activate/dev_manager.c:1048   Getting device info for VG01-s5
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4n
Xxhxd75lDLjzMXKs1nD7 N
ioctl/libdm-iface.c:1326   dm info VG01-s5  N
locking/file_locking.c:250   Locking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qi
e6tyA0ztVEJcQvJi9CvcngrT (W)
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (11) from /dev/sda at 23552 s
ize 2826
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7    145: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
activate/dev_manager.c:1048   Getting device info for VG01-lv1
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6ty
A0ztVEJcQvJi9CvcngrT N
mm/memlock.c:119   Unlocking memory
mm/memlock.c:138   memlock_count dec to 0
activate/fs.c:169   Removing /dev/VG01/s3
activate/fs.c:176   Linking /dev/VG01/s3 -> /dev/mapper/VG01-s3
activate/fs.c:176   Linking /dev/VG01/s5 -> /dev/mapper/VG01-s5
activate/fs.c:169   Removing /dev/VG01/s1
activate/fs.c:176   Linking /dev/VG01/s1 -> /dev/mapper/VG01-s1
activate/fs.c:169   Removing /dev/VG01/s4
activate/fs.c:176   Linking /dev/VG01/s4 -> /dev/mapper/VG01-s4
activate/fs.c:169   Removing /dev/VG01/s2
activate/fs.c:176   Linking /dev/VG01/s2 -> /dev/mapper/VG01-s2
activate/fs.c:169   Removing /dev/VG01/lv1
activate/fs.c:176   Linking /dev/VG01/lv1 -> /dev/mapper/VG01-lv1
format_text/archiver.c:364   Creating volume group backup "/etc/lvm/backup/VG01"
 (seqno 12).
format_text/format-text.c:661   Writing VG01 metadata to /etc/lvm/backup/.lvm_pr
oNAS_2497_1510734533
format_text/format-text.c:705   Committing VG01 metadata (12)
format_text/format-text.c:706   Renaming /etc/lvm/backup/VG01.tmp to /etc/lvm/ba
ckup/VG01
lvcreate.c:783   Logical volume "s5" created
locking/file_locking.c:59   Unlocking /var/lock/lvm/V_VG01
device/dev-io.c:456   Closed /dev/sda
filters/filter-persistent.c:181   Dumping persistent device cache to /etc/lvm/.c
ache
cache/lvmcache.c:574   Wiping internal VG cache














here is the verbose log of create snapshot volume but hang
**************************************************************************
config/config.c:778   log/activation not found in config: defaulting to 0
commands/toolcontext.c:146   Logging initialised at Sun Sep 18 00:13:12 2005

config/config.c:773   Setting global/umask to 63
commands/toolcontext.c:165   Set umask to 0077
config/config.c:758   Setting devices/dir to /dev
config/config.c:758   Setting global/proc to /proc
config/config.c:773   Setting global/activation to 1
config/config.c:778   global/suffix not found in config: defaulting to 1
config/config.c:764   global/units not found in config: defaulting to h
regex/matcher.c:267   Matcher built with 5 dfa states
config/config.c:758   Setting devices/cache to /etc/lvm/.cache
config/config.c:773   Setting devices/write_cache_state to 1
device/dev-io.c:425   Opened /etc/lvm/.cache RO
device/dev-io.c:456   Closed /etc/lvm/.cache
device/dev-cache.c:228   /dev/sda: Added to device cache
filters/filter-persistent.c:127   Loaded persistent filter cache from /etc/lvm/.
cache
config/config.c:773   Setting activation/reserved_stack to 256
config/config.c:773   Setting activation/reserved_memory to 8192
config/config.c:773   Setting activation/process_priority to -18
format1/format1.c:588   Initialised format: lvm1
format_pool/format_pool.c:355   Initialised format: pool
format_text/format-text.c:1706   Initialised format: lvm2
config/config.c:764   global/format not found in config: defaulting to lvm2
striped/striped.c:231   Initialised segtype: striped
zero/zero.c:100   Initialised segtype: zero
error/errseg.c:100   Initialised segtype: error
snapshot/snapshot.c:165   Initialised segtype: snapshot
mirror/mirrored.c:315   Initialised segtype: mirror
config/config.c:773   Setting backup/retain_days to 30
config/config.c:773   Setting backup/retain_min to 10
config/config.c:758   Setting backup/archive_dir to /etc/lvm/archive
config/config.c:758   Setting backup/backup_dir to /etc/lvm/backup
config/config.c:778   global/fallback_to_lvm1 not found in config: defaulting to
 0
lvmcmdline.c:812   Parsing: lvcreate -s -L64 -n s6 /dev/VG01/lv1
lvmcmdline.c:836   Processing: lvcreate -s -L64 -n s6 /dev/VG01/lv1
lvmcmdline.c:839   O_DIRECT will be used
config/config.c:773   Setting global/locking_type to 1
config/config.c:758   Setting global/locking_dir to /var/lock/lvm
locking/locking.c:139   File-based locking enabled.
lvcreate.c:306   Setting chunksize to 16 sectors.
activate/activate.c:302   Getting target version for snapshot
ioctl/libdm-iface.c:1326   dm version   O
ioctl/libdm-iface.c:1326   dm versions   O
activate/activate.c:302   Getting target version for snapshot-origin
ioctl/libdm-iface.c:1326   dm versions   O
config/config.c:773   Setting activation/mirror_region_size to 512
locking/file_locking.c:164   Locking /var/lock/lvm/V_VG01 WB
lvcreate.c:435   Finding volume group "VG01"
device/dev-io.c:425   Opened /dev/sda RW O_DIRECT
device/dev-io.c:134   /dev/sda: block size is 4096 bytes
label/label.c:168   /dev/sda: lvm2 label detected
cache/lvmcache.c:426   lvmcache: /dev/sda now orphaned
cache/lvmcache.c:426   lvmcache: /dev/sda now in VG VG01
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s5
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (12) from /dev/sda at 26624 s
ize 3047
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7    145: NULL(0:0)
metadata/lv_manip.c:1153   Creating logical volume s6
metadata/pv_map.c:47   Allowing allocation on /dev/sda start PE 7 length 145
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7      1: s6(0:0)
metadata/pv_manip.c:242   /dev/sda 7:      8    144: NULL(0:0)
format_text/format-text.c:397   Writing VG01 metadata to /dev/sda at 29696 len 3
273
format_text/format-text.c:483   Pre-Committing VG01 metadata (13) to /dev/sda he
ader at 4096
format_text/archiver.c:364   Creating volume group backup "/etc/lvm/backup/VG01"
 (seqno 13).
format_text/format-text.c:661   Writing VG01 metadata to /etc/lvm/backup/.lvm_pr
oNAS_2516_4686790
format_text/format-text.c:705   Committing VG01 metadata (13)
format_text/format-text.c:706   Renaming /etc/lvm/backup/VG01.tmp to /etc/lvm/ba
ckup/VG01
format_text/format-text.c:483   Committing VG01 metadata (13) to /dev/sda header
 at 4096
locking/file_locking.c:245   Locking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZ
K7A5JOgpUBnciRrm1UQPLpjP (R)
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s5
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (13) from /dev/sda at 29696 s
ize 3273
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7      1: s6(0:0)
metadata/pv_manip.c:242   /dev/sda 7:      8    144: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
config/config.c:758   Setting activation/missing_stripe_filler to /dev/ioerror
activate/dev_manager.c:1048   Getting device info for VG01-s6
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5
JOgpUBnciRrm1UQPLpjP N
ioctl/libdm-iface.c:1326   dm info VG01-s6  N
mm/memlock.c:119   Unlocking memory
mm/memlock.c:138   memlock_count dec to 0
activate/fs.c:176   Linking /dev/VG01/s6 -> /dev/mapper/VG01-s6
toollib.c:1087   Zeroing start of logical volume "s6"
device/dev-cache.c:228   /dev/VG01/s6: Added to device cache
device/dev-io.c:425   Opened /dev/VG01/s6 RW O_DIRECT
device/dev-io.c:584   Wiping /dev/VG01/s6 at sector 0 length 8 sectors
device/dev-io.c:134   /dev/VG01/s6: block size is 4096 bytes
device/dev-io.c:456   Closed /dev/VG01/s6
locking/file_locking.c:240   Locking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZ
K7A5JOgpUBnciRrm1UQPLpjP (NL)
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s5
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (13) from /dev/sda at 29696 s
ize 3273
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7      1: s6(0:0)
metadata/pv_manip.c:242   /dev/sda 7:      8    144: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
activate/dev_manager.c:1048   Getting device info for VG01-s6
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5
JOgpUBnciRrm1UQPLpjP O
mm/memlock.c:119   Unlocking memory
mm/memlock.c:138   memlock_count dec to 0
activate/fs.c:211   Removing link /dev/VG01/s6
locking/file_locking.c:235   Unlocking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnU
RZK7A5JOgpUBnciRrm1UQPLpjP
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s5
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (13) from /dev/sda at 29696 s
ize 3273
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7      1: s6(0:0)
metadata/pv_manip.c:242   /dev/sda 7:      8    144: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
activate/dev_manager.c:1048   Getting device info for VG01-s6
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5
JOgpUBnciRrm1UQPLpjP N
ioctl/libdm-iface.c:1326   dm info VG01-s6  N
locking/file_locking.c:250   Locking LV mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qi
e6tyA0ztVEJcQvJi9CvcngrT (W)
metadata/metadata.c:1158   Finding volume group for uuid mGsdNLkAeP8eWiFjBTybhs3
5PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT
label/label.c:168   /dev/sda: lvm2 label detected
label/label.c:168   /dev/sda: lvm2 label detected
config/config.c:758   Setting cow_store to s1
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s2
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s3
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s4
config/config.c:758   Setting origin to lv1
config/config.c:758   Setting cow_store to s5
config/config.c:758   Setting origin to lv1
format_text/format-text.c:311   Read VG01 metadata (13) from /dev/sda at 29696 s
ize 3273
metadata/pv_manip.c:242   /dev/sda 0:      0      2: lv1(0:0)
metadata/pv_manip.c:242   /dev/sda 1:      2      1: s1(0:0)
metadata/pv_manip.c:242   /dev/sda 2:      3      1: s2(0:0)
metadata/pv_manip.c:242   /dev/sda 3:      4      1: s3(0:0)
metadata/pv_manip.c:242   /dev/sda 4:      5      1: s4(0:0)
metadata/pv_manip.c:242   /dev/sda 5:      6      1: s5(0:0)
metadata/pv_manip.c:242   /dev/sda 6:      7      1: s6(0:0)
metadata/pv_manip.c:242   /dev/sda 7:      8    144: NULL(0:0)
metadata/metadata.c:1164   Found volume group "VG01"
activate/dev_manager.c:1048   Getting device info for VG01-lv1
ioctl/libdm-iface.c:1326   dm info  mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6ty
A0ztVEJcQvJi9CvcngrT N





hand when get device mapper info ID,
and no Unlocking memory log found.....
