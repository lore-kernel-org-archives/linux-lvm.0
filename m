From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200005032350.e43NowH30788@webber.adilger.net>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Date: Wed, 3 May 2000 17:50:57 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

Eric M. Hopper writes:
> 	One idea for making this happens is to have a way of locking
> logical extents to physical extents so that you have to use a special
> command to unlock them.  This kind of thing is already done in different
> parts of LVM to make sure you don't delete logical volumes that are in
> use, or remove physical volumes that still have extents allocated to
> them.

> 	One this exists, altering lilo to detect LVM, and automatically
> lock the necessary logical->physical extent mappings isn't too hard.

> 	Well, the problem is that moving a few physical extents does not
> obviously suggest re-running lilo.  Many physical extents are fine to
> move, and trying to keep track of which physical extents lilo cares
> about, and which one's it doesn't isn't a task I think a sysadmin should
> have to deal with.

I agree.  If it is possible/easy to already do this, I would say do it.
I'm also saying that if it isn't possible (or if it is, but it's a lot
of work), then it isn't really a show stopper.  People don't often move
their kernels around, and if they do, there is no indication that LILO
should be run either.  The /boot filesystem (or / if no /boot) is special
in other ways as well, and I don't think many sysadmins will have a problem
with remembering not to move it.

> 	While I expected that /boot would have to be ext2fs, and
> allocated a very generous 50M to it, I purposely compiled lvm into the
> kernel in the hopes of one day having an lvm / parition.  Of course,
> resizing an lvm / partition is a dicey affair.  :-)

Why do you say that?  You can resize it while it is mounted:
http://ext2resize.sourceforge.net/

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
