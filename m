Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Fri, 22 Jun 2001 02:59:26 +0200
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010622025926.B3938@tiger.bigcats.invalid>
References: <134718885.992837796416.JavaMail.root@boots> <20010618123318.A31606@tiger.bigcats.invalid> <20010621094645.A300@gambit>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010621094645.A300@gambit>; from thornber@btconnect.com on Thu, Jun 21, 2001 at 09:46:45AM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joe Thornber (thornber@btconnect.com) wrote 33 lines:
> On Mon, Jun 18, 2001 at 12:33:18PM +0200, Wolfgang Weisselberg wrote:

> > First, we need a fool^Wcrashproof, completely interruptible
> > pvmove for active, being currently read from and written
> > to LVs.

> I hope this is already there.  Do your experiences suggest it isn't
> working for active pv's ?

man pvmove:
[...]
       You  can  move  physical  extents in use but make sure you
       have an current backup in case of  a  system  crash  while
       moving!!!

Now, this does *not* look like *crashproof*, does it?
This is from the CVS, btw, dated 2001-06-10.

And I am unwilling to have a tool run automatically (at
night?) that - upon a crash - can destroy whole partitions.
I could live with a 'copy, repeat if original was changed,
lock LE, update maps on HD, unlock LE (on new PE)' thing.

I have used pmove about once in ernest, and my, moving 35 Gigs
over to a new HD takes time!  And that does not look like a
HD bottleneck...

> This is exactly what we're planning for the next version of LVM.  The
> moving of extents will be performed by the kernel rather than in user
> space, the ioctl interface will allow the user to specify a list of pe
> movements.

Sounds interesting.

> > Then the rest is simply ripping a balancing algorithm from
> > somewhere and slap it into a wrapper.  Data aquisition is
> > already done via lvmsadc/lvmsar.

> Yes, a little Perl script to process the usage stats and then create a
> new map.

There it might be interesting to know which blocks are accessed
in sequence.  Then again it might not, I am not an expert
there and haven't done the maths for that.

-Wolfgang
