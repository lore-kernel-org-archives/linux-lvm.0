From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>, <874n4w5q0y.fsf@red.mvo.lan>,
	<52E1000A.3060000@redhat.com>
In-reply-to: <52E1000A.3060000@redhat.com>
Date: Thu, 23 Jan 2014 14:35:53 +0200
Message-ID: <87y5265106.fsf@red.mvo.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--=-=-=
Content-Type: text/plain

Peter Rajnoha <prajnoha@redhat.com> writes:

> On 01/22/2014 10:23 AM, Marius Vollmer wrote:
>
>> Is it guaranteed (modulo bugs) that the DM_UDEV_DISABLE_*_RULES flags
>> are only ever removed from a node, and are never added to it over it's
>> lifetime between add/remove events?
>
> No, we don't have this restriction generally

Ok.

>> This isn't true right now, and UDisks fails to handle it correctly
>> when a flag is added in a "change" event.  I am asking to figure out
>> where the fix should go.
>
> Well, udisks should always check the DM_UDEV_DISABLE_OTHER_RULES_FLAG
> and if it's set, skip its processing. It already has:
>
> # honor the flag that device-mapper sets if the device should be ignored
> ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="udisks_end"
>
> ..in 80-udisks.rules. So it should be already following this.

That's from UDisks 1, I am concerned with UDisks2, which is a quite
different beast, I think.  Sorry for not making this clear.

The problem with UDisks2, as I see it, is that it ignores a "change" or
"add" event that has DM_UDEV_DISABLE_OTHER_RULES_FLAG set, while I think
it should treat it as a "remove" event.

I have proposed this patch:

    https://bugs.freedesktop.org/attachment.cgi?id=92577&action=edit

> Hmm, could you please send the whole log.

Sure, attached.


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=udev.log

Commands:

# udevadm monitor --property >udev.log
# vgcreate TEST /dev/vdb
# lvcreate TEST --thinpool pool -L 80

dm-0 shows the on/off behavior of DM_UDEV_DISABLE_OTHER_RULES_FLAG.

udev.log:

monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[6095.449586] change   /devices/pci0000:00/0000:00:08.0/virtio4/block/vdb (block)
ACTION=change
DEVNAME=/dev/vdb
DEVPATH=/devices/pci0000:00/0000:00:08.0/virtio4/block/vdb
DEVTYPE=disk
MAJOR=252
MINOR=16
SEQNUM=1777
SUBSYSTEM=block

UDEV  [6095.452889] change   /devices/pci0000:00/0000:00:08.0/virtio4/block/vdb (block)
ACTION=change
DEVLINKS=/dev/disk/by-id/virtio-DISK1
DEVNAME=/dev/vdb
DEVPATH=/devices/pci0000:00/0000:00:08.0/virtio4/block/vdb
DEVTYPE=disk
ID_FS_TYPE=LVM2_member
ID_FS_USAGE=raid
ID_FS_UUID=9KHyXO-0PPn-FdBI-vfez-Jh0p-mIDH-QH0cKF
ID_FS_UUID_ENC=9KHyXO-0PPn-FdBI-vfez-Jh0p-mIDH-QH0cKF
ID_FS_VERSION=LVM2 001
ID_SERIAL=DISK1
MAJOR=252
MINOR=16
SEQNUM=1777
SUBSYSTEM=block
TAGS=:systemd:
USEC_INITIALIZED=158

KERNEL[6104.251840] add      /devices/virtual/bdi/253:0 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:0
SEQNUM=1778
SUBSYSTEM=bdi

UDEV  [6104.260883] add      /devices/virtual/bdi/253:0 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:0
SEQNUM=1778
SUBSYSTEM=bdi
USEC_INITIALIZED=4251905

KERNEL[6104.261080] add      /devices/virtual/block/dm-0 (block)
ACTION=add
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
MAJOR=253
MINOR=0
SEQNUM=1779
SUBSYSTEM=block

UDEV  [6104.261463] add      /devices/virtual/block/dm-0 (block)
ACTION=add
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
MAJOR=253
MINOR=0
SEQNUM=1779
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=61143

KERNEL[6104.263059] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_COOKIE=23864838
MAJOR=253
MINOR=0
SEQNUM=1780
SUBSYSTEM=block

UDEV  [6104.283773] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVLINKS=/dev/TEST/lvol0 /dev/mapper/TEST-lvol0
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=23864838
DM_DISABLE_OTHER_RULES_FLAG_OLD=1
DM_LV_NAME=lvol0
DM_NAME=TEST-lvol0
DM_NOSCAN=1
DM_SUBSYSTEM_UDEV_FLAG0=1
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaNIz2qBZF5sitQdzJo4fYEFIhP4zBO0I2
DM_VG_NAME=TEST
MAJOR=253
MINOR=0
SEQNUM=1780
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=61143

