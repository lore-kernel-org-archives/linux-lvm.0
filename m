Date: Tue, 19 Sep 2000 17:05:07 -0400 (EDT)
From: Jeremy Hansen <jeremy@xxedgexx.com>
Subject: Re: [linux-lvm] what lvm shoudl I be using for 2.2.x?
In-Reply-To: <200009192022.e8JKMch15948@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0009191703020.27031-100000@srv2.ecropolis.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com


I'm actually using some of H.J. Lu's kernel builds which include all these
patches, so hopefully it will work well.

I plan on experimenting with ext3 and lvm.  Any experience with this?

Thanks
-jeremy

> Jeremy writes:
> > It seems 0.8final has no patches for 2.2.x kernels.  Should I be using
> > 0.7 for 2.2.x?
> 
> There is an "official" 0.8i version for 2.2, and I have also made a
> 2.2.x patch for 0.8 final.  Note that my patch is on top of rawio patch
> (for LVM snapshots) and also RAID 0.9.  It is easy to fix if you don't
> have the RAID 0.9 patches, but you need to #ifdef out a bunch of snapshot
> stuff if you don't have rawio.
> 
> Patch is at:
> 
> 	ftp://ftp.stelias.com/pub/adilger/
> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> 

eholes.org * jeremy@eholes.org
-----------------------------------------
eholes have feelings too...
