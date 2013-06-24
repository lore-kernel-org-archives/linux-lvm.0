Date: Mon, 24 Jun 2013 20:24:33 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130624192433.GB27846@agk-dp.fab.redhat.com>
References: <1372057440.20206.YahooMailBasic@web181506.mail.ne1.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1372057440.20206.YahooMailBasic@web181506.mail.ne1.yahoo.com>
Subject: Re: [linux-lvm] heat map
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
To: matthew patton <pattonme@yahoo.com>
Cc: linux-lvm@redhat.com

On Mon, Jun 24, 2013 at 12:04:00AM -0700, matthew patton wrote:
> If some older man pages are to be believed there once was a capability
> to keep a heat map of busy extents. Is there a way to revive that
> capability? I expect "last I/O within 30 seconds, 5 minute, 15minute" is
> probably sufficient for most uses as well as summary counters along the
> same lines.
 
Mikulas is developing a replacement here:
  http://people.redhat.com/~mpatocka/patches/kernel/dm-statistics/

Documentation appears at the end of the kernel patch.

If you want to try it out at the moment, you'll need this patch first I think:
  http://people.redhat.com/agk/patches/linux/editing/dm-optimize-use-SRCU-and-RCU.patch

Alasdair
