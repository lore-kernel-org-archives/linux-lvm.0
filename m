From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199910180544.XAA02421@webber.adilger.net>
Subject: [linux-lvm] Re: changing the size of a mounted partition
Date: Sun, 17 Oct 1999 23:43:38 -0600 (MDT)
In-Reply-To: <UTC199910172316.BAA10217.aeb@violet.cwi.nl> from "Andries.Brouwer@cwi.nl" at Oct 18, 99 01:16:40 am
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andries.Brouwer@cwi.nl

Andries writes:
> If you want to be able to shrink a mounted partition then that
> seems tricky - we have to collect from the rest of the kernel
> how much is being used as swap, or how large the currently
> mounted filesystem is. On the other hand, if you only want to
> grow a partition, there is no problem.

Currently, my patch only allows growing the filesystem, so your patch
will probably do the right thing.  At some time in the future it might
allow shrinking the filesystem.  The real problem with shrinking an ext2
filesystem is that ext2 normally spreads the directories across all of
the available groups, so it is rare that the groups at the end of a
filesystem are totally empty, even if the filesystem is mostly unused.

I don't think it will be very easy to do an online shrink unless the end
groups are free, which will only happen if the filesystem was newly
extended, or if it is nearly empty.  This shouldn't be a major problem,
since most other filesystems don't allow shrinking at all, even when
unmounted.  For ext2, you can always unmount your filesystem and use
ext2resize to shrink it.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
