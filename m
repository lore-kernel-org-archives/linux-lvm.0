Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q02Dcajb032318
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2012 08:38:36 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q02DcXpn032282
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2012 08:38:34 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A85F1055739
	for <linux-lvm@redhat.com>; Mon,  2 Jan 2012 14:38:33 +0100 (CET)
Date: Mon, 2 Jan 2012 14:38:30 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20120102133830.GG5051@barkeeper1-xen.linbit>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Fri, Dec 02, 2011 at 01:34:24PM -0500, starlight@binnacle.cx wrote:
> After a little digging discovered and ran 'debugfs'
> and used the 'testb' command to determine that the
> mirror mismatch blocks are "not in use".
> 
> So that's good.
> 
> However I am rather disturbed that LVM
> mirroring appears to have bugs that allow
> images to become out-of-sync.

I'd like to point to "unstable pages".
The Problem:
   http://lwn.net/Articles/429305/
   http://thread.gmane.org/gmane.linux.kernel/1103571
   http://thread.gmane.org/gmane.linux.scsi/59259

And many many more older threads on various ML,
some of them misleading, some of them mixing
this issue of in-flight modifications
with actual (hardware caused) data corruption.


In short: you do some thing like
  continuously append to some (log) file, *not* doing fsync,
  while also having some background writeout (global sync).
  perl -le '$|=1; print scalar localtime while !select undef,undef,undef,0.001;' >> log &
  while sleep 1; do sync ; done

Other variants involve mmap, but anything that keeps modifying buffer will do.

Global writeout causes dirty pages to be flushed to disk,
the continuous append changes the page while it is being written out.

These inconsistencies are usually short lived, not persistent, because,
at some point, the "changing spot" will move to some other page, the
page has been redirtied by the last change, and eventually will be
written out one last time.

But. Consider the case of already unlinked temporary files,
such as used by many data bases and other applications. 
It is a valid optimization for file systems to skip implicit write-out
of "deleted" pages.

In which case you may end up with persistent data divergence on disk,
supposedly only in the "deleted" area -- which matches your observation.
(such tmp files often live in /tmp, which may be on your root fs,
which would then also match your observation).

Also for swap it is legal to start swapout, then recognize suddenly the
page is needed after all, mark it's on-disk location as invalid and
continue to use it (which will change it while it is "in-flight").

So unless your file system does ensure "stable pages",
anything that submits a bio to more than one location
without first copying the data to private (thus supposedly stable)
pages, will suffer from that problem.

ext4 (and others) in recent kernels are supposed to provide stable pages.

afaik (means: I may be wrong), ext3 does not yet fully guarantee "stable
pages", though it has gotten much better.

> Have read that MD is the only way to go
> with any kind of RAID and now I see that
> is true.  If anyone can explain what
> happened here in any positive light I'd
> be interested in hearing about it.  For
> now I see LVM mirroring as a turkey that
> should be avoided.
> 
> Additional details:
> 
> * both LVs with discrepancies are "root"
> file system LVs where one or the other
> is selected in differing 'grub' boot
> configuration lines
> 
> * both LVs have an associated mirror log
> 
> * in the past have experienced system
> lockups due to a mirrored swap volume;
> reported it to RH Bugzilla and was
> told there are deadlock scenarios in
> the kernel and that mirrored swap
> volumes are not supported.  This and
> today's discovery leads me to the
> conclusion that LVM mirroring is
> a seriously bad idea.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
