Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106051800.f55I0uN9005116@webber.adilger.int>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
In-Reply-To: <3B1CC8D5.9F227A36@wrkhors.com> "from Steven Lembark at Jun 5, 2001
 06:56:05 am"
Date: Tue, 5 Jun 2001 12:00:56 -0600 (MDT)
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

Steven Lembar writes:
> It is seriously less hassle to have the root volume (with /boot
> on it) as a simple file system.  Main point is that any error
> in LVM will prevent you from booting to the point where you can
> come up far enough to clean up the LVM system.  "Doable" and 
> "make sense" aren't necessarly the same thing.

Yes, I think LVM is not quite at the stage yet where it is 100% robust
against crashes or errors during configuration changes.

> If you want to use LVM for nearly everything create a 128MB root,
> 64MB swap and few-hundred MB /var and use the 4th partition as pv00.

I don't know why you would want swap and /var as regular partitions.
Unless you have an incredibly small amount of RAM (i.e. 8MB or less)
you don't really need swap for booting.  Likewise, you don't need /var
right at boot time either.

In fact, on my 128MB laptop I don't use any swap at all, ever.  I first
turned it off when there were problems in the 2.4.x kernels with systems
going into livelock trying to flush swap pages, and never turned it on
again.  The only time I have memory problems is when I run silly filesystem
benchmarks that use 100k inodes, and the 2.4.5 kernel still doesn't flush
the inode slab cache properly.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
