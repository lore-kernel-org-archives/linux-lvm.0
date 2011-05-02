Date: Mon, 2 May 2011 10:48:23 -0400
From: Christoph Hellwig <hch@infradead.org>
Message-ID: <20110502144823.GA14393@infradead.org>
References: <20110428205935.GA24979@redhat.com>
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
Content-Disposition: inline
In-Reply-To: <4DBEC3F4.3050804@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Sandeen <sandeen@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@infradead.org>, device-mapper development <dm-devel@redhat.com>, DarkNovaNick@gmail.com, linux-lvm@redhat.com, Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org, Alasdair G Kergon <agk@redhat.com>

On Mon, May 02, 2011 at 09:47:16AM -0500, Eric Sandeen wrote:
> I still think we need to stick with the simple rule: "EOPNOTSUPP returned for a particular bio means that it is not supported for that particular bio" - I don't know what else we can do, without creating an ambiguity...
> 
> This does, however, suck for the layer calling in to a complex device.
> 
> What is the overhead for sending discard bios down to a device that does not support it?

For a DM-like device there is very little overhead.  The bio gets
dispatched to make_request and failed in there almost immediately.
