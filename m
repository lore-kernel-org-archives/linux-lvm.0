From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009220424.e8M4O9x09461@webber.adilger.net>
Subject: Re: [linux-lvm] what lvm shoudl I be using for 2.2.x?
Date: Thu, 21 Sep 2000 22:24:08 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

Jeremy, you write:
> Ahh, only one thing I noticed is that lvm doesn't merge with Steven
> Tweedie's sard patches which are available from:
> 
> ftp://ftp.uk.linux.org/pub/linux/sct/fs/profiling/
> 
> Has anyone gotten these patches to merge?

I put up new patches (vs. my lvm patch and RAID 0.90) at:

ftp://ftp.stelias.com/pub/adilger/sard-2.2.17lvm.diff

Note that they really haven't been tested at all (just compiling now).
Just the patch was updated to apply on a newer MD and added (basic)
LVM support.

It would probably good to fix the LVM support so that the accounting
information for LVM also included the underlying PV, but the LVM
tools already keep some of the same data as sard, on a per PP basis.
Not the latency info though, only the number of I/Os.

Let me know how it looks.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
