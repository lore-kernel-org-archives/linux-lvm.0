From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <NBBBKLKHMJHIJLHOGAOJMEDGJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0111291548580.4437-100000@lx1.daboard.com>
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
Date: Thu Nov 29 15:56:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of mitch@mdmiller.com
> > (b) dynamically expand the amount of space available to the 
> root partition.
> 
> Pardon me for being a neophyte here, but what else goes on the root
> partition which takes any significant or dynamic amount of space?  Isn't
> the root just a place to put all the top level directories, the contents
> of which are typically all on another partition anyway?

Exactly; virtually all the content of the root partition should
be describable as "static/unshareable" which means that it doesn't
need snapshotting in case you accidentally delete something,
or dynamically resizable.

Another of the purposes of the root filesystem is to provide
an island of sanity in a sea of madness when things go wrong;
typically the ideal is to have a system that can easily be
booted into a rescue mode from the root partition only.
In this setup one has "ghost" /usr/*bin et al directories
that are on the root filesystem but get mounted over
when you boot the system for real. These can provide the
tools you need to rescue the system.

Having root LVM just means that if anything goes wrong
with the LVM subsystem then you *need* the system to
be bootable from floppy or CDROM, and that is sometimes
less practical than having root *not* be LVM in the
first place! 
:)
anyhow this is getting away from the topic (which I'm really
interested in); LVM on mandrake 8.1 with devfs...

> 
> -- Mitch
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
