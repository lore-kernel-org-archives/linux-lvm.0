From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008022318.e72NIwA03071@webber.adilger.net>
Subject: Re: [linux-lvm] Online resizing of ext2 filesystems
In-Reply-To: <NDBBKPLIMKJCOCFNKHBLEEKGCNAA.jphollan@earthlink.net>
 "from Jason Holland at Aug 2, 2000 05:36:24 pm"
Date: Wed, 2 Aug 2000 17:18:57 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jphollan@earthlink.net
Cc: Linux-Lvm <linux-lvm@msede.com>

Jason, you write:
>   just curious about this.  does anyone know, including Andreas, if the next
> version of Linux LVM will include his patches for ONLINE resizing of ext2
> filesystems???  is there any chance a patch for the latest 2.4 test kernels
> will be released in the near future??

The official word that I got was that the ext2 online resize code was NOT
going into the official 2.4 kernel becuase it mucks with ext2, and ext2 is
too important to break.  I think this overlooks the fact that my patch
only touches code used at mount time (and now resize time), so it should be
fairly obvious if it is broken.  Maybe it will make it into post 2.4 kernels,
or 2.5/2.6 will be out sooner (one can always hope).

Does the current 2.3.X patch no longer work for 2.4.latest?  I haven't seen
any changes in ext2 in some time for the 2.4 kernels.  The last update that
I made was to shift the lock_super() calls around because of the VFS changes.
Did I not make this new patch available?

I've also updated e2fsadm tool to call ext2online if the filesystem is
mounted instead of exiting.  Other changes include resize support for
ext3 and work towards no direct disk access like I currently do for ext2.

> This is terrific work Andreas has done so far!!  kudos man!  this is a
> much needed, and i'm sure, much wanted funtion of LVM.

Thanks for the kind words.  It's not too many people that say thanks these
days for their free software...  Note that ext2 resizing is really not part
of LVM, it's just that LVM is the best way to use it.  With a small patch
to the loop device, it is also possible to online resize an ext2 filesystem
on a loop file (this may be useful for crypto filesystems or something).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
