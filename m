Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l19EEYGp025240
	for <linux-lvm@redhat.com>; Fri, 9 Feb 2007 09:14:35 -0500
Received: from smtp02.nagra.com (smtp02.nagra.com [217.169.130.206])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l19EEVht010574
	for <linux-lvm@redhat.com>; Fri, 9 Feb 2007 09:14:31 -0500
Received: from smtp02.nagra.com (localhost.localdomain [127.0.0.1])
	by localhost.nagra.com (Postfix) with ESMTP id E2E515E8004
	for <linux-lvm@redhat.com>; Fri,  9 Feb 2007 15:14:24 +0100 (CET)
Received: from aten.hq.k.grp (unknown [172.31.239.42])
	by smtp02.nagra.com (Postfix) with ESMTP id C7E3C5E8002
	for <linux-lvm@redhat.com>; Fri,  9 Feb 2007 15:14:24 +0100 (CET)
From: Martial Paupe <martial.paupe@nagra.com>
Date: Fri, 9 Feb 2007 15:14:10 +0100
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_yGIzFLGl3/Zynz/"
Message-Id: <200702091514.10920.martial.paupe@nagra.com>
Subject: [linux-lvm] lvm Segmentation fault
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
To: linux-lvm@redhat.com

--Boundary-00=_yGIzFLGl3/Zynz/
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have a problem wich LVM2 and device-mapper. When I use lvscan, the system 
said

#lvscan
  Failed to get device-mapper version
  inactive          '/dev/VG_system/LV_boot' [1.97 GB] inherit
  inactive          '/dev/VG_system/LV_home' [5.00 GB] inherit
  inactive          '/dev/VG_system/LV_opt' [1.97 GB] inherit
  inactive          '/dev/VG_system/LV_tmp' [1.00 GB] inherit
  inactive          '/dev/VG_system/LV_usr' [2.94 GB] inherit
  inactive          '/dev/VG_system/LV_var' [53.25 GB] inherit
  inactive          '/dev/VG_system/LV_swap' [1.94 GB] inherit
  inactive          '/dev/VG_data/LV_subversion' [30.00 GB] inherit
Segmentation fault

# vgchange -a y VG_system
 Failed to get device-mapper version
  0 logical volume(s) in volume group "VG_system" now active
Segmentation fault

#dmsetup status
Segmentation fault

So all of logical volumes are in use. I don't see what happen.

Best regards
-- 
Martial Paupe

--Boundary-00=_yGIzFLGl3/Zynz/
Content-Type: text/plain;
  charset="us-ascii";
  name="Log de lvm2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Log de lvm2"

