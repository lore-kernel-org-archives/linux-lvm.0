Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id i6U3dFX20314
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 23:39:15 -0400
Received: from ms-smtp-03-eri0.southeast.rr.com
	(ms-smtp-03-lbl.southeast.rr.com [24.25.9.102] (may be forged))
	by mx2.redhat.com (8.12.10/8.12.10) with SMTP id i6U2U7fu027302
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 22:30:08 -0400
Received: from ZACK2 (rdu163-116-062.nc.rr.com [24.163.116.62])
	by ms-smtp-03-eri0.southeast.rr.com (8.12.10/8.12.7) with ESMTP id
	i6U34UiB008418
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 23:04:38 -0400 (EDT)
Message-ID: <005501c475e1$feb8ecc0$6b02a8c0@ZACK2>
From: "Zachary Hamm" <zhamm@nc.rr.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
	<20040722153408.GG10840@tykepenguin.com>
	<001001c47021$9accc800$6b02a8c0@ZACK2>
	<20040723065607.GB9681@tykepenguin.com>
	<003701c47363$bb61ec90$6b02a8c0@ZACK2>
	<20040727071817.GA14648@tykepenguin.com>
	<001e01c47432$0ec64c40$6b02a8c0@ZACK2>
	<20040728053947.GD30520@percy.comedia.it>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Date: Thu, 29 Jul 2004 23:04:50 -0400
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0052_01C475C0.737FEA30"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0052_01C475C0.737FEA30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Attached is the lvm2.log file with debug at setting 6 (setting to level 7
created a 7M file!)
The drives are Three 36G SCSI drives, setup as a RAID1 mirror with hot
spare.

/etc/raidtab:
----------------------------------------------------
raiddev             /dev/md1
raid-level                  1
nr-raid-disks               2
chunk-size                  256
persistent-superblock       1
nr-spare-disks              1
    device          /dev/sda3
    raid-disk     0
    device          /dev/sdb3
    raid-disk     1
    device          /dev/sdc3
    spare-disk     0
raiddev             /dev/md0
raid-level                  1
nr-raid-disks               2
chunk-size                  256
persistent-superblock       1
nr-spare-disks              1
    device          /dev/sda1
    raid-disk     0
    device          /dev/sdb1
    raid-disk     1
    device          /dev/sdc1
    spare-disk     0



----- Original Message ----- 
From: "Luca Berra" <bluca@comedia.it>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Wednesday, July 28, 2004 1:39 AM
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2


> On Tue, Jul 27, 2004 at 07:33:00PM -0400, Zachary Hamm wrote:
> >Anything else I should be posting?  BTW, are you here in Raleigh?
> please edit lvm.conf so that it produces a full debug and post that.
> besides how big are your drives?
>
> L.
>
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_NextPart_000_0052_01C475C0.737FEA30
Content-Type: application/octet-stream;
	name="lvm2.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm2.log"

config/config.c:800   log/activation not found in config: defaulting to =
0
commands/toolcontext.c:139   Logging initialised at Thu Jul 29 22:53:59 =
2004

