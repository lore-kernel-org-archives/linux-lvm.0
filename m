From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199907051947.NAA23523@munet-d.enel.ucalgary.ca>
Subject: Re: [linux-lvm] Re: ext2resize  
Date: Mon, 5 Jul 1999 13:47:41 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM on Linux <linux-lvm@msede.com>

John Finlay <finlay@moeraki.com> writes:
> It seems that ext2 is not really suited for large filesystems: seems like
> there is too much redundancy in the block groups that causes slow downs in
> operations like mount, etc.; e2fsck takes hours on a 52GB filesystem.

Actually, the new "sparse superblock" version of ext2 available for Linux 2.2
kernels removes much of the redundancy issues for superblocks/group blocks.
Copies are only stored in group 0, and groups which are a power of 3, 5, and
7.  The real issue with large filesystems isn't the redundancy, which is
mostly wasted space and slowdown when unmounting, but rather that the fsck
has to verify the entire FS structure at mount time.  The preferred method
is to have a transaction log/journal which keeps track of outstanding metadata
changes in progress.  When you get a failure, then you only need to replay
the log to see what parts of the FS were being modified at the time, and
then only those areas need to be verified at fsck time.

> Are there any projects underway to develop a new filesystem that is more
> suitable for large filesystems?

There are several log FS/JFS projects underway right now for Linux.
Even SGI will release the source (or so I've read) to their IRIX
filesystem, which is journalled, so this may be added to the mix soon.

Cheers, Andreas
-- 
Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
                 Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \   cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert
