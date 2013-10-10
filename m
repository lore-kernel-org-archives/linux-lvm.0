Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9AJn1Qu006037
	for <linux-lvm@redhat.com>; Thu, 10 Oct 2013 15:49:01 -0400
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9AJmxm3008530
	for <linux-lvm@redhat.com>; Thu, 10 Oct 2013 15:48:59 -0400
Received: from mail35-co9 (localhost [127.0.0.1])	by mail35-co9-R.bigfish.com
	(Postfix) with ESMTP id 5DD132000B3	for <linux-lvm@redhat.com>;
	Thu, 10 Oct 2013 19:48:59 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.246])	by
	mail35-co9.bigfish.com (Postfix) with ESMTP id 5EB1E12008A	for
	<linux-lvm@redhat.com>; Thu, 10 Oct 2013 19:48:56 +0000 (UTC)
Message-ID: <52570497.6090308@tekcomms.com>
Date: Thu, 10 Oct 2013 14:48:39 -0500
From: Joe Harvell <joe.harvell@tekcomms.com>
MIME-Version: 1.0
References: <5255CAB1.5050606@tekcomms.com>	<1381356552.67129.YahooMailNeo@web181504.mail.ne1.yahoo.com>	<5255D815.1090704@tekcomms.com>	<1381361455.80237.YahooMailNeo@web181502.mail.ne1.yahoo.com>
	<5256C1EA.8080805@tekcomms.com> <5256F40B.3060002@redhat.com>
In-Reply-To: <5256F40B.3060002@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Le 10/10/2013 13:38, Peter Rajnoha a �crit :
> On 10/10/2013 05:04 PM, Joe Harvell wrote:
>> Le 09/10/2013 18:30, matthew patton a �crit :
>>>> So I should set 'obtain_device_list_from_udev' to 0, then pvscan, vgscan
>>>> and lvscan?
>>> worth a shot. have you confirmed that udev has all the basic disk
>>> devices created?
>>>
>> I tried that to no avail.  Yes, all the block devices were present in
>> /dev, both for the raw partitions and the RAID ones.
>>
>> Does anyone know the algorithm LVM uses to determine whether PVs are
>> present?  Also, I'd really like an LVM tool that reads the PV label off
>> of a PV and displays it...I want to see what UUID label is actually on
>> each PV.
>>
> Two important questions here - which distro is this?
>
> There are two notions of cache in LVM. One is device cache, the other one
> is metadata cache. The first one is controlled by write_cache_state setting
> (which is obsoleted by obtaining the device list from udev). The latter one
> is controlled by use_lvmetad setting. The lvmetad (and metadata cache) has
> been added to LVM just recently, while the device cache is there for a long
> time...
>
> As for the other important question:
> Is lvmetad used or not? (check global/use_lvmetad lvm.conf setting).
> If lvmetad is used, it gathers incoming PVs based on events which means
> once the PV is available in the system, lvmetad gets notified automatically.
> Then the PV is scanned for LVM metadata and lvmetad stores that information.
> This information is then reused for each LVM command call instead of scanning
> the /dev again and again for PVs. The lvmetad requires udev for its operation!
> If lvmetad is used, does pvscan --cache call help?
>
> If lvmetad is not used, whenever the LVM command is executed, each
> block device in /dev is scanned for PV labels, every time! Here,
> the obtain_device_list_from_udev lvm.conf setting makes a difference
> in a way how we get the list of block devices - if this setting is
> disabled, LVM directly scans all the /dev content and it selects block devices
> itself. If it's enabled, we get the list of block devices from udev database
> (which is a bit quicker as we don't need to iterate over all the content of
> /dev and decide which item is a block device or not, saving a bit of time
> this way).
>
> Peter
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Thanks, Peter.  I run Gentoo, and I have a custom busybox based initrd 
with a static /dev.  The initrd loads the necessary kernel modules, 
assembles the raid arrays and then runs lvm vgscan, followed by 
'lvmchange -ay seward' before mounting the root file system and doing a 
switch_root exec'ing systemd.  So there are two LVM installations....the 
initrd and the system.  The lvm.conf for the initrd and for the running 
system are both included below with comments removed.  In both cases, 
use_lvmetad=0 and obtain_device_list_from_udev = 1.

Is there some LVM tool that reads and display the PV label from a 
specified block device?  Or that reads and displays the LVM meta-data 
from a specified block device?

