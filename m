From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
Message-ID: <20030318101206.D30525@sistina.com>
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk> <20030312234520.GA19335@auctionwatch.com> <3E704492.DF386E61@silicide.dk> <140770000.1047758399@[192.168.200.4]> <20030315223607.GA16976@gw.silicide.dk>
Mime-Version: 1.0
In-Reply-To: <20030315223607.GA16976@gw.silicide.dk>; from jon+lvm@silicide.dk on Sat, Mar 15, 2003 at 11:36:07PM +0100
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
Date: Tue Mar 18 03:14:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Mar 15, 2003 at 11:36:07PM +0100, jon+lvm@silicide.dk wrote:
> On Sat, Mar 15, 2003 at 01:59:59PM -0600, Steven Lembark wrote:
> > 
> > 
> > -- Jon Bendtsen <jon+lvm@silicide.dk>
> > 
> > >>> that depends. You can stripe the lvm, but then you cant resize it.
> > >>> if you made a LV, then it would proberly just allokate all on one
> > >>> "disk", aka sda, and then on sdb.
> > >>
> > >>    I'm using 100% of the VG for the same LV.
> > >>
> > >>    I'm fine with not being able to resize it. Do I need the MD stuff to
> > >>    stripe it?
> > >
> > >No. You can stripe using the LV system. But i would think that
> > >if you can shutdown the LV, then you might as well stop the VG,
> > >and do it on the raw device. (except this isnt as future proof
> > >as a LVM system is).
> > 
> > Nor as flexable: with LVM you can easily grow the LV's, with
> > out LVM you are stuck with fixed partitions.
> 
> that would be included in being future proof ;-D
> Besides, he wants to stripe it, and you cant extend a stripped
> LV (as far as i know).

Yes, you can.

Stripes are linited by the physical volume size in LVM1 though and the only way
to grow a striped LV there is to pvmove the stripe to a larger PV and extend
the LV afterwards.

LVM2 doesn't have such constraint any longer :)

> 
> 
> 
> JonB
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
