Return-Path: <braam@mountainviewdata.com>
Date: Wed, 23 May 2001 13:22:38 -0600 (MDT)
From: "Peter J. Braam" <braam@mountainviewdata.com>
Subject: Re: [linux-lvm] LVM Snapshots & journal recovery
In-Reply-To: <OF2E735924.F8A0C9C9-ON85256A55.006660F2@raleigh.ibm.com>
Message-ID: <Pine.LNX.4.33.0105231317200.3381-100000@lustre.us.mvd>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: linux-lvm@sistina.com, Joe Thornber <thornber@btconnect.com>, adilger@turbolinux.com, linux-fsdevel@vger.kernel.org, evms-devel@lists.sourceforge.net

On Wed, 23 May 2001, Steve Pratt wrote:

>
>
> On Wed, 23 May 2001, Peter Braam wrote:
>
> >On Wed, 23 May 2001, Steven Pratt wrote:
> >> Peter, I fail to see how your proposed method of remapping writes to the
> >> original to the snapshot volume avoids the synchronous write penalties.
>
> >Hmm, I think you are raising many interesting issues.
>
> >> For example in your scenario, the filesystem journal itself will have to
> be
> >> written to the snapshot volume, so in order to ensure journal
> consistency
> >> you will need to write the remapping meta data synchronously with the
> >> remapped journal chunk or you would not know that the journal had been
> >> remapped.  Both writes must done synchronously or you have possible
> >> corruption.
> >>
>
> >The journal itself really shouldn't be on a snapshotted device - that
> >makes no sense.
>
> Well that depends on where the filesystem keeps the journal.  If the
> journal is stored on the same volume as the filesystem, then if you are
> snapshotting from a Volume Manager you have no choice but to remap the
> journal to the snapshot device.  If the journal is stored on another volume
> than I agree.  However my point still apply to regular data.

Any decent journal file system allows its journal to be written on another
device, preferrably a separate disk to benefit from the sequential writes
or NVRam.

>
> >The write operations are now idempotent: there is in fact no need
> >whatsoever to write anything synchronous since the journal replay will
> >always get it right.
>
> Hmmmm, you seem to be implying that the snapshot metadata is covered by the
> journal.  While this may be possible (and desirable) if the snapshotting is
> done in the filesystem, I don't see how this is possible when the remapping
> happens in the Volume Manager below the filesystem layer.

The point is that the remapping has to be done by the LVM layer. But
writes are idempotent (in my setup) and are guaranteed to be replayed by
the journaling layer should the system go down.  No need to write anything
synchronously.

>
> >For writing I believe what I have proposed is vastly superior:
> >no synchronous writes _and_ no copying of blocks.
>
> As stated above, I don't see how you can avoid the synchronous write, but
> you do save the copy.
>
> >> In addition to having to do the same number of synchronous writes, you
> have
> >> the additional penalty that you mentioned of the sync time when deleting
> >> the snapshot.  This resyncing also come with a whole new set of
> consistency
> >> issues (whole new code path)
>
> >It's not an additional penalty at all: this code again is idempotent too.
> >If it fails you can run it again - I think it has very simple logic but of
> >course I may be overlooking something.  Before you start the deletion
> >process the snapshot becomes unusable.  After it has completed the extra
> >partition becomes superfluous.
>
> >Also such a process can run in the background and would copy no more
> >blocks than doing the writes the other way around.
>
> Agreed, you just pay the price all at once instead of spread out.
>
> >> Also, you have moved the remapping lookup processing time penalty for
> reads
> >> from the snapshot to the original.  I think it is much better to
> optimize
> >> the access to the original as opposed to the snapshot for most cases.
>
> >This is a serious point: the reads need an indirection.
>
> Yes.
>
> >We did benchmarking of this in SnapFS and the redirection blocks are not
> >many and are typically cached.  It didn't seem to cost much at all.
>
> I think the same reasoning would apply to the LVM/EVMS method of
> snapshotting. We are just starting to do some benchmarking on our EVMS
> snapshotting code.  If you have any good benchmark tools or setups, we
> would love to run them on our system to see how they compare.
>
> >What do you think of this?
>
> I am still leaning toward the copy on write method for a number of reasons.

But if you are paranoid you shouldn't be fooling around with data that
want to preserve.

>
> Paranoia is one of them.  I don't like the idea of having my production,
> critical volume not fully contained in 1 place.  In copy on write
> snapshotting if the snapshot dies, all you lose is the old static copy that
> presumably you were using to back up an active volume.  In your method, if
> I lose the snapshot, I lose everything, ie no valid current copy of data
> exists.
>
> Disk full is another big issue, in copy on write again all that happens if
> the snapshot fills up is that the snapshot becomes invalid.  In you method
> what happens?

Exactly what always happen when a file system gets full.

 I think you lose the ability to write new data to the
> original volume.  Ouch!  Does this mean that my database that was being
> accessed by hundreds of people is down?  How do I get it back? resync from
> the snapshot, but his may take hours depending on how much data was
> snapshotted (enough to fill the snapshot).
>
> I can see possible advantages to your method if done in the filesystem as I
> believe SnapFS does, but from a Volume Manager standpoint I see to many
> negatives.

It apparently a matter of taste: two synchronous writes for one write is
just not an option fo me.

- Peter -

>
> Steve
>
> EVMS Development - http://www.sf.net/projects/evms
> Linux Technology Center - IBM Corporation
> (512) 838-9763  EMAIL: SLPratt@US.IBM.COM
>
>
>

-- 
