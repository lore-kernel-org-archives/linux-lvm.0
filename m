Subject: Re: [linux-lvm] Logical Volume max-size?
References: <20011117223754.B12510@auctionwatch.com>
	<003801c16ffd$757c3d50$fc00a8c0@xp>
	<20011117231120.C12510@auctionwatch.com>
	<20011119105657.F27261@golem.blacknet.de>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Goetz Bock's message of "Mon, 19 Nov 2001 10:56:57 +0100"
Message-ID: <ufa8zd2oo6t.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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
Date: Mon Nov 19 07:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "GB" == Goetz Bock <bock@blacknet.de> writes:

GB> While the cards may be cool, their raid 5 implementation sucks
GB> like hell. slow like a slug, and if it should ever become dirty
GB> the system is unuseable for about 6 hours.

Don't run the 6000-series cards in RAID5 mode; they weren't designed
for it.  Use software RAID instead; it works just fine and the card is
still cost-effective as an 8-channel IDE controller.  What you say is
blatantly untrue for the 7000-series cards; the 7850 should be even
faster.

Why the proliferation of 3ware misinformation on this list lately?

 - J<
