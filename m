From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] RAID extension and lvm
Message-ID: <20020714124751.A659@connectlive.com>
References: <15050000.1026663876@duke> <Pine.LNX.4.44.0207141936490.29308-100000@poseidon.ihs.uni-stuttgart.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0207141936490.29308-100000@poseidon.ihs.uni-stuttgart.de>; from rei@ihs.uni-stuttgart.de on Sun, Jul 14, 2002 at 07:40:56PM +0200
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
Date: Sun Jul 14 12:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I was about to ask why on earth a good hardware array couldn't
re-allocate the parity slices on-the-fly and act as if another disk (in
addition to the new physical volume) was present during the
reconstruction...

It is obvious to me that a *filesystem* must be resized, and the
software md drivers can hardly be expected to figure out all of this on
the fly, but a *hardware* device ought to be able to treat resizing as
just another "degraded" failure mode and rebuild.

Is that in fact what happens?  I know we used to run the Sun Storedge
arrays primarily as JBODs since we simply crammed them full to bursting,
but somewhere out there, perhaps people are buying RAIDs that aren't
already close to capacity ;-).

I still like the slice-and-dice flexibility of LVM but it is certainly a
drag to have to install a *minimum* of 3 physical devices to get an
additional RAID5 physical volume in an LVM volume group!


Quoth Ralf Eisinger:
> On Sun, 14 Jul 2002 lembark@wrkhors.com wrote:
> 
> >
> > > Sorry, but there is no pvresize command.
> >
> > You wouldn't want it anyway.
> >
> > There isn't any way to "resize" an fault-tolerant RAID
> > system (1/3/5) and you can get more flexable,
> This is not correct. You can extend most of the common hardware raid
> systems with raid5. Most of it during operation without shutting down.
> 
> > reliable
> > results with LVM than RAID0 anyway.
> >
> > The way to add space into a VG is by incorporating new
> > PV's with vgextend. If you want to grow a fault-tolerant
> > system then build new RAID5 groups and add them as new
> > PV's.
> But if I want to extend my system, I need at least three disks. If I
> extend an existing raid5, I need only one disk.
> 
> best regards
> 
> Ralf Eisinger
> -------------------
> IHS - University of Stuttgart, Germany
> Pfaffenwaldring 10
> 70150 Stuttgart
> Phone: (0049)-711-685-3201
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
  Tim Triche, Jr.
  Senior Engineer
  ConnectLive Communications, Inc.
  (202) 513-1000 || (202) 253-5666
