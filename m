From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200006051658.e55GwQx16588@webber.adilger.net>
Subject: Re: [linux-lvm] performance problems
Date: Mon, 5 Jun 2000 10:58:26 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

Chris writes:
> We are using LVM on a (hardware) RAID array and are
> having some performance problems.  File copying is
> very slow and one of the guys using it reported that
> untarring was very sluggish, and he got I/O errors. 
> Is this a known problem?  I believe we are using 0.8i
> and we are using 2.2.13 kernel.  Any help would be
> greatly appreciated.

Have you been using LVM without problem before, or is this a brand new
installation?

If the speed problem is new (i.e. LVM has been installed and working
well for a while), it may well be that you have a disk problem, and the
RAID array is slow because it needs to do extra parity calculations for
all I/O.  Getting I/O errors is a bad sign, as LVM doesn't know anything
about hardware RAID, it only knows there is a big disk beneath it.

If it is a new LVM installation, it may be that you want to check the
RAID stripe size/PE size/ext2 RAID stride are all set to reasonable
multiples of each other for maximum performance.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
