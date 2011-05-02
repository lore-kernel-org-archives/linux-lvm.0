Date: Mon, 2 May 2011 12:24:33 +0200 (CEST)
From: Lukas Czerner <lczerner@redhat.com>
In-Reply-To: <20110502081925.GA11312@infradead.org>
Message-ID: <alpine.LFD.2.00.1105021217080.3778@dhcp-27-109.brq.redhat.com>
References: <20110413224025.GA18589@redhat.com>
	<20110413234854.GA19793@redhat.com>
	<20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
	<20110428075355.GA2190@infradead.org>
	<20110428205935.GA24979@redhat.com>
	<alpine.LFD.2.00.1104291117510.5496@dhcp-27-109.brq.redhat.com>
	<20110429122454.GL32370@agk-dp.fab.redhat.com>
	<alpine.LFD.2.00.1105020857030.3778@dhcp-27-109.brq.redhat.com>
	<20110502081308.GC8642@agk-dp.fab.redhat.com>
	<20110502081925.GA11312@infradead.org>
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
To: Christoph Hellwig <hch@infradead.org>
Cc: sandeen@redhat.com, Mike Snitzer <snitzer@redhat.com>, device-mapper development <dm-devel@redhat.com>, DarkNovaNick@gmail.com, linux-lvm@redhat.com, Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org, Alasdair G Kergon <agk@redhat.com>

On Mon, 2 May 2011, Christoph Hellwig wrote:

> On Mon, May 02, 2011 at 09:13:08AM +0100, Alasdair G Kergon wrote:
> > On Mon, May 02, 2011 at 09:16:21AM +0200, Lukas Czerner wrote:
> > > However when we have dm device where part of the device supports
> > > discard due to underlying hardware capability we just can not return
> > > EOPNOTSUPP from blkdev_issue_discard, because it is just not true! 
> > 
> > EOPNOTSUPP from dm means the operation was not supported on that *one* bio.
> > It does *not* tell you anything in general about the device, or whether
> > you'd get the same error from different bios in future.
> 
> Exactly.  We already have the information in the queue limits to tell
> the filesystem if discard is supported at all or not.
> 

So I gave it a try. First of all the device composed of SSD and spinning
disk does export discard_support information properly, however it also
advertise discard_zeroes_data which is wrong and possibly dangerous and
should be fixed!

And second of all, strictly speaking if EOPNOTSUPP from dm means that
operation was not supported on that *one* bio, blkdev_issue_discard()
should handle that and do not return EOPNOTSUPP further if queue limits
tells that device has discard support. Is this acceptable solution for
you guys ? I can make that change since I am changing blkdev_issue_discard()
anyway. Or, we can make that change in filesystem where we disable
discard on mount time, when we notice that discard mount option was
specified, but the device does not support it (we should probably do
this regardless on blkdev_issue_discard() change).

Thanks!
-Lukas
