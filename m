Date: Tue, 7 Nov 2000 14:21:52 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001107142152.G1276@inspiron.random>
References: <Pine.LNX.4.05.10011071151180.21541-100000@humbolt.nl.linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.05.10011071151180.21541-100000@humbolt.nl.linux.org>; from riel@conectiva.com.br on Tue, Nov 07, 2000 at 11:55:42AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-lvm@msede.com, marcelo@conectiva.com.br

On Tue, Nov 07, 2000 at 11:55:42AM +0100, Rik van Riel wrote:
> On snapshot creation, the snapshot block device (/dev/vg0/snap1)
> is NOT made a read-only device, so ext3 tries to do journal

It is made read only.

> (leading to all kinds of nasty oopses)

Could you show me the Oopses?

> It should be easy enough to do an set_device_ro() on the LVM
> snapshot, shouldn't it?

That shouldn't be necessary. The way LVM handle this looks correct
to me, but maybe it's never been tested in the ll_rw_block layer because the
open(O_RDWR) check always handled it with ext2. Maybe ext3 forces writes via
ll_rw_block also when the device is mounted read only (probably when doing log
reply?) and maybe it hits the ll_rw_block check for the first time.

Currently we choose if a device is readable or not using the
VM_WRITE bitflag in the lv->lv_access field. If the bitflag is set
the device is writeable. You'll find that the snapshots has that bitflag
unset (please verify via /proc that they don't have the W capability set).

If the snapshot is not writeable as expected, the lvm hook in ll_rw_block
should return -1 and ll_rw_block should goto sorry just like if we would be
using the ro_bits via set_device_ro. So it should not be necessary
to use the set_device_ro.

Or maybe the bug is in ext3 that doesn't handle real read only blockdevices?

> That would fix the oopses I've been seeing and would make

Hopefully the Oopses will tell us more about this ext3/snapshot collision.

Also please ensure you can reproduce with 2.2.18pre17aa1 or 2.4.0-test10 to
make sure we're looking at the same sources.

Andrea
