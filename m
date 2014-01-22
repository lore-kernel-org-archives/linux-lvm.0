From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>, <87y52fdiyp.fsf@red.mvo.lan>,
	<52DD0D54.6060704@redhat.com>, <52DD1055.5040400@redhat.com>
In-reply-to: <52DD1055.5040400@redhat.com>
Date: Wed, 22 Jan 2014 11:23:09 +0200
Message-ID: <874n4w5q0y.fsf@red.mvo.lan>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> writes:

>> Thing here is that when LVs are created then at first they have this flag
>> set until proper initialization is finished - [...]

Is it guaranteed (modulo bugs) that the DM_UDEV_DISABLE_*_RULES flags
are only ever removed from a node, and are never added to it over it's
lifetime between add/remove events?

This isn't true right now, and UDisks fails to handle it correctly when
a flag is added in a "change" event.  I am asking to figure out where
the fix should go.

For example, this is what happens when creating a pool for thinly
provisioned volumes:

    UDEV  [2081.714175] add      /devices/virtual/block/dm-1 (block)
    [...]
    DM_UDEV_DISABLE_DISK_RULES_FLAG=1
    DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
    DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
    [...]

    UDEV  [2081.771737] change   /devices/virtual/block/dm-1 (block)
    [...]
    DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
    [...]

    UDEV  [2081.779997] change   /devices/virtual/block/dm-1 (block)
    [...]
    DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
    [...]

    UDEV  [2081.943224] change   /devices/virtual/block/dm-1 (block)
    [...]
    DM_UDEV_DISABLE_DISK_RULES_FLAG=1
    DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
    DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
    DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
    [...]

I.e., the flags are set, then are removed, then set again.  UDisks
ignores the change event with the flags set, and gets into an
inconsistent state.

(With my limited understanding, I would say that LVM2 should make the
guarantee and fix the above scenario.)

> ...the flag would be gone if you opened the LV for read-write and then
> close it - you don't even need to write anything to the LV, just open
> and close - this would fire an event that would have dropped the flag.

Thanks, that sounds like a good workaround until your fix is available
where we need it.
