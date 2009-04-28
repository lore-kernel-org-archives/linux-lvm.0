Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3S3XVgv007496
	for <linux-lvm@redhat.com>; Mon, 27 Apr 2009 23:33:31 -0400
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.1.38])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3S3WDP9029418
	for <linux-lvm@redhat.com>; Mon, 27 Apr 2009 23:32:13 -0400
Date: Mon, 27 Apr 2009 23:32:12 -0400 (EDT)
Message-Id: <200904280332.XAA06241@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <003a01c9c7a3$fa10a000$ee31e000$@no> (gaute@idrift.no)
Subject: [linux-lvm] Random file system errors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I suspect two things:  RAM and one of your disk controllers.

Going for the latter first---when you created non-LVM tests, were you
using the same disk?  Probably not.  Same IDE or SATA channels?  Maybe
you only get random errors from one of your IDE channels, or only one
of your SATA channels, or perhaps everything that passes through the
Northbridge, or something like that.  You may have to swap disks
around to do fault isolation.  The fact that the errors -stick- once
the data's in RAM makes me think that it's getting trashed on the way
in but that otherwise your RAM might be good.

But maybe it's not.  I had a bizarre failure once where I thought I
had a network problem, since I detected it when dd'ing 500GB from one
machine to another.  Turns out the problem was bad behavior in my RAM,
but ONLY WHEN when the CPU was throttled down!  Once I turned off CPU
throttling, the random errors went away.  And, of course, memtest86+
never saw it, because it -always- nails the CPU...

(In my case, I saw bit flips via md5sum whether the data was coming
from IDE, SATA, or even a USB stick---and there's very little hardware
in common there.  A tight loop md5summing the same file (one which fit
in RAM) got wrong, wrong, right right right right and the "rights"
suddenly started getting spit out much faster---it was at that moment
that I realized the wrong values were probably being produced while
the CPU was throttled.  [And putting a 10-second sleep in between each
md5sum got mostly wrong values---but as soon as I started nailing the
CPU in another process, the values being spit out by the loop, even
with the pauses, became correct...].  The dd didn't use enough CPU
time to throttle up, so I saw errors---and at about the same rate as
you, maybe one bit flip every few gig.  And I -knew- the data coming
in from the disks -had- to be good because it was a crypto filesystem
---bit errors there would trash entire blocks, and that wasn't
happening.)
