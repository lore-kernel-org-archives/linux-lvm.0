Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 28 Feb 2013 14:59:38 +0100
Message-ID: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854CA38@s02008.neopost.grp>
In-Reply-To: <512F5A51.3000909@redhat.com>
References: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
	<20130227181236.GG1514@agk.fab.redhat.com>
	<0926B8B0C4D4424CAE1FCE69BD50CB2F0854C76E@s02008.neopost.grp>
	<512F5A51.3000909@redhat.com>
From: "MOLLE Thomas" <t.molle@neopost.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] raid1 Failed to activate new LV
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

"lvcreate -vvv --type raid1 -m 1 -L 557G -n lv0 vg0" returns about 2000
rows.
Do you know what I could look?

Kernel : 2.6.39-300.28.1.el6uek.x86_64
# dmsetup targets
raid             v1.0.0
multipath        v1.3.0
mirror           v1.12.1
striped          v1.4.0
linear           v1.1.0
error            v1.0.1

Following some quotes of the lvcreate -vvvv :

Setting dmeventd/snapshot_library to libdevmapper-event-lvm2snapshot.so
Initialised segtype: snapshot
 Setting dmeventd/mirror_library to libdevmapper-event-lvm2mirror.so
Initialised segtype: mirror
dmeventd/raid_library not found in config: defaulting to
libdevmapper-event-lvm2raid.so
Initialised segtype: raid1
dmeventd/raid_library not found in config: defaulting to
libdevmapper-event-lvm2raid.so
Initialised segtype: raid4
...
#lvmcmdline.c:1070         Processing: lvcreate -vvvv --type raid1 -m 1
-L 557G -n lv0 vg0
#lvmcmdline.c:1073         O_DIRECT will be used
...
#libdm-config.c:758       Setting global/mirror_segtype_default to
mirror
...
#filters/filter-composite.c:31         Using /dev/mapper/mpathd
#device/dev-io.c:524         Opened /dev/mapper/mpathd RO O_DIRECT
#device/dev-io.c:137         /dev/mapper/mpathd: block size is 4096
bytes
#label/label.c:156       /dev/mapper/mpathd: lvm2 label detected at
sector 1
#cache/lvmcache.c:1337         lvmcache: /dev/mapper/mpathd: now in VG
#orphans_lvm2 (#orphans_lvm2) with 0 mdas
#format_text/format-text.c:1192         /dev/mapper/mpathd: Found
metadata at 178176 size 955 (in area at 4096 size 1044480) for vg0
(k7hTZD-QXLt-LO34-Fc5P-vk5T-zcOL-2JgZmr)
#cache/lvmcache.c:1337         lvmcache: /dev/mapper/mpathd: now in VG
vg0 with 1 mdas
#cache/lvmcache.c:1114         lvmcache: /dev/mapper/mpathd: setting vg0
VGID to k7hTZDQXLtLO34Fc5Pvk5TzcOL2JgZmr
#cache/lvmcache.c:1374         lvmcache: /dev/mapper/mpathd: VG vg0: Set
creation host to mrs
...
#format_text/archiver.c:131     Archiving volume group "vg0" metadata
(seqno 75).
#metadata/lv_manip.c:3062     Creating logical volume lv0
#metadata/lv_manip.c:2657       Extending segment type, raid1
#metadata/pv_map.c:55         Allowing allocation on /dev/mapper/mpathb
start PE 0 length 142794
#metadata/pv_map.c:55         Allowing allocation on /dev/mapper/mpathd
start PE 0 length 142794
#metadata/lv_manip.c:2072         Trying allocation using contiguous
policy.
#metadata/lv_manip.c:1684         Still need 285186 total extents:
#metadata/lv_manip.c:1687           2 (2 data/0 parity) parallel areas
of 142592 extents each
#metadata/lv_manip.c:1689           2 RAID metadata areas of 1 extents
each
#metadata/lv_manip.c:1378         Considering allocation area 0 as
/dev/mapper/mpathb start PE 0 length 142593 leaving 201.
#metadata/lv_manip.c:1378         Considering allocation area 1 as
/dev/mapper/mpathd start PE 0 length 142593 leaving 201.
#metadata/lv_manip.c:1859         Sorting 2 areas
#metadata/lv_manip.c:1145         Allocating parallel metadata area 0 on
/dev/mapper/mpathb start PE 0 length 1.
#metadata/lv_manip.c:1161         Allocating parallel area 0 on
/dev/mapper/mpathb start PE 1 length 142592.
#metadata/lv_manip.c:1145         Allocating parallel metadata area 1 on
/dev/mapper/mpathd start PE 0 length 1.
#metadata/lv_manip.c:1161         Allocating parallel area 1 on
/dev/mapper/mpathd start PE 1 length 142592.
#metadata/lv_manip.c:3062     Creating logical volume lv0_rimage_0
#metadata/lv_manip.c:455       Stack lv0:0[0] on LV lv0_rimage_0:0
...
#metadata/lv_manip.c:3214         LV lv0_rmeta_0 in VG vg0 is now
visible.
#metadata/lv_manip.c:3214         LV lv0_rmeta_1 in VG vg0 is now
visible.
...
#libdm-deptree.c:1790     Creating vg0-lv0
#ioctl/libdm-iface.c:1687         dm create vg0-lv0
LVM-k7hTZDQXLtLO34Fc5Pvk5TzcOL2JgZmrOeQEzBa3uGtAlpCbyKktcBT9InlochY4 NF
[16384] (*1)
#libdm-deptree.c:2329     Loading vg0-lv0 table (252:8)
#libdm-deptree.c:2273         Adding target to (252:8): 0 1168113664
raid raid1 3 0 region_size 1024 2 252:4 252:5 252:6 252:7
#ioctl/libdm-iface.c:1687         dm table   (252:8) OF   [16384] (*1)
#ioctl/libdm-iface.c:1687         dm reload   (252:8) NF   [16384] (*1)
#ioctl/libdm-iface.c:1705   device-mapper: reload ioctl on  failed:
Invalid argument
#libdm-deptree.c:2425         <backtrace>
#activate/dev_manager.c:2198         <backtrace>
#activate/dev_manager.c:2232         <backtrace>
#activate/activate.c:875         <backtrace>
#activate/activate.c:1849         <backtrace>
#mm/memlock.c:412         Leaving critical section (activated).
#metadata/vg.c:74         Freeing VG vg0 at 0x22197d0.
#activate/activate.c:1881         <backtrace>
#locking/locking.c:396         <backtrace>
#locking/locking.c:466         <backtrace>
#metadata/lv_manip.c:4525   Failed to activate new LV.





On 02/28/2013 10:32 AM, MOLLE Thomas wrote:
> kernel: lvcreate: sending ioctl 1261 to a partition!
> kernel: device-mapper: table: 252:8: raid: Unrecognised raid_type
> kernel: device-mapper: ioctl: error adding target to table

Hi, looking at RHEL6.3 kernel code there must be a corruption or
incompatibility somewhere between command line and kernel and raid1
should definitely be recognized.

Could you first try running the `lvcreate` command with `-vvvv`, please?

I see the lvm2 package is fairly recent. What about kernel? What do
`uname -a` and `dmsetup targets` say?

-- Marian

>
> I do not understand why the type is not recognized
>
>> On Wed, Feb 27, 2013 at 05:45:02PM +0100, MOLLE Thomas wrote:
>> # device-mapper: reload ioctl on failed: Invalid argument # Failed to

>> activate new LV.
>>
>> Look in your kernel message log for a more detailed error message.
>>
>> Alasdair
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
