Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103130056.f2D0uTi01167@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
In-Reply-To: <20010313012313.A3042@cistron.nl> from Wichert Akkerman at "Mar
 13, 2001 01:23:14 am"
Date: Mon, 12 Mar 2001 17:56:29 -0700 (MST)
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

Wichert Akkerman writes:
> It seems 0.9.1b6 is out there as well, although it's not mentioned on
> all the webpages and not on any mirrors..

Just released this minute...

> Wichert (browsing the patch to figure out why IOP reverted to 10).

IOP was reverted to 10 because the 1 reason it was changed to 11 was
removed (*).  Having IOP 11 tools, when stock 2.4.x has IOP 10 is just
asking for lots of bug reports, not to mention headaches for users.

Cheers, Andreas

(*) The VG_CREATE ioctl data was modified in an incompatible way in beta4
    to accomodate devfs users.  This caused a bug for older kernel code,
    and in beta5 the IOP was changed to 11.  After protests, the VG_CREATE
    ioctl was reverted to the original behaviour (as VG_CREATE_OLD with
    the old number), and a new ioctl with the new behaviour became VG_CREATE.
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
