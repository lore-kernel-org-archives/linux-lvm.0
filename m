Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103192037.f2JKbQn17560@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
In-Reply-To: <3AB6687F.EBC538E0@in.tum.de> from David Vidal Rodriguez at "Mar
 19, 2001 09:13:51 pm"
Date: Mon, 19 Mar 2001 13:37:26 -0700 (MST)
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

David Vidal R. (vidalrod@in.tum.de) writes:
> Linux-version: 2.4.0
> LVM-version: 0.9 (IO-Protocoll 10) -- the version of the Linus stock
> kernel, ie, no patches applied.

What version of user tools do you have?  You should use the beta6 tools.

> pvscan detects all my PVs and adds that they belong to "an unknown VG
> (run vgscan)."
> 
> I runned pvdata -U (get UUIDs) and I got some interesting information
> about my PVs. For simplicity's sake I'll use identifiers for the UUIDs.
> 
> List of UUIDs:
> 
> part5:
> <uuid1>
> <uuid2>
> 
> part7:
> <uuid3>
> <uuid2>
> 
> part2:
> <uuid2>
> <uuid2>

Your UUIDs are broken.  This is why vgscan is failing.  All of them are
incorrect.  Each should list all 3 UUIDs on each disk.  There was a bug
in the user tools related to this, fixed in beta4 (I think).  It is
definitely fixed in beta 6.

> it would be very frustrating to lose 3.2 Gb of data that isn't messed up...

Yes, your data is still on the disk, but it would be safer if you had a
backup.

> Please tell me if you need more information in order to find out what's
> gone wrong.

If you have the new beta6 tools, but an old beta2 kernel, you need to
apply a patch to vg_create_restore.c (I posted it to lvm-devel a week
ago or so), for vgscan to work properly.  If you run vgcfgrestore with
the beta6 tools, it should write the UUIDs to disk properly.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