config/config.c:795   Setting global/umask to 63
commands/toolcontext.c:158   Set umask to 0077
config/config.c:780   Setting devices/dir to /dev
config/config.c:780   Setting global/proc to /proc
config/config.c:795   Setting global/activation to 1
config/config.c:800   global/suffix not found in config: defaulting to 1
config/config.c:786   global/units not found in config: defaulting to h
config/config.c:780   Setting devices/cache to /etc/lvm/.cache
config/config.c:795   Setting devices/write_cache_state to 1
config/config.c:795   Setting activation/reserved_stack to 256
config/config.c:795   Setting activation/reserved_memory to 8192
config/config.c:795   Setting activation/process_priority to -18
config/config.c:786   global/format not found in config: defaulting to =
lvm2
commands/toolcontext.c:537   No tags defined in config file
config/config.c:795   Setting backup/retain_days to 30
config/config.c:795   Setting backup/retain_min to 10
config/config.c:780   Setting backup/archive_dir to /etc/lvm/archive
config/config.c:780   Setting backup/backup_dir to /etc/lvm/backup
config/config.c:800   global/fallback_to_lvm1 not found in config: =
defaulting to 1
config/config.c:795 pvscan  Setting global/locking_type to 1
config/config.c:780 pvscan  Setting global/locking_dir to /var/lock/lvm
locking/locking.c:137 pvscan  File-based locking enabled.
pvscan.c:127 pvscan  Wiping cache of LVM-capable devices
pvscan.c:130 pvscan  Wiping internal cache
pvscan.c:133 pvscan  Walking through all physical volumes
device/dev-io.c:220 pvscan  Getting size of /dev/sda
label/label.c:183 pvscan  /dev/sda: No label detected
device/dev-io.c:220 pvscan  Getting size of /dev/md0
label/label.c:183 pvscan  /dev/md0: No label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sda1
device/dev-io.c:220 pvscan  Getting size of /dev/md1
label/label.c:165 pvscan  /dev/md1: lvm2 label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sda2
label/label.c:183 pvscan  /dev/sda2: No label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sda3
device/dev-io.c:220 pvscan  Getting size of /dev/sdb
label/label.c:165 pvscan  /dev/sdb: lvm1 label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sdb1
device/dev-io.c:220 pvscan  Getting size of /dev/sdb2
label/label.c:183 pvscan  /dev/sdb2: No label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sdb3
device/dev-io.c:220 pvscan  Getting size of /dev/sdc
label/label.c:165 pvscan  /dev/sdc: lvm1 label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sdc1
device/dev-io.c:220 pvscan  Getting size of /dev/sdc2
label/label.c:183 pvscan  /dev/sdc2: No label detected
device/dev-io.c:220 pvscan  Getting size of /dev/sdc3
device/dev-io.c:79 pvscan  Read size too large: 3191341056
format1/disk-rep.c:364 pvscan  Failed to read extents from /dev/sdb
format1/disk-rep.c:152 pvscan  /dev/sda does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 pvscan  /dev/md0 does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 pvscan  /dev/md1 does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 pvscan  /dev/sda2 does not have a valid LVM1 PV =
identifier
device/dev-io.c:79 pvscan  Read size too large: 3191341056
format1/disk-rep.c:364 pvscan  Failed to read extents from /dev/sdb
format1/disk-rep.c:152 pvscan  /dev/sdb2 does not have a valid LVM1 PV =
identifier
device/dev-io.c:79 pvscan  Read size too large: 3191341056
format1/disk-rep.c:364 pvscan  Failed to read extents from /dev/sdc
format1/disk-rep.c:152 pvscan  /dev/sdc2 does not have a valid LVM1 PV =
identifier
label/label.c:165 pvscan  /dev/md1: lvm2 label detected
pvscan.c:97 pvscan  PV /dev/md1   VG rootvg   lvm2 [32.81 GB / 8.00 MB =
free]
pvscan.c:195 pvscan  Total: 1 [32.81 GB] / in use: 1 [32.81 GB] / in no =
VG: 0 [0   ]
filters/filter-persistent.c:179 pvscan  Dumping persistent device cache =
to
/etc/lvm/.cache
config/config.c:800   log/activation not found in config: defaulting to =
0
commands/toolcontext.c:139   Logging initialised at Thu Jul 29 22:54:02 =
2004

