From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199908270344.VAA23954@webber.adilger.net>
Subject: [linux-lvm] e2fsadm Q's
Date: Thu, 26 Aug 1999 21:44:12 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Johhny Brassow writes:
> The reason I'm asking is because I am going to start work on a file 
> system resizer for GFS.  I would like it to be an online resizer (mmm... 
> lots of problems:).  Does anyone have any experience in this or could 
> point me to some source code (other than the LVM stuff - I'm looking that 
> over now:)?

There are several ext2 offline resizers available, as well as my online
ext2 resizer.  If the filesystem is structured correctly on disk, there
isn't much change needed in the kernel to make online resizing work.  I
did much of the change in user-space, and then called (effectively):

mount -o remount,resize=<new block count> /dev/XXX

to have the kernel do the modifications to the parts of the superblock in
use, and to update the kernel data about the filesystem.  If you are
going to write a similar tool for GFS, feel free to use my code, and it
would be nice to keep the interfaces to the user-space tools and kernel
as similar as possible, so maybe there can be a common front-end (like
there is with fsck calling fsck.ext2, etc).

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
