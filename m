From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009261746.e8QHksg25808@webber.adilger.net>
Subject: Re: [linux-lvm] lvm and fibre channel
In-Reply-To: <39D093AC.54E9D40A@rds.ro> "from Florin Andrei at Sep 26, 2000 03:16:44
 pm"
Date: Tue, 26 Sep 2000 11:46:54 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florin Andrei <fandrei@rds.ro>
Cc: linux-lvm@msede.com

Florin writes:
> We have a big Web project, involving several disk arrays (over 3 TB total
> storage space) and around 24 Linux servers.
> 
> On the disk arrays, we need to create aprox. 2600 partitions, which may be
> mounted by the Linux servers (but no server can mount more than 16 partitions
> at any given moment).
> 
> So here is the problem: the Fibre Channel devices are seen as SCSI devices,
> but Linux doesn't support more than 2048 partitions on SCSI disks (max 128
> disks, max 16 partitions each).
> 
> Does LVM works over Fibre Channel?

Someone on the list was trying to get LVM to work on FC, but they were
having problems.  I don't know if they got it working at the end.

LVM will not help you here either, because it currently limits you to
255 LVs, regardless of how many VGs you have, because there is only 1
block major for LVM.

The solution to your problem is to allocate more block major numbers
to SCSI.  It would probably be easier to fix SCSI because it already
handles multiple major numbers, unless there is some built-in limit of
128 disks or 128 * 15 = 1920 (not 2048) partitions.

If you add new major numbers for LVM, then you would need to look at
all of the code to handle multiple major numbers.  This would probably
be a lot of work.  You would also have LVM consistency problems between
the nodes in your system (I don't know if LVM works very well in a
clustered environment at all).

You may want to consider something like GFS (www.globalfilesystem.org I
think), which is designed for exactly this sort of environment (although
I don't know if it is ready for production systems yet).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
