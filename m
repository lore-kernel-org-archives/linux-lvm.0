Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102221716.f1MHGN204028@webber.adilger.net>
Subject: Re: [linux-lvm] online resize of ext2
In-Reply-To: <Pine.LNX.4.21.0102221422190.3832-100000@munster.noc.fr.clara.net>
 from James at "Feb 22, 2001 02:23:12 pm"
Date: Thu, 22 Feb 2001 10:16:23 -0700 (MST)
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

James Tapping writes [re online resizing]:
> What are the version necessary for this?
> 
> kernel = ??
> package version = ??
> 
> command used = ??

Go to

http://sourceforge.net/projects/ext2resize/

and download ext2resize-1.1.16.  It has the appropriate kernel patch
for 2.2.18 and 2.4.0, along with the user tools.  Once you have patched,
recompiled, and installed your kernel, you can resize mounted filesystems
either via lvextend + ext2online, or preferrably e2fsadm (from beta5).

Note that there are some limits to online resizing, so read the ext2online
and ext2prepare man pages.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
