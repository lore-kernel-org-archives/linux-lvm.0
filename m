From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199910172025.OAA27918@webber.adilger.net>
Subject: [linux-lvm] Re: ext2 online resizer available
Date: Sun, 17 Oct 1999 14:25:41 -0600 (MDT)
In-Reply-To: <Pine.LNX.4.05.9910170632090.29538-100000@ns.snowman.net> from "Stephen Frost" at Oct 17, 99 06:39:06 am
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Frost <sfrost@ns.snowman.net>
Cc: Linux LVM mailing list <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Stephen writes:
> On Sat, 16 Oct 1999, Andreas Dilger wrote:
> > my online ext2 resizer is now available in a fully functional state.  If
> > the underlying partition supports it, it is possible to resize an ext2
> > filesystem while it is mounted and in use by applications.
> 
> 	Have you looked at all into how well it works on RAID partitions?
> Ideally I'd love to be able to stick a pair of disks into a system, rescan
> the SCSI bus to pick them up, add them onto the end of my RAID 0+1 (striped/
> mirrored) raid, and then increase the ext2 partition on the RAID.  All
> without having to drop the system.  I'm fairly sure it can't be done with
> the current set of tools and whatnot, but that's one thing I'd love to see.
> 	Don't get me wrong, ext2 resizing is very nice, just would be nice
> to be able to resize RAID things to go along with it...

I haven't ever used the MD RAID device, so I can't say for sure.  The real
issue is whether or not the MD RAID device uses DOS-style partitions made
with fdisk, or if you access the device directly (e.g. equivalent to using
/dev/hda instead of /dev/hda1 as the underlying device).  If you still have
DOS-style partitions on the MD device, then you can't use ext2online.

I have tried several times to make a small partition via fdisk, make and
mount a filesystem on it, and then while it is mounted use fdisk to
extend the partition at the end.  However, the kernel complains that the
partition is in use, and still thinks the partition is the old size.  I
have no problem with making a filesystem smaller than the full device size
and then extending the filesystem to fill the device while it is in use.
This is, of course, totally useless for a real system as you would not
make a huge partition and then only put a small filesystem in it.

I have also tried making a loopback device on a file, mounting it, increase
the size of the file and then grow the filesystem.  Again the kernel/loop
device think the size is the original file size and doesn't let me grow
past the end.

I think the only real solutions at this point are to use LVM, which allows
you to online resize the LVs.  If you use RAID on a device without partition
tables, and you are able to resize the device and the kernel can understand
that, then you can use ext2online to grow the filesystem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
