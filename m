From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009271905.e8RJ5KS00572@webber.adilger.net>
Subject: Re: [linux-lvm] lvm and fibre channel
In-Reply-To: <14801.35603.881485.66498@loki.1012internet.at> "from Michael Lausch
 at Sep 27, 2000 07:52:19 am"
Date: Wed, 27 Sep 2000 13:05:20 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Lausch <mla@1012surf.net>
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

Michael Lausch writes:
> Andreas Dilger writes:
>  > LVM will not help you here either, because it currently limits you to
>  > 255 LVs, regardless of how many VGs you have, because there is only 1
>  > block major for LVM.
> 
> is using devfs an option? We are planing to attach a PC to a storage
> array (HP XP256) using LVM and devfs over fibre channel next week and
> doing some tests (performance, ease of use, etc....)

The problem is that the LVM code is written to only look at 1 major number.
The SCSI code has been written to check multiple major numbers.  Maybe it
is worthwhile to change the LVM code to check a whole block of major
numbers, or alternately get dynamic majors via devfs.  This is not there
yet, so you are stuck with a maximum of 255 LVs and 99 VGs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
