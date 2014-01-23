Message-ID: <52E1000A.3060000@redhat.com>
Date: Thu, 23 Jan 2014 12:42:02 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>, <87y52fdiyp.fsf@red.mvo.lan>,
	<52DD0D54.6060704@redhat.com>,
	<52DD1055.5040400@redhat.com> <874n4w5q0y.fsf@red.mvo.lan>
In-Reply-To: <874n4w5q0y.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Marius Vollmer <marius.vollmer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 01/22/2014 10:23 AM, Marius Vollmer wrote:
> Peter Rajnoha <prajnoha@redhat.com> writes:
> 
>>> Thing here is that when LVs are created then at first they have this flag
>>> set until proper initialization is finished - [...]
> 
> Is it guaranteed (modulo bugs) that the DM_UDEV_DISABLE_*_RULES flags
> are only ever removed from a node, and are never added to it over it's
> lifetime between add/remove events?

No, we don't have this restriction generally - when LVM command processes
a device, it can suspend or resume it or do it in a cycle while modifying
these flags based on what's actually needed to be done - whether we need
to avoid any scanning on the device in udev or not etc (but I'm not sure
at the moment we have such a sequence used anywhere, but it's possible,
there's no restriction).

> 
> This isn't true right now, and UDisks fails to handle it correctly when
> a flag is added in a "change" event.  I am asking to figure out where
> the fix should go.

Well, udisks should always check the DM_UDEV_DISABLE_OTHER_RULES_FLAG
and if it's set, skip its processing. It already has:

# honor the flag that device-mapper sets if the device should be ignored
ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="udisks_end"

..in 80-udisks.rules. So it should be already following this.

> 
> For example, this is what happens when creating a pool for thinly
> provisioned volumes:
> 
>     UDEV  [2081.714175] add      /devices/virtual/block/dm-1 (block)
>     [...]
>     DM_UDEV_DISABLE_DISK_RULES_FLAG=1
>     DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
>     DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
>     [...]
> 
>     UDEV  [2081.771737] change   /devices/virtual/block/dm-1 (block)
>     [...]
>     DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
>     [...]
> 
>     UDEV  [2081.779997] change   /devices/virtual/block/dm-1 (block)
>     [...]
>     DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
>     [...]
> 
>     UDEV  [2081.943224] change   /devices/virtual/block/dm-1 (block)
>     [...]
>     DM_UDEV_DISABLE_DISK_RULES_FLAG=1
>     DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
>     DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
>     DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
>     [...]
> 
> I.e., the flags are set, then are removed, then set again.  UDisks
> ignores the change event with the flags set, and gets into an
> inconsistent state.
> 

Hmm, could you please send the whole log. This is what I see on my machine:


Creating temporary and internal LV to clean up pool metadata spare LV
 - one LV marked as internal with creating the /dev/vg/lvol0 symlink (dm-2)
   (DM_UDEV_DISABLE_DISK_RULES and DM_UDEV_DISABLE_OTHER_RULES set)
======================================================================

UDEV  [170.702190] add      /devices/virtual/block/dm-2 (block)
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1

UDEV  [170.713968] change   /devices/virtual/block/dm-2 (block)
DM_NAME=vg-lvol0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.730282] remove   /devices/virtual/block/dm-2 (block)
DM_NAME=vg-lvol0
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

(dm-2 removed!)
=======================================================================

Creating the pool LV itself
 - one top-level and public LV to represent the pool as a whole (dm-2 here)
   (no DM_UDEV_DISABLE_* set as that's the device to be used publicly)

 - one internal LV for metadata device (dm-3 here)
   (DM_UDEV_DISABLE_{DISK, OTHER, SUBSYSTEM}_RULES_FLAG set

 - one internal LV for data device (dm-4 here)
   (DM_UDEV_DISABLE_{DISK, OTHER, SUBSYSTEM}_RULES_FLAG set

 - one internal LV for pool device (dm-5 here)
   (DM_UDEV_DISABLE_{DISK, OTHER, SUBSYSTEM}_RULES_FLAG set
============================
UDEV  [170.743992] add      /devices/virtual/block/dm-2 (block)
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1

UDEV  [170.771393] change   /devices/virtual/block/dm-2 (block)
DM_NAME=vg-pool
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1

UDEV  [170.789168] add      /devices/virtual/block/dm-3 (block)
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1

UDEV  [170.793567] add      /devices/virtual/block/dm-4 (block)
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1

UDEV  [170.799868] add      /devices/virtual/block/dm-5 (block)
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1

UDEV  [170.809403] change   /devices/virtual/block/dm-2 (block)
DM_NAME=vg-pool
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.812167] change   /devices/virtual/block/dm-3 (block)
DM_NAME=vg-pool_tmeta
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.814378] change   /devices/virtual/block/dm-4 (block)
DM_NAME=vg-pool_tdata
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.840436] change   /devices/virtual/block/dm-5 (block)
DM_NAME=vg-pool-tpool
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1

UDEV  [170.870652] change   /devices/virtual/block/dm-3 (block)
DM_NAME=vg-pool_tmeta
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.871265] change   /devices/virtual/block/dm-4 (block)
DM_NAME=vg-pool_tdata
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.871863] change   /devices/virtual/block/dm-2 (block)
DM_NAME=vg-pool
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1

UDEV  [170.872784] change   /devices/virtual/block/dm-5 (block)
DM_NAME=vg-pool-tpool
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1


Seems OK to me. But I need your full udevadm monitor log to compare...
-- 
Peter
