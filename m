Date: Wed, 7 Jun 2000 14:59:54 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607145954.A22712@gruyere.muc.suse.de>
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de> <20000607140043.B5442@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20000607140043.B5442@colombina.comedia.it>; from bluca@comedia.it on Wed, Jun 07, 2000 at 02:00:43PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Jun 07, 2000 at 02:00:43PM +0200, Luca Berra wrote:
> On Tue, Jun 06, 2000 at 06:41:38PM +0200, Andi Kleen wrote:
> > On a real production system you probably should not use software RAID1
> > or RAID5 though. It is unreliable in the crash case though because
> > it does not support data logging. In this case a hardware RAID controller
> > is the better alternative. Of course you can run LVM on top of it.
> I fail to get your point, what makes hw raid more reliable than sw raid?
> why are you saying that sw raid is unreliable.

RAID1 and RAID5 require atomic update of several blocks (parity or mirror
blocks). If the machine crashes inbetween writing such an atomic update
it gets inconsistent.

In RAID5 that is very bad (e.g. when the parity block is not uptodate
and another block is unreadable) you get silent data corruption. In
RAID1 with a slave device you at worst get oudated data (may cause
problems with journaled file systems or programs that fsync/O_SYNC
really guarantee stable on disk storage). raidcheck can fix that in
a lot of cases, but not in all: sometimes it cannot decide if a 
block contains old or new data. 

Hardware RAID usually avoids the problem by using a battery backed 
log device for atomic updates. Software Raid could do the same
by logging block updates in a log (e.g. together with the journaled
file system), but that is not implemented in Linux ATM. It would
also be a severe performance hit.


-Andi 
