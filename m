Subject: Re: [linux-lvm] LVM 1.0.4 pvmove is broken
Message-ID: <20020523212702.GA981@fib011235813.fsnet.co.uk>
References: <F888C30C3021D411B9DA00B0D0209BE8038F94F9@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F94F9@cvo-exchange.cvo.roguewave.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu May 23 16:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 23, 2002 at 10:18:14AM -0700, Poul Petersen wrote:
> > It is well known that pvmove of live volumes in LVM1 is broken for a
> > couple of reasons, the most obvious being the deadlock under memory
> > pressure that you are experiencing.
> 
> 	If it is so well know, should it be in the known_bugs for 1.0.4? I
> saw
> the following entries:
> 
> - There is a very slight change that pvmove on a live system can
>   corrupt your data.  A pvmove on an offline (ie. not mounted) LV
>   should be fine.
> 
> - There is also a chance under high load that a live pvmove will
>   deadlock your system.
> 
> 	However, what I have been seeing is not a "very slight chance"; it
> fails
> every time. Also, whether or not the LV is mounted doesn't matter - in all
> of the
> failures I have seen the LV was *not* mounted. The three critical failure
> elements seem 
> to be:
> 
> 	1) use the LVM 1.0.4 Makefile generated patch for 2.4.18
> 	2) use 1.0.4 pvmove tool.
> 	3) Use an active VG, that is vgchange -ay
> 
> 	As long as I do all three things, it will fail every time without
> question 
> on three different machines that I have tested. If I change any element, say
> use the
> 1.0.3 toolset or use 1.0.4 but simply don't apply the Makefile generated
> patch, then
> it works fine. Is this still the same problem?

No, you have definitely hit a new problem introduced by 1.0.4.  Sorry
to mislead you.  I'm sure Heinz will get you a fix soon.

> > In the longer term the solution is to move to LVM2; we are currently
> > working on pvmove and will have it in the next beta (beginning of
> > June), pvmove is the last major feature from LVM1 that LVM2 doesn't
> > yet support.
> 
> 	Speaking of LVM2, will the transition to LVM2 require recreating the
> VGs?

No, LVM2 can use the same on disk format as LVM1.  Just build the
device-mapper into the kernel, build the LVM2 tools and reboot.  Or
you may wish to use Andres Salomon's Debian packages (search this list
for his post for where to get them).

- Joe
