Date: Tue, 7 Nov 2000 15:56:59 +0100 (CET)
From: Rik van Riel <riel@conectiva.com.br>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
In-Reply-To: <20001107142152.G1276@inspiron.random>
Message-ID: <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: linux-lvm@msede.com, marcelo@conectiva.com.br

On Tue, 7 Nov 2000, Andrea Arcangeli wrote:
> On Tue, Nov 07, 2000 at 11:55:42AM +0100, Rik van Riel wrote:
> > On snapshot creation, the snapshot block device (/dev/vg0/snap1)
> > is NOT made a read-only device, so ext3 tries to do journal
> 
> It is made read only.

No it isn't. It is made into a read-write block device
where all writes fail :)

kernel: Bad lvm_map in ll_rw_block
kernel: lvm - lvm_map: ll_rw_blk write for readonly LV /dev/vg0/snap1

> > (leading to all kinds of nasty oopses)
> 
> Could you show me the Oopses?

That's a bit much to type in by hand ... and it's basically
kjournald being confused by all its writes failing on a RW
block device.

> > It should be easy enough to do an set_device_ro() on the LVM
> > snapshot, shouldn't it?
> 
> That shouldn't be necessary. The way LVM handle this looks correct to
> me,

Please look again...

> but maybe it's never been tested in the ll_rw_block layer because the
> open(O_RDWR) check always handled it with ext2. Maybe ext3 forces
> writes via ll_rw_block also when the device is mounted read only
> (probably when doing log reply?) and maybe it hits the ll_rw_block
> check for the first time.

Indeed this is the case. When the block device is read-write
(the is_read_only(blk_dev) is non-true) it tries to replay
the log, even for a read-only mounted FS.

> Currently we choose if a device is readable or not using the VM_WRITE
> bitflag in the lv->lv_access field. If the bitflag is set the device
> is writeable. You'll find that the snapshots has that bitflag unset
> (please verify via /proc that they don't have the W capability set).

That bitflag is indeed not set, the snapshot is read-only,
but that status isn't propagated up to the block device
layer.

> Or maybe the bug is in ext3 that doesn't handle real read only blockdevices?

Real read only block devices show their status at the block
device layer :)

> Also please ensure you can reproduce with 2.2.18pre17aa1 or
> 2.4.0-test10 to make sure we're looking at the same sources.

It's with the LVM from the Conectiva kernel RPM, which
uses the source code from your 2.2 LVM driver.

regards,

Rik
--
The Internet is not a network of computers. It is a network
of people. That is its real strength.

http://www.conectiva.com/		http://www.surriel.com/
