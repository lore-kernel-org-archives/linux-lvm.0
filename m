Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011302154.eAULsJZ02315@webber.adilger.net>
In-Reply-To: <20001130214121.D18804@athlon.random> "from Andrea Arcangeli at
 Nov 30, 2000 09:41:21 pm"
Date: Thu, 30 Nov 2000 14:54:19 -0700 (MST)
MIME-Version: 1.0
Subject: [linux-lvm] Re: [PATCH] Re: [bug] infinite loop in generic_make_request()
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: Andreas Dilger <adilger@turbolinux.com>, Neil Brown <neilb@cse.unsw.edu.au>, Linus Torvalds <torvalds@transmeta.com>, V Ganesh <ganesh@veritas.com>, linux-kernel@vger.kernel.org, linux-LVM@sistina.com, mingo@redhat.com

Andrea writes:
> On Thu, Nov 30, 2000 at 01:05:53PM -0700, Andreas Dilger wrote:
> > the RAID and LVM make_request functions should be changed to do that
> > instead (i.e. 0 on success, -ve on error, and maybe "1" if they do their
> > own recursion to break the loop)?
> 
> We preferred to let the lowlevel drivers to handle error themselfs to
> simplify the interface. The lowlevel driver needs to call buffer_IO_error
> before returning in case of error.

Even if the lowlevel driver handles the error case, it would still
make more sense to stick with the normal kernel practise of -ERROR,
and 0 for success.  Then, if in the future we can do something with the
error codes, at least we don't have to change the interface yet again.
Also, it is a bit confusing, because the lvm (and md, I suppose) driver
returned "0" for success in 2.2, so now you need to special-case the
return value depending on kernel version, if you want to keep the same
code for 2.2 and 2.4.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