config/config.c:783   log/activation not found in config: defaulting to 0
commands/toolcontext.c:148   Logging initialised at Fri Feb  9 14:11:02 2007
config/config.c:778   Setting global/umask to 63
commands/toolcontext.c:167   Set umask to 0077
config/config.c:763   Setting devices/dir to /dev
config/config.c:763   Setting global/proc to /proc
config/config.c:778   Setting global/activation to 1
config/config.c:783   global/suffix not found in config: defaulting to 1
config/config.c:769   global/units not found in config: defaulting to h
regex/matcher.c:262   Matcher built with 73 dfa states
config/config.c:763   Setting devices/cache to /etc/lvm/.cache
config/config.c:778   Setting devices/write_cache_state to 1
device/dev-io.c:437   Opened /etc/lvm/.cache RO
device/dev-io.c:483   Closed /etc/lvm/.cache
device/dev-cache.c:225   /dev/dm-6: Added to device cache
device/dev-cache.c:225   /dev/ram11: Added to device cache
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:0a:03.0-fc-0x5006016810212608:0x0001000000000000: Added to device cache
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016910212608:0x0000000000000000: Added to device cache
device/dev-cache.c:225   /dev/sdh: Added to device cache
device/dev-cache.c:225   /dev/VG_system/LV_boot: Added to device cache
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016910212608:0x0001000000000000: Added to device cache
device/dev-cache.c:222   /dev/mapper/VG_system-LV_swap: Aliased to /dev/dm-6 in device cache
device/dev-cache.c:225   /dev/VG_system/LV_home: Added to device cache
device/dev-cache.c:225   /dev/dm-5: Added to device cache
device/dev-cache.c:225   /dev/ram10: Added to device cache
device/dev-cache.c:225   /dev/ram: Added to device cache
device/dev-cache.c:225   /dev/emcpowerc: Added to device cache
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016010212608:0x0000000000000000: Added to device cache
device/dev-cache.c:225   /dev/VG_data/LV_subversion: Added to device cache
device/dev-cache.c:225   /dev/VG_system/LV_usr: Added to device cache
device/dev-cache.c:225   /dev/ram12: Added to device cache
device/dev-cache.c:222   /dev/sdb: Aliased to /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016010212608:0x0000000000000000 in devi
ce cache (preferred name)
device/dev-cache.c:225   /dev/ram6: Added to device cache
device/dev-cache.c:222   /dev/VG_system/LV_var: Aliased to /dev/dm-5 in device cache
device/dev-cache.c:225   /dev/mapper/VG_system-LV_tmp: Added to device cache
device/dev-cache.c:225   /dev/ram13: Added to device cache
device/dev-cache.c:225   /dev/ram14: Added to device cache
device/dev-cache.c:225   /dev/emcpowera: Added to device cache
device/dev-cache.c:222   /dev/mapper/VG_data-LV_subversion: Aliased to /dev/VG_data/LV_subversion in device cache
device/dev-cache.c:225   /dev/sdf: Added to device cache
device/dev-cache.c:225   /dev/mapper/VG_system-LV_opt: Added to device cache
device/dev-cache.c:225   /dev/ram5: Added to device cache
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016010212608:0x0001000000000000: Added to device cache
device/dev-cache.c:222   /dev/disk/by-path/pci-0000:0a:03.0-fc-0x5006016810212608:0x0000000000000000: Aliased to /dev/sdh in devi
ce cache
device/dev-cache.c:222   /dev/dm-2: Aliased to /dev/mapper/VG_system-LV_opt in device cache (preferred name)
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:2:0:0-part1: Added to device cache
device/dev-cache.c:225   /dev/sdg: Added to device cache
device/dev-cache.c:222   /dev/ram1: Aliased to /dev/ram in device cache
device/dev-cache.c:222   /dev/sda1: Aliased to /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:2:0:0-part1 in device cache (preferred n
ame)
device/dev-cache.c:225   /dev/ramdisk: Added to device cache
device/dev-cache.c:222   /dev/disk/by-path/pci-0000:0a:03.0-fc-0x5006016110212608:0x0000000000000000: Aliased to /dev/sdf in devi
ce cache
device/dev-cache.c:222   /dev/VG_system/LV_swap: Aliased to /dev/dm-6 in device cache
device/dev-cache.c:222   /dev/dm-3: Aliased to /dev/mapper/VG_system-LV_tmp in device cache (preferred name)
device/dev-cache.c:222   /dev/dm-4: Aliased to /dev/VG_system/LV_usr in device cache (preferred name)
device/dev-cache.c:222   /dev/dm-7: Aliased to /dev/VG_data/LV_subversion in device cache (preferred name)
device/dev-cache.c:222   /dev/sdc: Aliased to /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016010212608:0x0001000000000000 in devi
ce cache (preferred name)
device/dev-cache.c:222   /dev/mapper/VG_system-LV_home: Aliased to /dev/VG_system/LV_home in device cache
device/dev-cache.c:222   /dev/ram0: Aliased to /dev/ramdisk in device cache
device/dev-cache.c:222   /dev/VG_system/LV_tmp: Aliased to /dev/dm-3 in device cache
device/dev-cache.c:222   /dev/root: Aliased to /dev/VG_system/LV_boot in device cache (preferred name)
device/dev-cache.c:222   /dev/dm-1: Aliased to /dev/VG_system/LV_home in device cache (preferred name)
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:2:0:0-part2: Added to device cache
device/dev-cache.c:222   /dev/disk/by-path/pci-0000:0a:03.0-fc-0x5006016110212608:0x0001000000000000: Aliased to /dev/sdg in devi
ce cache
device/dev-cache.c:222   /dev/sdi: Aliased to /dev/disk/by-path/pci-0000:0a:03.0-fc-0x5006016810212608:0x0001000000000000 in devi
ce cache (preferred name)
device/dev-cache.c:222   /dev/mapper/VG_system-LV_var: Aliased to /dev/dm-5 in device cache
device/dev-cache.c:225   /dev/ram2: Added to device cache
device/dev-cache.c:222   /dev/sda2: Aliased to /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:2:0:0-part2 in device cache (preferred n
ame)
device/dev-cache.c:225   /dev/ram8: Added to device cache
device/dev-cache.c:225   /dev/ram9: Added to device cache
device/dev-cache.c:222   /dev/dm-0: Aliased to /dev/root in device cache
device/dev-cache.c:222   /dev/mapper/VG_system-LV_usr: Aliased to /dev/dm-4 in device cache
device/dev-cache.c:225   /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:2:0:0-part3: Added to device cache
device/dev-cache.c:225   /dev/ram15: Added to device cache
device/dev-cache.c:222   /dev/mapper/VG_system-LV_boot: Aliased to /dev/root in device cache
device/dev-cache.c:222   /dev/sdd: Aliased to /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016910212608:0x0000000000000000 in devi
ce cache (preferred name)
device/dev-cache.c:222   /dev/sde: Aliased to /dev/disk/by-path/pci-0000:09:04.0-fc-0x5006016910212608:0x0001000000000000 in devi
ce cache (preferred name)
device/dev-cache.c:222   /dev/VG_system/LV_opt: Aliased to /dev/dm-2 in device cache
device/dev-cache.c:225   /dev/ram3: Added to device cache
device/dev-cache.c:222   /dev/sda3: Aliased to /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:2:0:0-part3 in device cache (preferred n
ame)
device/dev-cache.c:225   /dev/ram4: Added to device cache
device/dev-cache.c:225   /dev/ram7: Added to device cache
filters/filter-persistent.c:126   Loaded persistent filter cache from /etc/lvm/.cache
config/config.c:778   Setting activation/reserved_stack to 256
config/config.c:778   Setting activation/reserved_memory to 8192
config/config.c:778   Setting activation/process_priority to -18
format1/format1.c:581   Initialised format: lvm1
format_pool/format_pool.c:354   Initialised format: pool
format_text/format-text.c:1809   Initialised format: lvm2
config/config.c:769   global/format not found in config: defaulting to lvm2
striped/striped.c:227   Initialised segtype: striped
zero/zero.c:96   Initialised segtype: zero
error/errseg.c:95   Initialised segtype: error
snapshot/snapshot.c:165   Initialised segtype: snapshot
mirror/mirrored.c:526   Initialised segtype: mirror
config/config.c:778   Setting backup/retain_days to 30
config/config.c:778   Setting backup/retain_min to 10
config/config.c:763   Setting backup/archive_dir to /etc/lvm/archive
config/config.c:763   Setting backup/backup_dir to /etc/lvm/backup
config/config.c:783   global/fallback_to_lvm1 not found in config: defaulting to 1
lvmcmdline.c:834   Parsing: lvscan
lvmcmdline.c:858   Processing: lvscan
lvmcmdline.c:861   O_DIRECT will be used
config/config.c:778   Setting global/locking_type to 1
config/config.c:763   Setting global/locking_dir to /var/lock/lvm
locking/locking.c:139   File-based locking enabled.
toollib.c:286   Finding all logical volumes
device/dev-io.c:387   /dev/ramdisk: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ramdisk RO
device/dev-io.c:134   /dev/ramdisk: block size is 1024 bytes
label/label.c:180   /dev/ramdisk: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ramdisk
device/dev-io.c:437   Opened /dev/emcpowera RO O_DIRECT
device/dev-io.c:134   /dev/emcpowera: block size is 4096 bytes
label/label.c:158   /dev/emcpowera: lvm2 label detected
cache/lvmcache.c:655   lvmcache: /dev/emcpowera: now orphaned
format_text/format-text.c:954   /dev/emcpowera: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgN
iJf)
cache/lvmcache.c:655   lvmcache: /dev/emcpowera: now in VG VG_data
cache/lvmcache.c:469   lvmcache: /dev/emcpowera: setting VG_data VGID to ljpJB53zyufnqrS1fRrCs2JQZ2bgNiJf
cache/lvmcache.c:690   lvmcache: /dev/emcpowera: VG VG_data: Set creation host to leto1.
device/dev-io.c:483   Closed /dev/emcpowera
device/dev-io.c:437   Opened /dev/root RO O_DIRECT
device/dev-io.c:134   /dev/root: block size is 4096 bytes
label/label.c:180   /dev/root: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/root
device/dev-io.c:387   /dev/ram: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram RO
device/dev-io.c:134   /dev/ram: block size is 1024 bytes
label/label.c:180   /dev/ram: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram
device/dev-io.c:437   Opened /dev/sda1 RO O_DIRECT
device/dev-io.c:134   /dev/sda1: block size is 1024 bytes
label/label.c:180   /dev/sda1: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/sda1
device/dev-io.c:437   Opened /dev/dm-1 RO O_DIRECT
device/dev-io.c:134   /dev/dm-1: block size is 4096 bytes
label/label.c:180   /dev/dm-1: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-1
device/dev-io.c:387   /dev/ram2: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram2 RO
device/dev-io.c:134   /dev/ram2: block size is 1024 bytes
label/label.c:180   /dev/ram2: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram2
device/dev-io.c:437   Opened /dev/sda2 RO O_DIRECT
device/dev-io.c:134   /dev/sda2: block size is 1024 bytes
label/label.c:180   /dev/sda2: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/sda2
device/dev-io.c:437   Opened /dev/dm-2 RO O_DIRECT
device/dev-io.c:134   /dev/dm-2: block size is 4096 bytes
label/label.c:180   /dev/dm-2: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-2
device/dev-io.c:387   /dev/ram3: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram3 RO
device/dev-io.c:134   /dev/ram3: block size is 1024 bytes
label/label.c:180   /dev/ram3: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram3
device/dev-io.c:437   Opened /dev/sda3 RO O_DIRECT
device/dev-io.c:134   /dev/sda3: block size is 1024 bytes
label/label.c:158   /dev/sda3: lvm2 label detected
cache/lvmcache.c:655   lvmcache: /dev/sda3: now orphaned
format_text/format-text.c:954   /dev/sda3: Found metadata at 13824 size 2255 for VG_system (h32WYE-QS8L-kb1S-VN9T-TdT6-Lm9T-TKF7W
o)
cache/lvmcache.c:655   lvmcache: /dev/sda3: now in VG VG_system
cache/lvmcache.c:469   lvmcache: /dev/sda3: setting VG_system VGID to h32WYEQS8Lkb1SVN9TTdT6Lm9TTKF7Wo
cache/lvmcache.c:690   lvmcache: /dev/sda3: VG VG_system: Set creation host to localhost.localdomain.
device/dev-io.c:483   Closed /dev/sda3
device/dev-io.c:437   Opened /dev/dm-3 RO O_DIRECT
device/dev-io.c:134   /dev/dm-3: block size is 4096 bytes
label/label.c:180   /dev/dm-3: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-3
device/dev-io.c:387   /dev/ram4: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram4 RO
device/dev-io.c:134   /dev/ram4: block size is 1024 bytes
label/label.c:180   /dev/ram4: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram4
device/dev-io.c:437   Opened /dev/dm-4 RO O_DIRECT
device/dev-io.c:134   /dev/dm-4: block size is 4096 bytes
label/label.c:180   /dev/dm-4: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-4
device/dev-io.c:387   /dev/ram5: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram5 RO
device/dev-io.c:134   /dev/ram5: block size is 1024 bytes
label/label.c:180   /dev/ram5: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram5
device/dev-io.c:437   Opened /dev/dm-5 RO O_DIRECT
device/dev-io.c:134   /dev/dm-5: block size is 4096 bytes
label/label.c:180   /dev/dm-5: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-5
device/dev-io.c:387   /dev/ram6: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram6 RO
device/dev-io.c:134   /dev/ram6: block size is 1024 bytes
label/label.c:180   /dev/ram6: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram6
device/dev-io.c:437   Opened /dev/dm-6 RO O_DIRECT
device/dev-io.c:134   /dev/dm-6: block size is 4096 bytes
label/label.c:180   /dev/dm-6: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-6
device/dev-io.c:387   /dev/ram7: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram7 RO
device/dev-io.c:134   /dev/ram7: block size is 1024 bytes
label/label.c:180   /dev/ram7: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram7
device/dev-io.c:437   Opened /dev/dm-7 RO O_DIRECT
device/dev-io.c:134   /dev/dm-7: block size is 4096 bytes
label/label.c:180   /dev/dm-7: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/dm-7
device/dev-io.c:387   /dev/ram8: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram8 RO
device/dev-io.c:134   /dev/ram8: block size is 1024 bytes
label/label.c:180   /dev/ram8: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram8
device/dev-io.c:387   /dev/ram9: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram9 RO
device/dev-io.c:134   /dev/ram9: block size is 1024 bytes
label/label.c:180   /dev/ram9: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram9
device/dev-io.c:387   /dev/ram10: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram10 RO
device/dev-io.c:134   /dev/ram10: block size is 1024 bytes
label/label.c:180   /dev/ram10: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram10
device/dev-io.c:387   /dev/ram11: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram11 RO
device/dev-io.c:134   /dev/ram11: block size is 1024 bytes
label/label.c:180   /dev/ram11: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram11
device/dev-io.c:387   /dev/ram12: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram12 RO
device/dev-io.c:134   /dev/ram12: block size is 1024 bytes
label/label.c:180   /dev/ram12: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram12
device/dev-io.c:387   /dev/ram13: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram13 RO
device/dev-io.c:134   /dev/ram13: block size is 1024 bytes
label/label.c:180   /dev/ram13: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram13
device/dev-io.c:387   /dev/ram14: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram14 RO
device/dev-io.c:134   /dev/ram14: block size is 1024 bytes
label/label.c:180   /dev/ram14: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram14
device/dev-io.c:387   /dev/ram15: Not using O_DIRECT
device/dev-io.c:437   Opened /dev/ram15 RO
device/dev-io.c:134   /dev/ram15: block size is 1024 bytes
label/label.c:180   /dev/ram15: No label detected
label/label.c:278   <backtrace>
device/dev-io.c:483   Closed /dev/ram15
device/dev-io.c:437   Opened /dev/sdb RO O_DIRECT
device/dev-io.c:134   /dev/sdb: block size is 4096 bytes
label/label.c:158   /dev/sdb: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV Uw5jQrbmlZbPNbpeVNXvtg7HKxAdadfS: using /dev/sdb not /dev/emcpowera
format_text/format-text.c:954   /dev/sdb: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sdb
device/dev-io.c:437   Opened /dev/sdc RO O_DIRECT
device/dev-io.c:134   /dev/sdc: block size is 4096 bytes
label/label.c:158   /dev/sdc: lvm2 label detected
cache/lvmcache.c:655   lvmcache: /dev/sdc: now orphaned
format_text/format-text.c:954   /dev/sdc: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
cache/lvmcache.c:655   lvmcache: /dev/sdc: now in VG VG_data (ljpJB53zyufnqrS1fRrCs2JQZ2bgNiJf)
device/dev-io.c:483   Closed /dev/sdc
device/dev-io.c:437   Opened /dev/emcpowerc RO O_DIRECT
device/dev-io.c:134   /dev/emcpowerc: block size is 4096 bytes
label/label.c:158   /dev/emcpowerc: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV qqVYsq6hfR8yvS42uudnYZ3x5wliDG5B: using /dev/emcpowerc not /dev/sdc
format_text/format-text.c:954   /dev/emcpowerc: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgN
iJf)
device/dev-io.c:483   Closed /dev/emcpowerc
device/dev-io.c:437   Opened /dev/sdd RO O_DIRECT
device/dev-io.c:134   /dev/sdd: block size is 4096 bytes
label/label.c:158   /dev/sdd: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV Uw5jQrbmlZbPNbpeVNXvtg7HKxAdadfS: using /dev/sdd not /dev/sdb
format_text/format-text.c:954   /dev/sdd: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sdd
device/dev-io.c:437   Opened /dev/sde RO O_DIRECT
device/dev-io.c:134   /dev/sde: block size is 4096 bytes
label/label.c:158   /dev/sde: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV qqVYsq6hfR8yvS42uudnYZ3x5wliDG5B: using /dev/sde not /dev/emcpowerc
format_text/format-text.c:954   /dev/sde: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sde
device/dev-io.c:437   Opened /dev/sdf RO O_DIRECT
device/dev-io.c:134   /dev/sdf: block size is 4096 bytes
label/label.c:158   /dev/sdf: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV Uw5jQrbmlZbPNbpeVNXvtg7HKxAdadfS: using /dev/sdf not /dev/sdd
format_text/format-text.c:954   /dev/sdf: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sdf
device/dev-io.c:437   Opened /dev/sdg RO O_DIRECT
device/dev-io.c:134   /dev/sdg: block size is 4096 bytes
label/label.c:158   /dev/sdg: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV qqVYsq6hfR8yvS42uudnYZ3x5wliDG5B: using /dev/sdg not /dev/sde
format_text/format-text.c:954   /dev/sdg: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sdg
device/dev-io.c:437   Opened /dev/sdh RO O_DIRECT
device/dev-io.c:134   /dev/sdh: block size is 4096 bytes
label/label.c:158   /dev/sdh: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV Uw5jQrbmlZbPNbpeVNXvtg7HKxAdadfS: using /dev/sdh not /dev/sdf
format_text/format-text.c:954   /dev/sdh: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sdh
device/dev-io.c:437   Opened /dev/sdi RO O_DIRECT
device/dev-io.c:134   /dev/sdi: block size is 4096 bytes
label/label.c:158   /dev/sdi: lvm2 label detected
cache/lvmcache.c:799   Found duplicate PV qqVYsq6hfR8yvS42uudnYZ3x5wliDG5B: using /dev/sdi not /dev/sdg
format_text/format-text.c:954   /dev/sdi: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:483   Closed /dev/sdi
locking/file_locking.c:164   Locking /var/lock/lvm/V_VG_system RB
device/dev-io.c:437   Opened /dev/sda3 RO O_DIRECT
device/dev-io.c:134   /dev/sda3: block size is 1024 bytes
label/label.c:158   /dev/sda3: lvm2 label detected
format_text/format-text.c:954   /dev/sda3: Found metadata at 13824 size 2255 for VG_system (h32WYE-QS8L-kb1S-VN9T-TdT6-Lm9T-TKF7W
o)
label/label.c:158   /dev/sda3: lvm2 label detected
format_text/format-text.c:954   /dev/sda3: Found metadata at 13824 size 2255 for VG_system (h32WYE-QS8L-kb1S-VN9T-TdT6-Lm9T-TKF7W
o)
config/config.c:769   description not found in config: defaulting to 
format_text/format-text.c:323   Read VG_system metadata (8) from /dev/sda3 at 13824 size 2255
metadata/pv_manip.c:241   /dev/sda3 0:      0     63: LV_boot(0:0)
metadata/pv_manip.c:241   /dev/sda3 1:     63    160: LV_home(0:0)
metadata/pv_manip.c:241   /dev/sda3 2:    223     63: LV_opt(0:0)
metadata/pv_manip.c:241   /dev/sda3 3:    286     32: LV_tmp(0:0)
metadata/pv_manip.c:241   /dev/sda3 4:    318     94: LV_usr(0:0)
metadata/pv_manip.c:241   /dev/sda3 5:    412   1704: LV_var(0:0)
metadata/pv_manip.c:241   /dev/sda3 6:   2116     62: LV_swap(0:0)
metadata/pv_manip.c:241   /dev/sda3 7:   2178      1: NULL(0:0)
activate/activate.c:370   Getting device info for VG_system-LV_boot
ioctl/libdm-iface.c:776   Failed to get device-mapper version
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_boot' [1.97 GB] inherit
activate/activate.c:370   Getting device info for VG_system-LV_home
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_home' [5.00 GB] inherit
activate/activate.c:370   Getting device info for VG_system-LV_opt
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_opt' [1.97 GB] inherit
activate/activate.c:370   Getting device info for VG_system-LV_tmp
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_tmp' [1.00 GB] inherit
activate/activate.c:370   Getting device info for VG_system-LV_usr
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_usr' [2.94 GB] inherit
activate/activate.c:370   Getting device info for VG_system-LV_var
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_var' [53.25 GB] inherit
activate/activate.c:370   Getting device info for VG_system-LV_swap
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_system/LV_swap' [1.94 GB] inherit
locking/file_locking.c:59   Unlocking /var/lock/lvm/V_VG_system
device/dev-io.c:483   Closed /dev/sda3
locking/file_locking.c:164   Locking /var/lock/lvm/V_VG_data RB
device/dev-io.c:437   Opened /dev/sdh RO O_DIRECT
device/dev-io.c:134   /dev/sdh: block size is 4096 bytes
label/label.c:158   /dev/sdh: lvm2 label detected
format_text/format-text.c:954   /dev/sdh: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
device/dev-io.c:437   Opened /dev/sdi RO O_DIRECT
device/dev-io.c:134   /dev/sdi: block size is 4096 bytes
label/label.c:158   /dev/sdi: lvm2 label detected
format_text/format-text.c:954   /dev/sdi: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
label/label.c:158   /dev/sdh: lvm2 label detected
format_text/format-text.c:954   /dev/sdh: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
label/label.c:158   /dev/sdi: lvm2 label detected
format_text/format-text.c:954   /dev/sdi: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
config/config.c:769   description not found in config: defaulting to 
format_text/format-text.c:323   Read VG_data metadata (71) from /dev/sdh at 98816 size 957
label/label.c:158   /dev/sdh: lvm2 label detected
format_text/format-text.c:954   /dev/sdh: Found metadata at 98816 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
label/label.c:158   /dev/sdi: lvm2 label detected
format_text/format-text.c:954   /dev/sdi: Found metadata at 92672 size 957 for VG_data (ljpJB5-3zyu-fnqr-S1fR-rCs2-JQZ2-bgNiJf)
config/config.c:769   description not found in config: defaulting to 
format_text/format-text.c:323   Read VG_data metadata (71) from /dev/sdi at 92672 size 957
metadata/pv_manip.c:241   /dev/sdh 0:      0   7679: LV_subversion(0:0)
metadata/pv_manip.c:241   /dev/sdi 0:      0   2559: NULL(0:0)
activate/activate.c:370   Getting device info for VG_data-LV_subversion
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/dev_manager.c:102   <backtrace>
activate/dev_manager.c:130   <backtrace>
activate/activate.c:374   <backtrace>
lvscan.c:67   inactive          '/dev/VG_data/LV_subversion' [30.00 GB] inherit
locking/file_locking.c:59   Unlocking /var/lock/lvm/V_VG_data
device/dev-io.c:483   Closed /dev/sdh
device/dev-io.c:483   Closed /dev/sdi
lvmcmdline.c:901   Completed: lvscan
filters/filter-persistent.c:180   Dumping persistent device cache to /etc/lvm/.cache
cache/lvmcache.c:871   Wiping internal VG cache

--Boundary-00=_yGIzFLGl3/Zynz/--
