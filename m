From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199910170419.WAA26043@webber.adilger.net>
Subject: [linux-lvm] ext2 online resizer available
Date: Sat, 16 Oct 1999 22:19:23 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS development list <linux-fsdevel@vger.rutgers.edu>, Linux LVM mailing list <linux-lvm@msede.com>, Linux kernel development list <linux-kernel@vger.rutgers.edu>

Hello all,
my online ext2 resizer is now available in a fully functional state.  If
the underlying partition supports it, it is possible to resize an ext2
filesystem while it is mounted and in use by applications.

This capability is provided by a kernel patch (2.2/2.3 and 2.0 versions
available - should apply cleanly to most versions as that part of the
kernel code hasn't changed much in a long time) and some user-space tools.
The amount that you can resize a filesystem depends on the block size and
whether or not you have "prepared" the filesystem for large resizes.  The
ext2 filesystem is maintained as a normal filesystem at all times, and it
can be used by a non-patched kernel at any time, and with one exception
(if you have an old e2fsck) will fsck clean after a resize.

Note that you need some way to resize the underlying partition (via LVM
probably) in order to resize the filesystem.  For testing purposes you
can also create a small filesystem on a large partition, and then resize
to fill the partition.

Patches are available at my web site:
http://www-mddsp.enel.ucalgary.ca/People/adilger/online-ext2/

The user-space tools are now part of Lennert Buytenhek's ext2resize suite:
http://www.dsv.nl/~buytenh/ext2resize/
for which a patch is required from my site.

Please give it a good testing, as I haven't been able to find any problems
while putting a hundred copies of an 11MB filesystem tree into a filesystem
while doing thousands of resizes to the same mounted filesystem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
