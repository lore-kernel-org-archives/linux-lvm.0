From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009211952.e8LJq6t07194@webber.adilger.net>
Subject: Re: [linux-lvm] LVM + online resizing e2fs patches
Date: Thu, 21 Sep 2000 13:52:06 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

Erik writes:
> On Wed, Sep 20, 2000 at 02:39:46PM -0600, Andreas Dilger wrote:
> > The ext2online patch was written originally on 2.0, and it has moved
> > relatively unscathed through 2.3.99.  However, recent changes in the
> > VFS and ext2 code have likely broken the patch (I'm currently developing
> > on 2.2, and haven't had a chance/filesystem-I-want-to-destroy for testing
> > on 2.4.0-current).  So, yes ext2online will work with 2.2.13.
> 
> Any idea when you will try 2.4.x?
> My dream is really a Journaling filesystem with online resize for 2.4.x.

It shouldn't be too hard to get ext2 online resizing for 2.4, but I can't
do ext3 resizing until ext3 is available for 2.4...  I will probably start
working with Stephen to move to 2.4 in the next month or two, because he
is nearly done metadata-only journalling...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