KERNEL[6104.365107] remove   /devices/virtual/block/dm-0 (block)
ACTION=remove
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_COOKIE=6310363
MAJOR=253
MINOR=0
SEQNUM=1781
SUBSYSTEM=block

KERNEL[6104.369168] remove   /devices/virtual/bdi/253:0 (bdi)
ACTION=remove
DEVPATH=/devices/virtual/bdi/253:0
SEQNUM=1782
SUBSYSTEM=bdi

KERNEL[6104.369237] remove   /devices/virtual/block/dm-0 (block)
ACTION=remove
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
MAJOR=253
MINOR=0
SEQNUM=1783
SUBSYSTEM=block

UDEV  [6104.370315] remove   /devices/virtual/block/dm-0 (block)
ACTION=remove
DEVLINKS=/dev/TEST/lvol0 /dev/mapper/TEST-lvol0
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=6310363
DM_DISABLE_OTHER_RULES_FLAG_OLD=1
DM_LV_NAME=lvol0
DM_NAME=TEST-lvol0
DM_NOSCAN=1
DM_SUBSYSTEM_UDEV_FLAG0=1
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaNIz2qBZF5sitQdzJo4fYEFIhP4zBO0I2
DM_VG_NAME=TEST
MAJOR=253
MINOR=0
SEQNUM=1781
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=61143

UDEV  [6104.370646] remove   /devices/virtual/block/dm-0 (block)
ACTION=remove
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
MAJOR=253
MINOR=0
SEQNUM=1783
SUBSYSTEM=block
USEC_INITIALIZED=70205

UDEV  [6104.371339] remove   /devices/virtual/bdi/253:0 (bdi)
ACTION=remove
DEVPATH=/devices/virtual/bdi/253:0
SEQNUM=1782
SUBSYSTEM=bdi
USEC_INITIALIZED=4370054

KERNEL[6104.378571] add      /devices/virtual/bdi/253:0 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:0
SEQNUM=1784
SUBSYSTEM=bdi

UDEV  [6104.378888] add      /devices/virtual/bdi/253:0 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:0
SEQNUM=1784
SUBSYSTEM=bdi
USEC_INITIALIZED=78610

KERNEL[6104.378953] add      /devices/virtual/block/dm-0 (block)
ACTION=add
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
MAJOR=253
MINOR=0
SEQNUM=1785
SUBSYSTEM=block

UDEV  [6104.379369] add      /devices/virtual/block/dm-0 (block)
ACTION=add
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
MAJOR=253
MINOR=0
SEQNUM=1785
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=78978

KERNEL[6104.381042] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_COOKIE=6310363
MAJOR=253
MINOR=0
SEQNUM=1786
SUBSYSTEM=block

KERNEL[6104.523082] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
MAJOR=253
MINOR=0
SEQNUM=1787
SUBSYSTEM=block

UDEV  [6104.523385] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVLINKS=/dev/TEST/pool /dev/disk/by-id/dm-name-TEST-pool /dev/disk/by-id/dm-uuid-LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0 /dev/mapper/TEST-pool
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=6310363
DM_LV_NAME=pool
DM_NAME=TEST-pool
DM_SUSPENDED=0
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0
DM_VG_NAME=TEST
MAJOR=253
MINOR=0
SEQNUM=1786
SUBSYSTEM=block
TAGS=:systemd:
USEC_INITIALIZED=78978

UDEV  [6104.566730] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVLINKS=/dev/TEST/pool /dev/disk/by-id/dm-name-TEST-pool /dev/disk/by-id/dm-uuid-LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0 /dev/mapper/TEST-pool
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_LV_NAME=pool
DM_NAME=TEST-pool
DM_SUSPENDED=0
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0
DM_VG_NAME=TEST
MAJOR=253
MINOR=0
SEQNUM=1787
SUBSYSTEM=block
TAGS=:systemd:
USEC_INITIALIZED=78978

KERNEL[6104.619221] add      /devices/virtual/bdi/253:1 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:1
SEQNUM=1788
SUBSYSTEM=bdi

KERNEL[6104.619342] add      /devices/virtual/block/dm-1 (block)
ACTION=add
DEVNAME=/dev/dm-1
DEVPATH=/devices/virtual/block/dm-1
DEVTYPE=disk
MAJOR=253
MINOR=1
SEQNUM=1789
SUBSYSTEM=block

UDEV  [6104.619799] add      /devices/virtual/block/dm-1 (block)
ACTION=add
DEVNAME=/dev/dm-1
DEVPATH=/devices/virtual/block/dm-1
DEVTYPE=disk
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
MAJOR=253
MINOR=1
SEQNUM=1789
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=19489

UDEV  [6104.620062] add      /devices/virtual/bdi/253:1 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:1
SEQNUM=1788
SUBSYSTEM=bdi
USEC_INITIALIZED=19373

