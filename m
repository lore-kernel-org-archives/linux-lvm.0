From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <20020103173819.J12868@lynx.no>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200201040015.RAA00441@cthulhu.turbolabs.com>; from
    ahead@bigpond.net.au on Fri, Jan 04, 2002 at 10:15:34AM +1000
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan  3 18:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Steve Lord <lord@sgi.com>, Linux XFS <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Jan 04, 2002  10:15 +1000, Adrian Head wrote:
> Note: becareful when mounting an XFS snaphot without using "mount -t xfs" 
> otherwise i have found it will mount the snapshot as resierfs.
> See http://marc.theaimsgroup.com/?l=linux-xfs&m=100994490716530&w=2 for more 
> info on this.

This is because the reiserfs superblock is 64kB into the filesystem, and it
appears that the mkfs.xfs does not overwrite this part of the disk.  I have
heard of another person with this same problem.  It would probably behoove
the XFS folks to zero the first and last 128kB of a partition when doing
mkfs.xfs to avoid this sort of problem.

For mkfs.ext2, it will zero the first 4kB, overwrite the next tens of kB,
and also zero the last 128kB.  I should probably make sure that it will
_always_ overwrite at least the first 68kB, but with the default parameters
it will at least do so except on the smallest of filesystems (i.e. floppies).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
