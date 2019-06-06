From: Heming Zhao <heming.zhao@suse.com>
Date: Thu, 6 Jun 2019 13:30:05 +0000
Message-ID: <c7b1ca31-b1b5-4964-1263-65b97ec3ed8d@suse.com>
References: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
	<662c133e-cebe-1882-a086-edb2219af7f0@redhat.com>
	<4e175852-fd38-2096-a174-046e10af941f@suse.com>
	<8b345d98-abf5-b3f8-50fc-5d86d20fd060@redhat.com>
In-Reply-To: <8b345d98-abf5-b3f8-50fc-5d86d20fd060@redhat.com>
Content-Language: en-US
Content-ID: <9119F33953E2D24D8870D6C001C22EBC@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] confused with lvm2 filter rules
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
Content-Type: text/plain; charset="iso-8859-1"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hello,

the filter is:
filter =3D [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",=20
"r|/dev/fd.*|", "r|/dev/cdrom|", "a/.*/" ]

if filter doesn't contain "a/.*/":
- pvcreate, vgcreate & vgextend use regex filter to reject the disk.=20
(correct logic)

if filter contains "a/.*/":
- regex fileter pass the disk under pvcreate/vgcreate, create successfully.
- regex filter reject the disk under vgextend. (wrong. should create=20
successfuly)
- vgextend should do the same action as pvcreate/vgcreate.

