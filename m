From: dgould@suse.com
Date: Wed, 3 May 2000 19:28:26 -0700
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000503192826.E4439@archimedes.suse.com>
References: <200005032350.e43NowH30788@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200005032350.e43NowH30788@webber.adilger.net>; from adilger@turbolabs.com on Wed, May 03, 2000 at 05:50:57PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

On Wed, May 03, 2000 at 05:50:57PM -0600, Andreas Dilger wrote:
> Eric M. Hopper writes:
> > 	One this exists, altering lilo to detect LVM, and automatically
> > lock the necessary logical->physical extent mappings isn't too hard.
> 
> > 	Well, the problem is that moving a few physical extents does not
> > obviously suggest re-running lilo.  Many physical extents are fine to
> > move, and trying to keep track of which physical extents lilo cares
> > about, and which one's it doesn't isn't a task I think a sysadmin should
> > have to deal with.
> 
> I agree.  If it is possible/easy to already do this, I would say do it.
> I'm also saying that if it isn't possible (or if it is, but it's a lot
> of work), then it isn't really a show stopper.  People don't often move
> their kernels around, and if they do, there is no indication that LILO
> should be run either.  The /boot filesystem (or / if no /boot) is special
> in other ways as well, and I don't think many sysadmins will have a problem
> with remembering not to move it.

I agree with the statment "I don't think many sysadmins will have a
problem", however this does not address the typical desktop or home user.

They basically do not have a sysadmin, so mechanisms that rely on a savy
sysadmin avoiding disaster (ie, won't boot) are not suitable for a large
population of potential users. These are the same people who don't know
how to use fdisk safely, and who have no idea of how to lay out
filesystems. That is, the people who could really appreciate being able
to turn over all the storage to lvm so they can just add a disk and
extend their filesystems onto it when they need more space without
worrying about the details.

> Why do you say that?  You can resize it while it is mounted:
> http://ext2resize.sourceforge.net/

Cool.

-dg
 
-- 
David Gould                                   dgould@suse.com
If simplicity worked, the world would be overrun with insects.
