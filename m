From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011211835.eALIZ9j20425@webber.adilger.net>
Subject: Re: [linux-lvm] What if...
In-Reply-To: <003301c053cb$a51028a0$65358286@patti> "from Patrick Scharrenberg
 at Nov 21, 2000 03:59:27 pm"
Date: Tue, 21 Nov 2000 11:35:09 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Scharrenberg <patrick@scharrenberg.com>
Cc: linux-lvm@msede.com

Patrick writes:
> If I have a VG over 3 harddisks and one logical volume using all the VG
> space, then what will happen if one harddisk fails? Is the whole date lost,
> or only the data which was stored on the failed disk?

If you have ext2 on the disks, and the last one fails then you _may_ be
able to get back most of the data on the first two disks.  However, it is
a lot easier to get your data back from a backup.  You can use RAID 5 to
help with single disk failures, but it still isn't a substitute for a
backup.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
