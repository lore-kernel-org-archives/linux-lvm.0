Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106041737.f54HbWbB020317@webber.adilger.int>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
In-Reply-To: <20010603230453.A1829@pc.ilinx> "from Brian J. Murrell at Jun 3,
 2001 11:04:53 pm"
Date: Mon, 4 Jun 2001 11:37:32 -0600 (MDT)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Brian, you write:
> It's not so much the boot sector I am worried about.  What concerns me
> is that when I set up my new disk (on /dev/hdc1) with LVM, LVM is
> associating the device /dev/hdc1 with the PV.  What happens to that
> association when I move the disk to the primary ide bus and it becomes
> /dev/hda1?

If you run a vgscan within initrd (and also after you have moved to the
new disk), then LVM will know that the disk has moved.  Not a problem.

> > I put a (non-LVM) rescue boot partition on my disk which has basically
> > everything from /bin, /sbin, and some /lib/lib*, /lib/modules/<kernel>.
> 
> Everything that is needed for LVM you mean or do you mean you copied
> everything from your root filesystem?  If the latter, would that not
> be overkill?

Not necessarily everything.  It is about 50MB or so, but it is a fully
usable environment which allows me to fix problems.  I need this on
occasion because I do a lot of development on that system and run into
bad kernels, unmountable root filesystems, etc. on occasion.

> But I like the idea.  I was thinking it was time to move on from
> emergency boot diskette(s) to a boot CD-ROM.

The nice thing about an emergency boot partition is that you always have
it handy - no chance of losing this one.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
