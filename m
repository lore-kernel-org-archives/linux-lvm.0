Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B41608C3
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2019 17:34:05 +0000 (UTC)
Received: from strike.wu-wien.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65BEDA7FF2
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2019 17:33:53 +0000 (UTC)
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <0572fd11-c137-3def-cf63-3c796de07cf2@strike.wu.ac.at>
Date: Fri, 25 Jan 2019 18:33:50 +0100
MIME-Version: 1.0
Content-Language: de-AT
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend doesn't sync raid1 LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi!

If I extend a raid1 LV using lvextend, the newly allocated space in the two rimage devices isn't synced, just like if I had used the option --nosync.

As a result, a following raid check will report mismatches.

Here is an example:
-------------------- 8< --------------------
# lvcreate -L1g --type raid1 -m 1 -n /dev/vg_sys/lv_test /dev/vg_sys
  Logical volume "lv_test" created.
# lvs -a /dev/vg_sys/lv_test
  LV      VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_test vg_sys rwi-a-r--- 1.00g                                    88.35           
# lvs -a /dev/vg_sys/lv_test
  LV      VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_test vg_sys rwi-a-r--- 1.00g                                    100.00          
# lvextend -vvvv -L +1g /dev/vg_sys/lv_test
### (verbose output is shown below)

### sync percentage is immediately@100%
# lvs -a /dev/vg_sys/lv_test
  LV      VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_test vg_sys rwi-a-r--- 2.00g                                    100.00          

# lvchange --syncaction check /dev/vg_sys/lv_test
# lvs -a /dev/vg_sys/lv_test
  LV      VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_test vg_sys rwi-a-r--- 2.00g                                    6.25            

# lvs -a /dev/vg_sys/lv_test
  LV      VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_test vg_sys rwi-a-r-m- 2.00g                                    100.00          

# lvs -o lv_path,lv_attr,lv_size,devices,raid_mismatch_count,lv_health_status /dev/vg_sys/lv_test
  Path                Attr       LSize Devices                                 Mismatches Health          
  /dev/vg_sys/lv_test rwi-a-r-m- 2.00g lv_test_rimage_0(0),lv_test_rimage_1(0)    2097152 mismatches exist
-------------------- 8< --------------------


I am using Centos 7 with a 4.4 kernel-lt from ELRepo:

# rpm -q lvm2 device-mapper
lvm2-2.02.180-10.el7_6.2.x86_64
device-mapper-1.02.149-10.el7_6.2.x86_64
# uname -r
4.4.158-1.el7.elrepo.x86_64

Maybe the lvm2 / device-mapper version doesn't fit the kernel version?


I can fix this, of course, using "lvchange --syncaction repair" but I guess this isn't the intended workflow.

Cheers,
--leo



