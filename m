From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
Message-ID: <20030314002507.GE22003@auctionwatch.com>
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk> <20030312234520.GA19335@auctionwatch.com> <3E704492.DF386E61@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E704492.DF386E61@silicide.dk>
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
Date: Thu Mar 13 18:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Mar 13, 2003 at 09:42:58AM +0100, Jon Bendtsen wrote:
> Petro wrote:
> [cut]
> >     The production data we gathered showed the opposite--at least for the
> >     3ware cards in our environment (we had about 5-8% more overhead
> >     running the 3ware cards RAID0 than we did running either raw disk
> >     (cheap IDE cards) or having the 3ware card pretend to be a jbod.
> you mean the cpu was more used ?

    No, meaning we got better overall performance out of Mysql. Fewer
    running threads, threads connected and disconnected better etc. 

  
> >     Unfortunately I'll probably not get a chance to redo these.
> a shame, because if you dont need snapshots, LVM is a overhead.

    It may come to that. 
  
> > > > Since I need the disk write rate of all 6 drives, I'm *REALLY* hoping
> > > > that it's interleaved.
> > > sorry... it is not interleaved.
> > > JonB
> > > ps: how big a partition do you need stripping for? Do you need the
> > > advanced LVM stuff, like resize, snapshot...
> >     I need slightly over 1T of formatted disk space on each system.
> >     Which means i really need to find a way to send an <alt-3> through
> >     an ssh session to a telnet window.
> may i suggest
> http://www.realweasel.com/intro.html
> It's a pci GFX<->serial card.
> I dont have one, but i want 3. If you buy one... do tell us how it
> works.

    That won't solve the problem. 

    See, my servers are 55 miles down the road. I ssh to a machine that
    connects to a private network, on which are a bunch of portmasters
    and APCs. I then telnet to the Portmaster ports, which hook to cua0. 

    It looks basically like I call he "smart hands" at the Colo and talk
    them through redoing the RAID volumes. 

   

-- 
"On two occasions, I have been asked [by members of Parliament], 'Pray, 
Mr. Babbage, if you put into the machine wrong figures, will the right 
answers come out?' I am not able to rightly apprehend the kind of confusion 
of ideas that could provoke such a question." -- Charles Babbage 
