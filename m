Date: Thu, 24 Aug 2000 07:57:25 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824075725.B7996@gospelcom.net>
References: <OFBD402CC0.EADC9B6D-ONC1256945.00396FA2@resnova.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFBD402CC0.EADC9B6D-ONC1256945.00396FA2@resnova.de>; from Peter.Wuestefeld@resnova.de on Thu, Aug 24, 2000 at 12:37:43PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter.Wuestefeld@resnova.de
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com, owner-linux-lvm@msede.com

Thanks for the response,

also sprach Peter.Wuestefeld:
> 
>    Hi,
>    I think you are trying to cure the wrong disease ;-)
>    > [root@dmna /root]# pvcreate -f /dev/md0
>    > pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be
>    0x8e)
>    shows what is wrong:
>    try to set the partition id to 0x8e with fdisk/sfdisk/cfdisk - that
>    should solve the problem.

There *aren't* any partitions on a /dev/md? device. Look at the strace I
sent; it's trying to pvcreate /dev/sda, even though I specify /dev/md0 on
the command line.

Thanks for your help.

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
We come to bury DOS, not to praise it.
(Paul Vojta, vojta@math.berkeley.edu, paraphrasing a quote of Shakespeare)
