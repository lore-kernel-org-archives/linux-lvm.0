From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008290326.VAA01321@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Dazed & Confused
Date: Mon, 28 Aug 2000 21:26:56 -0600 (MDT)
In-Reply-To: <Pine.SOL.4.10.10008281524410.5632-100000@basm.cerias.purdue.edu> from "Brian Poole" at Aug 28, 2000 03:30:10 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Brian Poole <raj@cerias.purdue.edu>
Cc: linux-lvm@msede.com

Brian Poole writes:
> I'm a bit confused, trying to find the latest 2.2 kernel with the lvm
> patch and it is a bit confusing to say the least. 
> 
> I wouldn't mind running the 2.2.17pres, if there is a patch for them (?),
> otherwise, where do I find the 2.2.16 patch? From searching the mailing
> list archives it looked like there were at least 2 different ones (?) so
> I'm not really sure which I should be using.

Unfortunately, there is no "correct" version of the LVM patch, since
Heinz has not "blessed" either of the 2.2.16 patches available.
The patch that I posted previously has all of the _known_ bugfixes
in it, and is up-to-date with the 2.4 kernel code, so you can use the
same user-space tools when switching back & forth between 2.2 and 2.4.

It does not apply to the stock 2.2.16 or 2.2.17 kernel source because
lvm-snap.c uses some features that are not available in stock 2.2.X.
However, if you can live without snapshots, it _probably_ wouldn't be
hard to make it a config option, but I've never looked at it.

Cheers, Andreas
