From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021031134804.A491@sistina.com>
References: <1033579350.6468.61.camel@gopher> <20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory> <20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com> <1035866273.9074.74.camel@gopher> <20021029101033.A22193@sistina.com> <1035921224.1276.24.camel@gopher>
Mime-Version: 1.0
In-Reply-To: <1035921224.1276.24.camel@gopher>; from gkade@bigbrother.net on Tue, Oct 29, 2002 at 11:53:44AM -0800
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
Date: Thu Oct 31 06:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 29, 2002 at 11:53:44AM -0800, Gregory K. Ade wrote:
> On Tue, 2002-10-29 at 01:10, Heinz J . Mauelshagen wrote:
> > 
> > Gregory,
> > 
> > as Jon already thought, this seems to be a flaw in the VM subsystem.
> > 
> > The ksymoops you provided shows that, because it fails in vmalloc when
> > lvm_snapshot_alloc_hash_table() tries to allocated virtual memory for the
> > copy-on-write exeception table it needs to track the changes which happen
> > to the original logical volume.
> > 
> > Is there any chance to prove that by running the system with less than 2GB
> > of memory and _without_ high memory support for a test run?
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> 
> Actually, yes, I can run this on several other smaller-memory systems. 
> I've got a machine I've been working on setting up that's 2GB exactly,
> and several others running 2.4.19 & LVM 1.0.5 with less than 1GB of
> ram.  However, I've not had any of these systems produce errors like
> these.  I can run the 2GB system with and without high memory support
> and try to induce a similar failure.
> 
> Are there any specific tests you'd like me to run on this other system,
> in case I can't induce an Oops on it?

Gregory a _different_ system is unlikely to help.
I was asking for changes to take affect on the system where you do have 
the problem.
If you have a chance to reconfigure the failing system temporarily,
running what you did before should reproduce the same problems (segfault
on snapshot creation after fresh reboot) in case there's _no_ bug in the
large/high memory support.
My assumption is that it will not.

> 
> Thanks,
> 
> Gregory
> 
> -- 
> Gregory K. Ade <gkade@bigbrother.net>
> http://bigbrother.net/~gkade
> OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu



-- 

Regards,
Heinz    -- The LVM Guy --

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
