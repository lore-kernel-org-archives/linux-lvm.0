From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010250148.e9P1mTr00368@webber.adilger.net>
Subject: Re: [linux-lvm] Is LVM dead ?
In-Reply-To: <39F0B45C.6735D447@tls.msk.ru> "from Michael Tokarev at Oct 21,
 2000 01:08:44 am"
Date: Tue, 24 Oct 2000 19:48:29 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: linux-lvm@msede.com

Michael writes:
> There are too many patches floating around.  And the latest file date
> is about march-2000...  It seemed to be that folks has have only one
> target -- to include lvm into kernel.  To set up a dots under i's.

I agree that there should be more visible interim releases of LVM
user tools.  The kernel code is now part of 2.4, so it doesn't make
sense to make 2.4 kernel patches available anywhere else.  It may be
that we can get LVM 0.8 into the 2.2 kernel - I don't know if anyone
has tried yet.  In any case, I will continue to keep the 2.2 code
up to date.

> Again, when IBM comes with their ideas (not to say here good or
> bad -- it is a different story), people here just said something
> like "we already have all that we want, so go out"... (discussion
> was long and interesting, but primary authors was not involved
> there).
> 
> What's happening?  I'm really worried, as this is a very
> useful thing.  And I call here -- should someone become a
> new maintainer of the whole thing ? :(((  As current
> maintainer as it seemed to be just did all that he want
> already...

Actually, just to let you know what is happening, a lot of people
interested in LVM got together in Miami for the Storage Workshop
(Heinz was one of the organizers there), and talked about future
LVM development.  IBM was there, as well as a number of kernel
developers, Heinz, myself (for TurboLinux), LinuxCare, etc.  It
may not be visible that things are going on, but they are.  I'm
sure there will be more information available here when it is
more than just talk.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
