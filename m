Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1119E2166B2F
	for <linux-lvm@redhat.com>; Wed, 15 Apr 2020 13:51:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 164268FF67B
	for <linux-lvm@redhat.com>; Wed, 15 Apr 2020 13:51:31 +0000 (UTC)
Date: Wed, 15 Apr 2020 15:14:02 +0200
From: "Shock Media B.V. support" <support@shockmedia.nl>
Message-ID: <da14b5a06730db8e918d925b4e2f1507@administratix>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [1019133-4yqc8ex4] LVM hangs after volume change
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

We occasionally have issues with LVM freezing at which point no data can be written to volumes and no LVM-commands (like lvs,vgs) can retrieve any data and just get stuck. This happens on multiple machines that share the same config. The issue starts while making changes to volumes, removing snapshots, removing volumes, resizing volumes, etc

For detailed information on one such server, check the Appendices

Our situation is the following.

We use an mdadm raid-config consisting of 4 or more SSD's/Disks where we use part of the disks for a raid1,raid10 or raid5. We create volumes on 2 nodes and use DRBD to keep these 2 volumes in sync and we run a virtual machine (using KVM) on this volume.

These freezes happen on different machines, using Ubuntu 16.04 and 18.04 with different kernels, 4.4.0, 4.15.0 and 5.0.0

We have done extensive tests, but we are not able to reliably reproduce this issue.
The issues seem to happen more often when volumes that are changed (resized/removed) have been active for a longer time.

## Appendices:
# Appendix 1 - LVM Version
LVM version: 2.02.176(2) (2017-11-03)
Library version: 1.02.145 (2017-11-03)
Driver version: 4.39.0
Configuration: ./configure --build=x86_64-linux-gnu --prefix=/usr --includedir=${prefix}/include --mandir=${prefix}/share/man --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var --disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu --libexecdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run --disable-maintainer-mode --disable-dependency-tracking --exec-prefix= --bindir=/bin --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin --with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2 --with-cache=internal --with-clvmd=corosync --with-cluster=internal --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-default-locking-dir=/run/lock/lvm --with-thin=internal --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-applib --enable-blkid_wiping --enable-cmdlib --enable-cmirrord --enable-dmeventd --enable-dbus-service --enable-lvmetad --enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld --enable-notify-dbus --enable-pkgconfig --enable-readline --enable-udev_rules --enable-udev_sync


# Appendix 2 - MDADM-config
/dev/md3:
Version : 1.2
Creation Time : Tue Aug 28 11:49:14 2018
Raid Level : raid10
Array Size : 2790712320 (2661.43 GiB 2857.69 GB)
Used Dev Size : 930237440 (887.14 GiB 952.56 GB)
Raid Devices : 6
Total Devices : 6
Persistence : Superblock is persistent
Intent Bitmap : Internal
Update Time : Wed Apr 8 16:23:34 2020
State : active
Active Devices : 6
Working Devices : 6
Failed Devices : 0
Spare Devices : 0
Layout : near=2
Chunk Size : 512K
Consistency Policy : bitmap
Name : node1:3
UUID : 62594d9d:de7eb2e6:bc3c1523:ff7327f7
Events : 3973
Number Major Minor RaidDevice State
0 8 4 0 active sync set-A /dev/sda4
1 8 20 1 active sync set-B /dev/sdb4
2 8 36 2 active sync set-A /dev/sdc4
3 8 52 3 active sync set-B /dev/sdd4
4 8 68 4 active sync set-A /dev/sde4
5 8 84 5 active sync set-B /dev/sdf4

# Appendix 3 - LVM Config
config {
checks=1
abort_on_errors=0
profile_dir="/etc/lvm/profile"
}
local {
}
dmeventd {
mirror_library="libdevmapper-event-lvm2mirror.so"
snapshot_library="libdevmapper-event-lvm2snapshot.so"
thin_library="libdevmapper-event-lvm2thin.so"
}
activation {
checks=0
udev_sync=1
udev_rules=1
verify_udev_operations=0
retry_deactivation=1
missing_stripe_filler="error"
use_linear_target=1
reserved_stack=64
reserved_memory=8192
process_priority=-18
raid_region_size=512
readahead="auto"
raid_fault_policy="warn"
mirror_image_fault_policy="remove"
mirror_log_fault_policy="allocate"
snapshot_autoextend_threshold=100
snapshot_autoextend_percent=20
thin_pool_autoextend_threshold=100
thin_pool_autoextend_percent=20
use_mlockall=0
monitoring=1
polling_interval=15
activation_mode="degraded"
}
global {
umask=63
test=0
units="h"
si_unit_consistency=1
suffix=1
activation=1
proc="/proc"
etc="/etc"
locking_type=1
wait_for_locks=1
fallback_to_clustered_locking=1
fallback_to_local_locking=1
locking_dir="/run/lock/lvm"
prioritise_write_locks=1
abort_on_internal_errors=0
detect_internal_vg_cache_corruption=0
metadata_read_only=0
mirror_segtype_default="raid1"
raid10_segtype_default="raid10"
sparse_segtype_default="thin"
use_lvmetad=0
use_lvmlockd=0
system_id_source="none"
use_lvmpolld=1
}
shell {
history_size=100
}
backup {
backup=1
backup_dir="/etc/lvm/backup"
archive=1
archive_dir="/etc/lvm/archive"
retain_min=10
retain_days=30
}
log {
verbose=0
silent=0
syslog=1
overwrite=0
level=0
indent=1
command_names=0
prefix=" "
activation=0
debug_classes=["memory","devices","activation","allocation","lvmetad","metadata","cache","locking","lvmpolld"]
}
allocation {
maximise_cling=1
use_blkid_wiping=1
wipe_signatures_when_zeroing_new_lvs=1
mirror_logs_require_separate_pvs=0
cache_pool_metadata_require_separate_pvs=0
thin_pool_metadata_require_separate_pvs=0
}
devices {
filter=["a|/dev/md3|","r|.*|"]
dir="/dev"
scan="/dev"
obtain_device_list_from_udev=1
external_device_info_source="none"
cache_dir="/run/lvm"
cache_file_prefix=""
write_cache_state=1
sysfs_scan=1
multipath_component_detection=1
md_component_detection=1
fw_raid_component_detection=0
md_chunk_alignment=1
data_alignment_detection=1
data_alignment=0
data_alignment_offset_detection=1
ignore_suspended_devices=0
ignore_lvm_mirrors=1
disable_after_error_count=0
require_restorefile_with_uuid=1
pv_min_size=2048
issue_discards=1
}