#lvmcmdline.c:2829          Parsing: lvextend -vvvv -L +1g /dev/vg_sys/lv_test
#lvmcmdline.c:1881          Recognised command lvextend_by_size (id 81 / enum 59).
#config/config.c:1480        devices/global_filter not found in config: defaulting to global_filter = [ "a|.*/|" ]
#libdm-config.c:1074        global/use_lvmetad not found in config: defaulting to 1
#libdm-config.c:1002        global/lvmetad_update_wait_time not found in config: defaulting to 10
#daemon-client.c:33            /run/lvm/lvmetad.socket: Opening daemon socket to lvmetad for protocol lvmetad version 1.
#daemon-client.c:52            Sending daemon lvmetad: hello
#cache/lvmetad.c:143           Successfully connected to lvmetad on fd 3.
#filters/filter-sysfs.c:327           Sysfs filter initialised.
#filters/filter-internal.c:77            Internal filter initialised.
#filters/filter-type.c:56            LVM type filter initialised.
#filters/filter-usable.c:183           Usable device filter initialised.
#filters/filter-mpath.c:291           mpath filter initialised.
#filters/filter-partitioned.c:69            Partitioned filter initialised.
#filters/filter-composite.c:109           Composite filter initialised.
#config/config.c:1480        devices/filter not found in config: defaulting to filter = [ "a|.*/|" ]
#filters/filter-regex.c:216           Regex filter initialised.
#filters/filter-usable.c:183           Usable device filter initialised.
#filters/filter-composite.c:109           Composite filter initialised.
#libdm-config.c:975         devices/cache not found in config: defaulting to /etc/lvm/cache/.cache
#filters/filter-persistent.c:415           Persistent filter initialised.
#filters/filter-composite.c:109           Composite filter initialised.
#libdm-config.c:1074        global/use_lvmetad not found in config: defaulting to 1
#libdm-config.c:1074        metadata/record_lvs_history not found in config: defaulting to 0
#lvmcmdline.c:2897          DEGRADED MODE. Incomplete RAID LVs will be processed.
#lvmcmdline.c:2903          Processing command: lvextend -vvvv -L +1g /dev/vg_sys/lv_test
#lvmcmdline.c:2904          Command pid: 22359
#lvmcmdline.c:2905          System ID: 
#lvmcmdline.c:2908          O_DIRECT will be used
#locking/locking.c:129         File-based locking selected.
#cache/lvmetad.c:256           Sending lvmetad get_global_info
#libdm-config.c:975         report/output_format not found in config: defaulting to basic
#libdm-config.c:1074        log/report_command_log not found in config: defaulting to 0
#toollib.c:2246          Processing each VG
#toollib.c:2294        Obtaining the complete list of VGs to process
#cache/lvmetad.c:1447          Asking lvmetad for complete list of known VG ids/names
#toollib.c:2008        Processing VG vg_sys xwAQBN-iZlp-uwjO-a6Mx-fUBV-fTeU-KURS3O
#locking/locking.c:367           Dropping cache for vg_sys.
#misc/lvm-flock.c:202         Locking /run/lock/lvm/V_vg_sys WB
#misc/lvm-flock.c:100           _do_flock /run/lock/lvm/V_vg_sys:aux WB
#misc/lvm-flock.c:100           _do_flock /run/lock/lvm/V_vg_sys WB
#misc/lvm-flock.c:47            _undo_flock /run/lock/lvm/V_vg_sys:aux
#cache/lvmcache.c:755           lvmcache has no info for vgname "vg_sys".
#metadata/metadata.c:3780        Reading VG vg_sys xwAQBN-iZlp-uwjO-a6Mx-fUBV-fTeU-KURS3O
#cache/lvmetad.c:985           Asking lvmetad for VG xwAQBN-iZlp-uwjO-a6Mx-fUBV-fTeU-KURS3O vg_sys
#cache/lvmcache.c:755           lvmcache has no info for vgname "vg_sys" with VGID xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O.
#format_text/format-text.c:2055          <backtrace>
#device/dev-cache.c:1212          Creating list of system devices.
#device/dev-cache.c:723           Found dev 8:0 /dev/sda - new.
#device/dev-cache.c:763           Found dev 8:0 /dev/disk/by-id/ata-ST3000VX000-1CU166_Z1F2GBXH - new alias.
#device/dev-cache.c:763           Found dev 8:0 /dev/disk/by-id/wwn-0x5000c5005d1debb5 - new alias.
#device/dev-cache.c:763           Found dev 8:0 /dev/disk/by-path/pci-0000:00:1f.2-ata-1.0 - new alias.
#device/dev-cache.c:723           Found dev 8:1 /dev/sda1 - new.
#device/dev-cache.c:763           Found dev 8:1 /dev/disk/by-id/ata-ST3000VX000-1CU166_Z1F2GBXH-part1 - new alias.
#device/dev-cache.c:763           Found dev 8:1 /dev/disk/by-id/wwn-0x5000c5005d1debb5-part1 - new alias.
#device/dev-cache.c:763           Found dev 8:1 /dev/disk/by-partlabel/BIOS\x20boot\x20partition - new alias.
#device/dev-cache.c:763           Found dev 8:1 /dev/disk/by-partuuid/bbba959d-1e15-4080-98ce-c26079630769 - new alias.
#device/dev-cache.c:763           Found dev 8:1 /dev/disk/by-path/pci-0000:00:1f.2-ata-1.0-part1 - new alias.
#device/dev-cache.c:723           Found dev 8:2 /dev/sda2 - new.
#device/dev-cache.c:763           Found dev 8:2 /dev/disk/by-id/ata-ST3000VX000-1CU166_Z1F2GBXH-part2 - new alias.
#device/dev-cache.c:763           Found dev 8:2 /dev/disk/by-id/lvm-pv-uuid-hK7rcr-LItv-KP00-pdyo-e2IU-EGOO-L3zzyV - new alias.
#device/dev-cache.c:763           Found dev 8:2 /dev/disk/by-id/wwn-0x5000c5005d1debb5-part2 - new alias.
#device/dev-cache.c:723           Found dev 8:18 /dev/disk/by-partlabel/Linux\x20LVM - new.
#device/dev-cache.c:763           Found dev 8:2 /dev/disk/by-partuuid/80c4e2d6-1911-4865-aedd-8f808e3255fc - new alias.
#device/dev-cache.c:763           Found dev 8:2 /dev/disk/by-path/pci-0000:00:1f.2-ata-1.0-part2 - new alias.
#device/dev-cache.c:723           Found dev 8:16 /dev/sdb - new.
#device/dev-cache.c:763           Found dev 8:16 /dev/disk/by-id/ata-ST31000524NS_9WK3Y1T1 - new alias.
#device/dev-cache.c:763           Found dev 8:16 /dev/disk/by-id/wwn-0x5000c5002e13ae08 - new alias.
#device/dev-cache.c:763           Found dev 8:16 /dev/disk/by-path/pci-0000:00:1f.2-ata-2.0 - new alias.
#device/dev-cache.c:723           Found dev 8:17 /dev/sdb1 - new.
#device/dev-cache.c:763           Found dev 8:17 /dev/disk/by-id/ata-ST31000524NS_9WK3Y1T1-part1 - new alias.
#device/dev-cache.c:763           Found dev 8:17 /dev/disk/by-id/wwn-0x5000c5002e13ae08-part1 - new alias.
#device/dev-cache.c:714           Found dev 8:1 /dev/disk/by-partlabel/BIOS\x20boot\x20partition - exists. 
#device/dev-cache.c:763           Found dev 8:17 /dev/disk/by-partuuid/19a730ab-1daa-4b00-85c3-9c62bdbf38ae - new alias.
#device/dev-cache.c:763           Found dev 8:17 /dev/disk/by-path/pci-0000:00:1f.2-ata-2.0-part1 - new alias.
#device/dev-cache.c:763           Found dev 8:18 /dev/sdb2 - new alias.
#device/dev-cache.c:763           Found dev 8:18 /dev/disk/by-id/ata-ST31000524NS_9WK3Y1T1-part2 - new alias.
#device/dev-cache.c:763           Found dev 8:18 /dev/disk/by-id/lvm-pv-uuid-WrL4ie-rF0B-H1yL-m3DQ-uACO-CFKu-qmNTBg - new alias.
#device/dev-cache.c:763           Found dev 8:18 /dev/disk/by-id/wwn-0x5000c5002e13ae08-part2 - new alias.
#device/dev-cache.c:714           Found dev 8:18 /dev/disk/by-partlabel/Linux\x20LVM - exists. 
#device/dev-cache.c:763           Found dev 8:18 /dev/disk/by-partuuid/4d5505d9-31eb-4143-b0fa-a38569408e77 - new alias.
#device/dev-cache.c:763           Found dev 8:18 /dev/disk/by-path/pci-0000:00:1f.2-ata-2.0-part2 - new alias.
#device/dev-cache.c:723           Found dev 11:0 /dev/sr0 - new.
#device/dev-cache.c:763           Found dev 11:0 /dev/cdrom - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/disk/by-id/ata-PLDS_DVD+_-RW_DH-16AES_FY13D7363948V554KA00 - new alias.
#device/dev-cache.c:763           Found dev 11:0 /dev/disk/by-path/pci-0000:00:1f.2-ata-4.0 - new alias.
#device/dev-cache.c:723           Found dev 253:0 /dev/dm-0 - new.
#device/dev-cache.c:763           Found dev 253:0 /dev/mapper/vg_sys-root_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:1 /dev/dm-1 - new.
#device/dev-cache.c:763           Found dev 253:1 /dev/mapper/vg_sys-root_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:10 /dev/dm-10 - new.
#device/dev-cache.c:763           Found dev 253:10 /dev/mapper/vg_sys-swap_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:11 /dev/dm-11 - new.
#device/dev-cache.c:763           Found dev 253:11 /dev/mapper/vg_sys-swap_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:12 /dev/dm-12 - new.
#device/dev-cache.c:763           Found dev 253:12 /dev/mapper/vg_sys-swap_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:13 /dev/dm-13 - new.
#device/dev-cache.c:763           Found dev 253:13 /dev/mapper/vg_sys-swap_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:14 /dev/dm-14 - new.
#device/dev-cache.c:763           Found dev 253:14 /dev/disk/by-id/dm-name-vg_sys-swap - new alias.
#device/dev-cache.c:763           Found dev 253:14 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Oijl55IIgo5k7syQU99iyOwZPSB2m1iSC - new alias.
#device/dev-cache.c:763           Found dev 253:14 /dev/disk/by-uuid/56038862-0bb6-4583-bf39-d0d4fa51efe1 - new alias.
#device/dev-cache.c:763           Found dev 253:14 /dev/mapper/vg_sys-swap - new alias.
#device/dev-cache.c:763           Found dev 253:14 /dev/vg_sys/swap - new alias.
#device/dev-cache.c:723           Found dev 253:15 /dev/dm-15 - new.
#device/dev-cache.c:763           Found dev 253:15 /dev/mapper/vg_sys-afscache_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:16 /dev/dm-16 - new.
#device/dev-cache.c:763           Found dev 253:16 /dev/mapper/vg_sys-afscache_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:17 /dev/dm-17 - new.
#device/dev-cache.c:763           Found dev 253:17 /dev/mapper/vg_sys-afscache_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:18 /dev/dm-18 - new.
#device/dev-cache.c:763           Found dev 253:18 /dev/mapper/vg_sys-afscache_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:19 /dev/dm-19 - new.
#device/dev-cache.c:763           Found dev 253:19 /dev/disk/by-id/dm-name-vg_sys-afscache - new alias.
#device/dev-cache.c:763           Found dev 253:19 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OCGbsfg3WFFcnORN0JxulOMetEi9uK39D - new alias.
#device/dev-cache.c:763           Found dev 253:19 /dev/disk/by-uuid/779b4d3a-c1ae-4fe3-81c8-c332d7cc82b5 - new alias.
#device/dev-cache.c:763           Found dev 253:19 /dev/mapper/vg_sys-afscache - new alias.
#device/dev-cache.c:763           Found dev 253:19 /dev/vg_sys/afscache - new alias.
#device/dev-cache.c:723           Found dev 253:2 /dev/dm-2 - new.
#device/dev-cache.c:763           Found dev 253:2 /dev/mapper/vg_sys-root_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:20 /dev/dm-20 - new.
#device/dev-cache.c:763           Found dev 253:20 /dev/mapper/vg_sys-home_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:21 /dev/dm-21 - new.
#device/dev-cache.c:763           Found dev 253:21 /dev/mapper/vg_sys-home_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:22 /dev/dm-22 - new.
#device/dev-cache.c:763           Found dev 253:22 /dev/mapper/vg_sys-home_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:23 /dev/dm-23 - new.
#device/dev-cache.c:763           Found dev 253:23 /dev/mapper/vg_sys-home_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:24 /dev/dm-24 - new.
#device/dev-cache.c:763           Found dev 253:24 /dev/disk/by-id/dm-name-vg_sys-home - new alias.
#device/dev-cache.c:763           Found dev 253:24 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Oymv1VidJiTfPN0zcceh5CwcWh2zjugWE - new alias.
#device/dev-cache.c:763           Found dev 253:24 /dev/disk/by-uuid/fbb09ab0-022d-4afe-be5c-3c5881bc9fa7 - new alias.
#device/dev-cache.c:763           Found dev 253:24 /dev/mapper/vg_sys-home - new alias.
#device/dev-cache.c:763           Found dev 253:24 /dev/vg_sys/home - new alias.
#device/dev-cache.c:723           Found dev 253:25 /dev/dm-25 - new.
#device/dev-cache.c:763           Found dev 253:25 /dev/mapper/vg_sys-backup_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:26 /dev/dm-26 - new.
#device/dev-cache.c:763           Found dev 253:26 /dev/mapper/vg_sys-backup_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:27 /dev/dm-27 - new.
#device/dev-cache.c:763           Found dev 253:27 /dev/mapper/vg_sys-backup_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:28 /dev/dm-28 - new.
#device/dev-cache.c:763           Found dev 253:28 /dev/mapper/vg_sys-backup_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:29 /dev/dm-29 - new.
#device/dev-cache.c:763           Found dev 253:29 /dev/disk/by-id/dm-name-vg_sys-backup - new alias.
#device/dev-cache.c:763           Found dev 253:29 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Olin670B3YJn1mfehhPfZdatYS8xjkuI1 - new alias.
#device/dev-cache.c:763           Found dev 253:29 /dev/disk/by-uuid/2060a578-db2e-45fa-81e5-67070060b319 - new alias.
#device/dev-cache.c:763           Found dev 253:29 /dev/mapper/vg_sys-backup - new alias.
#device/dev-cache.c:763           Found dev 253:29 /dev/vg_sys/backup - new alias.
#device/dev-cache.c:723           Found dev 253:3 /dev/dm-3 - new.
#device/dev-cache.c:763           Found dev 253:3 /dev/mapper/vg_sys-root_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:30 /dev/dm-30 - new.
#device/dev-cache.c:763           Found dev 253:30 /dev/mapper/vg_sys-lv_testerl_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:31 /dev/dm-31 - new.
#device/dev-cache.c:763           Found dev 253:31 /dev/mapper/vg_sys-lv_testerl_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:32 /dev/dm-32 - new.
#device/dev-cache.c:763           Found dev 253:32 /dev/mapper/vg_sys-lv_testerl_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:33 /dev/dm-33 - new.
#device/dev-cache.c:763           Found dev 253:33 /dev/mapper/vg_sys-lv_testerl_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:34 /dev/dm-34 - new.
#device/dev-cache.c:763           Found dev 253:34 /dev/disk/by-id/dm-name-vg_sys-lv_testerl - new alias.
#device/dev-cache.c:763           Found dev 253:34 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O3jNpWeMf0NDxdd9oS2ihNSlXFhjqRGJH - new alias.
#device/dev-cache.c:763           Found dev 253:34 /dev/disk/by-uuid/8b762fb9-397e-443e-b14c-7c56d8c3cc37 - new alias.
#device/dev-cache.c:763           Found dev 253:34 /dev/mapper/vg_sys-lv_testerl - new alias.
#device/dev-cache.c:763           Found dev 253:34 /dev/vg_sys/lv_testerl - new alias.
#device/dev-cache.c:723           Found dev 253:35 /dev/dm-35 - new.
#device/dev-cache.c:763           Found dev 253:35 /dev/mapper/vg_sys-lv_test2_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:36 /dev/dm-36 - new.
#device/dev-cache.c:763           Found dev 253:36 /dev/mapper/vg_sys-lv_test2_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:37 /dev/dm-37 - new.
#device/dev-cache.c:763           Found dev 253:37 /dev/mapper/vg_sys-lv_test2_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:38 /dev/dm-38 - new.
#device/dev-cache.c:763           Found dev 253:38 /dev/mapper/vg_sys-lv_test2_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:39 /dev/dm-39 - new.
#device/dev-cache.c:763           Found dev 253:39 /dev/disk/by-id/dm-name-vg_sys-lv_test2 - new alias.
#device/dev-cache.c:763           Found dev 253:39 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OhfZ55FKMTq1ZcWnxqs3Vlxb2vqz8cElM - new alias.
#device/dev-cache.c:763           Found dev 253:39 /dev/mapper/vg_sys-lv_test2 - new alias.
#device/dev-cache.c:763           Found dev 253:39 /dev/vg_sys/lv_test2 - new alias.
#device/dev-cache.c:723           Found dev 253:4 /dev/dm-4 - new.
#device/dev-cache.c:763           Found dev 253:4 /dev/disk/by-id/dm-name-vg_sys-root - new alias.
#device/dev-cache.c:763           Found dev 253:4 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Op3Oia4XoTq1cEvn70QACWCWNvNphlblr - new alias.
#device/dev-cache.c:763           Found dev 253:4 /dev/disk/by-uuid/2b13e5b0-b705-47ba-93c7-db39964af33e - new alias.
#device/dev-cache.c:763           Found dev 253:4 /dev/mapper/vg_sys-root - new alias.
#device/dev-cache.c:763           Found dev 253:4 /dev/vg_sys/root - new alias.
#device/dev-cache.c:723           Found dev 253:40 /dev/dm-40 - new.
#device/dev-cache.c:763           Found dev 253:40 /dev/mapper/vg_sys-lv_test_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:41 /dev/dm-41 - new.
#device/dev-cache.c:763           Found dev 253:41 /dev/mapper/vg_sys-lv_test_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:42 /dev/dm-42 - new.
#device/dev-cache.c:763           Found dev 253:42 /dev/mapper/vg_sys-lv_test_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:43 /dev/dm-43 - new.
#device/dev-cache.c:763           Found dev 253:43 /dev/mapper/vg_sys-lv_test_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:44 /dev/dm-44 - new.
#device/dev-cache.c:763           Found dev 253:44 /dev/disk/by-id/dm-name-vg_sys-lv_test - new alias.
#device/dev-cache.c:763           Found dev 253:44 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV - new alias.
#device/dev-cache.c:763           Found dev 253:44 /dev/mapper/vg_sys-lv_test - new alias.
#device/dev-cache.c:763           Found dev 253:44 /dev/vg_sys/lv_test - new alias.
#device/dev-cache.c:723           Found dev 253:5 /dev/dm-5 - new.
#device/dev-cache.c:763           Found dev 253:5 /dev/mapper/vg_sys-var_rmeta_0 - new alias.
#device/dev-cache.c:723           Found dev 253:6 /dev/dm-6 - new.
#device/dev-cache.c:763           Found dev 253:6 /dev/mapper/vg_sys-var_rimage_0 - new alias.
#device/dev-cache.c:723           Found dev 253:7 /dev/dm-7 - new.
#device/dev-cache.c:763           Found dev 253:7 /dev/mapper/vg_sys-var_rmeta_1 - new alias.
#device/dev-cache.c:723           Found dev 253:8 /dev/dm-8 - new.
#device/dev-cache.c:763           Found dev 253:8 /dev/mapper/vg_sys-var_rimage_1 - new alias.
#device/dev-cache.c:723           Found dev 253:9 /dev/dm-9 - new.
#device/dev-cache.c:763           Found dev 253:9 /dev/disk/by-id/dm-name-vg_sys-var - new alias.
#device/dev-cache.c:763           Found dev 253:9 /dev/disk/by-id/dm-uuid-LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OMfsALdG0wa5QG5TjddqRbCCxSdUcIRGz - new alias.
#device/dev-cache.c:763           Found dev 253:9 /dev/disk/by-uuid/3c23ecb4-18d1-4c78-9b1a-24d1d447247b - new alias.
#device/dev-cache.c:763           Found dev 253:9 /dev/mapper/vg_sys-var - new alias.
#device/dev-cache.c:763           Found dev 253:9 /dev/vg_sys/var - new alias.
#filters/filter-persistent.c:346           filter caching good /dev/sdb2
#cache/lvmcache.c:2084          lvmcache /dev/sdb2: now in VG #orphans_lvm2 (#orphans_lvm2) with 0 mda(s).
#filters/filter-persistent.c:346           filter caching good /dev/sda2
#cache/lvmcache.c:2084          lvmcache /dev/sda2: now in VG #orphans_lvm2 (#orphans_lvm2) with 0 mda(s).
#metadata/vg.c:74            Allocated VG vg_sys at 0x564bc426ef60.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[0] on LV vg_sys/root_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[0] on LV vg_sys/root_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[1] on LV vg_sys/root_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[1] on LV vg_sys/root_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[0] on LV vg_sys/var_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[0] on LV vg_sys/var_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[1] on LV vg_sys/var_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[1] on LV vg_sys/var_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[0] on LV vg_sys/swap_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[0] on LV vg_sys/swap_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[1] on LV vg_sys/swap_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[1] on LV vg_sys/swap_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[0] on LV vg_sys/afscache_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[0] on LV vg_sys/afscache_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[1] on LV vg_sys/afscache_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[1] on LV vg_sys/afscache_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[0] on LV vg_sys/home_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[0] on LV vg_sys/home_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[1] on LV vg_sys/home_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[1] on LV vg_sys/home_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[0] on LV vg_sys/backup_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[0] on LV vg_sys/backup_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[1] on LV vg_sys/backup_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[1] on LV vg_sys/backup_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[0] on LV vg_sys/lv_testerl_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[0] on LV vg_sys/lv_testerl_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[1] on LV vg_sys/lv_testerl_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[1] on LV vg_sys/lv_testerl_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[0] on LV vg_sys/lv_test2_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[0] on LV vg_sys/lv_test2_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[1] on LV vg_sys/lv_test2_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[1] on LV vg_sys/lv_test2_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[0] on LV vg_sys/lv_test_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[0] on LV vg_sys/lv_test_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[1] on LV vg_sys/lv_test_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[1] on LV vg_sys/lv_test_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rimage_1.
#cache/lvmcache.c:755           lvmcache has no info for vgname "vg_sys" with VGID xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O.
#cache/lvmcache.c:755           lvmcache has no info for vgname "vg_sys".
#cache/lvmcache.c:2084          lvmcache /dev/sdb2: now in VG vg_sys with 1 mda(s).
#cache/lvmcache.c:1910          lvmcache /dev/sdb2: VG vg_sys: set VGID to xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O.
#cache/lvmcache.c:2084          lvmcache /dev/sda2: now in VG vg_sys (xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O) with 1 mda(s).
#cache/lvmetad.c:2478          Sending lvmetad vg_clear_outdated_pvs
#libdm-config.c:1002        metadata/lvs_history_retention_time not found in config: defaulting to 0
#device/dev-io.c:359         /dev/sdb2: size is 1953508751 sectors
#device/dev-io.c:359         /dev/sda2: size is 1953508751 sectors
#metadata/pv_manip.c:417           /dev/sdb2 0:      0      1: root_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 1:      1   2560: root_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 2:   2561      1: var_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 3:   2562   7680: var_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 4:  10242      1: swap_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 5:  10243   1024: swap_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 6:  11267      1: afscache_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 7:  11268   1024: afscache_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 8:  12292      1: home_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 9:  12293  51200: home_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 10:  63493      1: backup_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 11:  63494  46080: backup_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 12: 109574  12800: home_rimage_0(51200:0)
#metadata/pv_manip.c:417           /dev/sdb2 13: 122374   5120: backup_rimage_0(46080:0)
#metadata/pv_manip.c:417           /dev/sdb2 14: 127494      1: lv_testerl_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 15: 127495    512: lv_testerl_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 16: 128007  12800: backup_rimage_0(51200:0)
#metadata/pv_manip.c:417           /dev/sdb2 17: 140807  25600: home_rimage_0(64000:0)
#metadata/pv_manip.c:417           /dev/sdb2 18: 166407    512: root_rimage_0(2560:0)
#metadata/pv_manip.c:417           /dev/sdb2 19: 166919  12800: home_rimage_0(89600:0)
#metadata/pv_manip.c:417           /dev/sdb2 20: 179719    256: lv_testerl_rimage_1(512:0)
#metadata/pv_manip.c:417           /dev/sdb2 21: 179975      1: lv_test2_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 22: 179976    768: lv_test2_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 23: 180744      1: lv_test_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 24: 180745    256: lv_test_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 25: 181001  57464: NULL(0:0)
#metadata/pv_manip.c:417           /dev/sda2 0:      0      1: root_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 1:      1   2560: root_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 2:   2561      1: var_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 3:   2562   7680: var_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 4:  10242      1: swap_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 5:  10243   1024: swap_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 6:  11267      1: afscache_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 7:  11268   1024: afscache_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 8:  12292      1: home_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 9:  12293  89600: home_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 10: 101893      1: backup_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 11: 101894  64000: backup_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 12: 165894      1: lv_testerl_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sda2 13: 165895    512: lv_testerl_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sda2 14: 166407    512: root_rimage_1(2560:0)
#metadata/pv_manip.c:417           /dev/sda2 15: 166919  12800: home_rimage_1(89600:0)
#metadata/pv_manip.c:417           /dev/sda2 16: 179719    256: lv_testerl_rimage_0(512:0)
#metadata/pv_manip.c:417           /dev/sda2 17: 179975      1: lv_test2_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 18: 179976    768: lv_test2_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 19: 180744      1: lv_test_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 20: 180745    256: lv_test_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 21: 181001  57464: NULL(0:0)
#metadata/vg.c:74            Allocated VG vg_sys at 0x564bc4236a50.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[0] on LV vg_sys/root_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[0] on LV vg_sys/root_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[1] on LV vg_sys/root_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[1] on LV vg_sys/root_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[0] on LV vg_sys/var_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[0] on LV vg_sys/var_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[1] on LV vg_sys/var_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[1] on LV vg_sys/var_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[0] on LV vg_sys/swap_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[0] on LV vg_sys/swap_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[1] on LV vg_sys/swap_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[1] on LV vg_sys/swap_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[0] on LV vg_sys/afscache_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[0] on LV vg_sys/afscache_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[1] on LV vg_sys/afscache_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[1] on LV vg_sys/afscache_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[0] on LV vg_sys/home_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[0] on LV vg_sys/home_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[1] on LV vg_sys/home_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[1] on LV vg_sys/home_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[0] on LV vg_sys/backup_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[0] on LV vg_sys/backup_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[1] on LV vg_sys/backup_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[1] on LV vg_sys/backup_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[0] on LV vg_sys/lv_testerl_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[0] on LV vg_sys/lv_testerl_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[1] on LV vg_sys/lv_testerl_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[1] on LV vg_sys/lv_testerl_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[0] on LV vg_sys/lv_test2_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[0] on LV vg_sys/lv_test2_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[1] on LV vg_sys/lv_test2_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[1] on LV vg_sys/lv_test2_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[0] on LV vg_sys/lv_test_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[0] on LV vg_sys/lv_test_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[1] on LV vg_sys/lv_test_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[1] on LV vg_sys/lv_test_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rimage_1.
#toollib.c:2034        Running command for VG vg_sys xwAQBN-iZlp-uwjO-a6Mx-fUBV-fTeU-KURS3O
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm version   [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ noopencount flush ]   [16384] (*1)
#activate/activate.c:1591        vg_sys/lv_test is active locally
#metadata/lv_manip.c:5071    Extending 2 mirror images.
#metadata/lv_manip.c:5315          New size for vg_sys/lv_test: 512. Existing logical extents: 256 / physical extents: 514.
#format_text/archiver.c:142       Archiving volume group "vg_sys" metadata (seqno 149).
#format_text/archive.c:213         Expiring archive /etc/lvm/archive/vg_sys_00091-549715003.vg
#metadata/lv_manip.c:5382      Extending logical volume vg_sys/lv_test to 2.00 GiB
#metadata/lv_manip.c:4148        Adding segment of type raid1 to LV lv_test.
#metadata/lv_manip.c:3449          Adjusted allocation request to 256 logical extents. Existing size 256. New size 512.
#metadata/pv_map.c:54            Allowing allocation on /dev/sdb2 start PE 181001 length 57464
#metadata/pv_map.c:54            Allowing allocation on /dev/sda2 start PE 181001 length 57464
#metadata/lv_manip.c:3195          Trying allocation using contiguous policy.
#metadata/lv_manip.c:2791          2 preferred area(s) to be filled positionally.
#metadata/lv_manip.c:2708          Still need 512 total extents from 114928 remaining (2 positional slots):
#metadata/lv_manip.c:2711            2 (2 data/0 parity) parallel areas of 256 extents each
#metadata/lv_manip.c:2715            0 mirror logs of 0 extents each
#metadata/lv_manip.c:2370          Considering allocation area 0 as /dev/sdb2 start PE 181001 length 57464 leaving 0.
#metadata/lv_manip.c:2370          Considering allocation area 1 as /dev/sda2 start PE 181001 length 57464 leaving 0.
#metadata/lv_manip.c:1950          Allocating parallel area 0 on /dev/sdb2 start PE 181001 length 256.
#metadata/lv_manip.c:1950          Allocating parallel area 1 on /dev/sda2 start PE 181001 length 256.
#metadata/lv_manip.c:5408    Size of logical volume vg_sys/lv_test changed from 1.00 GiB (256 extents) to 2.00 GiB (512 extents).
#metadata/lv_manip.c:6414        Updating logical volume vg_sys/lv_test on disk(s).
#metadata/pv_manip.c:417           /dev/sdb2 0:      0      1: root_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 1:      1   2560: root_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 2:   2561      1: var_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 3:   2562   7680: var_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 4:  10242      1: swap_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 5:  10243   1024: swap_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 6:  11267      1: afscache_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 7:  11268   1024: afscache_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 8:  12292      1: home_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 9:  12293  51200: home_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 10:  63493      1: backup_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 11:  63494  46080: backup_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 12: 109574  12800: home_rimage_0(51200:0)
#metadata/pv_manip.c:417           /dev/sdb2 13: 122374   5120: backup_rimage_0(46080:0)
#metadata/pv_manip.c:417           /dev/sdb2 14: 127494      1: lv_testerl_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 15: 127495    512: lv_testerl_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 16: 128007  12800: backup_rimage_0(51200:0)
#metadata/pv_manip.c:417           /dev/sdb2 17: 140807  25600: home_rimage_0(64000:0)
#metadata/pv_manip.c:417           /dev/sdb2 18: 166407    512: root_rimage_0(2560:0)
#metadata/pv_manip.c:417           /dev/sdb2 19: 166919  12800: home_rimage_0(89600:0)
#metadata/pv_manip.c:417           /dev/sdb2 20: 179719    256: lv_testerl_rimage_1(512:0)
#metadata/pv_manip.c:417           /dev/sdb2 21: 179975      1: lv_test2_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 22: 179976    768: lv_test2_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 23: 180744      1: lv_test_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 24: 180745    512: lv_test_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sdb2 25: 181257  57208: NULL(0:0)
#metadata/pv_manip.c:417           /dev/sda2 0:      0      1: root_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 1:      1   2560: root_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 2:   2561      1: var_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 3:   2562   7680: var_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 4:  10242      1: swap_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 5:  10243   1024: swap_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 6:  11267      1: afscache_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 7:  11268   1024: afscache_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 8:  12292      1: home_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 9:  12293  89600: home_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 10: 101893      1: backup_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 11: 101894  64000: backup_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 12: 165894      1: lv_testerl_rmeta_0(0:0)
#metadata/pv_manip.c:417           /dev/sda2 13: 165895    512: lv_testerl_rimage_0(0:0)
#metadata/pv_manip.c:417           /dev/sda2 14: 166407    512: root_rimage_1(2560:0)
#metadata/pv_manip.c:417           /dev/sda2 15: 166919  12800: home_rimage_1(89600:0)
#metadata/pv_manip.c:417           /dev/sda2 16: 179719    256: lv_testerl_rimage_0(512:0)
#metadata/pv_manip.c:417           /dev/sda2 17: 179975      1: lv_test2_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 18: 179976    768: lv_test2_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 19: 180744      1: lv_test_rmeta_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 20: 180745    512: lv_test_rimage_1(0:0)
#metadata/pv_manip.c:417           /dev/sda2 21: 181257  57208: NULL(0:0)
#locking/locking.c:367           Dropping cache for vg_sys.
#mm/memlock.c:594           Unlock: Memlock counters: prioritized:0 locked:0 critical:0 daemon:0 suspended:0
#format_text/format-text.c:331           Reading mda header sector from /dev/sdb2 at 4096
#format_text/format-text.c:682           Writing metadata for VG vg_sys to /dev/sdb2 at 858624 len 16413 (wrap 0)
#device/dev-io.c:609           Opened /dev/sdb2 RO O_DIRECT
#device/dev-io.c:166           /dev/sdb2: Block size is 512 bytes
#device/dev-io.c:177           /dev/sdb2: Physical block size is 512 bytes
#device/dev-io.c:658           Closed /dev/sdb2
#label/label.c:1202          Close and reopen to write /dev/sdb2
#format_text/format-text.c:331           Reading mda header sector from /dev/sda2 at 4096
#format_text/format-text.c:682           Writing metadata for VG vg_sys to /dev/sda2 at 530944 len 16413 (wrap 0)
#device/dev-io.c:609           Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:166           /dev/sda2: Block size is 512 bytes
#device/dev-io.c:177           /dev/sda2: Physical block size is 4096 bytes
#device/dev-io.c:658           Closed /dev/sda2
#label/label.c:1202          Close and reopen to write /dev/sda2
#format_text/format-text.c:331           Reading mda header sector from /dev/sdb2 at 4096
#format_text/format-text.c:800           Pre-Committing vg_sys metadata (150) to /dev/sdb2 header at 4096
#device/dev-io.c:609           Opened /dev/sdb2 RO O_DIRECT
#device/dev-io.c:166           /dev/sdb2: Block size is 512 bytes
#device/dev-io.c:177           /dev/sdb2: Physical block size is 512 bytes
#device/dev-io.c:658           Closed /dev/sdb2
#device/bcache.c:211           Limit write at 0 len 131072 to len 4608
#format_text/format-text.c:331           Reading mda header sector from /dev/sda2 at 4096
#format_text/format-text.c:800           Pre-Committing vg_sys metadata (150) to /dev/sda2 header at 4096
#device/dev-io.c:609           Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:166           /dev/sda2: Block size is 512 bytes
#device/dev-io.c:177           /dev/sda2: Physical block size is 4096 bytes
#device/dev-io.c:658           Closed /dev/sda2
#device/bcache.c:205           Limit write at 0 len 131072 to len 4608 rounded to 8192
#metadata/vg.c:74            Allocated VG vg_sys at 0x564bc427cfa0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/root_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/var_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/swap_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/afscache_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/home_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/backup_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_testerl_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test2_rmeta_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rimage_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rmeta_0.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rimage_1.
#format_text/import_vsn1.c:591           Importing logical volume vg_sys/lv_test_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[0] on LV vg_sys/root_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[0] on LV vg_sys/root_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[1] on LV vg_sys/root_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/root:0[1] on LV vg_sys/root_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/root:0 as an user of vg_sys/root_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[0] on LV vg_sys/var_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[0] on LV vg_sys/var_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[1] on LV vg_sys/var_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/var:0[1] on LV vg_sys/var_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/var:0 as an user of vg_sys/var_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[0] on LV vg_sys/swap_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[0] on LV vg_sys/swap_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[1] on LV vg_sys/swap_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/swap:0[1] on LV vg_sys/swap_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/swap:0 as an user of vg_sys/swap_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[0] on LV vg_sys/afscache_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[0] on LV vg_sys/afscache_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[1] on LV vg_sys/afscache_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/afscache:0[1] on LV vg_sys/afscache_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/afscache:0 as an user of vg_sys/afscache_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[0] on LV vg_sys/home_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[0] on LV vg_sys/home_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[1] on LV vg_sys/home_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/home:0[1] on LV vg_sys/home_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/home:0 as an user of vg_sys/home_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[0] on LV vg_sys/backup_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[0] on LV vg_sys/backup_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[1] on LV vg_sys/backup_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/backup:0[1] on LV vg_sys/backup_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/backup:0 as an user of vg_sys/backup_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[0] on LV vg_sys/lv_testerl_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[0] on LV vg_sys/lv_testerl_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[1] on LV vg_sys/lv_testerl_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_testerl:0[1] on LV vg_sys/lv_testerl_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_testerl:0 as an user of vg_sys/lv_testerl_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[0] on LV vg_sys/lv_test2_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[0] on LV vg_sys/lv_test2_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[1] on LV vg_sys/lv_test2_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test2:0[1] on LV vg_sys/lv_test2_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test2:0 as an user of vg_sys/lv_test2_rimage_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[0] on LV vg_sys/lv_test_rmeta_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rmeta_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[0] on LV vg_sys/lv_test_rimage_0:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rimage_0.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[1] on LV vg_sys/lv_test_rmeta_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rmeta_1.
#metadata/lv_manip.c:1191        Stack vg_sys/lv_test:0[1] on LV vg_sys/lv_test_rimage_1:0.
#metadata/lv_manip.c:747         Adding vg_sys/lv_test:0 as an user of vg_sys/lv_test_rimage_1.
#cache/lvmetad.c:1184          Sending lvmetad pending VG vg_sys (seqno 150)
#locking/file_locking.c:109         Locking LV xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV (W)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ noopencount flush ]   [16384] (*1)
#device/dev-io.c:396         /dev/sdb2: read_ahead is 8192 sectors
#device/dev-io.c:396         /dev/sda2: read_ahead is 8192 sectors
#activate/dev_manager.c:3225          Creating PRELOAD tree for vg_sys/lv_test.
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#activate/activate.c:523         Getting driver version
#ioctl/libdm-iface.c:1857          dm version   [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:44) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:43) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:42) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:41) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:40) [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:761           Skipping checks for old devices without LVM- dm uuid prefix (kernel vsn 4 >= 3).
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV in deptree.
#activate/dev_manager.c:2791          Checking kernel supports raid1 segment type for vg_sys/lv_test
#activate/activate.c:535         Getting target version for raid
#ioctl/libdm-iface.c:1857          dm versions   [ opencount flush ]   [16384] (*1)
#activate/activate.c:572         Found raid target v1.7.0.
#activate/activate.c:535         Getting target version for raid
#ioctl/libdm-iface.c:1857          dm versions   [ opencount flush ]   [16384] (*1)
#activate/activate.c:572         Found raid target v1.7.0.
#raid/raid.c:507         Target raid does not support shrinking.
#raid/raid.c:507         Target raid does not support rebuild+emptymeta.
#raid/raid.c:507         Target raid does not support reshaping.
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rimage_0 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rimage_0
#activate/activate.c:535         Getting target version for linear
#ioctl/libdm-iface.c:1857          dm versions   [ opencount flush ]   [16384] (*1)
#activate/activate.c:572         Found linear target v1.2.1.
#activate/activate.c:535         Getting target version for striped
#ioctl/libdm-iface.c:1857          dm versions   [ opencount flush ]   [16384] (*1)
#activate/activate.c:572         Found striped target v1.5.1.
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rimage_0 is 8192
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rmeta_0 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rmeta_0
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rmeta_0 is 8192
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rimage_1 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rimage_1
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rimage_1 is 8192
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rmeta_1 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rmeta_1
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rmeta_1 is 8192
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z in deptree.
#metadata/metadata.c:2133          Calculated readahead of LV lv_test is 8192
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rimage_1 (253:43).
#libdm-deptree.c:2641          Adding target to (253:43): 0 4194304 linear 8:2 1480665088
#ioctl/libdm-iface.c:1857          dm table   (253:43) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm reload   (253:43) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2746          Table size changed from 2097152 to 4194304 for vg_sys-lv_test_rimage_1 (253:43).
#libdm-deptree.c:1302      Resuming vg_sys-lv_test_rimage_1 (253:43).
#libdm-common.c:2433          Udev cookie 0xd4dc508 (semid 4521993) created
#libdm-common.c:2453          Udev cookie 0xd4dc508 (semid 4521993) incremented to 1
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 2
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES DISABLE_DISK_RULES DISABLE_OTHER_RULES DISABLE_LIBRARY_FALLBACK         (0x2e)
#ioctl/libdm-iface.c:1857          dm resume   (253:43) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test_rimage_1: Stacking NODE_ADD (253,43) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_1: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rmeta_1 (253:42).
#libdm-deptree.c:2641          Adding target to (253:42): 0 8192 linear 8:2 1480656896
#ioctl/libdm-iface.c:1857          dm table   (253:42) [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2729      Suppressed vg_sys-lv_test_rmeta_1 (253:42) identical table reload.
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rimage_0 (253:41).
#libdm-deptree.c:2641          Adding target to (253:41): 0 4194304 linear 8:18 1480665088
#ioctl/libdm-iface.c:1857          dm table   (253:41) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm reload   (253:41) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2746          Table size changed from 2097152 to 4194304 for vg_sys-lv_test_rimage_0 (253:41).
#libdm-deptree.c:1302      Resuming vg_sys-lv_test_rimage_0 (253:41).
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 3
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES DISABLE_DISK_RULES DISABLE_OTHER_RULES DISABLE_LIBRARY_FALLBACK         (0x2e)
#ioctl/libdm-iface.c:1857          dm resume   (253:41) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test_rimage_0: Stacking NODE_ADD (253,41) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_0: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rmeta_0 (253:40).
#libdm-deptree.c:2641          Adding target to (253:40): 0 8192 linear 8:18 1480656896
#ioctl/libdm-iface.c:1857          dm table   (253:40) [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2729      Suppressed vg_sys-lv_test_rmeta_0 (253:40) identical table reload.
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test (253:44).
#libdm-deptree.c:2251        Getting target version for raid
#ioctl/libdm-iface.c:1857          dm versions   [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2270        Found raid target v1.7.0.
#libdm-deptree.c:2641          Adding target to (253:44): 0 4194304 raid raid1 3 0 region_size 4096 2 253:40 253:41 253:42 253:43
#ioctl/libdm-iface.c:1857          dm table   (253:44) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm reload   (253:44) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2746          Table size changed from 2097152 to 4194304 for vg_sys-lv_test (253:44).
#activate/activate.c:2350          Requiring flush for LV vg_sys/lv_test.
#libdm-config.c:975         dmeventd/executable not found in config: defaulting to /usr/sbin/dmeventd
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#activate/activate.c:2039      Not monitoring vg_sys/lv_test with libdevmapper-event-lvm2raid.so
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#activate/activate.c:1837      Unmonitored LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV for events
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#libdevmapper-event.c:761           vg_sys-lv_test: device not registered.
#mm/memlock.c:623           Entering critical section (suspending).
#mm/memlock.c:583           Lock:   Memlock counters: prioritized:0 locked:0 critical:1 daemon:0 suspended:0
#mm/memlock.c:516         Locking memory
#mm/memlock.c:296           mlock       1900KiB 564bc2385000 - 564bc2560000 r-xp 00000000 fd:04 1074029                    /usr/sbin/lvm
#mm/memlock.c:296           mlock         40KiB 564bc275f000 - 564bc2769000 r--p 001da000 fd:04 1074029                    /usr/sbin/lvm
#mm/memlock.c:296           mlock        212KiB 564bc2769000 - 564bc279e000 rw-p 001e4000 fd:04 1074029                    /usr/sbin/lvm
#mm/memlock.c:296           mlock       2272KiB 564bc279e000 - 564bc29d6000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           mlock      15100KiB 564bc3dd3000 - 564bc4c92000 rw-p 00000000 00:00 0                          [heap]
#mm/memlock.c:268           mlock default filter 'locale/locale-archive' matches '7f8689836000-7f868fd60000 r--p 00000000 fd:04 6395174                    /usr/lib/locale/locale-archive': Skipping.
#mm/memlock.c:268           mlock default filter '/libpcre.so.' matches '7f868fd60000-7f868fdc0000 r-xp 00000000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f868fdc0000-7f868ffc0000 ---p 00060000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0 : Skipping.
#mm/memlock.c:268           mlock default filter '/libpcre.so.' matches '7f868ffc0000-7f868ffc1000 r--p 00060000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0': Skipping.
#mm/memlock.c:268           mlock default filter '/libpcre.so.' matches '7f868ffc1000-7f868ffc2000 rw-p 00061000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0': Skipping.
#mm/memlock.c:268           mlock default filter '/libbz2.so.' matches '7f868ffc2000-7f868ffd1000 r-xp 00000000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f868ffd1000-7f86901d0000 ---p 0000f000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6 : Skipping.
#mm/memlock.c:268           mlock default filter '/libbz2.so.' matches '7f86901d0000-7f86901d1000 r--p 0000e000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6': Skipping.
#mm/memlock.c:268           mlock default filter '/libbz2.so.' matches '7f86901d1000-7f86901d2000 rw-p 0000f000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6': Skipping.
#mm/memlock.c:268           mlock default filter '/liblzma.so.' matches '7f86901d2000-7f86901f7000 r-xp 00000000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f86901f7000-7f86903f6000 ---p 00025000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2 : Skipping.
#mm/memlock.c:268           mlock default filter '/liblzma.so.' matches '7f86903f6000-7f86903f7000 r--p 00024000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2': Skipping.
#mm/memlock.c:268           mlock default filter '/liblzma.so.' matches '7f86903f7000-7f86903f8000 rw-p 00025000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2': Skipping.
#mm/memlock.c:268           mlock default filter '/libz.so.' matches '7f86903f8000-7f869040d000 r-xp 00000000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f869040d000-7f869060c000 ---p 00015000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7 : Skipping.
#mm/memlock.c:268           mlock default filter '/libz.so.' matches '7f869060c000-7f869060d000 r--p 00014000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7': Skipping.
#mm/memlock.c:268           mlock default filter '/libz.so.' matches '7f869060d000-7f869060e000 rw-p 00015000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7': Skipping.
#mm/memlock.c:268           mlock default filter '/libelf-' matches '7f869060e000-7f8690625000 r-xp 00000000 fd:04 21093871                   /usr/lib64/libelf-0.172.so': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8690625000-7f8690824000 ---p 00017000 fd:04 21093871                   /usr/lib64/libelf-0.172.so : Skipping.
#mm/memlock.c:268           mlock default filter '/libelf-' matches '7f8690824000-7f8690825000 r--p 00016000 fd:04 21093871                   /usr/lib64/libelf-0.172.so': Skipping.
#mm/memlock.c:268           mlock default filter '/libelf-' matches '7f8690825000-7f8690826000 rw-p 00017000 fd:04 21093871                   /usr/lib64/libelf-0.172.so': Skipping.
#mm/memlock.c:268           mlock default filter '/libattr.so.' matches '7f8690826000-7f869082a000 r-xp 00000000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f869082a000-7f8690a29000 ---p 00004000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0 : Skipping.
#mm/memlock.c:268           mlock default filter '/libattr.so.' matches '7f8690a29000-7f8690a2a000 r--p 00003000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0': Skipping.
#mm/memlock.c:268           mlock default filter '/libattr.so.' matches '7f8690a2a000-7f8690a2b000 rw-p 00004000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0': Skipping.
#mm/memlock.c:268           mlock default filter '/libtinfo.so.' matches '7f8690a2b000-7f8690a50000 r-xp 00000000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8690a50000-7f8690c50000 ---p 00025000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9 : Skipping.
#mm/memlock.c:268           mlock default filter '/libtinfo.so.' matches '7f8690c50000-7f8690c54000 r--p 00025000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9': Skipping.
#mm/memlock.c:268           mlock default filter '/libtinfo.so.' matches '7f8690c54000-7f8690c55000 rw-p 00029000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9': Skipping.
#mm/memlock.c:268           mlock default filter '/libsepol.so.' matches '7f8690c55000-7f8690cf1000 r-xp 00000000 fd:04 19861052                   /usr/lib64/libsepol.so.1': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8690cf1000-7f8690ef0000 ---p 0009c000 fd:04 19861052                   /usr/lib64/libsepol.so.1 : Skipping.
#mm/memlock.c:268           mlock default filter '/libsepol.so.' matches '7f8690ef0000-7f8690ef1000 r--p 0009b000 fd:04 19861052                   /usr/lib64/libsepol.so.1': Skipping.
#mm/memlock.c:268           mlock default filter '/libsepol.so.' matches '7f8690ef1000-7f8690ef2000 rw-p 0009c000 fd:04 19861052                   /usr/lib64/libsepol.so.1': Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8690ef2000 - 7f8690ef3000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/libselinux.so.' matches '7f8690ef3000-7f8690f17000 r-xp 00000000 fd:04 19861057                   /usr/lib64/libselinux.so.1': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8690f17000-7f8691116000 ---p 00024000 fd:04 19861057                   /usr/lib64/libselinux.so.1 : Skipping.
#mm/memlock.c:268           mlock default filter '/libselinux.so.' matches '7f8691116000-7f8691117000 r--p 00023000 fd:04 19861057                   /usr/lib64/libselinux.so.1': Skipping.
#mm/memlock.c:268           mlock default filter '/libselinux.so.' matches '7f8691117000-7f8691118000 rw-p 00024000 fd:04 19861057                   /usr/lib64/libselinux.so.1': Skipping.
#mm/memlock.c:296           mlock          8KiB 7f8691118000 - 7f869111a000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/libuuid.so.' matches '7f869111a000-7f869111e000 r-xp 00000000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f869111e000-7f869131d000 ---p 00004000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0 : Skipping.
#mm/memlock.c:268           mlock default filter '/libuuid.so.' matches '7f869131d000-7f869131e000 r--p 00003000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0': Skipping.
#mm/memlock.c:268           mlock default filter '/libuuid.so.' matches '7f869131e000-7f869131f000 rw-p 00004000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0': Skipping.
#mm/memlock.c:296           mlock         84KiB 7f869131f000 - 7f8691334000 r-xp 00000000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1
#mm/memlock.c:250           mlock area unreadable 7f8691334000-7f8691533000 ---p 00015000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1 : Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8691533000 - 7f8691534000 r--p 00014000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1
#mm/memlock.c:296           mlock          4KiB 7f8691534000 - 7f8691535000 rw-p 00015000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1
#mm/memlock.c:268           mlock default filter '/libdw-' matches '7f8691535000-7f8691581000 r-xp 00000000 fd:04 20545973                   /usr/lib64/libdw-0.172.so': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8691581000-7f8691781000 ---p 0004c000 fd:04 20545973                   /usr/lib64/libdw-0.172.so : Skipping.
#mm/memlock.c:268           mlock default filter '/libdw-' matches '7f8691781000-7f8691783000 r--p 0004c000 fd:04 20545973                   /usr/lib64/libdw-0.172.so': Skipping.
#mm/memlock.c:268           mlock default filter '/libdw-' matches '7f8691783000-7f8691784000 rw-p 0004e000 fd:04 20545973                   /usr/lib64/libdw-0.172.so': Skipping.
#mm/memlock.c:296           mlock       1028KiB 7f8691784000 - 7f8691885000 r-xp 00000000 fd:04 21230170                   /usr/lib64/libm-2.17.so
#mm/memlock.c:250           mlock area unreadable 7f8691885000-7f8691a84000 ---p 00101000 fd:04 21230170                   /usr/lib64/libm-2.17.so : Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8691a84000 - 7f8691a85000 r--p 00100000 fd:04 21230170                   /usr/lib64/libm-2.17.so
#mm/memlock.c:296           mlock          4KiB 7f8691a85000 - 7f8691a86000 rw-p 00101000 fd:04 21230170                   /usr/lib64/libm-2.17.so
#mm/memlock.c:268           mlock default filter '/libcap.so.' matches '7f8691a86000-7f8691a8a000 r-xp 00000000 fd:04 17349797                   /usr/lib64/libcap.so.2.22': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8691a8a000-7f8691c89000 ---p 00004000 fd:04 17349797                   /usr/lib64/libcap.so.2.22 : Skipping.
#mm/memlock.c:268           mlock default filter '/libcap.so.' matches '7f8691c89000-7f8691c8a000 r--p 00003000 fd:04 17349797                   /usr/lib64/libcap.so.2.22': Skipping.
#mm/memlock.c:268           mlock default filter '/libcap.so.' matches '7f8691c8a000-7f8691c8b000 rw-p 00004000 fd:04 17349797                   /usr/lib64/libcap.so.2.22': Skipping.
#mm/memlock.c:296           mlock         28KiB 7f8691c8b000 - 7f8691c92000 r-xp 00000000 fd:04 21086475                   /usr/lib64/librt-2.17.so
#mm/memlock.c:250           mlock area unreadable 7f8691c92000-7f8691e91000 ---p 00007000 fd:04 21086475                   /usr/lib64/librt-2.17.so : Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8691e91000 - 7f8691e92000 r--p 00006000 fd:04 21086475                   /usr/lib64/librt-2.17.so
#mm/memlock.c:296           mlock          4KiB 7f8691e92000 - 7f8691e93000 rw-p 00007000 fd:04 21086475                   /usr/lib64/librt-2.17.so
#mm/memlock.c:296           mlock         92KiB 7f8691e93000 - 7f8691eaa000 r-xp 00000000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so
#mm/memlock.c:250           mlock area unreadable 7f8691eaa000-7f86920a9000 ---p 00017000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so : Skipping.
#mm/memlock.c:296           mlock          4KiB 7f86920a9000 - 7f86920aa000 r--p 00016000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so
#mm/memlock.c:296           mlock          4KiB 7f86920aa000 - 7f86920ab000 rw-p 00017000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so
#mm/memlock.c:296           mlock         16KiB 7f86920ab000 - 7f86920af000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           mlock       1800KiB 7f86920af000 - 7f8692271000 r-xp 00000000 fd:04 21230163                   /usr/lib64/libc-2.17.so
#mm/memlock.c:250           mlock area unreadable 7f8692271000-7f8692471000 ---p 001c2000 fd:04 21230163                   /usr/lib64/libc-2.17.so : Skipping.
#mm/memlock.c:296           mlock         16KiB 7f8692471000 - 7f8692475000 r--p 001c2000 fd:04 21230163                   /usr/lib64/libc-2.17.so
#mm/memlock.c:296           mlock          8KiB 7f8692475000 - 7f8692477000 rw-p 001c6000 fd:04 21230163                   /usr/lib64/libc-2.17.so
#mm/memlock.c:296           mlock         20KiB 7f8692477000 - 7f869247c000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/libreadline.so.' matches '7f869247c000-7f86924b8000 r-xp 00000000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f86924b8000-7f86926b8000 ---p 0003c000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2 : Skipping.
#mm/memlock.c:268           mlock default filter '/libreadline.so.' matches '7f86926b8000-7f86926ba000 r--p 0003c000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2': Skipping.
#mm/memlock.c:268           mlock default filter '/libreadline.so.' matches '7f86926ba000-7f86926c0000 rw-p 0003e000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2': Skipping.
#mm/memlock.c:296           mlock          8KiB 7f86926c0000 - 7f86926c2000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/libaio.so.' matches '7f86926c2000-7f86926c3000 r-xp 00000000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f86926c3000-7f86928c2000 ---p 00001000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1 : Skipping.
#mm/memlock.c:268           mlock default filter '/libaio.so.' matches '7f86928c2000-7f86928c3000 r--p 00000000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1': Skipping.
#mm/memlock.c:268           mlock default filter '/libaio.so.' matches '7f86928c3000-7f86928c4000 rw-p 00001000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1': Skipping.
#mm/memlock.c:296           mlock        328KiB 7f86928c4000 - 7f8692916000 r-xp 00000000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02
#mm/memlock.c:250           mlock area unreadable 7f8692916000-7f8692b15000 ---p 00052000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02 : Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8692b15000 - 7f8692b16000 r--p 00051000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02
#mm/memlock.c:296           mlock         16KiB 7f8692b16000 - 7f8692b1a000 rw-p 00052000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02
#mm/memlock.c:296           mlock          4KiB 7f8692b1a000 - 7f8692b1b000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/libblkid.so.' matches '7f8692b1b000-7f8692b57000 r-xp 00000000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8692b57000-7f8692d56000 ---p 0003c000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0 : Skipping.
#mm/memlock.c:268           mlock default filter '/libblkid.so.' matches '7f8692d56000-7f8692d59000 r--p 0003b000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0': Skipping.
#mm/memlock.c:268           mlock default filter '/libblkid.so.' matches '7f8692d59000-7f8692d5a000 rw-p 0003e000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0': Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8692d5a000 - 7f8692d5b000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/libdl-' matches '7f8692d5b000-7f8692d5d000 r-xp 00000000 fd:04 21230168                   /usr/lib64/libdl-2.17.so': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8692d5d000-7f8692f5d000 ---p 00002000 fd:04 21230168                   /usr/lib64/libdl-2.17.so : Skipping.
#mm/memlock.c:268           mlock default filter '/libdl-' matches '7f8692f5d000-7f8692f5e000 r--p 00002000 fd:04 21230168                   /usr/lib64/libdl-2.17.so': Skipping.
#mm/memlock.c:268           mlock default filter '/libdl-' matches '7f8692f5e000-7f8692f5f000 rw-p 00003000 fd:04 21230168                   /usr/lib64/libdl-2.17.so': Skipping.
#mm/memlock.c:268           mlock default filter '/libudev.so.' matches '7f8692f5f000-7f8692f74000 r-xp 00000000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2': Skipping.
#mm/memlock.c:250           mlock area unreadable 7f8692f74000-7f8693173000 ---p 00015000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2 : Skipping.
#mm/memlock.c:268           mlock default filter '/libudev.so.' matches '7f8693173000-7f8693174000 r--p 00014000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2': Skipping.
#mm/memlock.c:268           mlock default filter '/libudev.so.' matches '7f8693174000-7f8693175000 rw-p 00015000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2': Skipping.
#mm/memlock.c:296           mlock         20KiB 7f8693175000 - 7f869317a000 r-xp 00000000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02
#mm/memlock.c:250           mlock area unreadable 7f869317a000-7f8693379000 ---p 00005000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02 : Skipping.
#mm/memlock.c:296           mlock          4KiB 7f8693379000 - 7f869337a000 r--p 00004000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02
#mm/memlock.c:296           mlock          4KiB 7f869337a000 - 7f869337b000 rw-p 00005000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02
#mm/memlock.c:268           mlock default filter '/ld-2.' matches '7f869337b000-7f869339d000 r-xp 00000000 fd:04 21230156                   /usr/lib64/ld-2.17.so': Skipping.
#mm/memlock.c:296           mlock         52KiB 7f8693572000 - 7f869357f000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           mlock         68KiB 7f869358a000 - 7f869359b000 rw-s 00000000 00:0c 51024634                   /[aio] (deleted)
#mm/memlock.c:296           mlock          4KiB 7f869359b000 - 7f869359c000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           mlock default filter '/ld-2.' matches '7f869359c000-7f869359d000 r--p 00021000 fd:04 21230156                   /usr/lib64/ld-2.17.so': Skipping.
#mm/memlock.c:268           mlock default filter '/ld-2.' matches '7f869359d000-7f869359e000 rw-p 00022000 fd:04 21230156                   /usr/lib64/ld-2.17.so': Skipping.
#mm/memlock.c:296           mlock          4KiB 7f869359e000 - 7f869359f000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           mlock        132KiB 7ffde4cee000 - 7ffde4d0f000 rw-p 00000000 00:00 0                          [stack]
#mm/memlock.c:296           mlock         12KiB 7ffde4d24000 - 7ffde4d27000 r--p 00000000 00:00 0                          [vvar]
#mm/memlock.c:258           mlock ignore filter '[vdso]' matches '7ffde4d27000-7ffde4d29000 r-xp 00000000 00:00 0                          [vdso]': Skipping.
#mm/memlock.c:258           mlock ignore filter '[vsyscall]' matches 'ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]': Skipping.
#mm/memlock.c:382           Locked 23883776 bytes
#mm/memlock.c:489           Raised task priority 0 -> -18.
#activate/dev_manager.c:3225          Creating SUSPEND tree for vg_sys/lv_test.
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:44) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:43) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:42) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:41) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:40) [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm info   (253:44) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:1353      Suspending vg_sys-lv_test (253:44) with device flush
#ioctl/libdm-iface.c:1857          dm suspend   (253:44) [ noopencount flush skiplockfs ]   [16384] (*1)
#libdm-common.c:277           Suspended device counter increased to 1
#ioctl/libdm-iface.c:1857          dm info   (253:43) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:1353      Suspending vg_sys-lv_test_rimage_1 (253:43) with device flush
#ioctl/libdm-iface.c:1857          dm suspend   (253:43) [ noopencount flush skiplockfs ]   [16384] (*1)
#libdm-common.c:277           Suspended device counter increased to 2
#ioctl/libdm-iface.c:1857          dm info   (253:42) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:1353      Suspending vg_sys-lv_test_rmeta_1 (253:42) with device flush
#ioctl/libdm-iface.c:1857          dm suspend   (253:42) [ noopencount flush skiplockfs ]   [16384] (*1)
#libdm-common.c:277           Suspended device counter increased to 3
#ioctl/libdm-iface.c:1857          dm info   (253:41) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:1353      Suspending vg_sys-lv_test_rimage_0 (253:41) with device flush
#ioctl/libdm-iface.c:1857          dm suspend   (253:41) [ noopencount flush skiplockfs ]   [16384] (*1)
#libdm-common.c:277           Suspended device counter increased to 4
#ioctl/libdm-iface.c:1857          dm info   (253:40) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:1353      Suspending vg_sys-lv_test_rmeta_0 (253:40) with device flush
#ioctl/libdm-iface.c:1857          dm suspend   (253:40) [ noopencount flush skiplockfs ]   [16384] (*1)
#libdm-common.c:277           Suspended device counter increased to 5
#format_text/format-text.c:331           Reading mda header sector from /dev/sdb2 at 4096
#format_text/format-text.c:800           Committing vg_sys metadata (150) to /dev/sdb2 header at 4096
#device/dev-io.c:521       dev_open(/dev/sdb2) called while suspended
#device/dev-io.c:609           Opened /dev/sdb2 RO O_DIRECT
#device/dev-io.c:166           /dev/sdb2: Block size is 512 bytes
#device/dev-io.c:177           /dev/sdb2: Physical block size is 512 bytes
#device/dev-io.c:658           Closed /dev/sdb2
#device/bcache.c:211           Limit write at 0 len 131072 to len 4608
#format_text/format-text.c:331           Reading mda header sector from /dev/sda2 at 4096
#format_text/format-text.c:800           Committing vg_sys metadata (150) to /dev/sda2 header at 4096
#device/dev-io.c:521       dev_open(/dev/sda2) called while suspended
#device/dev-io.c:609           Opened /dev/sda2 RO O_DIRECT
#device/dev-io.c:166           /dev/sda2: Block size is 512 bytes
#device/dev-io.c:177           /dev/sda2: Physical block size is 4096 bytes
#device/dev-io.c:658           Closed /dev/sda2
#device/bcache.c:205           Limit write at 0 len 131072 to len 4608 rounded to 8192
#locking/locking.c:367           Dropping cache for vg_sys.
#metadata/vg.c:89            Freeing VG vg_sys at 0x564bc4236a50.
#metadata/lv_manip.c:6434        Updating logical volume vg_sys/lv_test in kernel.
#locking/file_locking.c:90          Unlocking LV xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV
#activate/activate.c:2539          Resuming LV vg_sys/lv_test if active.
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ noopencount flush ]   [16384] (*1)
#activate/dev_manager.c:3225          Creating ACTIVATE tree for vg_sys/lv_test.
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:44) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:43) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:42) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:41) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:40) [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV in deptree.
#activate/dev_manager.c:2791          Checking kernel supports raid1 segment type for vg_sys/lv_test
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rimage_0 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rimage_0
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rimage_0 is 8192
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rmeta_0 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rmeta_0
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rmeta_0 is 8192
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rimage_1 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rimage_1
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rimage_1 is 8192
#activate/dev_manager.c:2869          Adding new LV vg_sys/lv_test_rmeta_1 to dtree
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe in deptree.
#activate/dev_manager.c:2791          Checking kernel supports striped segment type for vg_sys/lv_test_rmeta_1
#metadata/metadata.c:2133          Calculated readahead of LV lv_test_rmeta_1 is 8192
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe in deptree.
#libdm-deptree.c:572           Matched uuid LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z in deptree.
#metadata/metadata.c:2133          Calculated readahead of LV lv_test is 8192
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rimage_1 (253:43).
#libdm-deptree.c:2641          Adding target to (253:43): 0 4194304 linear 8:2 1480665088
#ioctl/libdm-iface.c:1857          dm table   (253:43) [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2729      Suppressed vg_sys-lv_test_rimage_1 (253:43) identical table reload.
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rmeta_1 (253:42).
#libdm-deptree.c:2641          Adding target to (253:42): 0 8192 linear 8:2 1480656896
#ioctl/libdm-iface.c:1857          dm table   (253:42) [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2729      Suppressed vg_sys-lv_test_rmeta_1 (253:42) identical table reload.
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rimage_0 (253:41).
#libdm-deptree.c:2641          Adding target to (253:41): 0 4194304 linear 8:18 1480665088
#ioctl/libdm-iface.c:1857          dm table   (253:41) [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2729      Suppressed vg_sys-lv_test_rimage_0 (253:41) identical table reload.
#libdm-deptree.c:2696      Loading table for vg_sys-lv_test_rmeta_0 (253:40).
#libdm-deptree.c:2641          Adding target to (253:40): 0 8192 linear 8:18 1480656896
#ioctl/libdm-iface.c:1857          dm table   (253:40) [ opencount flush ]   [16384] (*1)
#libdm-deptree.c:2729      Suppressed vg_sys-lv_test_rmeta_0 (253:40) identical table reload.
#libdm-deptree.c:1302      Resuming vg_sys-lv_test_rimage_1 (253:43).
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 2
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES DISABLE_DISK_RULES DISABLE_OTHER_RULES DISABLE_LIBRARY_FALLBACK         (0x2e)
#ioctl/libdm-iface.c:1857          dm resume   (253:43) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test_rimage_1: Stacking NODE_ADD (253,43) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_1: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:288           Suspended device counter reduced to 4
#libdm-deptree.c:1302      Resuming vg_sys-lv_test_rmeta_1 (253:42).
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 3
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES DISABLE_DISK_RULES DISABLE_OTHER_RULES DISABLE_LIBRARY_FALLBACK         (0x2e)
#ioctl/libdm-iface.c:1857          dm resume   (253:42) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test_rmeta_1: Stacking NODE_ADD (253,42) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rmeta_1: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:288           Suspended device counter reduced to 3
#libdm-deptree.c:1302      Resuming vg_sys-lv_test_rimage_0 (253:41).
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 4
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES DISABLE_DISK_RULES DISABLE_OTHER_RULES DISABLE_LIBRARY_FALLBACK         (0x2e)
#ioctl/libdm-iface.c:1857          dm resume   (253:41) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test_rimage_0: Stacking NODE_ADD (253,41) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_0: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:288           Suspended device counter reduced to 2
#libdm-deptree.c:1302      Resuming vg_sys-lv_test_rmeta_0 (253:40).
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 5
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES DISABLE_DISK_RULES DISABLE_OTHER_RULES DISABLE_LIBRARY_FALLBACK         (0x2e)
#ioctl/libdm-iface.c:1857          dm resume   (253:40) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test_rmeta_0: Stacking NODE_ADD (253,40) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rmeta_0: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:288           Suspended device counter reduced to 1
#libdm-deptree.c:1302      Resuming vg_sys-lv_test (253:44).
#libdm-common.c:2325          Udev cookie 0xd4dc508 (semid 4521993) incremented to 6
#libdm-common.c:2575          Udev cookie 0xd4dc508 (semid 4521993) assigned to RESUME task(5) with flags DISABLE_LIBRARY_FALLBACK         (0x20)
#ioctl/libdm-iface.c:1857          dm resume   (253:44) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1484          vg_sys-lv_test: Stacking NODE_ADD (253,44) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:288           Suspended device counter reduced to 0
#activate/dev_manager.c:3225          Creating CLEAN tree for vg_sys/lv_test.
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:44) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:43) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:42) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:41) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm deps   (253:40) [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Omb4nZd6r61oeblo8EqKOzQvXAnC0vjxD-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_0-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OHKkDqs6jUPoMBJioFbCqzXPnWRByKIHo-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rimage_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3O0H2uLsVMI5TFKjvCU5OTeK2bh8TxgC2z-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1 [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-real [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:779           Getting device info for vg_sys-lv_test_rmeta_1-cow [LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow].
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3OwlHRdNW45KUw8IxWRlUAxiZb5kAa7qfe-cow [ opencount flush ]   [16384] (*1)
#mm/memlock.c:636           Leaving critical section (resumed).
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#libdevmapper-event.c:761           vg_sys-lv_test: device not registered.
#activate/activate.c:2028        Monitoring vg_sys/lv_test with libdevmapper-event-lvm2raid.so.
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#activate/activate.c:1837      Monitored LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV for events
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1857          dm info  LVM-xwAQBNiZlpuwjOa6MxfUBVfTeUKURS3Ol7BEmZRrSI2Vt6z6HKkyDjcZ1eb1roJV [ opencount flush ]   [16384] (*1)
#mm/memlock.c:594           Unlock: Memlock counters: prioritized:1 locked:1 critical:0 daemon:0 suspended:0
#mm/memlock.c:552         Unlocking memory
#mm/memlock.c:296           munlock       1900KiB 564bc2385000 - 564bc2560000 r-xp 00000000 fd:04 1074029                    /usr/sbin/lvm
#mm/memlock.c:296           munlock         40KiB 564bc275f000 - 564bc2769000 r--p 001da000 fd:04 1074029                    /usr/sbin/lvm
#mm/memlock.c:296           munlock        212KiB 564bc2769000 - 564bc279e000 rw-p 001e4000 fd:04 1074029                    /usr/sbin/lvm
#mm/memlock.c:296           munlock       2272KiB 564bc279e000 - 564bc29d6000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           munlock      15100KiB 564bc3dd3000 - 564bc4c92000 rw-p 00000000 00:00 0                          [heap]
#mm/memlock.c:268           munlock default filter 'locale/locale-archive' matches '7f8689836000-7f868fd60000 r--p 00000000 fd:04 6395174                    /usr/lib/locale/locale-archive': Skipping.
#mm/memlock.c:268           munlock default filter '/libpcre.so.' matches '7f868fd60000-7f868fdc0000 r-xp 00000000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f868fdc0000-7f868ffc0000 ---p 00060000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0 : Skipping.
#mm/memlock.c:268           munlock default filter '/libpcre.so.' matches '7f868ffc0000-7f868ffc1000 r--p 00060000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0': Skipping.
#mm/memlock.c:268           munlock default filter '/libpcre.so.' matches '7f868ffc1000-7f868ffc2000 rw-p 00061000 fd:04 17350317                   /usr/lib64/libpcre.so.1.2.0': Skipping.
#mm/memlock.c:268           munlock default filter '/libbz2.so.' matches '7f868ffc2000-7f868ffd1000 r-xp 00000000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f868ffd1000-7f86901d0000 ---p 0000f000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6 : Skipping.
#mm/memlock.c:268           munlock default filter '/libbz2.so.' matches '7f86901d0000-7f86901d1000 r--p 0000e000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6': Skipping.
#mm/memlock.c:268           munlock default filter '/libbz2.so.' matches '7f86901d1000-7f86901d2000 rw-p 0000f000 fd:04 17544510                   /usr/lib64/libbz2.so.1.0.6': Skipping.
#mm/memlock.c:268           munlock default filter '/liblzma.so.' matches '7f86901d2000-7f86901f7000 r-xp 00000000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f86901f7000-7f86903f6000 ---p 00025000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2 : Skipping.
#mm/memlock.c:268           munlock default filter '/liblzma.so.' matches '7f86903f6000-7f86903f7000 r--p 00024000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2': Skipping.
#mm/memlock.c:268           munlock default filter '/liblzma.so.' matches '7f86903f7000-7f86903f8000 rw-p 00025000 fd:04 20932306                   /usr/lib64/liblzma.so.5.2.2': Skipping.
#mm/memlock.c:268           munlock default filter '/libz.so.' matches '7f86903f8000-7f869040d000 r-xp 00000000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f869040d000-7f869060c000 ---p 00015000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7 : Skipping.
#mm/memlock.c:268           munlock default filter '/libz.so.' matches '7f869060c000-7f869060d000 r--p 00014000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7': Skipping.
#mm/memlock.c:268           munlock default filter '/libz.so.' matches '7f869060d000-7f869060e000 rw-p 00015000 fd:04 19861062                   /usr/lib64/libz.so.1.2.7': Skipping.
#mm/memlock.c:268           munlock default filter '/libelf-' matches '7f869060e000-7f8690625000 r-xp 00000000 fd:04 21093871                   /usr/lib64/libelf-0.172.so': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8690625000-7f8690824000 ---p 00017000 fd:04 21093871                   /usr/lib64/libelf-0.172.so : Skipping.
#mm/memlock.c:268           munlock default filter '/libelf-' matches '7f8690824000-7f8690825000 r--p 00016000 fd:04 21093871                   /usr/lib64/libelf-0.172.so': Skipping.
#mm/memlock.c:268           munlock default filter '/libelf-' matches '7f8690825000-7f8690826000 rw-p 00017000 fd:04 21093871                   /usr/lib64/libelf-0.172.so': Skipping.
#mm/memlock.c:268           munlock default filter '/libattr.so.' matches '7f8690826000-7f869082a000 r-xp 00000000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f869082a000-7f8690a29000 ---p 00004000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0 : Skipping.
#mm/memlock.c:268           munlock default filter '/libattr.so.' matches '7f8690a29000-7f8690a2a000 r--p 00003000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0': Skipping.
#mm/memlock.c:268           munlock default filter '/libattr.so.' matches '7f8690a2a000-7f8690a2b000 rw-p 00004000 fd:04 17348907                   /usr/lib64/libattr.so.1.1.0': Skipping.
#mm/memlock.c:268           munlock default filter '/libtinfo.so.' matches '7f8690a2b000-7f8690a50000 r-xp 00000000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8690a50000-7f8690c50000 ---p 00025000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9 : Skipping.
#mm/memlock.c:268           munlock default filter '/libtinfo.so.' matches '7f8690c50000-7f8690c54000 r--p 00025000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9': Skipping.
#mm/memlock.c:268           munlock default filter '/libtinfo.so.' matches '7f8690c54000-7f8690c55000 rw-p 00029000 fd:04 17350494                   /usr/lib64/libtinfo.so.5.9': Skipping.
#mm/memlock.c:268           munlock default filter '/libsepol.so.' matches '7f8690c55000-7f8690cf1000 r-xp 00000000 fd:04 19861052                   /usr/lib64/libsepol.so.1': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8690cf1000-7f8690ef0000 ---p 0009c000 fd:04 19861052                   /usr/lib64/libsepol.so.1 : Skipping.
#mm/memlock.c:268           munlock default filter '/libsepol.so.' matches '7f8690ef0000-7f8690ef1000 r--p 0009b000 fd:04 19861052                   /usr/lib64/libsepol.so.1': Skipping.
#mm/memlock.c:268           munlock default filter '/libsepol.so.' matches '7f8690ef1000-7f8690ef2000 rw-p 0009c000 fd:04 19861052                   /usr/lib64/libsepol.so.1': Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8690ef2000 - 7f8690ef3000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/libselinux.so.' matches '7f8690ef3000-7f8690f17000 r-xp 00000000 fd:04 19861057                   /usr/lib64/libselinux.so.1': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8690f17000-7f8691116000 ---p 00024000 fd:04 19861057                   /usr/lib64/libselinux.so.1 : Skipping.
#mm/memlock.c:268           munlock default filter '/libselinux.so.' matches '7f8691116000-7f8691117000 r--p 00023000 fd:04 19861057                   /usr/lib64/libselinux.so.1': Skipping.
#mm/memlock.c:268           munlock default filter '/libselinux.so.' matches '7f8691117000-7f8691118000 rw-p 00024000 fd:04 19861057                   /usr/lib64/libselinux.so.1': Skipping.
#mm/memlock.c:296           munlock          8KiB 7f8691118000 - 7f869111a000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/libuuid.so.' matches '7f869111a000-7f869111e000 r-xp 00000000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f869111e000-7f869131d000 ---p 00004000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0 : Skipping.
#mm/memlock.c:268           munlock default filter '/libuuid.so.' matches '7f869131d000-7f869131e000 r--p 00003000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0': Skipping.
#mm/memlock.c:268           munlock default filter '/libuuid.so.' matches '7f869131e000-7f869131f000 rw-p 00004000 fd:04 21230738                   /usr/lib64/libuuid.so.1.3.0': Skipping.
#mm/memlock.c:296           munlock         84KiB 7f869131f000 - 7f8691334000 r-xp 00000000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1
#mm/memlock.c:250           munlock area unreadable 7f8691334000-7f8691533000 ---p 00015000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1 : Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8691533000 - 7f8691534000 r--p 00014000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1
#mm/memlock.c:296           munlock          4KiB 7f8691534000 - 7f8691535000 rw-p 00015000 fd:04 20760024                   /usr/lib64/libgcc_s-4.8.5-20150702.so.1
#mm/memlock.c:268           munlock default filter '/libdw-' matches '7f8691535000-7f8691581000 r-xp 00000000 fd:04 20545973                   /usr/lib64/libdw-0.172.so': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8691581000-7f8691781000 ---p 0004c000 fd:04 20545973                   /usr/lib64/libdw-0.172.so : Skipping.
#mm/memlock.c:268           munlock default filter '/libdw-' matches '7f8691781000-7f8691783000 r--p 0004c000 fd:04 20545973                   /usr/lib64/libdw-0.172.so': Skipping.
#mm/memlock.c:268           munlock default filter '/libdw-' matches '7f8691783000-7f8691784000 rw-p 0004e000 fd:04 20545973                   /usr/lib64/libdw-0.172.so': Skipping.
#mm/memlock.c:296           munlock       1028KiB 7f8691784000 - 7f8691885000 r-xp 00000000 fd:04 21230170                   /usr/lib64/libm-2.17.so
#mm/memlock.c:250           munlock area unreadable 7f8691885000-7f8691a84000 ---p 00101000 fd:04 21230170                   /usr/lib64/libm-2.17.so : Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8691a84000 - 7f8691a85000 r--p 00100000 fd:04 21230170                   /usr/lib64/libm-2.17.so
#mm/memlock.c:296           munlock          4KiB 7f8691a85000 - 7f8691a86000 rw-p 00101000 fd:04 21230170                   /usr/lib64/libm-2.17.so
#mm/memlock.c:268           munlock default filter '/libcap.so.' matches '7f8691a86000-7f8691a8a000 r-xp 00000000 fd:04 17349797                   /usr/lib64/libcap.so.2.22': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8691a8a000-7f8691c89000 ---p 00004000 fd:04 17349797                   /usr/lib64/libcap.so.2.22 : Skipping.
#mm/memlock.c:268           munlock default filter '/libcap.so.' matches '7f8691c89000-7f8691c8a000 r--p 00003000 fd:04 17349797                   /usr/lib64/libcap.so.2.22': Skipping.
#mm/memlock.c:268           munlock default filter '/libcap.so.' matches '7f8691c8a000-7f8691c8b000 rw-p 00004000 fd:04 17349797                   /usr/lib64/libcap.so.2.22': Skipping.
#mm/memlock.c:296           munlock         28KiB 7f8691c8b000 - 7f8691c92000 r-xp 00000000 fd:04 21086475                   /usr/lib64/librt-2.17.so
#mm/memlock.c:250           munlock area unreadable 7f8691c92000-7f8691e91000 ---p 00007000 fd:04 21086475                   /usr/lib64/librt-2.17.so : Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8691e91000 - 7f8691e92000 r--p 00006000 fd:04 21086475                   /usr/lib64/librt-2.17.so
#mm/memlock.c:296           munlock          4KiB 7f8691e92000 - 7f8691e93000 rw-p 00007000 fd:04 21086475                   /usr/lib64/librt-2.17.so
#mm/memlock.c:296           munlock         92KiB 7f8691e93000 - 7f8691eaa000 r-xp 00000000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so
#mm/memlock.c:250           munlock area unreadable 7f8691eaa000-7f86920a9000 ---p 00017000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so : Skipping.
#mm/memlock.c:296           munlock          4KiB 7f86920a9000 - 7f86920aa000 r--p 00016000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so
#mm/memlock.c:296           munlock          4KiB 7f86920aa000 - 7f86920ab000 rw-p 00017000 fd:04 21086471                   /usr/lib64/libpthread-2.17.so
#mm/memlock.c:296           munlock         16KiB 7f86920ab000 - 7f86920af000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           munlock       1800KiB 7f86920af000 - 7f8692271000 r-xp 00000000 fd:04 21230163                   /usr/lib64/libc-2.17.so
#mm/memlock.c:250           munlock area unreadable 7f8692271000-7f8692471000 ---p 001c2000 fd:04 21230163                   /usr/lib64/libc-2.17.so : Skipping.
#mm/memlock.c:296           munlock         16KiB 7f8692471000 - 7f8692475000 r--p 001c2000 fd:04 21230163                   /usr/lib64/libc-2.17.so
#mm/memlock.c:296           munlock          8KiB 7f8692475000 - 7f8692477000 rw-p 001c6000 fd:04 21230163                   /usr/lib64/libc-2.17.so
#mm/memlock.c:296           munlock         20KiB 7f8692477000 - 7f869247c000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/libreadline.so.' matches '7f869247c000-7f86924b8000 r-xp 00000000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f86924b8000-7f86926b8000 ---p 0003c000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2 : Skipping.
#mm/memlock.c:268           munlock default filter '/libreadline.so.' matches '7f86926b8000-7f86926ba000 r--p 0003c000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2': Skipping.
#mm/memlock.c:268           munlock default filter '/libreadline.so.' matches '7f86926ba000-7f86926c0000 rw-p 0003e000 fd:04 17350365                   /usr/lib64/libreadline.so.6.2': Skipping.
#mm/memlock.c:296           munlock          8KiB 7f86926c0000 - 7f86926c2000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/libaio.so.' matches '7f86926c2000-7f86926c3000 r-xp 00000000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f86926c3000-7f86928c2000 ---p 00001000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1 : Skipping.
#mm/memlock.c:268           munlock default filter '/libaio.so.' matches '7f86928c2000-7f86928c3000 r--p 00000000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1': Skipping.
#mm/memlock.c:268           munlock default filter '/libaio.so.' matches '7f86928c3000-7f86928c4000 rw-p 00001000 fd:04 17410806                   /usr/lib64/libaio.so.1.0.1': Skipping.
#mm/memlock.c:296           munlock        328KiB 7f86928c4000 - 7f8692916000 r-xp 00000000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02
#mm/memlock.c:250           munlock area unreadable 7f8692916000-7f8692b15000 ---p 00052000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02 : Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8692b15000 - 7f8692b16000 r--p 00051000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02
#mm/memlock.c:296           munlock         16KiB 7f8692b16000 - 7f8692b1a000 rw-p 00052000 fd:04 19926003                   /usr/lib64/libdevmapper.so.1.02
#mm/memlock.c:296           munlock          4KiB 7f8692b1a000 - 7f8692b1b000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/libblkid.so.' matches '7f8692b1b000-7f8692b57000 r-xp 00000000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8692b57000-7f8692d56000 ---p 0003c000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0 : Skipping.
#mm/memlock.c:268           munlock default filter '/libblkid.so.' matches '7f8692d56000-7f8692d59000 r--p 0003b000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0': Skipping.
#mm/memlock.c:268           munlock default filter '/libblkid.so.' matches '7f8692d59000-7f8692d5a000 rw-p 0003e000 fd:04 20372563                   /usr/lib64/libblkid.so.1.1.0': Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8692d5a000 - 7f8692d5b000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/libdl-' matches '7f8692d5b000-7f8692d5d000 r-xp 00000000 fd:04 21230168                   /usr/lib64/libdl-2.17.so': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8692d5d000-7f8692f5d000 ---p 00002000 fd:04 21230168                   /usr/lib64/libdl-2.17.so : Skipping.
#mm/memlock.c:268           munlock default filter '/libdl-' matches '7f8692f5d000-7f8692f5e000 r--p 00002000 fd:04 21230168                   /usr/lib64/libdl-2.17.so': Skipping.
#mm/memlock.c:268           munlock default filter '/libdl-' matches '7f8692f5e000-7f8692f5f000 rw-p 00003000 fd:04 21230168                   /usr/lib64/libdl-2.17.so': Skipping.
#mm/memlock.c:268           munlock default filter '/libudev.so.' matches '7f8692f5f000-7f8692f74000 r-xp 00000000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2': Skipping.
#mm/memlock.c:250           munlock area unreadable 7f8692f74000-7f8693173000 ---p 00015000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2 : Skipping.
#mm/memlock.c:268           munlock default filter '/libudev.so.' matches '7f8693173000-7f8693174000 r--p 00014000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2': Skipping.
#mm/memlock.c:268           munlock default filter '/libudev.so.' matches '7f8693174000-7f8693175000 rw-p 00015000 fd:04 22709071                   /usr/lib64/libudev.so.1.6.2': Skipping.
#mm/memlock.c:296           munlock         20KiB 7f8693175000 - 7f869317a000 r-xp 00000000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02
#mm/memlock.c:250           munlock area unreadable 7f869317a000-7f8693379000 ---p 00005000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02 : Skipping.
#mm/memlock.c:296           munlock          4KiB 7f8693379000 - 7f869337a000 r--p 00004000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02
#mm/memlock.c:296           munlock          4KiB 7f869337a000 - 7f869337b000 rw-p 00005000 fd:04 20645309                   /usr/lib64/libdevmapper-event.so.1.02
#mm/memlock.c:268           munlock default filter '/ld-2.' matches '7f869337b000-7f869339d000 r-xp 00000000 fd:04 21230156                   /usr/lib64/ld-2.17.so': Skipping.
#mm/memlock.c:296           munlock         52KiB 7f8693572000 - 7f869357f000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           munlock         68KiB 7f869358a000 - 7f869359b000 rw-s 00000000 00:0c 51024634                   /[aio] (deleted)
#mm/memlock.c:296           munlock          4KiB 7f869359b000 - 7f869359c000 rw-p 00000000 00:00 0 
#mm/memlock.c:268           munlock default filter '/ld-2.' matches '7f869359c000-7f869359d000 r--p 00021000 fd:04 21230156                   /usr/lib64/ld-2.17.so': Skipping.
#mm/memlock.c:268           munlock default filter '/ld-2.' matches '7f869359d000-7f869359e000 rw-p 00022000 fd:04 21230156                   /usr/lib64/ld-2.17.so': Skipping.
#mm/memlock.c:296           munlock          4KiB 7f869359e000 - 7f869359f000 rw-p 00000000 00:00 0 
#mm/memlock.c:296           munlock        132KiB 7ffde4cee000 - 7ffde4d0f000 rw-p 00000000 00:00 0                          [stack]
#mm/memlock.c:296           munlock         12KiB 7ffde4d24000 - 7ffde4d27000 r--p 00000000 00:00 0                          [vvar]
#mm/memlock.c:258           munlock ignore filter '[vdso]' matches '7ffde4d27000-7ffde4d29000 r-xp 00000000 00:00 0                          [vdso]': Skipping.
#mm/memlock.c:258           munlock ignore filter '[vsyscall]' matches 'ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]': Skipping.
#mm/memlock.c:382           Unlocked 23883776 bytes
#mm/memlock.c:502           Restoring original task priority 0.
#format_text/archiver.c:576       Creating volume group backup "/etc/lvm/backup/vg_sys" (seqno 150).
#format_text/format-text.c:1009          Writing vg_sys metadata to /etc/lvm/backup/.lvm_strike.wu-wien.ac.at_22359_516907111
#format_text/format-text.c:1028          Renaming /etc/lvm/backup/.lvm_strike.wu-wien.ac.at_22359_516907111 to /etc/lvm/backup/vg_sys.tmp
#format_text/format-text.c:1053          Committing vg_sys metadata (150)
#format_text/format-text.c:1054          Renaming /etc/lvm/backup/vg_sys.tmp to /etc/lvm/backup/vg_sys
#metadata/lv_manip.c:5628    Logical volume vg_sys/lv_test successfully resized.
#cache/lvmetad.c:1246          Sending lvmetad updated VG vg_sys (seqno 150)
#format_text/format-text.c:331           Reading mda header sector from /dev/sdb2 at 4096
#cache/lvmetad.c:1673          Telling lvmetad to store PV /dev/sdb2 (WrL4ie-rF0B-H1yL-m3DQ-uACO-CFKu-qmNTBg)
#format_text/format-text.c:331           Reading mda header sector from /dev/sda2 at 4096
#cache/lvmetad.c:1673          Telling lvmetad to store PV /dev/sda2 (hK7rcr-LItv-KP00-pdyo-e2IU-EGOO-L3zzyV)
#mm/memlock.c:594           Unlock: Memlock counters: prioritized:0 locked:0 critical:0 daemon:0 suspended:0
#activate/fs.c:491           Syncing device names
#libdm-common.c:2360          Udev cookie 0xd4dc508 (semid 4521993) decremented to 1
#libdm-common.c:2646          Udev cookie 0xd4dc508 (semid 4521993) waiting for zero
#libdm-common.c:2375          Udev cookie 0xd4dc508 (semid 4521993) destroyed
#libdm-common.c:1484          vg_sys-lv_test_rimage_1: Skipping NODE_ADD (253,43) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_1: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test_rimage_1 (253:43): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test_rimage_1: retaining kernel read ahead of 8192 (requested 8192)
#libdm-common.c:1484          vg_sys-lv_test_rimage_0: Skipping NODE_ADD (253,41) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_0: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test_rimage_0 (253:41): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test_rimage_0: retaining kernel read ahead of 8192 (requested 8192)
#libdm-common.c:1484          vg_sys-lv_test_rimage_1: Skipping NODE_ADD (253,43) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_1: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test_rimage_1 (253:43): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test_rimage_1: retaining kernel read ahead of 8192 (requested 8192)
#libdm-common.c:1484          vg_sys-lv_test_rmeta_1: Skipping NODE_ADD (253,42) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rmeta_1: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test_rmeta_1 (253:42): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test_rmeta_1: retaining kernel read ahead of 8192 (requested 8192)
#libdm-common.c:1484          vg_sys-lv_test_rimage_0: Skipping NODE_ADD (253,41) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rimage_0: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test_rimage_0 (253:41): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test_rimage_0: retaining kernel read ahead of 8192 (requested 8192)
#libdm-common.c:1484          vg_sys-lv_test_rmeta_0: Skipping NODE_ADD (253,40) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test_rmeta_0: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test_rmeta_0 (253:40): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test_rmeta_0: retaining kernel read ahead of 8192 (requested 8192)
#libdm-common.c:1484          vg_sys-lv_test: Skipping NODE_ADD (253,44) 0:6 0660 [trust_udev]
#libdm-common.c:1494          vg_sys-lv_test: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1248          vg_sys-lv_test (253:44): read ahead is 8192
#libdm-common.c:1373          vg_sys-lv_test: retaining kernel read ahead of 8192 (requested 8192)
#locking/locking.c:367           Dropping cache for vg_sys.
#misc/lvm-flock.c:70          Unlocking /run/lock/lvm/V_vg_sys
#misc/lvm-flock.c:47            _undo_flock /run/lock/lvm/V_vg_sys
#metadata/vg.c:89            Freeing VG vg_sys at 0x564bc427cfa0.
#metadata/vg.c:89            Freeing VG vg_sys at 0x564bc426ef60.
#cache/lvmcache.c:2539          Dropping VG info
#cache/lvmcache.c:755           lvmcache has no info for vgname "#orphans_lvm1" with VGID #orphans_lvm1.
#cache/lvmcache.c:755           lvmcache has no info for vgname "#orphans_lvm1".
#cache/lvmcache.c:2086          lvmcache: Initialised VG #orphans_lvm1.
#cache/lvmcache.c:755           lvmcache has no info for vgname "#orphans_pool" with VGID #orphans_pool.
#cache/lvmcache.c:755           lvmcache has no info for vgname "#orphans_pool".
#cache/lvmcache.c:2086          lvmcache: Initialised VG #orphans_pool.
#cache/lvmcache.c:755           lvmcache has no info for vgname "#orphans_lvm2" with VGID #orphans_lvm2.
#cache/lvmcache.c:755           lvmcache has no info for vgname "#orphans_lvm2".
#cache/lvmcache.c:2086          lvmcache: Initialised VG #orphans_lvm2.
#lvmcmdline.c:3050          Completed: lvextend -vvvv -L +1g /dev/vg_sys/lv_test



-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at   
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
