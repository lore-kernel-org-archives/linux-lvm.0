From: Jesse Sipprell <jss@evcom.net>
Date: Sat, 11 Nov 2000 08:46:02 -0500
Subject: [linux-lvm] LVM in shared parallel SCSI environment
Message-ID: <20001111084602.B26544@kevorkian.evcom.net>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi all,

I'm currently in the process of planning a large(ish)-scale Linux deployment.
As part of the planning process, I am considering using LVM in a shared SCSI
environment; potentially with GFS as the file system in the future, but
starting with ext2.

To that end I have a test "cluster" set up.  It consists of:

One Winchester Systems OpenRAID chassis with 100GB total storage, running in
RAID5.  The OpenRAID is a SCSI-to-SCSI solution, with four host SCSI channels.
The hardware can be configured so that the channels can share physical storage
space.

Four test Linux boxes, each with a small (9GB) boot/root/swap/emergency SCSI
disk.  Obviously, the four boxes are connected to the four host channels on
the OpenRAID.

The OpenRAID is configured such that all available disk space is visable
identically to the servers.  Obviously, because the initial test uses ext2
instead of a filesystem that supports shared media (i.e. GFS), we won't be
actually sharing filesystems between boxes.  However, LVM seemed like a pretty
good potential in this situation because it allows for relatively dynamic
allocation of storage from a large shared "pool."  The catch, as with all
shared SCSI solutions, is that each participating host must maintain a
consistant view of LVM metadata.

So far, it's been fairly successful.  Once the vg and lvs are created, and each
host has meta in core, all is well.  The only problem I am seeing is when an
lv (for example) is extended or reduced, the other systems are unaware of the
change in LVM metadata.  This makes sense of course, because each host is
operating with it's own "notion" of the LVM in core.  The solution is rather
awkward; one has to unmount all LVM filesystems on each host, vgchange the vg
to inactive, vgchange it back to active and then remount the filesystems.

My question is this:  Is there any way to "refresh" the in-core metadata from
disk?  If not, does anyone think this might be a good idea for the future?

Regards,

-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *
