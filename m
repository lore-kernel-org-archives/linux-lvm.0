Message-Id: <200202070309.g1739t930318@stf.comptex.com.au>
From: "Richard Barbara" <richard@stf.comptex.com.au>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
MIME-Version: 1.0
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
Date: Wed Feb  6 21:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Does anyone have an opinion as to what the cost of storage should be (say
in $ /Gbyte) to enable wider use of 'direct to disk' backup?
Would tape emulation help in this issue?  

----------
> From: Jeff Layton <laytonjb@bellsouth.net>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
> Date: Thursday, 7 February 2002 13:04
> 
> James Mello wrote:
> 
> > >    Large amounts of data brings in even more issues. How do
> > > you stream Petabytes of data to tape in a resonable of time?
> > > Unless you spend HUGE amounts of money to buy multiple
> > > silos to handle slices of the data and put in a fantastic network
> > > to handle the traffic, you can't backup in a reasonable amount
> > > of time. In this case, disk is your only choice. The data size
> > > break point between disk and tape depends on lots of things,
> > > but that point is moving downward all the time (perhaps in
> > > the Terabyte range).
> >
> > Petabytes are another matter entirely. If you must absolutely have that
> > much data backed up, you start looking at more exotic solutions.
Backing
> > up solely to disk is *way* to expensive, hence the wonderful, but of
> > poorly implemented idea of HSM.... Disk and tape :)
> 
> Yes, HSM has never panned out the way it was supposed to.
> However, try backing up Petabytes with tape in a reasonable
> amount of time. While I've never configure such a system,
> the numbers from systems I have seen indicate that disk is
> much cheaper than tape (even if tape is a feasible solution
> because of speed).
> 
> Jeff
> 
> 
> >
> >         -- Cheers
> >         -- James
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
