Date: Wed, 4 May 2011 19:02:06 +0200 (CEST)
From: Lukas Czerner <lczerner@redhat.com>
In-Reply-To: <20110504163317.GA17529@thunk.org>
Message-ID: <alpine.LFD.2.00.1105041858010.27793@dhcp-27-109.brq.redhat.com>
References: <20110413224025.GA18589@redhat.com>
	<20110413234854.GA19793@redhat.com>
	<20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
	<20110428075355.GA2190@infradead.org>
	<20110428205935.GA24979@redhat.com>
	<alpine.LFD.2.00.1104291117510.5496@dhcp-27-109.brq.redhat.com>
	<20110429122454.GL32370@agk-dp.fab.redhat.com>
	<20110429122906.GA7381@infradead.org>
	<4DBACB23.80607@redhat.com> <20110504163317.GA17529@thunk.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [dm-devel] do not disable ext4 discards on first
 discard failure? [was: Re: dm snapshot: ignore discards issued to the
 snapshot-origin target]
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ted Ts'o <tytso@mit.edu>
Cc: Eric Sandeen <sandeen@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com, DarkNovaNick@gmail.com, linux-lvm@redhat.com, Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org

On Wed, 4 May 2011, Ted Ts'o wrote:

> On Fri, Apr 29, 2011 at 09:28:51AM -0500, Eric Sandeen wrote:
> > On 4/29/11 7:29 AM, Christoph Hellwig wrote:
> > > FYI, that disable discard on failure seems to be an ext4 special and no
> > > one else picked up that stupid idea.  If ext4 wants to misbehave for
> > > that just let them..
> > 
> > It was my "stupid idea," and I'm ok with reverting it ;)
> 
> I think I forgot to send the patch out, but it's been reverted in the
> ext4 master branch, commit id: d9f34504e695.  It's more than a revert,
> actually, since I also dropped error checking for FITRIM.  Otherwise
> an attempt to use FITRIM would stop after hitting the first dm region
> that didn't support discards.
> 
> 						- Ted
> 

However I would very much like to change blkdev_issue_discard() not NOT
return EOPNOTSUPP if QUEUE_FLAG_DISCARD is set, this way we can rely on
EOPNOTSUPP saying really that it is NOT supported. Regardless on ext4
change.

I will send a patch for it, if you guy agree. Also consider BLKDISCARD
which is now broken and this change will fix that!

Thanks!
-Lukas
