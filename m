From: jasonf@Cronosys.COM
Message-ID: <20000322104034.B23747@nccr-cle-c.nccrs.com>
Date: Wed, 22 Mar 2000 10:40:34 -0500
Subject: [linux-lvm] RaidZone RAID hardware.
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hello,

I've recently purchased Consensus' RaidZone IDE RAID Can and stuff, and
would like to use LVM with it.

The drivers for the RAID can are in patch + binary library form.  The
binary library seems to be a generic library, and the source for the whole
of the Linux kernel interface is available in patch form.  I've been able to
resolve conflicts between the two patches, and modify the user-mode tools
to accept devices with RaidZone's major numbers (116 and 117), as well as
the new IDE major numbers that the RaidZone patch adds (IDE7_MAJOR through
IDE13_MAJOR); at this point I can create volume groups and logical volumes,
but running mke2fs on various logical volumes fails with different read or
write failures.  A small LV failed with short write to block 0, all the 
others failed with 'short read in ext2_mkdir()'.  For some reason, vgcreate
selected 4Mb PE/LE size.

Has this been seen before, and might anyone have any clues?  My config is
using the 0.8i patch on 2.2.14 with the RaidZone patch.  The RaidZone patch
basically just implements the RaidZone devices (/dev/rz*), but also adds
support for more IDE major numbers (all of the drives in the
RAID can are also individually accessible, although I haven't tested that).

This was attempted both with making the 150Gb volume group from /dev/rza1
and making the volume group from /dev/rza - I can partition /dev/rza just
fine and have made a large (150Gig) ext2 partition on /dev/rza1 and these
work fine - that seems to indicate to me that it's not the RaidZone driver,
not that I would be terribly surprised if the RaidZone drivers were the 
issue anyway.

The RaidZone patch is only available for 2.2.12, 2.2.13, and 2.2.14, which
is why I chose 2.2.14; are there any issues with 0.8i on 2.2.14 this might
be exposing?  When will 0.8final be available for 2.2.14, and what needs to
be done there?

Unfortunately, I can't devote much more time on this; so, if there are no
easy things to try or obvious solutions, I will probably mail my patches to
Consensus and tell them to fix it.  (I feel justified in doing that when I
paid close to $4K for the box ;-)

-Jason

P.S. [offtopic] Anyone know where the ext3 patches are, and whether any of
the various ext2 resizers (including the one that works when mounted) will
work with the ext3 journal in place?  And that ext3 works with LVM, of
course.
