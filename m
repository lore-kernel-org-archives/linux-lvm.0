Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103130140.f2D1euw01293@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
In-Reply-To: <20010313021438.A6401@cistron.nl> from Wichert Akkerman at "Mar
 13, 2001 02:14:39 am"
Date: Mon, 12 Mar 2001 18:40:56 -0700 (MST)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Wichert writes:
> > IOP was reverted to 10 because the 1 reason it was changed to 11 was
> > removed (*).  Having IOP 11 tools, when stock 2.4.x has IOP 10 is just
> > asking for lots of bug reports, not to mention headaches for users.
> 
> I figured that out by now. I think I'll add the LVM10 ioctls to 
> strace 4.4 actually :)

That would be nice.

> BTW, the current LVM tools violate the FHS by putting binaries in
> /sbin/lvm-*/. Would you accept a patch to move that to /lib/lvm-*/
> instead?

Why is FHS violated when binaries are in /sbin?  In any case, I have
my tools in /lib/lvm-iop10, and only the wrapper script in /sbin.  If
installed properly, the wrapper is < 1k, hardlinked to all tool names.

I agree it is a bit of a mess with _all_ of the tools going into /sbin,
when only a couple are needed@boot time.  However, it does make life
easier if you have trouble activating your LVs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
