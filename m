From: Linus Torvalds <torvalds@osdl.org>
In-Reply-To: <20031204011236.GA5622@simulated.ca>
Message-ID: <Pine.LNX.4.58.0312031721210.2055@home.osdl.org>
References: <3FCB4AFB.3090700@backtobasicsmgmt.com> <20031201141144.GD12211@suse.de>
 <3FCB4CFA.4020302@backtobasicsmgmt.com> <20031201155143.GF12211@suse.de>
 <3FCC0EE0.9010207@backtobasicsmgmt.com> <20031202082713.GN12211@suse.de>
 <Pine.LNX.4.58.0312021009070.1519@home.osdl.org> <20031204011236.GA5622@simulated.ca>
MIME-Version: 1.0
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
Date: Thu Dec  4 08:58:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kirby <sim@netnation.com>
Cc: Linux-raid maillist <linux-raid@vger.kernel.org>, Jens Axboe <axboe@suse.de>, Neil Brown <neilb@cse.unsw.edu.au>, "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>, LKML <linux-kernel@vger.kernel.org>, linux-lvm@sistina.com


On Wed, 3 Dec 2003, Simon Kirby wrote:
>
> In any event, this patch against 2.6.0-test11 compiles without warnings,
> boots, and (bonus) actually works:

Really? This actually makes a difference for you? I don't see why it
should matter: even if the sector offsets would overflow, why would that
cause _oopses_?

[ Insert theme to "The Twilight Zone" ]

Neil, Jens, any ideas?

		Linus
