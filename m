From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Paralell IO performance with LVM and XFS
Message-Id: <20020117175832.GL1066@tykepenguin.com>
References: <200201171229.g0HCTVe10111@localhost.localdomain>
    <20020117125640.35CF032FDE6@lyta.coker.com.au>
    <20020117152130.GG1066@tykepenguin.com>
    <20020117173959.5BF1F35FA9E@lyta.coker.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020117173959.5BF1F35FA9E@lyta.coker.com.au>
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
Date: Thu Jan 17 11:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 17, 2002 at 06:39:58PM +0100, Russell Coker wrote:
> On Thu, 17 Jan 2002 16:21, Patrick Caulfield wrote:
> > On Thu, Jan 17, 2002 at 01:56:39PM +0100, Russell Coker wrote:
> > > Striping across 4 disks will never give you 4* the throughput of 1 disk,
> > > but you would hope for double the throughput.
> >
> > A graph of some tests I did using bonnie++ and striping on fibre-channel
> > disks is online at http://www.cix.co.uk/~tykepenguin/stripetest.png
> 
> Firstly, I suggest that you skip the per-char tests when graphing such 
> things, it's generally not very interesting and just clutters the graph.
> 
> Next the seeks, block-io, and create/delete test results belong on different 
> graphs because the Y axis measures different things, and because it needs 
> different scales.

Yeah, I just graphed the whole output - I only did it for my own interest
really, it's not meant to be an official test or especially meaningful. I just
thought it might be interesting. The only reason it's still on my web site is
that I forgot to remove it.

> Finally what graphing program did you use?

Err...I'd rather not say...
 
> > The most obvious bottleneck there was the actually FC interface which ran
> > out of capacity at 3 stripes.
> 
> Why are you so certain that it's the FC interface at fault?  The FC interface 
> should be able to do more than 60MB/s.

I don't suppose I am that certain to be honest but I had so much trouble with
the Linux drivers for this card that at the time I was prepared to blame
everything from Global Warming downwards on it. 

patrick
