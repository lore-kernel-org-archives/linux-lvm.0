From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011082129.eA8LTQv20620@webber.adilger.net>
Subject: Re: [linux-lvm] Disk striping option
In-Reply-To: <OLEAJMNOEMOMMNEIMMINEEIGCBAA.pswartz@digitalrom.com>
 "from Patrick Swartz at Nov 8, 2000 02:48:30 pm"
Date: Wed, 8 Nov 2000 14:29:25 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Swartz <pswartz@digitalrom.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Patrick Swartz writes:
> Thanks for responding so quickly.  I should add that each JBOD chassis is
> attached to it's own ICP card in a Raid 5 + hot spare configuration.  This
> system will be used in a heavy fileserver environment doing reads-writes
> with large files.

In this case you don't want to do any striping from LVM at all.  If you are
using ext2/ext3 you may want to consider using the "-R stride" option to
align the block/inode bitmaps on different disks.  For read performance,
ext2/ext3 is equal or better than ReiserFS.  For write performance, the
current "stable" ext3 is 1/2 as fast (because of data journalling).

For large files there will be no real performance/space benefit to ReiserFS
over ext2, but of course you will have journalling support.  There are also
some issues to getting ReiserFS set up properly with NFS (if that's what
you will use), so make sure you check this out closely.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