config/config.c:795   Setting global/umask to 63
commands/toolcontext.c:158   Set umask to 0077
config/config.c:780   Setting devices/dir to /dev
config/config.c:780   Setting global/proc to /proc
config/config.c:795   Setting global/activation to 1
config/config.c:800   global/suffix not found in config: defaulting to 1
config/config.c:786   global/units not found in config: defaulting to h
config/config.c:780   Setting devices/cache to /etc/lvm/.cache
config/config.c:795   Setting devices/write_cache_state to 1
filters/filter-persistent.c:125   Loaded persistent filter cache from =
/etc/lvm/.cache
config/config.c:795   Setting activation/reserved_stack to 256
config/config.c:795   Setting activation/reserved_memory to 8192
config/config.c:795   Setting activation/process_priority to -18
config/config.c:786   global/format not found in config: defaulting to =
lvm2
commands/toolcontext.c:537   No tags defined in config file
config/config.c:795   Setting backup/retain_days to 30
config/config.c:795   Setting backup/retain_min to 10
config/config.c:780   Setting backup/archive_dir to /etc/lvm/archive
config/config.c:780   Setting backup/backup_dir to /etc/lvm/backup
config/config.c:800   global/fallback_to_lvm1 not found in config: =
defaulting to 1
config/config.c:795 vgscan  Setting global/locking_type to 1
config/config.c:780 vgscan  Setting global/locking_dir to /var/lock/lvm
locking/locking.c:137 vgscan  File-based locking enabled.
vgscan.c:51 vgscan  Wiping cache of LVM-capable devices
vgscan.c:54 vgscan  Wiping internal cache
vgscan.c:57 vgscan  Reading all physical volumes.  This may take a =
while...
toollib.c:414 vgscan  Finding all volume groups
device/dev-io.c:220 vgscan  Getting size of /dev/sda
label/label.c:183 vgscan  /dev/sda: No label detected
device/dev-io.c:220 vgscan  Getting size of /dev/md0
label/label.c:183 vgscan  /dev/md0: No label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sda1
device/dev-io.c:220 vgscan  Getting size of /dev/md1
label/label.c:165 vgscan  /dev/md1: lvm2 label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sda2
label/label.c:183 vgscan  /dev/sda2: No label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sda3
device/dev-io.c:220 vgscan  Getting size of /dev/sdb
label/label.c:165 vgscan  /dev/sdb: lvm1 label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sdb1
device/dev-io.c:220 vgscan  Getting size of /dev/sdb2
label/label.c:183 vgscan  /dev/sdb2: No label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sdb3
device/dev-io.c:220 vgscan  Getting size of /dev/sdc
label/label.c:165 vgscan  /dev/sdc: lvm1 label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sdc1
device/dev-io.c:220 vgscan  Getting size of /dev/sdc2
label/label.c:183 vgscan  /dev/sdc2: No label detected
device/dev-io.c:220 vgscan  Getting size of /dev/sdc3
locking/file_locking.c:162 vgscan  Locking /var/lock/lvm/V_vg00 RB
toollib.c:330 vgscan  Finding volume group "vg00"
device/dev-io.c:79 vgscan  Read size too large: 3191341056
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdb
format1/disk-rep.c:152 vgscan  /dev/sda does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 vgscan  /dev/md0 does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 vgscan  /dev/md1 does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 vgscan  /dev/sda2 does not have a valid LVM1 PV =
identifier
device/dev-io.c:79 vgscan  Read size too large: 3191341056
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdb
format1/disk-rep.c:152 vgscan  /dev/sdb2 does not have a valid LVM1 PV =
identifier
device/dev-io.c:79 vgscan  Read size too large: 3191341056
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdc
format1/disk-rep.c:152 vgscan  /dev/sdc2 does not have a valid LVM1 PV =
identifier
vgscan.c:22 vgscan  Volume group "vg00" not found
locking/file_locking.c:59 vgscan  Unlocking /var/lock/lvm/V_vg00
locking/file_locking.c:162 vgscan  Locking /var/lock/lvm/V_rootvg RB
toollib.c:330 vgscan  Finding volume group "rootvg"
label/label.c:165 vgscan  /dev/md1: lvm2 label detected
vgscan.c:37 vgscan  Found volume group "rootvg" using metadata type lvm2
locking/file_locking.c:59 vgscan  Unlocking /var/lock/lvm/V_rootvg
filters/filter-persistent.c:179 vgscan  Dumping persistent device cache =
to
/etc/lvm/.cache
config/config.c:800   log/activation not found in config: defaulting to =
0
commands/toolcontext.c:139   Logging initialised at Thu Jul 29 22:54:10 =
2004

