From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199906282032.OAA17812@munet-d.enel.ucalgary.ca>
Subject: Re: [linux-lvm] Alpha testers rqd for ext2 fs extend utility.
Date: Mon, 28 Jun 1999 14:32:09 -0600 (MDT)
In-Reply-To: <37773336.2DFD841C@the.net.nz> from "Mike Field" at Jun 28, 99 08:32:54 pm
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mike Field <mafield@the.net.nz>
Cc: LVM on Linux <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Mike Field writes:
> I'm a HP-UX user and love LVM. I find the lack of an free extendfs
> utility a real hole in LVM on Linux - so I've done something about it!

Just in case you hadn't seen the discussion lately here and on
linux-fsdevel mailing list, Lennert Buytenhek is also working on a GPL
ext2 extender.  It apparently will handle the 256MB limit by moving
data blocks around during the resize as well.  I don't have the URL
handy, but it was posted in the linux-lvm mailing list in the last
week.

One thing I was thinking is if we can't make the ext2 resize work past
the 256MB boundary while the filesystem is mounted, we could have the
existing "ext2-resize" program do the resizing while unmounted, but
also have a different utility (or a separate function of ext2-resize)
that will allow growth to the next 256MB boundary while the FS is
mounted, for those emergency times when you just need a bit more
space and can't afford a shutdown...

Another possibility (if the ext2 kernel code can handle it) is to build
the ext2 filesystem "pre-enlarged" with enough group descriptors and
inode blocks for a much larger filesystem, and then we don't have the 
issue of moving blocks around on a (un)mounted filesystem.  I think that
this is what AIX does, since when you create a new JFS filesystem (selecting
bytes/inode and cluster size) it replies with:

Based on the parameters chosen, the new /tt JFS file system
is limited to a maximum size of 134217728 (512 byte blocks)

so there is a pre-determined JFS size limit as well, it's just a very
large one.  That would be the equivalent of ext2's 256MB resize limit,
and AIX JFS doesn't allow you to expand past the size which is determined
at JFS creation time.

I know that there are calculations in the kernel, and in the ext2 tools
which work out GD size and inode block counts based on the total number
of blocks, but would it be possible to somehow dissociate these two numbers,
and say we will have X group descriptors, and Y inode blocks no matter
how big the FS currently is?  Then all we have to do is pick X and Y large
enough to satisfy most expansion limits, maybe 128x as large as the original
filesystem size.

Cheers, Andreas
-- 
Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
                 Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \   cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert
