Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102262215.f1QMF4W11409@webber.adilger.net>
Subject: Re: [linux-lvm] Slackware init
In-Reply-To: <Pine.LNX.4.20.0102261635050.7246-100000@rdb.linux-help.org> from
 "ardy@rdb.linux-help.org" at "Feb 26, 2001 04:39:46 pm"
Date: Mon, 26 Feb 2001 15:15:04 -0700 (MST)
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

Andy writes:
> On Mon, 26 Feb 2001, AJ Lewis wrote:
> > I think the issue is that /proc is not yet mounted when you call vgscan.
> > If you look at the tools/lib/lvm_dir_cache.c file at line 90, you will
> > see that it checks for /proc/partitions.  If it finds that, it only scans
> > the files in /proc/partitions.  Otherwise, it goes through all the possible
> > devices LVM recognizes. 
> 
> Well this is the problem, since I'm trying to mount the volumes from fstab
> when mount is called, how would I go about getting /proc mounted after /
> is mounted read-write, but before vgscan is run?
> Have /proc mounted with a separate command in rc.S after / is remounted rw
> and before vgscan is run?

In my Turbolinux init (I haven't used Slackware for many years), there is
an explicit mount of /proc in rc.sysinit.  Later, when it is mounting the
rest of the filesystems, it uses "mount -a -t nonfs,proc", to avoid any
error messages.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
