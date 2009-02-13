Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1DKZULc021088
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 15:35:30 -0500
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.1.38])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1DKYqo8013588
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 15:34:52 -0500
Date: Fri, 13 Feb 2009 15:34:51 -0500 (EST)
Message-Id: <200902132034.PAA09181@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <499541F1.3080501@redhat.com> (bmr@redhat.com)
Subject: [linux-lvm] Re: About fstab and fsck
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

Hardware does go bad.  It can affect journaling filesystems as well.
The ext3 manpage points out that there are plenty of things that can
wreck your filesystem even if the software is perfect, and that you'd
probably want to know if it was being slowly munched away -before- it
finally goes south completely.  (For example, subtle memory errors can
gradually turn your FS into garbage, but it may take a while to notice.
Capacitors slowly going bad on a motherboard that lead to corruption
due to poor power-supply bypassing; vibration leading to submicrosecond
faults in solder joints and connectors...  The list is endless.)

Some filesystems are far more vulnerable to single-bit errors than
others, so some may fall over long before it would occur to you to
run fsck if you run it "only when there's a problem".  ext3 is more
paranoid of bad hardware than some other popular journalling filesystems,
so in fact you might be well-advised to run fsck -more- frequently on
others.  (Just be careful---for hilarity's sake, try copying an entire
reiserfs filesystem into an ordinary file on a second reiserfs, and
then run fsck on -that-.  Make sure your backups are readable first;
you'll need 'em.  http://zork.net/~nick/mail/why-reiserfs-is-teh-sukc
has details, and XFS doesn't come off too well in that, either.)

For that matter, subtle hardware issues might eat the data in your
files, bit by bit, and you might never notice unless it was starting
to eat your metadata and you wondered why fsck kept finding small
errors.  It depends on whether you care whether your data might have
a few bits of corruption scattered through it.

I recently hit an issue where a motherboard had issues with (a) CPU
throttling (flipped some RAM bits when the CPU was in "slow" mode),
-and- (b) with dual-channel memory (flipped some bits, even after the
throttling was turned off, if the RAM was in dual-channel mode but not
if it was in single-channel mode---no version of memtest86+ was ever
able to detect the corruption, but repeated runs of "fsck -n" on the
(terabyte) FS yielded -different- results every time!).  And this was
on top of an encrypted device, so it was quite clear that it wasn't
bad bits on the disk or in any of the disk datapaths.

[(a) above was repeatable when reading from a USB stick and both SATA
and IDE, which pretty much nailed the coffin shut and was about when I
found out the problem was throttling---repeated md5sum on files with
certain bit patterns yielded nondeterministic results if run on an
idle machine ten seconds apart, but running them in a tight loop
yielded the same results after the first few "random" results, as
did nailing the CPU in another process even if the md5sums were
seconds apart.  But (b) didn't manifest -at all- except in fsck,
and I -ran- the fsck because I thought (a) might have already
trashed the filesystem and I wanted to find out whether it had.]

Without fsck, I'd never have discovered the dual-channel problem until
it had completely trashed the data (instead of discovering it "only" a
month after installing some new RAM -and- thoroughly "testing" it with
memtest86+ before putting the machine back in service---memtest86+'s
tests didn't discover the dual-channel problem despite days of runtime
-and- never noticed throttling issues because, of course, it runs the
CPU flat-out all the time...).

One thing you might want to consider is whether your backups go at
least far back in time as the last time you ran fsck.  If they don't,
and fsck discovers that bad hardware has been corrupting your data,
you're screwed.  OTOH, running fsck more frequently might mean you
don't need to keep complete backups quite as far back.

Since this is the LVM list, I'm assuming that y'all are actually, you
know, -running- LVM.  And if you are, you can make a snapshot of your
filesystem and run "fsck -n" -on the snapshot- so you don't even have
to take the FS out of service; if it finds a serious problem, then you
can dismount it and run a real fsck to fix it.  Sure, the system will
be slower while fsck is running, but you can ionice it and/or run it
at slack(er) times or whatever else can mitigate its impact, and it
doesn't matter how long it takes to run if it's running readonly off
a snapshot...
