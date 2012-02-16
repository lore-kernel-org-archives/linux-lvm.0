Date: Thu, 16 Feb 2012 10:54:33 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120216155433.GB13948@redhat.com>
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
	<4F3D15CC.1080901@mohawksoft.com>
	<alpine.LRH.2.00.1202161014230.3425@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.1202161014230.3425@bmsred.bmsi.com>
Subject: Re: [linux-lvm] Snapshots
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

On Thu, Feb 16 2012 at 10:18am -0500,
Stuart D. Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on Feb 16, Mark Woodward would write:
> 
> >I guess I missed that. I need to check out the changes, looks like
> >you have auto-grow with monitoring? I was looking more towards the
> >"snapshots of snapshots" ability. Is that on the radar?
> 
> The ZumaStor 3rd party userland tools support that.

Now AFAIK ZumaStor is a dead technology... nobody is actually
maintaining the code upstream.  The shared snapshot store that
dm-thin-pool provides is functionally equivalent to what Zumastor
provides -- dm-thinp provides a single storage pool for all snapshots.
This avoids excessive copy-out that the old dm-snapshot suffered from
due to it requiring a distinct snapshot store for each snapshot.

I'd really like to encourage you and others to evaluate and test
snapshots with dm-thinp -- now that lvm2 provides support it _should_ be
more approachable.

> An elegant part of the LVM system is that the device mapper kernel support is
> very general, and new data structures can be experimented with entirely in user
> code - with a script language even.  Metadata for experimental structures does
> not have to stored with the main metadata.

Please note that the dm-thinp code has metadata in the kernel (on-disk
format for btrees, etc) much like a filesystem would have.  So there is
both kernel and userspace (lvm2) metadata for dm-thinp.

Mike
