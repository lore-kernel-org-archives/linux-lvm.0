From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008241747.e7OHlNd04033@webber.adilger.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
In-Reply-To: <20000824124613.B19952@colombina.comedia.it> "from Luca Berra at
 Aug 24, 2000 12:46:14 pm"
Date: Thu, 24 Aug 2000 11:47:23 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bluca@comedia.it
Cc: linux-lvm@msede.com

Luca Berra write:
> anyway i found the bug, well there is more than one preventing you to use
> raid and LVM,

Can you send your fixes to the list?  At least then everyone else doesn't
need to fix the same bugs.  It would be even better if Heinz made a new
bugfix release, but I watch the list for fixes anyways...

> fixed that and pvmoved everything onto my lvm+raid5 (fixing another bug
> in the process).  Well, i discovered that reiserfs + LVM + raid DOES NOT
> WORK, it actually filled 95% of my files with zeroes :)

No journalling filesystem will work properly with RAID 5 - not reiserfs
and not ext3.  You need to stick with a non-journalling filesystem, or
use RAID1.  It may be that this is supposed to be fixed in 2.4, but I'm
not 100% sure...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
