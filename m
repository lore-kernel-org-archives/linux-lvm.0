Date: Wed, 7 Jun 2000 18:23:03 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607182303.A9261@jadzia.josv.com>
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de> <20000607140043.B5442@colombina.comedia.it> <20000607145954.A22712@gruyere.muc.suse.de> <20000607180455.Y3279@jadzia.josv.com> <20000607180803.A26366@gruyere.muc.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000607180803.A26366@gruyere.muc.suse.de>; from ak@suse.de on Wed, Jun 07, 2000 at 06:08:03PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: linux-lvm@msede.com

And thus it came to pass that Andi Kleen wrote:
(on Wed, Jun 07, 2000 at 06:08:03PM +0200 to be exact)

> On Wed, Jun 07, 2000 at 06:04:55PM +0200, Jos Visser wrote:
> > The way HP's logical volume manager does it is by maintaining a kind of 
> > data log somewhere in the volume metadata.  This log (let's call it the 
> > Mirror Write Cache) is effectively a bitmap which keeps track of which 
> > blocks in the logical volume are hit by a write.  The unit of 
> > granularity here is not an individual block, but something that is 
> > called a Large Track Group (LTG, let's say a couple of MB).  Whenever 
> > all parallel writes are finished, the corresponding LTG bit in the MWC 
> > is cleared and the MWC on disk is (eventually) updated.
> > 
> > After a crash when the Volume Group is activated, all copies (plexes)
> > of a volume must be synchronized. The VM software inspects the MWC, and
> > then knows which blocks might be out of sync across the plexes. Only
> > these blocks are then synchronized using a read from the preferred plex
> > and write to all other plexes. The MWC is used to prevent a full sync
> > after a crash.
> 
> Sounds clever. I really wish Linux raid would use this optimization :-) 

Well, the source is there, unfortunately I've got something to do tonight :-)

++Jos

> (The slowness of raidcheck is a big problem) 
> 
> -Andi

-- 
The InSANE quiz master is always right!
(or was it the other way round? :-)
