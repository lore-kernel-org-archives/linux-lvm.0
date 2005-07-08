Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j684APV08404
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 00:10:25 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j684AN8V025499
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 00:10:23 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DqkBw-0004dT-DM
	for linux-lvm@redhat.com; Fri, 08 Jul 2005 06:10:20 +0200
Received: from dyn129-100-6-14.onemeg.uwo.ca ([129.100.6.14])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 08 Jul 2005 06:10:20 +0200
Received: from jdc by dyn129-100-6-14.onemeg.uwo.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 08 Jul 2005 06:10:20 +0200
From: Dan Christensen <jdc@uwo.ca>
Date: Thu, 07 Jul 2005 23:54:52 -0400
Message-ID: <8764vmc7xm.fsf@uwo.ca>
References: <4226C7C8.10406@theserrs.net> <422CB890.4050003@vilain.net>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: lvm2 on raid5 speed, not so bad
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
To: linux-lvm@redhat.com

[Sorry for following up to a message from March.  I'm just scanning
the old postings...]

Sam Vilain <sam@vilain.net> writes:

> Firstly, you'll notice that the write performance of the RAID 5 array is
> lower than for an individual disk.  This is expected, as for RAID 5 updates
> the system needs to first read two sectors (real + parity), perform a little
> calculation that modern processors can do quickly enough, and write the two
> blocks out again.  A large cache can help sometimes, but usually only in
> Benchmarks ;-).

This explanation makes sense.  Just to elaborate, for my own
understanding, the situation where you can get better raid-5 write
speeds than single device write speeds is when you are doing long
sequential writes.  It's true that raid has to write twice as many
blocks out, but my bus bandwidth is about 3 times my individual disk
write speed, so I should still be able to get 1.5 times the write
speed, and that's in fact what I observe.  (Because I'm considering
long sequential writes, the sectors that need to be read to compute
parity should be in cache.)

Idle thinking...If the raid layer was smart enough to notice that
consecutive writes were being done and group them together, only
writing the parity once, it would only have to do 33% more writes if
there are four disks.  This would require the raid layer to do some
caching.  Has this been thought about?  Or does this happen
automatically because of the write caching done by lower layers?

> The read access is of comparable speed - this is also expected.

This surprises me, but is also what I observe in practice.  If I'm
doing a long sequential read, shouldn't the kernel be able to read in
parallel from the drives?

On my system, I can get about 59MB/s from each component drive, and
I also get about 59MB/s from the raid device.  If I read in parallel
directly from the four drives, I get around 25-30MB/s from each one,
over 100MB/s in total.  Shouldn't the kernel take advantage of that?

> I'm slightly surprised that the random seek performance is quite poor.

My seek performance is also only about twice as good as on a single
device.  Not sure why.

Dan