config/config.c:795   Setting global/umask to 63
commands/toolcontext.c:158   Set umask to 0077
config/config.c:780   Setting devices/dir to /dev
config/config.c:780   Setting global/proc to /proc
config/config.c:795   Setting global/activation to 1
config/config.c:800   global/suffix not found in config: defaulting to 1
config/config.c:786   global/units not found in config: defaulting to h
config/config.c:780   Setting devices/cache to /etc/lvm/.cache
config/config.c:795   Setting devices/write_cache_state to 1
filters/filter-persistent.c:125   Loaded persistent filter cache from =
/etc/lvm/.cache
config/config.c:795   Setting activation/reserved_stack to 256
config/config.c:795   Setting activation/reserved_memory to 8192
config/config.c:795   Setting activation/process_priority to -18
config/config.c:786   global/format not found in config: defaulting to =
lvm2
commands/toolcontext.c:537   No tags defined in config file
config/config.c:795   Setting backup/retain_days to 30
config/config.c:795   Setting backup/retain_min to 10
config/config.c:780   Setting backup/archive_dir to /etc/lvm/archive
config/config.c:780   Setting backup/backup_dir to /etc/lvm/backup
config/config.c:800   global/fallback_to_lvm1 not found in config: =
defaulting to 1
config/config.c:795 lvscan  Setting global/locking_type to 1
config/config.c:780 lvscan  Setting global/locking_dir to /var/lock/lvm
locking/locking.c:137 lvscan  File-based locking enabled.
toollib.c:223 lvscan  Finding all logical volumes
label/label.c:183 lvscan  /dev/sda: No label detected
label/label.c:183 lvscan  /dev/md0: No label detected
label/label.c:165 lvscan  /dev/md1: lvm2 label detected
label/label.c:183 lvscan  /dev/sda2: No label detected
label/label.c:165 lvscan  /dev/sdb: lvm1 label detected
label/label.c:183 lvscan  /dev/sdb2: No label detected
label/label.c:165 lvscan  /dev/sdc: lvm1 label detected
label/label.c:183 lvscan  /dev/sdc2: No label detected
locking/file_locking.c:162 lvscan  Locking /var/lock/lvm/V_vg00 RB
device/dev-io.c:79 lvscan  Read size too large: 3191341056
format1/disk-rep.c:364 lvscan  Failed to read extents from /dev/sdb
format1/disk-rep.c:152 lvscan  /dev/sda does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 lvscan  /dev/md0 does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 lvscan  /dev/md1 does not have a valid LVM1 PV =
identifier
format1/disk-rep.c:152 lvscan  /dev/sda2 does not have a valid LVM1 PV =
identifier
device/dev-io.c:79 lvscan  Read size too large: 3191341056
format1/disk-rep.c:364 lvscan  Failed to read extents from /dev/sdb
format1/disk-rep.c:152 lvscan  /dev/sdb2 does not have a valid LVM1 PV =
identifier
device/dev-io.c:79 lvscan  Read size too large: 3191341056
format1/disk-rep.c:364 lvscan  Failed to read extents from /dev/sdc
format1/disk-rep.c:152 lvscan  /dev/sdc2 does not have a valid LVM1 PV =
identifier
locking/file_locking.c:59 lvscan  Unlocking /var/lock/lvm/V_vg00
toollib.c:247 lvscan  Volume group "vg00" not found
locking/file_locking.c:162 lvscan  Locking /var/lock/lvm/V_rootvg RB
label/label.c:165 lvscan  /dev/md1: lvm2 label detected
config/config.c:780 lvscan  Setting activation/missing_stripe_filler to =
/dev/ioerror
config/config.c:795 lvscan  Setting activation/mirror_region_size to 512
lvscan.c:43 lvscan  ACTIVE            '/dev/rootvg/LogVol00' [32.80 GB] =
next free
(default)
locking/file_locking.c:59 lvscan  Unlocking /var/lock/lvm/V_rootvg
filters/filter-persistent.c:179 lvscan  Dumping persistent device cache =
to
/etc/lvm/.cache

=20

------=_NextPart_000_0052_01C475C0.737FEA30--
