Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102280537.f1S5bk529025@webber.adilger.net>
Subject: Re: [linux-lvm] Possible to raise Max LV?
In-Reply-To: <20010227172820.A1211@bar.nowhere> from "zoo1@corecomm.net" at "Feb
 27, 2001 05:28:20 pm"
Date: Tue, 27 Feb 2001 22:37:46 -0700 (MST)
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

"zoo1" writes:
> i was also considering creating two VGs, one for "user" data
> and one for "system" stuff. now, i'm trying to figure out what i thought
> the point of this was, maybe something about possible future migrations
> to multispindle systems.

One reason to do this (on AIX) at least was that for production systems
it was useful to be able to move a VG to another server if the original
server died a horrible death.  Also, if you have server failover (HA),
you need to have all of the data in a single VG in order to import it
on the backup server (of course a replicated distributed filesystem is
better).

Finally, on AIX, you have a backup tool called "mksysb" which would give
you a backup tape so that you can install a new/replacement system from
the tape, and it configures all of your LVs for you etc.  The mksysb
backup only backs up the "rootvg", which normally holds /, /usr, /tmp,
/var, /home, /boot, and swap (swap and /tmp are not backed up, but are
re-created at install time).  If you put too much stuff in your rootvg
then it was in danger of not fitting on a single tape, and you also may
restore a lot of junk you don't want on another system.

I've been thinking about doing something like mksysb for Linux, but I
need a bit more support in ext2 (to hold the last mounted directory
for rebuilding /etc/fstab).  Other than that, it would be supremely
convenient for bare-metal restores of a system (only need a boot floppy).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
