From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009111908.e8BJ8jH27472@webber.adilger.net>
Subject: Re: [linux-lvm] Re:  LVM and I2O
In-Reply-To: <39BD6CDE.821BADCE@artstor.de> "from Jan Strohbehn at Sep 12, 2000
 01:38:06 am"
Date: Mon, 11 Sep 2000 13:08:45 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Strohbehn <j.strohbehn@artstor.de>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Jan, you write:
> I have tried all this but the error still appears. Here's the exact
> error message:
>
> ext2fs_mkdir: Attempt to read block from filesystem resulted in short
> read while creating root dir

Is it possible that the I2O driver/disk itself is not working?  Have you
tried something like "dd if=/dev/zero of=/dev/{i2o_disk}" to test writes,
and "dd if=/dev/{i2o_disk} of=/dev/null" to test reads?  The block counts
returned from the read and write tests should match...  It may be that
there is a bad block on the disk, and with LVM it changes the alignment
of the FS so that the bad block is under some metadata (read/writted at
mke2fs time), whereas the block is unused without LVM.

If that works OK, try sending the end of "strace mke2fs" on your disk to
see what exactly is happening.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
