From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009261931.e8QJVU126129@webber.adilger.net>
Subject: Re: [linux-lvm] lvm and fibre channel
In-Reply-To: <200009261746.e8QHksg25808@webber.adilger.net> "from Andreas Dilger
 at Sep 26, 2000 11:46:54 am"
Date: Tue, 26 Sep 2000 13:31:29 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Florin Andrei <fandrei@rds.ro>, linux-lvm@msede.com

I wrote:
> Florin writes:
> > Does LVM works over Fibre Channel?
> 
> Someone on the list was trying to get LVM to work on FC, but they were
> having problems.  I don't know if they got it working at the end.

My mistake, the person having problems was using I2O, and not FC.  Since
the FC disks show up as SCSI disks, they should be fine.  However, it
may be that LVM doesn't work well with the same disks connected to multiple
systems.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
