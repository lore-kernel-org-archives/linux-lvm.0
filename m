Message-ID: <389975BE.9F10A6C9@msede.com>
Date: Thu, 03 Feb 2000 13:34:06 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: me@jimcain.net
MIME-Version: 1.0
Subject: [linux-lvm] Patch 0.8i to 2.3.40: error during make
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Wed, 2 Feb 2000 23:28:13 -0500 (EST)
From: Jim Cain <me@jimcain.net>
Subject: Re: [linux-lvm] Patch 0.8i to 2.3.40: error during make

Okay, I got the kernel to compile. Please ignore my previous message
about
not having the appropriate declarations. I was in the wrong linux
source
tree on the wrong machine. :-)

Anyway, I still had to make the changes that were previously noted:

> - edit ./include/linux/fs.h
> - locate line 775
> - add the following two lines:
> 
> extern int blkdev_close(struct inode *, struct file *);
> extern int block_fsync(struct file *, struct dentry *);

Well, that's *nearly* all. You need to remove the "static" keywords
from
both blkdev_close and block_fsync in ./fs/block_dev.c, too.

Once I was in the correct source tree, these changes were reasonable,
and
they allowed the kernel to compile.

However, I had problems getting the tools to build, and I'll be
composing
a separate message with details.

Thanks very much for the help!

Cheers,
Jim
