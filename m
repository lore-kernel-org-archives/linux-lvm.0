From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010241642.e9OGgOn31554@webber.adilger.net>
Subject: Re: [linux-lvm] swap lv
In-Reply-To: <20001024224017.E27491@ist.flinders.edu.au> "from Mark Phillips
 at Oct 24, 2000 10:40:17 pm"
Date: Tue, 24 Oct 2000 10:42:24 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: Holger Rauch <Holger.Rauch@heitec.de>, linux-lvm@msede.com

Mark Phillips writes:
> Holger Rauch [Holger.Rauch@heitec.de] wrote:
> > Is it possible to have only one swap partition that resides on an LV? If
> > so, how can this be achieved? Are swap LVs resizable?
> 
> As for resizing a swap partition.  What I would do is as follows.
> First unmount your swap partition so that you are not using it
> anymore.  Then delete the partition.  Then create it again, making it
> a different size.  Then run mkswap again and mount it again.

Actually, it is probably better to make a new swap LV, activate it, and
then deactivate the old one (assuming you have enough disk space to do
so).  Otherwise, you may run out of memory if you don't have a swap
partition.

The other alternative is to simply have 2 or more swap partitions.  If
they are created with equal priority, then they will both be used.  There
is no problem with having multiple swap partitions.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
