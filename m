Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2BN3C800485
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 18:03:12 -0500
Received: from mailgate2.Cadence.COM (mailgate2.Cadence.COM [158.140.2.31])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2BN3B07006745
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 18:03:11 -0500
Subject: Re: [linux-lvm] Re: lvm2 performance data with linux-2.6
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <20040311142515.A27177@osdlab.pdx.osdl.net>
References: <200403081916.i28JGgE25794@mail.osdl.org>
	 <4050E453.3010809@tmr.com>  <20040311142515.A27177@osdlab.pdx.osdl.net>
Message-Id: <1079046114.3850.349.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar 11 18:01:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: Bill Davidsen <davidsen@tmr.com>, linux-kernel@vger.kernel.org

Is this generally available to all?  Where can it be had?

TIA

On Thu, 2004-03-11 at 14:25, Mark Wong wrote:
> On Thu, Mar 11, 2004 at 05:12:35PM -0500, Bill Davidsen wrote:
> > markw@osdl.org wrote:
> > > I've started collecting various data (including oprofile) using our
> > > DBT-2 (OLTP) workload with lvm2 on linux 2.6.2 and 2.6.3 on ia32 and
> > > ia64 platforms:
> > > 	http://developer.osdl.org/markw/lvm2/
> > > 
> > > So far I've only varied the stripe width with lvm, from 8 KB to 512 KB,
> > > for PostgreSQL that is using 8 KB sized blocks with ext2.  It appears
> > > that a stripe width of 16 KB through 128KB on the ia64 system gives the
> > > best throughput for the DBT-2 workload on a volume that should be doing
> > > mostly sequential writes.
> > > 
> > > I'm going to run through more tests varying the block size that
> > > PostgreSQL uses, but I wanted to share what I had so far in case there
> > > were other suggestions or recommendations.
> > > 
> > Here's one thought: look at the i/o rates on individual drives using 
> > each stripe size. You *might* see that one size does far fewer seeks 
> > than others, which is a secondary thing to optimize after throughput IMHO.
> > 
> > If you don't have a tool for this I can send you the latest diorate 
> > which does stuff like this, io rate perdrive or per partition, something 
> > I occasionally find revealing.
> 
> Yeah, please do send me a copy.  I'd be interested to see what that might 
> turn up.  I've just been using iostat -x so far.
> 
> Thanks,
> Mark
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