# Appendix 4 - PVDisplay
--- Physical volume ---
PV Name /dev/md3
VG Name vservers
PV Size 2.60 TiB / not usable 3.50 MiB
Allocatable yes
PE Size 4.00 MiB
Total PE 681325
Free PE 71789
Allocated PE 609536
PV UUID mY0oJr-IOll-Ez7b-1t7n-Skyx-US4n-05jVIQ

# Appendix 5 - Volumegroup
--- Volume group ---
VG Name vservers
System ID
Format lvm2
Metadata Areas 1
Metadata Sequence No 67
VG Access read/write
VG Status resizable
MAX LV 0
Cur LV 17
Open LV 16
Max PV 0
Cur PV 1
Act PV 1
VG Size 2.60 TiB
PE Size 4.00 MiB
Total PE 681325
Alloc PE / Size 609536 / 2.33 TiB
Free PE / Size 71789 / 280.43 GiB
VG UUID r74ack-311w-r1ls-MwGe-WY9l-k2u3-9Dpu0l

# Appendix 6 - Dmesg
Apr 8 14:36:11 node1 kernel: [1044966.745830] lvremove D 0 8606 7208 0x00000002
Apr 8 14:36:11 node1 kernel: [1044966.745833] Call Trace:
Apr 8 14:36:11 node1 kernel: [1044966.745839] __schedule+0x2c0/0x870
Apr 8 14:36:11 node1 kernel: [1044966.745844] schedule+0x2c/0x70
Apr 8 14:36:11 node1 kernel: [1044966.745849] schedule_timeout+0x1db/0x360
Apr 8 14:36:11 node1 kernel: [1044966.745855] ? blk_flush_plug_list+0xbc/0x100
Apr 8 14:36:11 node1 kernel: [1044966.745861] io_schedule_timeout+0x1e/0x50
Apr 8 14:36:11 node1 kernel: [1044966.745866] wait_for_completion_io+0xba/0x140
Apr 8 14:36:11 node1 kernel: [1044966.745871] ? wake_up_q+0x80/0x80
Apr 8 14:36:11 node1 kernel: [1044966.745877] submit_bio_wait+0x61/0x90
Apr 8 14:36:11 node1 kernel: [1044966.745884] blkdev_issue_discard+0x80/0xd0
Apr 8 14:36:11 node1 kernel: [1044966.745890] blk_ioctl_discard+0xc4/0x110
Apr 8 14:36:11 node1 kernel: [1044966.745894] ? blk_ioctl_discard+0xc4/0x110
Apr 8 14:36:11 node1 kernel: [1044966.745899] blkdev_ioctl+0x336/0xa00
Apr 8 14:36:11 node1 kernel: [1044966.745904] block_ioctl+0x3d/0x50
Apr 8 14:36:11 node1 kernel: [1044966.745909] do_vfs_ioctl+0xa9/0x640
Apr 8 14:36:11 node1 kernel: [1044966.745915] ? __do_sys_newfstat+0x44/0x70
Apr 8 14:36:11 node1 kernel: [1044966.745920] ksys_ioctl+0x75/0x80
Apr 8 14:36:11 node1 kernel: [1044966.745925] __x64_sys_ioctl+0x1a/0x20
Apr 8 14:36:11 node1 kernel: [1044966.745930] do_syscall_64+0x5a/0x120
Apr 8 14:36:11 node1 kernel: [1044966.745934] entry_SYSCALL_64_after_hwframe+0x44/0xa9
Apr 8 14:36:11 node1 kernel: [1044966.745937] RIP: 0033:0x7fbec31955d7
Apr 8 14:36:11 node1 kernel: [1044966.745943] Code: Bad RIP value.
Apr 8 14:36:11 node1 kernel: [1044966.745944] RSP: 002b:00007fff7d5dd348 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
Apr 8 14:36:11 node1 kernel: [1044966.745948] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fbec31955d7
Apr 8 14:36:11 node1 kernel: [1044966.745950] RDX: 00007fff7d5dd370 RSI: 0000000000001277 RDI: 0000000000000003
Apr 8 14:36:11 node1 kernel: [1044966.745952] RBP: 00007fff7d5dd3a0 R08: 0000564bc980c5e8 R09: 00007fff7d5dd260
Apr 8 14:36:11 node1 kernel: [1044966.745954] R10: 0000000000000000 R11: 0000000000000206 R12: 0000564bc965b140
Apr 8 14:36:11 node1 kernel: [1044966.745956] R13: 00007fff7d5ddde0 R14: 0000000000000000 R15: 0000000000000000

Thanks
Niels te Grotenhuis
--
Niels te Grotenhuis, Senior Solution Architect, Shock Media B.V., Almelo, The Netherlands

-- 
Volg uw ticket online / Follow your ticket online:
https://tickets.shockmedia.nl/?tid=1019133&cs=4yqc8ex4
