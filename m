From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021105152824.E27825@sistina.com>
References: <20021004105057.B8575@sistina.com> <1034107599.28928.105.camel@pslgregory> <20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com> <1035866273.9074.74.camel@gopher> <20021029101033.A22193@sistina.com> <1035921224.1276.24.camel@gopher> <20021031134804.A491@sistina.com> <1036104859.21418.104.camel@pslgregory>
Mime-Version: 1.0
In-Reply-To: <1036104859.21418.104.camel@pslgregory>; from gkade@bigbrother.net on Thu, Oct 31, 2002 at 02:54:18PM -0800
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
Date: Tue Nov  5 08:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 31, 2002 at 02:54:18PM -0800, Gregory Ade wrote:
> On Thu, 2002-10-31 at 04:48, Heinz J . Mauelshagen wrote:
> 
> > Gregory a _different_ system is unlikely to help.
> > I was asking for changes to take affect on the system where you do have 
> > the problem.
> 
> Ahh...  That may take a little time, then.  I can certainly prepare
> another kernel for testing with high memory support turned off, and try
> to do some tests at the end of business on friday.  It might have to
> wait a little longer, though.  I'll see what they're willing to
> schedule, and get you results when I can.
> 
> > If you have a chance to reconfigure the failing system temporarily,
> > running what you did before should reproduce the same problems (segfault
> > on snapshot creation after fresh reboot) in case there's _no_ bug in the
> > large/high memory support.
> > My assumption is that it will not.
> 
> So, just for clarification, on the system where I am having this
> problem, all you want me to do is run a kernel without high memory
> support and attempt the snapshot creation?  Unfortunately, the way the
> system was assembled, the smallest I can physically reduce the RAM to is
> 4GB (two DIMMS on each memory carrier is the minimum required for the
> system to boot, and they shipped it to us with 8 1GB DIMMS.)

There's no need to physically remove any DIMMs. Just cook up a kernel
without the patches you mentioned to get that elefant going and
without high memory support.

You can boot with lilo command line containing "mem=1G" to test with
just 1Gb.

> 
> Thanks again,
> Gregory
> 
> -- 
> Gregory K. Ade <gkade@bigbrother.net>
> http://bigbrother.net/~gkade
> OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

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
