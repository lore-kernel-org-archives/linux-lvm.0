From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009202039.e8KKdkm25172@webber.adilger.net>
Subject: Re: [linux-lvm] LVM + online resizing e2fs patches
In-Reply-To: <01C022D8.286A2860.smdenton@bellsouth.net> "from S. Michael Denton
 at Sep 20, 2000 07:55:32 am"
Date: Wed, 20 Sep 2000 14:39:46 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Scott Denton writes:
> > Actually, I don't _think_ the ext2online and LVM patches should conflict
> > at all.  The ext2online patch only changes files in fs/ext2, while LVM
> > changes files in drivers/block.  I have both working on my systems
> > (using my LVM 0.8final patch, and my own ext2online patch), so if you
> > want these instead, let me know...
> 
> Would they work with 2.2.13?  Or would I have to upgrade my kernel?

The ext2online patch was written originally on 2.0, and it has moved
relatively unscathed through 2.3.99.  However, recent changes in the
VFS and ext2 code have likely broken the patch (I'm currently developing
on 2.2, and haven't had a chance/filesystem-I-want-to-destroy for testing
on 2.4.0-current).  So, yes ext2online will work with 2.2.13.

As for the LVM patches, I can't really say, but the changes are likely
to be trivial.  Note that my LVM patch needs rawio patches for LVM snapshots,
and is made against a kernel with RAID 0.90 patches.  Both of these are
relatively easy to fix if you really want to stick with 2.2.13.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