Also, I realize I failed to mention something important.  When I first 
booted with all 5 disks in akita (the new system), my static /dev in the 
initrd did not have all the block device entries for all the partitions 
of all the disks in the system. Additionally, after I added the new 
entries with mknod, My devices {filter} config in the initrd was 
filtering them out. I've since corrected both of these.  Before I fixed 
this, I would get complaints running vgscan about several missing 
PVs....and the complaint output would refer to them by UUID. After I 
fixed this, I don't see those complaints.  So that must mean it found 
the PVs with those UUIDs....but still it shows the PVs with the 
"missing" flag and forces me to use --partial when activating the vg :(

On my running system, I have already done the following procedure and 
saw no changes:

1. Set devices { filter = [] }
2. Set devices { obtain_device_list_from_udev = 0 }
3. Executed pvscan
4. Executed vgscan
5. Executed lvscan
6. Observed a new file created /etc/lvm/cache/.cache
7. Observed PVs still have missing flag and I still have to say 
--partial to activate bayeux
8. Reverted config from steps 1 and 2
9. Deleted /etc/lvm/cache and its contents

Also for reference, here is what my initrd does exactly:

#!/bin/busybox sh

export PATH=/bin:/sbin
mount -n -t proc none /proc
mount -n -t sysfs none /sys
modprobe ahci
modprobe sd_mod
modprobe dm-mod
modprobe md-mod
modprobe raid1
modprobe raid10
modprobe raid5
modprobe ext4
modprobe xhci-hcd
modprobe ehci-hcd
modprobe uhci-hcd
modprobe ohci-hcd
modprobe usbhid
modprobe hid-generic
modprobe nvidia
mdadm --assemble --scan
lvm vgscan
lvm vgchange -ay seward
mount -t ext4 /dev/seward/root /mnt
umount /proc
umount /sys
exec switch_root /mnt /usr/lib/systemd/systemd --log-level=debug 
--log-target=journal


// Initrd LVM version (statically linked)
   LVM version:     2.02.103(2) (2013-10-04)
   Library version: 1.02.82 (2013-10-04)
   Driver version:  4.25.0
// Initrd LVM config

config {
     checks = 1
     abort_on_errors = 0
     profile_dir = "/etc/lvm/profile"
}

devices {
     dir = "/dev"
     scan = [ "/dev" ]
     obtain_device_list_from_udev = 1
     preferred_names = [ ]
     filter = [ "a|^/dev/md/.*|", "a|^/dev/sd[a-f][1-9]$|", 
"a|^/dev/sd[a-f]1[0-5]$|", "r|.*|" ]
     cache_dir = "/etc/lvm/cache"
     cache_file_prefix = ""
     write_cache_state = 1
     sysfs_scan = 1
     multipath_component_detection = 1
     md_component_detection = 1
     md_chunk_alignment = 1
     data_alignment_detection = 1
     data_alignment = 0
     data_alignment_offset_detection = 1
     ignore_suspended_devices = 0
     disable_after_error_count = 0
     require_restorefile_with_uuid = 1
     pv_min_size = 2048
     issue_discards = 0
}

allocation {
     maximise_cling = 1
     thin_pool_metadata_require_separate_pvs = 0
}

log {
     verbose = 0
     silent = 0
     syslog = 1
     overwrite = 0
     level = 0
     indent = 1
     command_names = 0
     prefix = "  "
     debug_classes = [ "memory", "devices", "activation", "allocation",
                       "lvmetad", "metadata", "cache", "locking" ]
}

backup {
     backup = 1
     backup_dir = "/etc/lvm/backup"
     archive = 1
     archive_dir = "/etc/lvm/archive"
     retain_min = 10
     retain_days = 30
}

shell {
     history_size = 100
}


global {
     umask = 077
     test = 0
     units = "h"
     si_unit_consistency = 1
     activation = 1
     fallback_to_lvm1 = 0
     proc = "/proc"
     locking_type = 1
     wait_for_locks = 1
     fallback_to_clustered_locking = 1
     fallback_to_local_locking = 1
     locking_dir = "/run/lock/lvm"
     prioritise_write_locks = 1
     abort_on_internal_errors = 0
     detect_internal_vg_cache_corruption = 0
     metadata_read_only = 0
     mirror_segtype_default = "raid1"
     raid10_segtype_default = "raid10"
     use_lvmetad = 0
}

activation {
     checks = 0
     udev_sync = 1
     udev_rules = 1
     verify_udev_operations = 0
     retry_deactivation = 1
     missing_stripe_filler = "error"
     use_linear_target = 1
     reserved_stack = 64
     reserved_memory = 8192
     process_priority = -18
     raid_region_size = 512
     readahead = "auto"
     raid_fault_policy = "warn"
     mirror_log_fault_policy = "allocate"
     mirror_image_fault_policy = "remove"
     snapshot_autoextend_threshold = 100
     snapshot_autoextend_percent = 20
     thin_pool_autoextend_threshold = 100
     thin_pool_autoextend_percent = 20
     use_mlockall = 0
     monitoring = 1
     polling_interval = 15
}

metadata {
}

dmeventd {
}

dmeventd {
     mirror_library = "libdevmapper-event-lvm2mirror.so"
     snapshot_library = "libdevmapper-event-lvm2snapshot.so"
     thin_library = "libdevmapper-event-lvm2thin.so"
}


// Running system LVM version:
  LVM version:     2.02.103(2) (2013-10-04)
   Library version: 1.02.82 (2013-10-04)
   Driver version:  4.25.0

// Running system LVM config:
config {
     checks = 1
     abort_on_errors = 0
     profile_dir = "/etc/lvm/profile"
}

devices {
     dir = "/dev"
     scan = [ "/dev" ]
     obtain_device_list_from_udev = 1
     preferred_names = [ ]
     filter = [ "a|^/dev/md/.*|", "a|^/dev/sd[a-g][1-9]$|", 
"a|^/dev/sd[a-g]1[0-5]$|", "r|.*|" ]
     cache_dir = "/etc/lvm/cache"
     cache_file_prefix = ""
     write_cache_state = 1
     sysfs_scan = 1
     multipath_component_detection = 1
     md_component_detection = 1
     md_chunk_alignment = 1
     data_alignment_detection = 1
     data_alignment = 0
     data_alignment_offset_detection = 1
     ignore_suspended_devices = 0
     disable_after_error_count = 0
     require_restorefile_with_uuid = 1
     pv_min_size = 2048
     issue_discards = 0
}

allocation {
     maximise_cling = 1
     mirror_logs_require_separate_pvs = 0
     thin_pool_metadata_require_separate_pvs = 0
}

log {
     verbose = 0
     silent = 0
     syslog = 1
     overwrite = 0
     level = 0
     indent = 1
     command_names = 0
     prefix = "  "
     debug_classes = [ "memory", "devices", "activation", "allocation",
                       "lvmetad", "metadata", "cache", "locking" ]
}

backup {
     backup = 1
     backup_dir = "/etc/lvm/backup"
     archive = 1
     archive_dir = "/etc/lvm/archive"
     retain_min = 10
     retain_days = 30
}

shell {
     history_size = 100
}


global {
     umask = 077
     test = 0
     units = "h"
     si_unit_consistency = 1
     activation = 1
     fallback_to_lvm1 = 0
     proc = "/proc"
     locking_type = 1
     wait_for_locks = 1
     fallback_to_clustered_locking = 1
     fallback_to_local_locking = 1
     locking_dir = "/run/lock/lvm"
     prioritise_write_locks = 1
     abort_on_internal_errors = 0
     detect_internal_vg_cache_corruption = 0
     metadata_read_only = 0
     mirror_segtype_default = "raid1"
     raid10_segtype_default = "raid10"
     use_lvmetad = 0
}

activation {
     checks = 0
     udev_sync = 1
     udev_rules = 1
     verify_udev_operations = 0
     retry_deactivation = 1
     missing_stripe_filler = "error"
     use_linear_target = 1
     reserved_stack = 64
     reserved_memory = 8192
     process_priority = -18
     raid_region_size = 512
     readahead = "auto"
     raid_fault_policy = "warn"
     mirror_log_fault_policy = "allocate"
     mirror_image_fault_policy = "remove"
     snapshot_autoextend_threshold = 100
     snapshot_autoextend_percent = 20
     thin_pool_autoextend_threshold = 100
     thin_pool_autoextend_percent = 20
     use_mlockall = 0
     monitoring = 1
     polling_interval = 15
}

metadata {
}

dmeventd {
     mirror_library = "libdevmapper-event-lvm2mirror.so"
     snapshot_library = "libdevmapper-event-lvm2snapshot.so"
     thin_library = "libdevmapper-event-lvm2thin.so"
}
