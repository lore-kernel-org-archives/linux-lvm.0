From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Logical Volume max-size?
Message-ID: <20011119152703.A28540@golem.blacknet.de>
References: <20011117223754.B12510@auctionwatch.com> <003801c16ffd$757c3d50$fc00a8c0@xp> <20011117231120.C12510@auctionwatch.com> <20011119105657.F27261@golem.blacknet.de> <ufa8zd2oo6t.fsf@epithumia.math.uh.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ufa8zd2oo6t.fsf@epithumia.math.uh.edu>; from tibbs@math.uh.edu on Mon, Nov 19, 2001 at 08:00:42AM -0600
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
Date: Mon Nov 19 08:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 19 '01 at 08:00, Jason L Tibbitts III wrote:
> GB> While the cards may be cool, their raid 5 implementation sucks
> GB> like hell. slow like a slug, and if it should ever become dirty
> GB> the system is unuseable for about 6 hours.
> Don't run the 6000-series cards in RAID5 mode; they weren't designed
I figured this out the hard way. I asked some 3ware person whether I
could use a 6800 as a RAID5 controller and was told, that it would work
fine.
> for it.  Use software RAID instead; it works just fine and the card is
> still cost-effective as an 8-channel IDE controller.
This is true.
> What you say is blatantly untrue for the 7000-series cards; the 7850
> should be even faster.
As an owner of two 6800 this does not help me at all :-(, but hey they
got better, what is cool. 

> Why the proliferation of 3ware misinformation on this list lately?
It was only me who disappointed by the 6xxx series RAID5 performance

    Goetz.
