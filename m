From: Ralf Eisinger <rei@ihs.uni-stuttgart.de>
Subject: Re: [linux-lvm] RAID extension and lvm
In-Reply-To: <20020714124751.A659@connectlive.com>
Message-ID: <Pine.LNX.4.44.0207142010160.29796-100000@poseidon.ihs.uni-stuttgart.de>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Date: Sun Jul 14 13:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

Sorry, I think there is/was something confusing. We want to have the
following scenario:

- we had an hardware raid5 with three disks (so we get the size from two
  of them)
- from the view of the kernel there is one big SCSI disk
- on that disk I install lvm (for snapshots) and ext3
- ...
- we are working (heavily ;-) on that disks
- ...
- Because we are running out of disk space, I plug in a new disk
  and add them to the existing raid5. So it will have now four disks.
  This adding is done by the hardware.
- Now the disk size of the "one big disk" is changed to the new
  "netto" size of the raid5.

Is it possible to handle that with lvm and when the answer is "yes", in
which way? One point was a command named "pvresize" but I didn't find it
in my distribution (SuSE 8.0) and I find nothing about that in the HOWTO.


On Sun, 14 Jul 2002, Tim wrote:

>
> I was about to ask why on earth a good hardware array couldn't
> re-allocate the parity slices on-the-fly and act as if another disk (in
> addition to the new physical volume) was present during the
> reconstruction...
>
> It is obvious to me that a *filesystem* must be resized, and the
> software md drivers can hardly be expected to figure out all of this on
> the fly, but a *hardware* device ought to be able to treat resizing as
> just another "degraded" failure mode and rebuild.
>
> Is that in fact what happens?  I know we used to run the Sun Storedge
> arrays primarily as JBODs since we simply crammed them full to bursting,
> but somewhere out there, perhaps people are buying RAIDs that aren't
> already close to capacity ;-).
>
> I still like the slice-and-dice flexibility of LVM but it is certainly a
> drag to have to install a *minimum* of 3 physical devices to get an
> additional RAID5 physical volume in an LVM volume group!
>
>
> Quoth Ralf Eisinger:
> > On Sun, 14 Jul 2002 lembark@wrkhors.com wrote:
> >
> > >
> > > > Sorry, but there is no pvresize command.
> > >
> > > You wouldn't want it anyway.
> > >
> > > There isn't any way to "resize" an fault-tolerant RAID
> > > system (1/3/5) and you can get more flexable,
> > This is not correct. You can extend most of the common hardware raid
> > systems with raid5. Most of it during operation without shutting down.
> >
> > > reliable
> > > results with LVM than RAID0 anyway.
> > >
> > > The way to add space into a VG is by incorporating new
> > > PV's with vgextend. If you want to grow a fault-tolerant
> > > system then build new RAID5 groups and add them as new
> > > PV's.
> > But if I want to extend my system, I need at least three disks. If I
> > extend an existing raid5, I need only one disk.
> >
> > best regards
> >
> > Ralf Eisinger
> > -------------------
> > IHS - University of Stuttgart, Germany
> > Pfaffenwaldring 10
> > 70150 Stuttgart
> > Phone: (0049)-711-685-3201
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> --
>   Tim Triche, Jr.
>   Senior Engineer
>   ConnectLive Communications, Inc.
>   (202) 513-1000 || (202) 253-5666
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>

Mit freundlichen Gr=FC=DFen

Ralf Eisinger
-------------------
IHS - University of Stuttgart, Germany
Pfaffenwaldring 10
70150 Stuttgart
Phone: (0049)-711-685-3201
