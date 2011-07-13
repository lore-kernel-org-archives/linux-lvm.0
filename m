Date: Wed, 13 Jul 2011 17:11:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110713161141.GX7857@agk-dp.fab.redhat.com>
References: <4E1A526F.9090700@tlinx.org>
	<20110711025811.GF7857@agk-dp.fab.redhat.com>
	<4E1D77A7.4030801@tlinx.org>
	<alpine.LRH.2.00.1107131137130.28748@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.1107131137130.28748@bmsred.bmsi.com>
Subject: Re: [linux-lvm] Inconsistent naming...?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 13, 2011 at 11:39:48AM -0400, Stuart D. Gathman wrote:
> I apologize for not being more helpful and actually posting such a script
> (would be happy to do so when I find the link to the quoting spec),
> but I would write a python script (or even a C program in the unlikely event
> it becomes a bottleneck) to quote/unquote lv names.  Use that
> in your shell scripts to get the dev name.

Oh - you've just reminded me:
  dmsetup splitname

Alasdair
