From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008232200.e7NM0oI22048@webber.adilger.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
In-Reply-To: <20000823162957.B8398@gospelcom.net> "from Peter Green at Aug 23,
 2000 04:29:57 pm"
Date: Wed, 23 Aug 2000 16:00:49 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Green <pcg@gospelcom.net>
Cc: linux-lvm@msede.com

Peter Green writes:
> I am having a really difficult time being able to get LVM to recognize my
> /dev/md[012] arrays.

What does /proc/partitions show you?  What about cfdisk -P s /dev/sdX for
each drive?

>   (pcg@dmna) ~> sudo pvcreate /dev/md0
>   pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

Have you tried doing this directly as root?  I'm not sure if it makes a
difference, but it is worth trying.

Have you applied the fixes from "BUGS" to the LVM tools?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
