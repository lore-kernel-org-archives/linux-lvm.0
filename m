From: Simon Kirby <sim@netnation.com>
Message-ID: <20031204043106.GA19017@netnation.com>
References: <3FCB4AFB.3090700@backtobasicsmgmt.com> <20031201141144.GD12211@suse.de> <3FCB4CFA.4020302@backtobasicsmgmt.com> <20031201155143.GF12211@suse.de> <3FCC0EE0.9010207@backtobasicsmgmt.com> <20031202082713.GN12211@suse.de> <Pine.LNX.4.58.0312021009070.1519@home.osdl.org> <20031204011236.GA5622@simulated.ca> <Pine.LNX.4.58.0312031721210.2055@home.osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0312031721210.2055@home.osdl.org>
Subject: [linux-lvm] Re: Reproducable OOPS with MD RAID-5 on 2.6.0-test11
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
Date: Thu Dec  4 08:58:07 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Linux-raid maillist <linux-raid@vger.kernel.org>, Jens Axboe <axboe@suse.de>, Neil Brown <neilb@cse.unsw.edu.au>, "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>, LKML <linux-kernel@vger.kernel.org>, linux-lvm@sistina.com

On Wed, Dec 03, 2003 at 05:23:02PM -0800, Linus Torvalds wrote:

> On Wed, 3 Dec 2003, Simon Kirby wrote:
> >
> > In any event, this patch against 2.6.0-test11 compiles without warnings,
> > boots, and (bonus) actually works:
> 
> Really? This actually makes a difference for you? I don't see why it
> should matter: even if the sector offsets would overflow, why would that
> cause _oopses_?
> 
> [ Insert theme to "The Twilight Zone" ]

Without the patches, the box gets as far as assembling the array and
activating it, but dies on "mke2fs".  Running mke2fs through strace shows
that it stops during the early stages, before it even tries to write
anything.  mke2fs appears to seek through the whole device and do a bunch
of small reads at various points, and as soon as it tries to read from an
offset > 2 TB, it hangs.

When I first tried this, something with the configuration caused it to
hang so that even nmi_watchdog didn't work.  I first assumed it was the
result of some sort of current spike from all of the drives working at
once, but after gettng it to work with an array size < 2 TB and after
seeing different strange Oopses with different total sizes (by removing
some drives), the problem appeared to be software-related.  I added some
printk()s and found the problem occurred shortly after an overflow in
linear.c:which_dev().

As soon as I saw the overflow I made the connection and corrected the
variable types, but I didn't bother to figure out why it decided to
blow up before.

I can put an unpatched kernel back on the box and do some more testing
if it would be helpful.

Simon-
