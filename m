From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009192022.e8JKMch15948@webber.adilger.net>
Subject: Re: [linux-lvm] what lvm shoudl I be using for 2.2.x?
In-Reply-To: <Pine.LNX.4.21.0009191514250.13277-100000@srv2.ecropolis.com>
 "from Jeremy Hansen at Sep 19, 2000 03:15:04 pm"
Date: Tue, 19 Sep 2000 14:22:38 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Hansen <jeremy@xxedgexx.com>
Cc: linux-lvm@msede.com

Jeremy writes:
> It seems 0.8final has no patches for 2.2.x kernels.  Should I be using
> 0.7 for 2.2.x?

There is an "official" 0.8i version for 2.2, and I have also made a
2.2.x patch for 0.8 final.  Note that my patch is on top of rawio patch
(for LVM snapshots) and also RAID 0.9.  It is easy to fix if you don't
have the RAID 0.9 patches, but you need to #ifdef out a bunch of snapshot
stuff if you don't have rawio.

Patch is at:

	ftp://ftp.stelias.com/pub/adilger/

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
