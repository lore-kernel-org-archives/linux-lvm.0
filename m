From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021009133650.E23965@sistina.com>
References: <1033579350.6468.61.camel@gopher> <20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory>
Mime-Version: 1.0
In-Reply-To: <1034107599.28928.105.camel@pslgregory>; from gkade@bigbrother.net on Tue, Oct 08, 2002 at 01:06:39PM -0700
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
Date: Wed Oct  9 06:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 08, 2002 at 01:06:39PM -0700, Gregory Ade wrote:
> On Fri, 2002-10-04 at 01:50, Heinz J . Mauelshagen wrote:
> > 
> > Gregory,
> > 
> > running "lvcreate --size 8G --snapshot --name db1_snap vg01" should give
> > a syntax error rather than "... doesn't exist".
> > 
> > Did you eventually run
> > "lvcreate --size 8G --snapshot --name db1_snap /dev/vg01/db1"
> > instead?
> 
> according to the manpage and help for lvcreate, the syntax was correct. 
> The problem was that vg01 really didn't exist. :)
> 
> That, however, is not the problem.

<pickymode>
True, it is not. Manual page says "OriginalLogicalVolumePath".
</pickymode>

> 
> > I guess the problem has disappeared after your reboot, right?
> > If so, are you able to repeat the problem?
> 
> Kinda...

:)

> 
> I'm hesitant to do any serious poking at it just yet, as the machine
> having the problems is already in production and being heavily used.

I understand.

Having read the information below you've got various different
HW components in the machine in question. If you have a chance,
please try to put load on the machine on non LVM devices and see if that
causes problems as well.

There's a variaty of nasty things which can hit you under load:

- one or more CPUs with heat problems
- heat problems with mainboard components or drives
  (i.e. your airflow could be insufficient under load)
- flaky cables/connectors
- flaky drivers (as you already refered to)
- other kernel flaws

Tell me about your test results, please.

Regards,
Heinz    -- The LVM Guy --

> 
> Rebooting mostly clears up the problem.  After a reboot, I can use
> lvdisplay and vgdisplay to my heart's content.  I can lvcreate and
> lvremove lv's from the vg without problem.  vgscan and lvscan work as
> expected.
> 
> It seems that the `vgchange -a n` in /etc/init.d/halt hangs, though.  On
> other systems, this is not the case, even with the same version kernel &
> LVM utilities (2.4.19 & 1.0.5, respectively).
> 
> another point is that this system is configured with root (/) on LVM
> (/dev/vg00/root).  On other systems we have configured this way, we
> occasionally get an error message that vgchange was unable to deactivate
> the volume group because there were open volumes.  On this machine, it
> just hangs, requiring a power-cycle to do a reboot (why did they stop
> putting reset switches in Intel servers???)
> 
> I haven't tried creating a snapshot yet, mainly because I'm gun shy
> right now, and I don't want to risk imposing brain damage on the system
> in the middle of the week.
> 
> I'm also experiencing bizarre behavior with this system when doing any
> operations involving rapid traversal of the filesystems, which again
> does not happen on any of our other systems with identical software
> loaded.  The best example is to run:
> 
> 	find / > /dev/null
> 
> On any other system, this just forces the system to read every directory
> on the filesystem.  not very useful, but it doesn't do much more than
> take 10%CPU on a P-III 800 for a little bit.  On this system (Quad
> 1.6GHz Xeon, HyperThreading disabled, 8GB RAM, 8GB Swap, 100GB RAID-10),
> running that command will eventually choke up the machine, forcing find
> and kswapd to >40%CPU (according to top), and occasionally bringing
> kupdated into the mix.
> 
> I'm currently trying to figure out if the problem is with LVM, if I need
> to double the swap space to 16GB, or if I need to find a new driver for
> the RAID card.  As it is, any intrusive testing on this system will have
> to wait until I'm physically at the location with this server, which
> will likely happen on or about Sat. Oct. 19, so i can have the machine
> to myself on a weekend.
> 
> I'm starting to get desperate for a solution...
> 
> -- 
> Gregory K. Ade <gkade@bigbrother.net>
> http://bigbrother.net/~gkade
> OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
