Date: Thu, 13 Mar 2014 10:01:58 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140313140158.GB5738@redhat.com>
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
	<20140312233505.GA1660@redhat.com>
	<0c1301cf3e5c$1218eb10$364ac130$@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c1301cf3e5c$1218eb10$364ac130$@acm.org>
Subject: Re: [linux-lvm] thinpool metadata size
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
To: "Paul B. Henson" <henson@acm.org>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

On Wed, Mar 12 2014 at  9:32pm -0400,
Paul B. Henson <henson@acm.org> wrote:

> > From: Mike Snitzer
> > Sent: Wednesday, March 12, 2014 4:35 PM
> >
> > No, metadata resize is now available.
> 
> Oh, cool; that makes the initial allocation decision a little less critical
> :).
> 
> > But you definitely want to be
> > using the latest kernel (there have been various fixes for this
> > feature).
> 
> I thought I saw a thin pool metadata corruption issue fly by recently with a
> fix destined for 3.14, I was tentatively thinking of waiting for the 3.14
> release before migrating my box to thin provisioning. I'm currently running
> 3.12, it looks like that was designated a long-term support kernel? Are thin
> provisioning (and dm-cache, as I'm going to add that to the mix as soon as
> lvm supports it) patches going to be backported to that, or would it be
> better to track mainline stable kernels as they are released?

The important fixes for long-standing issues will be marked for stable,
e.g.: http://git.kernel.org/linus/cebc2de44d3bce53 (and yes I already
sent a note to stable@ to have them pull this in to 3.12-stable too)

But significant improvements will not be.  The biggest recent example of
this are all the improvements made in 3.14 for "out-of-data-space" mode
and all the associated error handling improvements.

So if I were relegated to using upstream kernels, I'd track latest
stable kernel if I could.  Otherwise, I'd do my own backports -- but
wouldn't expect others to support my backports.

> > Completely exhausting all space in the metadata device will expose you
> > to a corner case that still needs work... so best to avoid that by
> > sizing your metadata device conservatively (larger).
> 
> On the grand scale of things it doesn't look like it wants that much space,
> so over allocation sounds like a good idea.
> 
> > The largest the metadata volume can be is just under 16GB.  The size of
> > the metadata device will depend on the blocksize and number of expected
> > snapshots.
> 
> Interesting; for some reason I thought metadata usage was also dependent on
> changes between origin and snapshots. So, if you had one origin lv and 100
> snapshots of it that were all identical, it would use less metadata than if
> you had 100 snapshots that had been written to and were all wildly divergent
> from each other. Evidently not though?

I'm not sure if the tool tracks the rate of change.  It may account for
worst case of _every_ block for the provided number of thin devices
_not_ being shared.
