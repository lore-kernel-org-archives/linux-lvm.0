From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] Redhat patches to LVM-1.0.3 tools
Message-Id: <20020306214131.A24612@redhat.com>
References: <20020305082545.GC30667@colombina.comedia.it>
    <20020306111442.F21935@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020306111442.F21935@sistina.com>; from
    mauelshagen@sistina.com on Wed, Mar 06, 2002 at 11:14:42AM +0100
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
Date: Wed Mar  6 15:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Stephen Tweedie <sct@redhat.com>, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

Hi,

On Wed, Mar 06, 2002 at 11:14:42AM +0100, Heinz J . Mauelshagen wrote:
 
> I heard about it yesterday.
> 
> TTBOMK none of the RedHat folks came back to us directly or on any LVM list :-(
> 
> They definitely should feed back the code changes to us or give
> pointers, where to retrieve them.

Will do.  I didn't realise it had gone out to rawhide quite so
quickly --- sorry about that.

It's a test patch to try to make pvmove not quite so broken.  I
started thinking about it a few weeks back when I realised that the
current pvmove code has a bug which affects all filesystems but which
ext2 gets away with most of the time.

That particular problem is the use of fsync_dev() to flush pending IOs
to disk when we lock a PE for pvmove.  fsync_dev doesn't work.  It
flushes all buffers which are marked dirty in the buffer cache, true,
but there are many cases where IOs bypass the buffer cache (raw IO,
swap, O_DIRECT, and the ext3 journal), and there are also cases in
reiserfs where dirty data in the buffer cache is temporarily marked
not-dirty, confusing fsync_dev().

The impact of the bug is that although the PE lock prevents new IO
from taking place on the corresponding LE, it does _not_ wait for all
existing IO to complete; so it's theoretically possible for the pvmove
to end up copying the old copy of the imperfectly-locked old PE to the
new PV, only for the pending write to complete afterwards on the old
PE.

Net effect --- data corruption; we have essentially lost a write.

There were two other related bugs in pvmove.  One is that it uses
buffered IO against the physical disk device to do the PE copy, and
that buffered IO is not cache-coherent with respect to changes
happening on the logical devices.  Anything which populates the buffer
cache with the contents of the PE can cause *massive* corruption on
pvmove as we propagate bulk stale data to the new disk.

The other related bug is that because the PE copy is done in user
space, it is prone to VM deadlock.

The solution I've been testing has been to add a locked PE copy ioctl,
which locks the PE *safely*, copies it using kiobufs, and then updates
the LV maps all in one ioctl.  Doing the safe PE lock is a little
tricky since it requires that LVM track all IOs in transit so that it
can do a guaranteed flush of pending IOs, rather than the half-hearted
attempt that fsync_dev makes.

The patch is in two chunks.  One factors out the kiobuf bulk copy code
from the snapshot support, and the second implements the new ioctl.
It seems to work well in testing, and I haven't measured any
performance penalty from the new IO tracking.  However, that tracking
_will_ have some cost, because it basically cannot be done without
pushing a new buffer_head on top of each incoming one passing through
lvm_map.  There's a third patch involved which is just a backport of
2.5's mempool code, which is an efficient and deadlock-free way of
allocating the buffer_heads used to track the pending IOs.

I had a long exchange with Joe Thornber about all of this --- his
solution for LVM2 looks really solid (and incidentally requires the
same pushing of completion structs that I do in my LVM1 patch), so for
now I'm just looking for the minimal fix necessary to really cure the
bugs in LVM1.

The patches I'm using are at

	http://people.redhat.com/sct/patches/lvm/

They apply to our rawhide kernel, which is basically 2.4.18-ac3, and I
think they should apply to any 2.4.19 kernel.  One of the patches
brings in the important fixes from 1.0.3 into the Marcelo kernel (most
are already in 2.4, of course).  It probably won't apply directly to
CVS 1.0.3, because that and 2.4 have diverged quite a bit recently.

	lvm-1.0.3-pvmove.patch

is the user-space diff, and it tries quite hard to fall back from the
new ioctl to the old pvmove code if the ioctl doesn't seem to be
present (it caches that result and doesn't even try it the second
time).

Cheers,
 Stephen