KERNEL[6104.620413] change   /devices/virtual/block/dm-1 (block)
ACTION=change
DEVNAME=/dev/dm-1
DEVPATH=/devices/virtual/block/dm-1
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=1
SEQNUM=1790
SUBSYSTEM=block

KERNEL[6104.620424] add      /devices/virtual/bdi/253:2 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:2
SEQNUM=1791
SUBSYSTEM=bdi

UDEV  [6104.621979] add      /devices/virtual/bdi/253:2 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:2
SEQNUM=1791
SUBSYSTEM=bdi
USEC_INITIALIZED=20465

KERNEL[6104.622083] add      /devices/virtual/block/dm-2 (block)
ACTION=add
DEVNAME=/dev/dm-2
DEVPATH=/devices/virtual/block/dm-2
DEVTYPE=disk
MAJOR=253
MINOR=2
SEQNUM=1792
SUBSYSTEM=block

UDEV  [6104.622360] add      /devices/virtual/block/dm-2 (block)
ACTION=add
DEVNAME=/dev/dm-2
DEVPATH=/devices/virtual/block/dm-2
DEVTYPE=disk
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
MAJOR=253
MINOR=2
SEQNUM=1792
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=22121

UDEV  [6104.625538] change   /devices/virtual/block/dm-1 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool_tmeta
DEVNAME=/dev/dm-1
DEVPATH=/devices/virtual/block/dm-1
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_NAME=pool_tmeta
DM_NAME=TEST-pool_tmeta
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRahwWEou57GnOqtLMM4eVS9tei6ZnRIgC3
DM_VG_NAME=TEST
MAJOR=253
MINOR=1
SEQNUM=1790
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=19489

KERNEL[6104.625827] change   /devices/virtual/block/dm-2 (block)
ACTION=change
DEVNAME=/dev/dm-2
DEVPATH=/devices/virtual/block/dm-2
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=2
SEQNUM=1793
SUBSYSTEM=block

KERNEL[6104.625839] add      /devices/virtual/bdi/253:3 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:3
SEQNUM=1794
SUBSYSTEM=bdi

KERNEL[6104.625908] add      /devices/virtual/block/dm-3 (block)
ACTION=add
DEVNAME=/dev/dm-3
DEVPATH=/devices/virtual/block/dm-3
DEVTYPE=disk
MAJOR=253
MINOR=3
SEQNUM=1795
SUBSYSTEM=block

UDEV  [6104.626173] add      /devices/virtual/bdi/253:3 (bdi)
ACTION=add
DEVPATH=/devices/virtual/bdi/253:3
SEQNUM=1794
SUBSYSTEM=bdi
USEC_INITIALIZED=25953

UDEV  [6104.627425] add      /devices/virtual/block/dm-3 (block)
ACTION=add
DEVNAME=/dev/dm-3
DEVPATH=/devices/virtual/block/dm-3
DEVTYPE=disk
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
MAJOR=253
MINOR=3
SEQNUM=1795
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=4625994

UDEV  [6104.661855] change   /devices/virtual/block/dm-2 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool_tdata
DEVNAME=/dev/dm-2
DEVPATH=/devices/virtual/block/dm-2
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_NAME=pool_tdata
DM_NAME=TEST-pool_tdata
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRa7SYvk5oDL9xXw3AYkRdFldf5GcgTSO0u
DM_VG_NAME=TEST
MAJOR=253
MINOR=2
SEQNUM=1793
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=22121

KERNEL[6104.731441] change   /devices/virtual/block/dm-3 (block)
ACTION=change
DEVNAME=/dev/dm-3
DEVPATH=/devices/virtual/block/dm-3
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=3
SEQNUM=1796
SUBSYSTEM=block

UDEV  [6104.736131] change   /devices/virtual/block/dm-3 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool-tpool
DEVNAME=/dev/dm-3
DEVPATH=/devices/virtual/block/dm-3
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_LAYER=tpool
DM_LV_NAME=pool
DM_NAME=TEST-pool-tpool
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0-tpool
DM_VG_NAME=TEST
MAJOR=253
MINOR=3
SEQNUM=1796
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=4625994

KERNEL[6104.781450] change   /devices/virtual/block/dm-2 (block)
ACTION=change
DEVNAME=/dev/dm-2
DEVPATH=/devices/virtual/block/dm-2
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=2
SEQNUM=1797
SUBSYSTEM=block

KERNEL[6104.781467] change   /devices/virtual/block/dm-1 (block)
ACTION=change
DEVNAME=/dev/dm-1
DEVPATH=/devices/virtual/block/dm-1
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=1
SEQNUM=1798
SUBSYSTEM=block

KERNEL[6104.781487] change   /devices/virtual/block/dm-3 (block)
ACTION=change
DEVNAME=/dev/dm-3
DEVPATH=/devices/virtual/block/dm-3
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=3
SEQNUM=1799
SUBSYSTEM=block

