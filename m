Return-Path: <lembark@wrkhors.com>
Message-ID: <3AB60D44.3036CD9C@wrkhors.com>
Date: Mon, 19 Mar 2001 07:44:36 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with 
 striping
References: <01C0B04F.5EFB3400.smdenton@bellsouth.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I tend to agree.  In general software RAID will bog the system down
> and if performance is key, you should take the load off the CPU
> whereever possible.  The obvious conclusion with data volumes is to
> use a hardware RAID controller, beit SCSI or IDE... I've used both
> SCSI raid controllers and the IDE promise raid controller with good
> results.  The other thing that may be killing your performance is IO
> contention.  Check for other highly-used devices on the same PCI
> bus... on PCs there are quite a few points of possible contention.
> 
> Just -my- 2 cents :)
> 
> > On Mon, 19 Mar 2001 lvm@winux.com wrote:
> >
> >
> > > Donald Thompson writes:
> > > > I notice during the dd operation that my system CPU state is
> > > > 90% or more.  So I think I just answered my own question, I'm
> > > > CPU bound. Moving on, is there any known ways to improve my
> > > > performance off each PV with this type of hardware setup?
> > > > ...
> > > > Should I expect that I won't see the performance drop on
> > > > individual PV's with striping on SCSI drives? I originally
> > > > setup this system with no intentions of it being a high
> > > > performance file server, until a few people I work with decided
> > > > they wanted to use it for a database machine. So I'm not afraid
> > > > to spend a couple grand to get some faster disks in it if thats
> > > > the only thing
> > > > thats gonna help me.
> > >
> > > Hi Donald,
> > >
> > > I think what you're seeing is to be expected from vanilla IDE.
> > > Not only is it not Linux LVM's fault but Linux LVM can't fix it.
> > > IDE controllers are not able to do the things more sophisicated
> > > controllers and host adapters do to increase performance in a
> > > multi-spindle environment.  Fortunately, there is a solution
> > > that's fast, cheap, and reliable.
> > >
> > > I suggest that, rather than replacing the drives with
> > > expensive SCSI drives and an expensive SCSI host adapter,
> > > you buy an Escalade Switch from http://www.3ware.com/ and
> > > use your existing drives.
> > >
> > > The Escalade is a hybrid controller of sorts.  It presents itself
> > > as a SCSI host adapter to the host's PCI bus and as multiple (up
> > > to 8) independent IDE controllers to the IDE drives.  It's
> > > essentially a cross-bar switch that lets multiple IDE drives act
> > > independently of one another.  They use some clever controller
> > > software to get a BETTER than 2x boost in read-performance when
> > > you mirror drives.
> > >
> > > It has the additional advantage of providing RAID for the
> > > attached drives. It supports RAID 0, 1, 10, and 5, so you get all
> > > those benefits without imposing ANY additional CPU load.  The
> > > controller is actually quite a gem and is very reasonably priced.
> > >  I've been using them on all of my systems where performance
> > > and/or reliability are critical.
> > >
> > > The Escalade driver is supported in the standard 2.2.x and 2.4.x
> > > Linux kernels.
> > >
> > > In short, let 3ware's hardware handle the striping/RAID and use
> > > Linux LVM to manage the volume.  It's a powerful combination.

Escalade is a nice idea, but still runs afoul of the interrupt
& bus design of PC's.  for high-i/o applications "PC" hardware
doesn't work all that well.  main problem here is delivering the
raw datat to an Esc. controller through the existing PC.  the
add'l cpu load in this case comes from the bottom-half of drivers
on heavily loaded cards that spend too much time waiting for 
access to the shared card.  

these are a distinct improvement over stock IDE or software RAID
but don't expect them to suddenly turn your PC into a SparcServer
or K400.

note on the benchmark:  you can push the CPU to 100% w/ the dd
of=/dev/null
trick because there isn't any latency on the destination side.  with
a normal disk the cpu has time between writes due to bus & hardware
access.  if you want to bring the system to its knees try:

	dd if=/dev/zero of=/dev/null bs=8k;

lacking any hardware or bus latency, this hits 100% immediately.

using /dev/null and /dev/zero for i/o is useful but you have to 
take the results with a big chunk of salt.  rather than watch the
CPU idle % you might get better results from procinfo -n10 -D and
watching the interrupt vs. i/o rates.  tickle hdparm until the 
int / blocks is low (there are some useful config options floating
around, i can look them up if you can't find them).

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
