From: Andreas Dilger <adilger@home.com>
Message-Id: <200003221722.e2MHMlT01821@webber.adilger.net>
Subject: Re: [linux-lvm] RaidZone RAID hardware.
In-Reply-To: <20000322104034.B23747@nccr-cle-c.nccrs.com> from "jasonf@cronosys.com"
 at "Mar 22, 2000 10:40:34 am"
Date: Wed, 22 Mar 2000 10:22:47 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: jasonf@Cronosys.COM
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Jason writes:
> P.S. [offtopic] Anyone know where the ext3 patches are, and whether any of
> the various ext2 resizers (including the one that works when mounted) will
> work with the ext3 journal in place?  And that ext3 works with LVM, of
> course.

While I've looked at ext3, I haven't looked at ext3+online resize.  However,
I don't think that there would be a problem with using ext2resize on an
unmounted ext3 filesystem, since the ext3 filesystem is on-disk identical
to ext2 format filesystems.  When ext3 is unmounted, the only difference
between it and ext2 is the journal file (just a regular file), and a bit
in the superblock that says there is a journal.  It may be that ext2resize
will complain about the unknown journal flag, but it may just work anyways.

I think when there is 2.3 ext3 journal code, I will look at making ext2online
work with it.  Right now, I'm trying to fix a few bugs and get it into the
2.3.99 kernel if possible.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
