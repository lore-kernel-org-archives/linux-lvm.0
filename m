From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
Message-ID: <20030312234520.GA19335@auctionwatch.com>
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030312221320.GA15196@gw.silicide.dk>
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
Date: Wed Mar 12 17:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 12, 2003 at 11:13:20PM +0100, jon+lvm@silicide.dk wrote:
> On Wed, Mar 12, 2003 at 11:52:17AM -0800, Petro wrote:
> > I've got a couple of brand new boxes I'm trying to get LVM set up
> > properly on. 
> > These machines have 6 200GiB drives attached to a 3ware controller card,
> > for a total of 1,200,000,000,000 bytes of storage. 
> later down you write you need speed. In that case i would suggest
> ditching the hardware raid, and use pure software raid, it is faster.
> I dont mind 3ware, i have dome myself, but my benchmarking revealed
> that software was faster.

    The production data we gathered showed the opposite--at least for the 
    3ware cards in our environment (we had about 5-8% more overhead
    running the 3ware cards RAID0 than we did running either raw disk
    (cheap IDE cards) or having the 3ware card pretend to be a jbod. 

    This wasn't benchmarking, this was set it up and throw it over the
    wall for a month or two and see what the numbers looked like. 

    A really nervous way of testing. 
    
> > I'm running kernel 2.4.18, with LVM version 1.0.3, and the lvmtools
> > version 1.0.1rc3-1 (long story, but upgrading is a path-of-last-resort).
> if you need snapshots, get 1.0.7

    If I get the chance I'm probably going to ditch LVM since I don't
    need snapshots. I initially was give snapshots as a requirement. 

    Unfortunately I'll probably not get a chance to redo these. 
  
> > Initially I had the drives set up as a single raid0 device, but doing a
> > pvcreate on it failed with a message that said something about "can't
> > get size". 
> strange, linux should be able to handle 2T block devices.

    Yes. It should. 

    But when I did a pvcreate /dev/sda, where sda was 6 drives in a
    raid0, it failed. 
    
> > So I set up 2 3 disk RAID0 devices, and did a vgcreate /dev/sda /dev/sdb.
> > Now, one question I have is: 
> >     Does this concatenate the devices, or does it interleave the
> >     devices? IE do I have a stripe of stripes, or two stripes? 
> that depends. You can stripe the lvm, but then you cant resize it.
> if you made a LV, then it would proberly just allokate all on one
> "disk", aka sda, and then on sdb.
 
    I'm using 100% of the VG for the same LV. 

    I'm fine with not being able to resize it. Do I need the MD stuff to
    stripe it? 

> > Since I need the disk write rate of all 6 drives, I'm *REALLY* hoping
> > that it's interleaved. 
> sorry... it is not interleaved.
> JonB
> ps: how big a partition do you need stripping for? Do you need the
> advanced LVM stuff, like resize, snapshot...

    I need slightly over 1T of formatted disk space on each system. 

    Which means i really need to find a way to send an <alt-3> through
    an ssh session to a telnet window. 

-- 
"On two occasions, I have been asked [by members of Parliament], 'Pray, 
Mr. Babbage, if you put into the machine wrong figures, will the right 
answers come out?' I am not able to rightly apprehend the kind of confusion 
of ideas that could provoke such a question." -- Charles Babbage 
