Return-Path: <dlt@dataventures.com>
Message-ID: <3AB5AFC0.5C4A58C9@dataventures.com>
Date: Mon, 19 Mar 2001 00:05:36 -0700
From: Donald Thompson <dlt@dataventures.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with 
 striping
References: <3AB59501.FF6ED9F3@dataventures.com> <15029.41256.426234.309500@nv.192.168.71.6>
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

Actually, I've learned a lot from Eric's comments. After looking
into hdparm and a couple other things, it looks like the kernel settings
as well as hdparm settings are set to about the worst possible (ie. safest)
I could have. Probably most importantly, they aren't using DMA, and
I'll need to recompile the kernel to get it to do so.

I actually was thinking seriously about getting a 3ware card when I
started this machine, but I wussed out and just went with the two onboard
IDE interfaces. Its definately a cheaper option than replacing or adding
SCSI drives to the system.

-Don

lvm@winux.com wrote:

> Donald Thompson writes:
> > I notice during the dd operation that my system CPU state is 90% or
> > more.  So I think I just answered my own question, I'm CPU bound.
> > Moving on, is there any known ways to improve my performance off
> > each PV with this type of hardware setup?
> > ...
> > Should I expect that I won't see the performance drop on individual PV's
> > with striping on SCSI drives? I originally setup this system with no
> > intentions of it being a high performance file server, until a few
> > people I work with decided they wanted to use it for a database machine.
> > So I'm not afraid to spend a couple grand to get some faster disks in it
> > if thats the only thing
> > thats gonna help me.
>
> Hi Donald,
>
> I think what you're seeing is to be expected from vanilla IDE.
> Not only is it not Linux LVM's fault but Linux LVM can't fix it.
> IDE controllers are not able to do the things more sophisicated
> controllers and host adapters do to increase performance in a
> multi-spindle environment.  Fortunately, there is a solution that's
> fast, cheap, and reliable.
>
> I suggest that, rather than replacing the drives with
> expensive SCSI drives and an expensive SCSI host adapter,
> you buy an Escalade Switch from http://www.3ware.com/ and
> use your existing drives.
>
> The Escalade is a hybrid controller of sorts.  It presents itself as a
> SCSI host adapter to the host's PCI bus and as multiple (up to 8)
> independent IDE controllers to the IDE drives.  It's essentially a
> cross-bar switch that lets multiple IDE drives act independently of
> one another.  They use some clever controller software to get a BETTER
> than 2x boost in read-performance when you mirror drives.
>
> It has the additional advantage of providing RAID for the attached drives.
> It supports RAID 0, 1, 10, and 5, so you get all those benefits
> without imposing ANY additional CPU load.  The controller is actually
> quite a gem and is very reasonably priced.  I've been using them on
> all of my systems where performance and/or reliability are critical.
>
> The Escalade driver is supported in the standard 2.2.x and 2.4.x Linux kernels.
>
> In short, let 3ware's hardware handle the striping/RAID and use Linux LVM
> to manage the volume.  It's a powerful combination.
>
> Larry
>
> DISCLAIMER:  These statements reflect my personal opinions... bla bla bla.
> I don't have any affiliation with 3ware or anyone else in this business.
>
> CLAIMER:  3ware makes good stuff that works very well.
> It solved my problems and it could solve yours.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
