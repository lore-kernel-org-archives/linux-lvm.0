Date: Wed, 7 Jun 2000 18:04:55 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607180455.Y3279@jadzia.josv.com>
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de> <20000607140043.B5442@colombina.comedia.it> <20000607145954.A22712@gruyere.muc.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000607145954.A22712@gruyere.muc.suse.de>; from ak@suse.de on Wed, Jun 07, 2000 at 02:59:54PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: linux-lvm@msede.com

And thus it came to pass that Andi Kleen wrote:
(on Wed, Jun 07, 2000 at 02:59:54PM +0200 to be exact)

> On Wed, Jun 07, 2000 at 02:00:43PM +0200, Luca Berra wrote:
> > On Tue, Jun 06, 2000 at 06:41:38PM +0200, Andi Kleen wrote:
> > > On a real production system you probably should not use software RAID1
> > > or RAID5 though. It is unreliable in the crash case though because
> > > it does not support data logging. In this case a hardware RAID controller
> > > is the better alternative. Of course you can run LVM on top of it.
> > I fail to get your point, what makes hw raid more reliable than sw raid?
> > why are you saying that sw raid is unreliable.
> 
> RAID1 and RAID5 require atomic update of several blocks (parity or mirror
> blocks). If the machine crashes inbetween writing such an atomic update
> it gets inconsistent.
> 
> In RAID5 that is very bad (e.g. when the parity block is not uptodate
> and another block is unreadable) you get silent data corruption. In
> RAID1 with a slave device you at worst get oudated data (may cause
> problems with journaled file systems or programs that fsync/O_SYNC
> really guarantee stable on disk storage). raidcheck can fix that in
> a lot of cases, but not in all: sometimes it cannot decide if a 
> block contains old or new data. 
> 
> Hardware RAID usually avoids the problem by using a battery backed 
> log device for atomic updates. Software Raid could do the same
> by logging block updates in a log (e.g. together with the journaled
> file system), but that is not implemented in Linux ATM. It would
> also be a severe performance hit.

The way HP's logical volume manager does it is by maintaining a kind of 
data log somewhere in the volume metadata.  This log (let's call it the 
Mirror Write Cache) is effectively a bitmap which keeps track of which 
blocks in the logical volume are hit by a write.  The unit of 
granularity here is not an individual block, but something that is 
called a Large Track Group (LTG, let's say a couple of MB).  Whenever 
all parallel writes are finished, the corresponding LTG bit in the MWC 
is cleared and the MWC on disk is (eventually) updated.

After a crash when the Volume Group is activated, all copies (plexes)
of a volume must be synchronized. The VM software inspects the MWC, and
then knows which blocks might be out of sync across the plexes. Only
these blocks are then synchronized using a read from the preferred plex
and write to all other plexes. The MWC is used to prevent a full sync
after a crash.

++Jos


-- 
The InSANE quiz master is always right!
(or was it the other way round? :-)
