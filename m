From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] 2.4.20-pre4 and lvm-1.0.5
Message-ID: <20020828151805.A27323@sistina.com>
References: <20020827091844.B20836@sistina.com> <Pine.LNX.4.44.0208271022040.20666-100000@junior.lunanet.biz>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0208271022040.20666-100000@junior.lunanet.biz>; from dlt@lunanet.biz on Tue, Aug 27, 2002 at 10:26:45AM -0600
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
Date: Wed Aug 28 08:38:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 27, 2002 at 10:26:45AM -0600, Donald Thompson wrote:
> 
> On Tue, 27 Aug 2002, Heinz J . Mauelshagen wrote:
> 
> > On Mon, Aug 26, 2002 at 12:21:52PM -0600, Donald Thompson wrote:
> > >
> > > That is correct. I boot, vgscan fails (I'm assuming it segfaults but I
> > > really can't tell during the normal boot process what actually happened)
> > > to detect my VGs, my system goes into a maintenance mode situation since
> > > my /usr is on an LV, I login and run lsmod and absolutely no modules
> > > appear in the list. I try vgscan and/or pvscan and they fail with a
> > > segmentation fault. So yeah, if no module tree exists system boots fine,
> > > if module tree exists vgscan fails regardless of whether modules are
> > > loaded. Yes it defies logic, but I swear thats how it worked:)
> >
> > I wonder if there might be a single user case disabling lsmod to list?
> 
> Well I doubt that. Originally rtc.o was being loaded and was listed by
> lsmod, so I figured maybe that was the problem. rtc.o gets loaded I think
> automatically when my system is setting the software clock from the
> hardware. But removing rtc.o from the module tree, running depmod -a, and
> rebooting, I got the same result where vgscan segfaults.

Donald,

I figured out that it is the gendisk thing (again).
2.4.20-pre4 even segfaults on "cat /proc/partitions" !!!

Investigating...

> 
> -Don
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
