Received: from localhost (vpn-10-1.bos.redhat.com [10.16.10.1])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8BDi3Ff021721
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 09:44:03 -0400
Date: Fri, 11 Sep 2009 09:44:02 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20090911134402.GA10146@redhat.com>
References: <20090910152510.20691nc1e7608sm8@www.destar.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090910152510.20691nc1e7608sm8@www.destar.net>
Subject: [linux-lvm] Re: Snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Sep 10 2009 at  7:25pm -0400,
jonr@destar.net <jonr@destar.net> wrote:

> Hello List,
>
> I don't get it!

The snapshot diagrams from Alasdair's old FOSDEM slides should help you
visualize the kernel layers involved beneath LVM (e.g. dm-snapshot):

http://people.redhat.com/agk/talks/FOSDEM_2005/

Starting with the "Snapshot" slide through "Two Snapshots".  Without
having text associated with each slide it may be too terse for you
but I recommend having a look...

> 1. How can I have a 20GB LV as a disk and the snapshot be 10GB and boot 
> the entire OS?

The snapshot LV is backed by the "COW" in the diagrams above.  If you
wanted to accommodate _every_ block changing in the origin LV (copied out
to the snapshot LV) you'd have to size the snapshot LV to be a bit
larger than the origin LV (snapshot metadata has some small overhead).

Sizing your snapshot LV is all about how you intend to use the
snapshot.  E.g. what is the expected rate of change to the origin LV
while you intend to have the snapshot active?  If you'll be changing the
origin extensively then you want to use a larger snapshot LV.

> 2. Can I create a DomU and then snapshot the LV and use the snapshot to 
> create other DomU's?

Sure, but I'd imagine you'd have to change some unique identifiers in
the DomU so that it can co-exist with the original.  These changes would
get written through the "snapshot" layer in the kernel and directly out
to the COW (would never touch the origin LV; not to be confused with
"origin" layer :).

> 3. If 2 is yes, would I want to continue using the snapshot as the disk 
> or is there something else that should be done, i.e. dd the drive to a 
> new LV?

Depends how permanent you need the new DomU to be.  And how much
simultaneous change you expect to the original DomU.

The emerging "multi-snapshot" implementation that Mikulas Patocka is
actively working on is really geared toward this Xen DomU snapshot
use-case.  Mikulas has posted his patches to dm-devel but it'll be a bit
longer before they are all merged into an upstream Linux kernel.

Mike