KERNEL[6104.783279] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_COOKIE=7254432
MAJOR=253
MINOR=0
SEQNUM=1800
SUBSYSTEM=block

UDEV  [6104.967244] change   /devices/virtual/block/dm-2 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool_tdata
DEVNAME=/dev/dm-2
DEVPATH=/devices/virtual/block/dm-2
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_NAME=pool_tdata
DM_NAME=TEST-pool_tdata
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRa7SYvk5oDL9xXw3AYkRdFldf5GcgTSO0u
DM_VG_NAME=TEST
MAJOR=253
MINOR=2
SEQNUM=1797
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=22121

UDEV  [6105.044133] change   /devices/virtual/block/dm-3 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool-tpool
DEVNAME=/dev/dm-3
DEVPATH=/devices/virtual/block/dm-3
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_LAYER=tpool
DM_LV_NAME=pool
DM_NAME=TEST-pool-tpool
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0-tpool
DM_VG_NAME=TEST
MAJOR=253
MINOR=3
SEQNUM=1799
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=4625994

UDEV  [6105.049374] change   /devices/virtual/block/dm-1 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool_tmeta
DEVNAME=/dev/dm-1
DEVPATH=/devices/virtual/block/dm-1
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_NAME=pool_tmeta
DM_NAME=TEST-pool_tmeta
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRahwWEou57GnOqtLMM4eVS9tei6ZnRIgC3
DM_VG_NAME=TEST
MAJOR=253
MINOR=1
SEQNUM=1798
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=19489

UDEV  [6105.052445] change   /devices/virtual/block/dm-0 (block)
ACTION=change
DEVLINKS=/dev/mapper/TEST-pool
DEVNAME=/dev/dm-0
DEVPATH=/devices/virtual/block/dm-0
DEVTYPE=disk
DM_ACTIVATION=1
DM_COOKIE=7254432
DM_LV_NAME=pool
DM_NAME=TEST-pool
DM_SUSPENDED=0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES_VSN=2
DM_UUID=LVM-FKRNpPEfHeVp00nZICmpj2ZJkljO3XRaKpffahoii1titC0QpYhX0MtF9c1Z4cd0
DM_VG_NAME=TEST
MAJOR=253
MINOR=0
SEQNUM=1800
SUBSYSTEM=block
SYSTEMD_READY=0
TAGS=:systemd:
USEC_INITIALIZED=78978

KERNEL[6105.399952] change   /devices/pci0000:00/0000:00:08.0/virtio4/block/vdb (block)
ACTION=change
DEVNAME=/dev/vdb
DEVPATH=/devices/pci0000:00/0000:00:08.0/virtio4/block/vdb
DEVTYPE=disk
MAJOR=252
MINOR=16
SEQNUM=1801
SUBSYSTEM=block

UDEV  [6105.403658] change   /devices/pci0000:00/0000:00:08.0/virtio4/block/vdb (block)
ACTION=change
DEVLINKS=/dev/disk/by-id/virtio-DISK1
DEVNAME=/dev/vdb
DEVPATH=/devices/pci0000:00/0000:00:08.0/virtio4/block/vdb
DEVTYPE=disk
ID_FS_TYPE=LVM2_member
ID_FS_USAGE=raid
ID_FS_UUID=9KHyXO-0PPn-FdBI-vfez-Jh0p-mIDH-QH0cKF
ID_FS_UUID_ENC=9KHyXO-0PPn-FdBI-vfez-Jh0p-mIDH-QH0cKF
ID_FS_VERSION=LVM2 001
ID_SERIAL=DISK1
MAJOR=252
MINOR=16
SEQNUM=1801
SUBSYSTEM=block
TAGS=:systemd:
USEC_INITIALIZED=158

--=-=-=
Content-Type: text/plain


> This is what I see on my machine:

I think you also this, for dm-2:

> UDEV  [170.743992] add      /devices/virtual/block/dm-2 (block)
> DM_UDEV_DISABLE_DISK_RULES_FLAG=1
> DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
> DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
>
> UDEV  [170.771393] change   /devices/virtual/block/dm-2 (block)
> DM_NAME=vg-pool
> DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
[...]
> UDEV  [170.809403] change   /devices/virtual/block/dm-2 (block)
> DM_NAME=vg-pool
> DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
> DM_UDEV_PRIMARY_SOURCE_FLAG=1
[...]
> UDEV  [170.871863] change   /devices/virtual/block/dm-2 (block)
> DM_NAME=vg-pool
> DM_UDEV_DISABLE_DISK_RULES_FLAG=1
> DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
> DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
> DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
> DM_UDEV_PRIMARY_SOURCE_FLAG=1
[...]

--=-=-=--
