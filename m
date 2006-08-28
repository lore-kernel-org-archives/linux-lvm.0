Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SBJJS8015123
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 07:19:19 -0400
Received: from mail.esperi.org.uk (user83503@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7SBIxNa027698
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 07:19:00 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k7SBIvI7022659
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 12:18:57 +0100
Subject: Re: [linux-lvm] Creation of snapshots failing with `in use' errors
References: <87fyfirrhq.fsf@hades.wkstn.nix>
	<20060827202737.GX13859@agk.surrey.redhat.com>
From: Nix <nix@esperi.org.uk>
Date: Mon, 28 Aug 2006 12:18:56 +0100
In-Reply-To: <20060827202737.GX13859@agk.surrey.redhat.com> (Alasdair G.
	Kergon's message of "Sun, 27 Aug 2006 21:27:37 +0100")
Message-ID: <87lkp9qfa7.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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

On Sun, 27 Aug 2006, Alasdair G. Kergon uttered the following:
> On Sun, Aug 27, 2006 at 06:57:37PM +0100, Nix wrote:
>> Specifically, snapshot creation randomly fails if you've recently done
>> another LVM command. 
> 
> See if it's the usual udev problem: completely disable udev for your
> lvm devices.  [Common problem is udev causing the device to be opened to
> look for a label - then lvm command fails because it needs exclusive
> access.]

I knew about this but did I remember about it? I did not. `Oh, look at
the idiots not disabling udev' I said as I lurked, and then I set up
a new system, and, whoops...

I need a holiday. (Oh, look, a bank holiday. How convenient.)


Of course, it'd be nice to keep udev active for my non-snapshot devices:
the /dev/disk/* persistent naming really *is* useful (pretty much
critically so on one of my systems, with hot-pluggable devices with an
LVM VG on them). I just don't need it for snapshots.

Which leads me to another problem. Creation of a snapshot creates at least
one temporary block device, but it gets removed so fast that I can't tell
anything about its characteristics to get udev to ignore it:

UEVENT[1156762986.267714] remove@/block/dm-16
UEVENT[1156762990.264106] add@/block/dm-16
UEVENT[1156762990.418076] remove@/block/dm-16
UEVENT[1156762990.592966] add@/block/dm-16
UEVENT[1156762990.606790] add@/block/dm-17
UEVENT[1156762990.609193] add@/block/dm-18

However, that's not all that problematic as there's nothing about dm-16
to dm-18 that tells me they're part of a snapshot either. It looks like
the latter dm-16 is a -real device, while -18 is a -cow, but again
there's absolutely nothing about the -16 that I can sensibly key off: it
doesn't even have all-zero SYSFS{stat} like the snapshot devices do.

It'd be nice if we had a sysfs key that we could use to determine `this
is a snapshot', or an event which was fired to indicate that the device
can be safely opened because lvcreate is finished with it. Right now we
can't even do a dmsetup ls or an lvs from a udev rule to attempt to
determine if the new device is a snapshot, because there's no obvious
way to get from that -cow device, say, to the LV name, and because the
LV isn't even *marked* as a snapshot until a short time after creation.

... hah! Got one, although it's a vile hack. If `dmsetup deps' indicates
a dependency on other device-mapper devices (assuming `major 16' is
enough to tell) then this is a snapshot or mirror some other class of
derived device, and udev should either hands-off it or go to sleep for a
few seconds to let lvcreate or whatever do its job. (That's assuming
that the dependencies are set up at creation time. If they aren't, udev
will see no dependencies, and I'm right back where I started. Let's
see...)

>> original filesystem, since LVM maintains a snapshot percentage counter
> 
> lvm2 doesn't maintain it, but while a device is active, kernel dm tells
> userspace lvm2 the percentage full.

Ah. That explains the absence of setters :)

>> This has not only not worked for no good reason (it's not in use! it's
>> brand new!) 
> 
> udev is probably using it.
> Old udev packages used to work OK, but something got changed - we never
> discovered what (ref. an old debian bug) - and this started to break.

Well, I'm using handwritten udev rules, so it's perfectly likely that
this is the problem.

> Some people at suse are working on a proper fix for this problem (so kernel
> will inform udev when device is usable, instead of udev running too early as
> it can now; udev will inform lvm2 when it has finished whatever pointless
> things it wants to do and lvm2 will wait for that message).

Yep, that's what we're looking for :)

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
