From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] How to transit from Linux 2.4 to 2.6 with LVM in play?
Message-ID: <20031006072116.GB2081@tykepenguin.com>
References: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu> <20030930151649.GL1593@tykepenguin.com> <Pine.LNX.4.55.0310040444040.9304@mhw.ULib.IUPUI.Edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.55.0310040444040.9304@mhw.ULib.IUPUI.Edu>
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
Date: Mon Oct  6 02:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Oct 04, 2003 at 05:12:08AM -0500, Mark H. Wood wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On Tue, 30 Sep 2003, Patrick Caulfield wrote:
> [snip]
> > If not then you'll need to patch device-mapper into your 2.4 kernel to
> > allow you to run LVM2 on it. (LVM2 will read the LVM1 metadata)
> 
> OK, I hadn't understood that, while LVM2 will read LVM1 metadata, it must
> read them through the device-mapper.  I patched up a 2.4.21 kernel and
> tried again.  But I still get this:
> 
> # ~mhwood/build/LVM2.2.00.07/tools/lvm vgs
>   /proc/lvm/VGs/vg1 exists: Is the original LVM driver using this volume group?
>   Can't lock vg1: skipping
> 
> Well, of course the original LVM driver activated my one and only volume
> group, otherwise /home wouldn't be mounted and the new 'lvm' wouldn't be
> available for testing.  So it seems to mean that "switch between LVM1 and
> LVM2" means "replace LVM1 tools with LVM2 tools and v.v.", not "you can
> use one set to inspect storage objects activated by the other".  The only
> point of compatibility between the two tool sets is that LVM2 tools
> understand the LVM1 on-disk format; they won't run concurrently.
> 

Well, no you can't run two volume manager concurrently. That would be guaranteed
to corrupt your data :-)

The solution (apart from running Debian!) is just to have the tools in two different
directories and switch between them using PATH.

-- 

patrick
