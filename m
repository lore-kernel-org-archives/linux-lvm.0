Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104061549.f36FnKn09371@webber.adilger.int>
Subject: Re: [linux-lvm] Help! vgchange -> invalid argument
In-Reply-To: <F3YA5kcDj6QqW9F0qnq000014e8@hotmail.com> from cjs 2895 at "Apr
 6, 2001 11:00:08 am"
Date: Fri, 6 Apr 2001 09:49:20 -0600 (MDT)
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

Christopher writes:
> I am about one step away from setting up a new system with LVM!
> There is just one thing keeping me back. When I try to activate
> the volume group I've created -- vgchange does this for sure, I
> get an error "Invalid Argument". According to all the debug
> output I'm passing all of my checks, its the last point where
> the volume group is brought online that this dies. I think this
> is a known problem with a known fix, but I can't find a patch
> in the mailing list. Could someone post it here or to me
> in e-mail?

You can find it in lvm-devel (or probably in this list as well).
I posted it, and it relates to VG_CHANGE ioctl.

> My kernel is stock 2.4.3.
> My tools are stock 0.9.1-Beta6

If you use the current CVS code (soon to be 0.9.1b7) the problem is
fixed there as well.  Alternately, you can apply a kernel patch
(see PATCHES/README) to fix the problem (and many other problems also).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
