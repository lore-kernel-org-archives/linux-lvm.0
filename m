Message-ID: <39752900.73B56CE@marxmeier.com>
Date: Wed, 19 Jul 2000 06:05:20 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: adilger@turbolinux.com
MIME-Version: 1.0
Subject: Re: [linux-lvm] made a big misstake
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Andreas Dilger ...

-------- Original Message --------
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200007182302.e6IN2m930146@webber.adilger.net>
Subject: Re: [linux-lvm] made a big misstake
In-Reply-To: <20000718231557.B13413@zyrgelkwyt.pdc.kth.se>
=?ISO-8859-1?Q?from_Erik_B=E5gfors_at_Jul_18=2C_2000_11=3A15=3A57_pm?=
To: =?ISO-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Date: Tue, 18 Jul 2000 17:02:47 -0600 (MDT)
CC: linux-lvm@msede.com
X-Mailer: ELM [version 2.4ME+ PL73 (25)]
MIME-Version: 1.0

Erik writes:
> I just installed a new computer the other day and since I'm a long time
> aix-user and love there lvm-system I installed the linux-lvm.
> 
> So far I am VERY impressed.  I've tried resizeing and moving end extending
> and all kinds of stuff and everything worked!! Good work!!!

Online resize and move, or offline?  I'm not sure if online moving of
PEs
is really safe if the filesystem is being used.  Of course, it is safe
if
the PE doesn't change while it is being moved...

> Now the misstake, I did not run a vgreduce before I fdisk'ed the whole 
> disk (hdb).  Now when I start up, vgscan cannot find any vg's.

Was hdb1 the first PV created in the VG?  The problem, I think, is
that
Linux LVM only keeps the VGDA on the first PV.  AIX will keep a VGDA
copy on all of the PVs, and even will keep 2 VGDAs on the first PV for
backup, in case the first one is corrupt.

> So.. anyone knows how to solve this?  Sorry I don't have better output from
> my commands but it's hard since the network is not working on it right now :)

Sorry, I don't know enough about how the VGDA backups are stored.  You
may
be able to examine the VGDA backup to find the old size of /dev/hdb1
and
then restore it, but otherwise I'm not sure what you can do.

I think Linux LVM needs to be updated to keep VGDA backups on all
disks
instead of in the filesystem, exactly for reasons like this.  Right
now,
if the first disk fails, then you are unable to access any LVs that
are
wholly on another disk.  This is bad.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of
antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               --
Dogbert
