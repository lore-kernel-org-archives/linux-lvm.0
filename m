Message-ID: <3782E55A.5549A280@moeraki.com>
Date: Tue, 06 Jul 1999 22:27:54 -0700
From: John Finlay <finlay@moeraki.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: ext2resize
References: <199907051947.NAA23523@munet-d.enel.ucalgary.ca>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@enel.ucalgary.ca>
Cc: LVM on Linux <linux-lvm@msede.com>

Andreas Dilger wrote:

> John Finlay <finlay@moeraki.com> writes:
> > It seems that ext2 is not really suited for large filesystems: seems like
> > there is too much redundancy in the block groups that causes slow downs in
> > operations like mount, etc.; e2fsck takes hours on a 52GB filesystem.
>
> Actually, the new "sparse superblock" version of ext2 available for Linux 2.2
> kernels removes much of the redundancy issues for superblocks/group blocks.
> Copies are only stored in group 0, and groups which are a power of 3, 5, and
> 7.  The real issue with large filesystems isn't the redundancy, which is
> mostly wasted space and slowdown when unmounting, but rather that the fsck
> has to verify the entire FS structure at mount time.  The preferred method

It's been my observation that there is an awful lot of disk activity at mount
time on a clean large file system (no fsck). It appears that every superblock is
being written in turn - maybe to set the dirty flag? It's particularly noticeable
if the filesystem uses 1k blocksize. The mounts are much faster for  when the
filesystem uses 4k blocksize.

>
> is to have a transaction log/journal which keeps track of outstanding metadata
> changes in progress.  When you get a failure, then you only need to replay
> the log to see what parts of the FS were being modified at the time, and
> then only those areas need to be verified at fsck time.
>

Logging metadata does speed up lots of operations including filesystem recovery
after an unclean shutdown by avoiding fsck. This does seem like the only way to
meet the needs of large filesystem users.

>
> > Are there any projects underway to develop a new filesystem that is more
> > suitable for large filesystems?
>
> There are several log FS/JFS projects underway right now for Linux.

Are any of them nearing first release? Where's the best place to find pointers?

>
> Even SGI will release the source (or so I've read) to their IRIX
> filesystem, which is journalled, so this may be added to the mix soon.
>

I'm not hopeful that XFS source will be released soon - seems more like a PR
gesture.

John
