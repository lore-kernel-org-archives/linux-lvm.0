From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] Paralell IO performance with LVM and XFS
References: <200201171229.g0HCTVe10111@localhost.localdomain>
    <20020117125640.35CF032FDE6@lyta.coker.com.au>
    <20020117152130.GG1066@tykepenguin.com>
In-Reply-To: <20020117152130.GG1066@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020117173959.5BF1F35FA9E@lyta.coker.com.au>
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
Date: Thu Jan 17 11:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Patrick Caulfield <caulfield@sistina.com>

On Thu, 17 Jan 2002 16:21, Patrick Caulfield wrote:
> On Thu, Jan 17, 2002 at 01:56:39PM +0100, Russell Coker wrote:
> > Striping across 4 disks will never give you 4* the throughput of 1 disk,
> > but you would hope for double the throughput.
>
> A graph of some tests I did using bonnie++ and striping on fibre-channel
> disks is online at http://www.cix.co.uk/~tykepenguin/stripetest.png

Firstly, I suggest that you skip the per-char tests when graphing such 
things, it's generally not very interesting and just clutters the graph.

Next the seeks, block-io, and create/delete test results belong on different 
graphs because the Y axis measures different things, and because it needs 
different scales.

Finally what graphing program did you use?

> The most obvious bottleneck there was the actually FC interface which ran
> out of capacity at 3 stripes.

Why are you so certain that it's the FC interface at fault?  The FC interface 
should be able to do more than 60MB/s.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
