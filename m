From: "Stephen C. Tweedie" <sct@redhat.com>
Message-Id: <20020201145855.G2149@redhat.com>
References: <20020201051251.B10893@devserv.devel.redhat.com>
    <E16WevQ-0005H0-00@the-village.bc.nu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16WevQ-0005H0-00@the-village.bc.nu>; from
    alan@lxorguk.ukuu.org.uk on Fri, Feb 01, 2002 at 02:44:24PM +0000
Subject: [linux-lvm] Re: [Evms-devel] Re: [ANNOUNCE] LVM reimplementation ready for
 beta testing
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
Date: Fri Feb  1 08:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Arjan van de Ven <arjanv@redhat.com>, Joe Thornber <thornber@fib011235813.fsnet.co.uk>, lvm-devel@sistina.com, Jim McDonald <Jim@mcdee.net>, Andreas Dilger <adilger@turbolabs.com>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, evms-devel@lists.sourceforge.net

Hi,

On Fri, Feb 01, 2002 at 02:44:24PM +0000, Alan Cox wrote:
> > But "flushes all pending io" is *far* from trivial. there's no current
> > kernel functionality for this, so you'll have to do "weird shit" that will
> > break easy and often.
> > 
> > Also "suspending" is rather dangerous because it can deadlock the machine
> > (think about the VM needing to write back dirty data on this LV in order to
> >  make memory available for your move)...
> 
> I don't think you need to suspend I/O except momentarily. I don't use LVM and
> while I can't resize volumes I migrate them like this

LVM1 has some problems here.  First, when it needs to flush IO as
part of its locking it does so with fsync_dev, which is not a valid
way of flushing certain types IO.  Second, its copy is done in user
space, so there is no cache coherence with the logical device contents
and there is enough VM pressure to give a good chance of deadlocking.

However, it _does_ do its locking at a finer granularity than the
whole disk (it locks an extent --- 4MB by default --- at a time), so
even with LVM1 it is possible to do the move on a live volume without
locking up all IO for the duration of the entire copy.

LVM2's device-mirror code is much closer to the raid1 mechanism in
design, so it doesn't even have to lock down an extent during the
copy.

> the situation here seems analogous. You never need to suspend I/O to the
> volume until you actually kill it, by which time you can just skip the write
> to the dead volume.

Right.  LVM1 doesn't actually suspend IO to the volume, just to an
extent.  What it does volume-wide is to flush IO, which is different.

The problem is that when we come to copy a chunk of the volume,
however large that chunk is, we need to make sure both that no new IOs
arrive on it, AND that we have waited for all outstanding IOs against
that chunk.  It's the latter part which is the problem.  It is 
expensive to keep track of all outstanding IOs on a per-stripe basis,
so when we place a lock on a stripe and come to wait for
already-submitted IOs to complete, it is much easier just to do that
flush volume-wide.  It's not a complete lock on the whole volume, just
a temporary mutex to ensure that there are no IOs left outstanding on
the stripe we're locking.

Cheers,
 Stephen
