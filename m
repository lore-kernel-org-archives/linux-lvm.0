From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008240045.SAA08617@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM and sw RAID1
Date: Wed, 23 Aug 2000 18:45:18 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

I was just checking out pvcreate on my system, and it seems that LVM is doing
a bit more than it really should.  It appears that pv_get_size is actually
reading the partition table from the disk, but shouldn't this be left to
other code in the kernel (e.g. /proc/partitions or BLKGETSIZE ioctl)?

With the growing number of partition types that Linux supports, it makes
no sense for LVM to be doing things like this...

Cheers, Andreas
