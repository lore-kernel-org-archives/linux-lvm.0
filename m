From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008240002.e7O02bo03155@webber.adilger.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
In-Reply-To: <20000823194847.D8398@gospelcom.net> "from Peter Green at Aug 23,
 2000 07:48:47 pm"
Date: Wed, 23 Aug 2000 18:02:37 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Green <pcg@gospelcom.net>
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

Peter writes:
> [root@dmna /root]# pvcreate /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)
> 
> [root@dmna /root]# pvcreate -f /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)
> 
> [root@dmna /root]# pvcreate -ff /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

Have you tried running "pvcreate -v -d /dev/md0"?  It may be that you
get some more clues with this.  Maybe even strace of the above.  It
looks like pvcreate is not getting the correct "dev" or "rdev" from the
inode...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
