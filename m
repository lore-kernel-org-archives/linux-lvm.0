Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103130059.f2D0xsJ01176@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
In-Reply-To: <GIEGKMCLIJBKBNBCCHEACEJACAAA.heimdall@mail.org> from Daniel E Whicker
 at "Mar 12, 2001 06:16:49 pm"
Date: Mon, 12 Mar 2001 17:59:54 -0700 (MST)
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

Daniel Whiker writes:
> Thanks for helping.  I did in fact have devfs compiled in and mounted to an
> alternative path.

Currently devfs and LVM don't work well together, especially if it is not
mounted on /dev.  My patch fixes a small part of this, but it is still
safer to simply configure devfs out of the kernel when using LVM, until
your system is working properly.

> Beyond that, everything is pretty vanilla.  I'm rebuilding the OS on that
> system at the moment, but as soon as I'm done, I'll get 2.4.2 with LVM
> .9.1b5 and your patch installed and see how it goes from there.  In the
> meantime, is there any way of restoring the "HM" magic to the PVs
> nondestructively?

I think this may have been caused by the devfs strangeness.  Start out
with devfs out of the kernel entirely, and go from there.  I don't think
2.4.2 will help you.  You need to apply an LVM kernel patch anyways.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
