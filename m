Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102052238.f15Mcli17581@webber.adilger.net>
Subject: Re: [linux-lvm] lv extend
In-Reply-To: <20010205050101.A13880@jadzia.josv.com> from Jos Visser at "Feb
 5, 2001 05:01:01 am"
Date: Mon, 5 Feb 2001 15:38:46 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jos Visser writes:
> Resizing the / file system would require considerable more work (rescue
> system et cetera).
> 
> For the really brave, there are patches that allow online resizing of
> partitions.

Not to be overly positive or anything, but the online ext2 resizing is
actually very safe.  With the exception of the fact the user tools don't
work on big-endian systems, I haven't had any bug reports on this in a
long time.  Even then, I've basically never had a bug report that ended
in data loss.

The only issue with online ext2 resizing is that changes in the latest
2.4 kernels cause an oops at resize time.  This has been fixed, and I
will probably be releasing a new ext2resize tools, mostly to update the
kernel patches.

On Mon, 5 Feb 2001, Tom Dawes-Gamble wrote:
> Or lvextend could check the mount table and offer to run
> ext2resize for you.  If that seems like a neat idea I would
> be willing to write the code.

That's what e2fsadm is for - it will resize the filesystem and the
LV at the same time.  IMHO, it is a bad idea to make lvextend do
filesystem work.  However, for some reason the 0.9 version of e2fsadm
doesn't have the online resizing changes that are in 0.8.1.  I have a
patch to fix this.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
