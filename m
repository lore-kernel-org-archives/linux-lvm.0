Date: Mon, 2 May 2011 16:58:23 +0200 (CEST)
From: Lukas Czerner <lczerner@redhat.com>
In-Reply-To: <4DBEC3F4.3050804@redhat.com>
Message-ID: <alpine.LFD.2.00.1105021654190.6828@dhcp-27-109.brq.redhat.com>
References: <20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
	<20110428075355.GA2190@infradead.org>
	<20110428205935.GA24979@redhat.com>
	<alpine.LFD.2.00.1104291117510.5496@dhcp-27-109.brq.redhat.com>
	<20110429122454.GL32370@agk-dp.fab.redhat.com>
	<alpine.LFD.2.00.1105020857030.3778@dhcp-27-109.brq.redhat.com>
	<20110502081308.GC8642@agk-dp.fab.redhat.com>
	<20110502081925.GA11312@infradead.org>
	<alpine.LFD.2.00.1105021217080.3778@dhcp-27-109.brq.redhat.com>
	<20110502124803.GA31034@redhat.com>
	<alpine.LFD.2.00.1105021458480.3778@dhcp-27-109.brq.redhat.com>
	<4DBEC3F4.3050804@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] do not disable ext4 discards on first discard
 failure? [was: Re: dm snapshot: ignore discards issued to the
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
To: Eric Sandeen <sandeen@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@infradead.org>, device-mapper development <dm-devel@redhat.com>, DarkNovaNick@gmail.com, linux-lvm@redhat.com, Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org, Alasdair G Kergon <agk@redhat.com>

On Mon, 2 May 2011, Eric Sandeen wrote:

> On 5/2/11 8:05 AM, Lukas Czerner wrote:
> > On Mon, 2 May 2011, Mike Snitzer wrote:
> 
> ...
> 
> >> The blkdev_issue_discard() change you propose could be fine (mask
> >> EOPNOTSUPP return if device advertises support for discards) -- though
> >> Eric said we shouldn't ever say we did something when we didn't.
> > 
> > Exactly, so we should not say that it is not supported when it is, but
> > we just hit the "wrong" part of the device:) I would just very much like
> > to keep the abstraction of having one consistent device underneath the
> > file system and not deal with several devices, or regions with different
> > behaviour in the file system itself (let the pixies underneath deal with
> > that, after all not all of us are btrfs:))
> 
> I still think we need to stick with the simple rule: "EOPNOTSUPP returned for a particular bio means that it is not supported for that particular bio" - I don't know what else we can do, without creating an ambiguity...

I agree, but we do not care about bios in file system. We need to know
whether the device itself supports it or not. Also consider BLKDISCARD
ioctl(), now as it is it's completely broken on such dm devices, because
you are not able to use it due to -EOPNOTSUPP first time you hit the
device which does not support it, but it can very well be just a small
part of dm device.

Again, it does not make sense to return -EOPNOTSUPP from
blkdev_issue_discard() when the device actually supports it.

-Lukas

> 
> This does, however, suck for the layer calling in to a complex device.
> 
> What is the overhead for sending discard bios down to a device that does not support it?
> 
> -Eric
> 

-- 