log as below (with filter contain: "a/.*/"):
------------------------
# vgextend -vvvv vgtst /dev/disk/by-id/scsi-360014051ec87260bf98462eb448
0b3b3
#lvmcmdline.c:2814          Parsing: vgextend -vvvv vgtst=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3
#lvmcmdline.c:1868          Recognised command vgextend_general (id 128=20
/ enum 113).
#config/config.c:1480        devices/global_filter not found in config:=20
defaulting to global_filter =3D [ "a|.*/|" ]
#libdm-config.c:1002        global/lvmetad_update_wait_time not found in=20
config: defaulting to 10
#daemon-client.c:33            /run/lvm/lvmetad.socket: Opening daemon=20
socket to lvmetad for protocol lvmetad version 1.
#daemon-client.c:52            Sending daemon lvmetad: hello
#cache/lvmetad.c:141           Successfully connected to lvmetad on fd 3.
#libdm-config.c:1074        global/use_lvmpolld not found in config:=20
defaulting to 1
#filters/filter-sysfs.c:327           Sysfs filter initialised.
#filters/filter-internal.c:77            Internal filter initialised.
#filters/filter-type.c:56            LVM type filter initialised.
#filters/filter-usable.c:183           Usable device filter initialised.
#filters/filter-mpath.c:291           mpath filter initialised.
#filters/filter-partitioned.c:69            Partitioned filter initialised.
#filters/filter-signature.c:84            signature filter initialised.
#filters/filter-md.c:169           MD filter initialised.
#libdm-config.c:1074        devices/fw_raid_component_detection not=20
found in config: defaulting to 0
#filters/filter-composite.c:109           Composite filter initialised.
#config/config.c:1483        Setting devices/filter to filter =3D [=20
"r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|", "r|/dev/fd.*|",=20
"r|/dev/cdrom|", "a/.*/" ]
#filters/filter-regex.c:216           Regex filter initialised.
#filters/filter-usable.c:183           Usable device filter initialised.
#filters/filter-composite.c:109           Composite filter initialised.
#libdm-config.c:975         devices/cache not found in config:=20
defaulting to /etc/lvm/cache/.cache
#filters/filter-persistent.c:415           Persistent filter initialised.
#filters/filter-composite.c:109           Composite filter initialised.
#libdm-config.c:1074        metadata/record_lvs_history not found in=20
config: defaulting to 0
#lvmcmdline.c:2882          DEGRADED MODE. Incomplete RAID LVs will be=20
processed.
#lvmcmdline.c:2888          Processing command: vgextend -vvvv vgtst=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3
#lvmcmdline.c:2889          Command pid: 17557
#lvmcmdline.c:2890          System ID:
#lvmcmdline.c:2893          O_DIRECT will be used
#locking/locking.c:129         File-based locking selected.
#libdm-config.c:1074        global/use_lvmlockd not found in config:=20
defaulting to 0
#cache/lvmetad.c:254           Sending lvmetad get_global_info
#libdm-config.c:1074        metadata/pvmetadataignore not found in=20
config: defaulting to 0
#libdm-config.c:1002        metadata/pvmetadatasize not found in config:=20
defaulting to 255
#libdm-config.c:1002        metadata/pvmetadatacopies not found in=20
config: defaulting to 1
#libdm-config.c:975         report/output_format not found in config:=20
defaulting to basic
#libdm-config.c:1074        log/report_command_log not found in config:=20
defaulting to 0
#cache/lvmcache.c:2535          Dropping VG info
#cache/lvmcache.c:751           lvmcache has no info for vgname=20
"#orphans_lvm2" with VGID #orphans_lvm2.
#cache/lvmcache.c:751           lvmcache has no info for vgname=20
"#orphans_lvm2".
#cache/lvmcache.c:2082          lvmcache: Initialised VG #orphans_lvm2.
#locking/locking.c:331           Dropping cache for #orphans.
#misc/lvm-flock.c:202         Locking /run/lvm/lock/P_orphans WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/P_orphans:aux WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/P_orphans WB
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/P_orphans:aux
#cache/lvmcache.c:751           lvmcache has no info for vgname "#orphans".
#device/dev-cache.c:723           Found dev 8:32=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3 - new.
#device/dev-io.c:609           Opened=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3 RO O_DIRECT
#device/dev-io.c:359=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3: size is 1024000=20
sectors
#device/dev-io.c:658           Closed=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3
#device/dev-io.c:336=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3: using cached=20
size 1024000 sectors
#filters/filter-regex.c:172=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3: Skipping (regex)
#filters/filter-persistent.c:346           filter caching bad=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3
#toollib.c:4451          Processing each PV
#cache/lvmetad.c:1445          Asking lvmetad for complete list of known=20
VG ids/names
#toollib.c:3941          Getting list of all devices
#device/dev-cache.c:1212          Creating list of system devices.
#device/dev-cache.c:723           Found dev 253:0 /dev/vda - new.
#device/dev-cache.c:723           Found dev 253:1 /dev/vda1 - new.
#device/dev-cache.c:763           Found dev 253:1=20
/dev/disk/by-partuuid/000c10c1-01 - new alias.
#device/dev-cache.c:763           Found dev 253:1=20
/dev/disk/by-uuid/060ece02-7ac0-49bd-88cf-2853fe388671 - new alias.
#device/dev-cache.c:723           Found dev 253:2 /dev/vda2 - new.
#device/dev-cache.c:763           Found dev 253:2=20
/dev/disk/by-partuuid/000c10c1-02 - new alias.
#device/dev-cache.c:763           Found dev 253:2=20
/dev/disk/by-uuid/f545996e-247f-4778-ab81-7c7b6140d23a - new alias.
#device/dev-cache.c:763           Found dev 253:2 /dev/root - new alias.
#device/dev-cache.c:723           Found dev 8:0 /dev/sda - new.
#device/dev-cache.c:763           Found dev 8:0=20
/dev/disk/by-id/lvm-pv-uuid-2n9LLa-sWow-ZYA3-jiRX-5yfc-ghcq-119083 - new=20
alias.
#device/dev-cache.c:763           Found dev 8:0=20
/dev/disk/by-id/scsi-1LIO-ORG_FILEIO:78c8c971-44e0-4791-aa89-97ad40cb48d1=20
- new alias.
#device/dev-cache.c:763           Found dev 8:0=20
/dev/disk/by-id/scsi-3600140578c8c97144e04791aa8997ad4 - new alias.
#device/dev-cache.c:763           Found dev 8:0=20
/dev/disk/by-id/scsi-SLIO-ORG_FILEIO_78c8c971-44e0-4791-aa89-97ad40cb48d1=20
- new alias.
#device/dev-cache.c:763           Found dev 8:0=20
/dev/disk/by-id/wwn-0x600140578c8c97144e04791aa8997ad4 - new alias.
#device/dev-cache.c:763           Found dev 8:0=20
/dev/disk/by-path/ip-10.67.17.201:3260-iscsi-iqn.2019-06.com.example:iscsi-=
500m-disk01-lun-0=20
- new alias.
#device/dev-cache.c:723           Found dev 8:16 /dev/sdb - new.
#device/dev-cache.c:763           Found dev 8:16=20
/dev/disk/by-id/lvm-pv-uuid-FQqmv2-8mTk-5r4r-cwvn-8HJ1-GDBH-svklEf - new=20
alias.
#device/dev-cache.c:763           Found dev 8:16=20
/dev/disk/by-id/scsi-1LIO-ORG_FILEIO:a7ec3a1e-70d4-4a47-b16d-2e404f27b30c=20
- new alias.
#device/dev-cache.c:763           Found dev 8:16=20
/dev/disk/by-id/scsi-36001405a7ec3a1e70d44a47b16d2e404 - new alias.
#device/dev-cache.c:763           Found dev 8:16=20
/dev/disk/by-id/scsi-SLIO-ORG_FILEIO_a7ec3a1e-70d4-4a47-b16d-2e404f27b30c=20
- new alias.
#device/dev-cache.c:763           Found dev 8:16=20
/dev/disk/by-id/wwn-0x6001405a7ec3a1e70d44a47b16d2e404 - new alias.
#device/dev-cache.c:763           Found dev 8:16=20
/dev/disk/by-path/ip-10.67.17.201:3260-iscsi-iqn.2019-06.com.example:iscsi-=
500m-disk02-lun-0=20
- new alias.
#device/dev-cache.c:763           Found dev 8:32 /dev/sdc - new alias.
#device/dev-cache.c:763           Found dev 8:32=20
/dev/disk/by-id/scsi-1LIO-ORG_FILEIO:1ec87260-bf98-462e-b448-0b3b32f1e1c4=20
- new alias.
#device/dev-cache.c:714           Found dev 8:32=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3 - exists.
#device/dev-cache.c:763           Found dev 8:32=20
/dev/disk/by-id/scsi-SLIO-ORG_FILEIO_1ec87260-bf98-462e-b448-0b3b32f1e1c4=20
- new alias.
#device/dev-cache.c:763           Found dev 8:32=20
/dev/disk/by-id/wwn-0x60014051ec87260bf98462eb4480b3b3 - new alias.
#device/dev-cache.c:763           Found dev 8:32=20
/dev/disk/by-path/ip-10.67.17.201:3260-iscsi-iqn.2019-06.com.example:iscsi-=
500m-disk03-lun-0=20
- new alias.
#cache/lvmetad.c:1420          Asking lvmetad for complete list of known PVs
#filters/filter-persistent.c:346           filter caching good /dev/sdb
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgtst"=20
with VGID PFEUFqY9UO1SFYoNiIgPEk90ThVmDDx0.
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgtst".
#cache/lvmcache.c:2080          lvmcache /dev/sdb: now in VG vgtst with=20
0 mda(s).
#cache/lvmcache.c:1906          lvmcache /dev/sdb: VG vgtst: set VGID to=20
PFEUFqY9UO1SFYoNiIgPEk90ThVmDDx0.
#filters/filter-persistent.c:346           filter caching good /dev/sda
#cache/lvmcache.c:2080          lvmcache /dev/sda: now in VG vgtst=20
(PFEUFqY9UO1SFYoNiIgPEk90ThVmDDx0) with 0 mda(s).
#device/dev-io.c:609           Opened /dev/sda RO O_DIRECT
#device/dev-io.c:359         /dev/sda: size is 1024000 sectors
#device/dev-io.c:658           Closed /dev/sda
#device/dev-io.c:336         /dev/sda: using cached size 1024000 sectors
#filters/filter-persistent.c:312           /dev/sda: filter cache using=20
(cached good)
#device/dev-io.c:609           Opened /dev/vda RO O_DIRECT
#device/dev-io.c:359         /dev/vda: size is 83886080 sectors
#device/dev-io.c:658           Closed /dev/vda
#filters/filter-partitioned.c:37            /dev/vda: Skipping:=20
Partition table signature found
#device/dev-io.c:609           Opened /dev/vda1 RO O_DIRECT
#device/dev-io.c:359         /dev/vda1: size is 3002368 sectors
#device/dev-io.c:658           Closed /dev/vda1
#device/dev-io.c:336         /dev/vda1: using cached size 3002368 sectors
#filters/filter-persistent.c:346           filter caching good /dev/vda1
#device/dev-io.c:609           Opened /dev/root RO O_DIRECT
#device/dev-io.c:359         /dev/root: size is 80881664 sectors
#device/dev-io.c:658           Closed /dev/root
#device/dev-io.c:336         /dev/root: using cached size 80881664 sectors
#filters/filter-persistent.c:346           filter caching good /dev/root
#device/dev-io.c:609           Opened /dev/sdb RO O_DIRECT
#device/dev-io.c:359         /dev/sdb: size is 1024000 sectors
#device/dev-io.c:658           Closed /dev/sdb
#device/dev-io.c:336         /dev/sdb: using cached size 1024000 sectors
#filters/filter-persistent.c:312           /dev/sdb: filter cache using=20
(cached good)
#device/dev-io.c:336         /dev/sdc: using cached size 1024000 sectors
#device/dev-io.c:336         /dev/sdc: using cached size 1024000 sectors
#filters/filter-persistent.c:346           filter caching good /dev/sdc
#toollib.c:4377          Processing PVs in VG vgtst
#locking/locking.c:331           Dropping cache for vgtst.
#misc/lvm-flock.c:202         Locking /run/lvm/lock/V_vgtst RB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/V_vgtst:aux WB
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/V_vgtst:aux
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/V_vgtst RB
#metadata/metadata.c:3778        Reading VG vgtst=20
PFEUFq-Y9UO-1SFY-oNiI-gPEk-90Th-VmDDx0
#cache/lvmetad.c:983           Asking lvmetad for VG=20
PFEUFq-Y9UO-1SFY-oNiI-gPEk-90Th-VmDDx0 vgtst
#filters/filter-persistent.c:312           /dev/sdb: filter cache using=20
(cached good)
#cache/lvmcache.c:2080          lvmcache /dev/sdb: now in VG=20
#orphans_lvm2 (#orphans_lvm2) with 1 mda(s).
#filters/filter-persistent.c:312           /dev/sda: filter cache using=20
(cached good)
#cache/lvmcache.c:2080          lvmcache /dev/sda: now in VG=20
#orphans_lvm2 (#orphans_lvm2) with 1 mda(s).
#metadata/vg.c:68            Allocated VG vgtst at 0x55c563bc5980.
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgtst"=20
with VGID PFEUFqY9UO1SFYoNiIgPEk90ThVmDDx0.
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgtst".
#cache/lvmcache.c:2080          lvmcache /dev/sdb: now in VG vgtst with=20
1 mda(s).
#cache/lvmcache.c:1906          lvmcache /dev/sdb: VG vgtst: set VGID to=20
PFEUFqY9UO1SFYoNiIgPEk90ThVmDDx0.
#cache/lvmcache.c:2080          lvmcache /dev/sda: now in VG vgtst=20
(PFEUFqY9UO1SFYoNiIgPEk90ThVmDDx0) with 1 mda(s).
#cache/lvmetad.c:2462          Sending lvmetad vg_clear_outdated_pvs
#device/dev-io.c:336         /dev/sdb: using cached size 1024000 sectors
#device/dev-io.c:336         /dev/sda: using cached size 1024000 sectors
#metadata/pv_manip.c:417           /dev/sdb 0:      0    123: NULL(0:0)
#metadata/pv_manip.c:417           /dev/sda 0:      0    123: NULL(0:0)
#metadata/vg.c:68            Allocated VG vgtst at 0x55c563bb2a90.
#toollib.c:4269        Processing PV /dev/sdb in VG vgtst.
#toollib.c:4269        Processing PV /dev/sda in VG vgtst.
#mm/memlock.c:594           Unlock: Memlock counters: prioritized:0=20
locked:0 critical:0 daemon:0 suspended:0
#activate/fs.c:491           Syncing device names
#locking/locking.c:331           Dropping cache for vgtst.
#misc/lvm-flock.c:70          Unlocking /run/lvm/lock/V_vgtst
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/V_vgtst
#metadata/vg.c:83            Freeing VG vgtst at 0x55c563bb2a90.
#metadata/vg.c:83            Freeing VG vgtst at 0x55c563bc5980.
#toollib.c:4377          Processing PVs in VG #orphans_lvm2
#metadata/metadata.c:5495        Locking #orphans_lvm2 already done
#metadata/metadata.c:3764        Reading VG #orphans_lvm2
#locking/locking.c:331           Dropping cache for #orphans.
#misc/lvm-flock.c:70          Unlocking /run/lvm/lock/P_orphans
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/P_orphans
#cache/lvmcache.c:751           lvmcache has no info for vgname "#orphans".
#locking/locking.c:331           Dropping cache for #orphans.
#misc/lvm-flock.c:202         Locking /run/lvm/lock/P_orphans WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/P_orphans:aux WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/P_orphans WB
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/P_orphans:aux
#cache/lvmcache.c:751           lvmcache has no info for vgname "#orphans".
#metadata/metadata.c:3764        Reading VG #orphans_lvm2
#toollib.c:4056          Processing devices that are not PVs
#toollib.c:4072        Processing device /dev/vda1.
#toollib.c:4072        Processing device /dev/root.
#toollib.c:4072        Processing device /dev/sdc.
#toollib.c:5539    Device=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3 excluded by a filter.
#toollib.c:5545          <backtrace>
#locking/locking.c:331           Dropping cache for #orphans.
#misc/lvm-flock.c:70          Unlocking /run/lvm/lock/P_orphans
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/P_orphans
#cache/lvmcache.c:751           lvmcache has no info for vgname "#orphans".
#vgextend.c:177           <backtrace>
#libdm-config.c:1074        global/notify_dbus not found in config:=20
defaulting to 1
#cache/lvmcache.c:2535          Dropping VG info
#cache/lvmcache.c:751           lvmcache has no info for vgname=20
"#orphans_lvm2" with VGID #orphans_lvm2.
#cache/lvmcache.c:751           lvmcache has no info for vgname=20
"#orphans_lvm2".
#cache/lvmcache.c:2082          lvmcache: Initialised VG #orphans_lvm2.
#lvmcmdline.c:3028          Completed: vgextend -vvvv vgtst=20
/dev/disk/by-id/scsi-360014051ec87260bf98462eb4480b3b3

On 6/6/19 4:43 PM, Zdenek Kabelac wrote:
> Dne 06. 06. 19 v 10:16 Heming Zhao napsal(a):
>> Hello,
>>
>> BTW,
>> Only vgextend doesn't work, which must be a bug. It looks the filter
>> handling codes have bug.
>>
>=20
> Hi
>=20
> Please provide full 'vgextend -vvvv' trace=EF=BF=BD with some explanation=
 of=20
> what you believe is a bug in handling code.
>=20
>=20
> Regards
>=20
>=20
> Zdenek
>=20
