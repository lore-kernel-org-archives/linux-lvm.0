Received: from twilight.int.mornfall.net ([10.3.112.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o96HNtpY001252
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 13:23:57 -0400
Received: from twilight.int.mornfall.net. (localhost [127.0.0.1])
	by twilight.int.mornfall.net (Postfix) with ESMTP id 0E49925CF4
	for <linux-lvm@redhat.com>; Wed,  6 Oct 2010 19:23:43 +0200 (CEST)
From: Petr Rockai <prockai@redhat.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
	<87y6adm5hs.fsf@twilight.int.mornfall.net.>
	<11404.7696.qm@web120712.mail.ne1.yahoo.com>
Date: Wed, 06 Oct 2010 19:23:42 +0200
In-Reply-To: <11404.7696.qm@web120712.mail.ne1.yahoo.com> (Jay's message of
	"Wed, 6 Oct 2010 08:50:41 -0700 (PDT)")
Message-ID: <87sk0jjkv5.fsf@twilight.int.mornfall.net.>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM mirror questions
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi again,

Jay <jrharris19@yahoo.com> writes:

> Thanks for the reply.  "Should continue to work.." leaves me with some
> doubt.  My intent for a mirror is for a datastore that has reliability
> at the expense of space.  In addition, when a large datastore is
> rebooted, there would be a period of time when the data is being
> mirrored, which leaves a window of peril. After I migrate my data off
> of lvm and onto an md device, I will test lvm.

This depends on how you set up things. With the normal dmeventd
monitoring enabled, the mirror, when experiencing a log failure, will
discard the log and continue working with core log. Same for faulty
images (it'll discard the image, and depending on how many images you
have, continue as linear or with fewer images; with recent versions, you
can say in /etc/lvm/lvm.conf that you want the images/logs replaced
automatically from free PV space).

> Test #1 will be start a huge write operation on a mirror that consists
> of 2 mirrors and 1 log, all on seperate pvs.  While the write
> operation is happening, I will unplug the log drive and see if lvm
> switches in midstream to a memory log without loss.

If you have dmeventd running and the mirror volumes are monitored,
that's exactly what should happen. There might be a hitch in the IO flow
while the mirror is converted, but nothing should be lost. Please do let
us know if you observe anything else!

> Test #2 will be to see if I can make lvm activate lvs or vgs in a
> certain order.  That way I could make the first 20 extents of every
> physical device part of a vg/lv that houses mirror logs.  These log
> lvs would be mirrored across all physical devices.  The log lvs would
> have memory logs, which would be ok since they will be so small.  The
> window of peril is reduced from hours to a few seconds.

You can use --mirrorlog mirrored for that, you just need to play a bit
with the options to achieve the layout you want. Also please note that
having a log and a mirror image on the same drive may come with a
non-trivial performance penalty, since log updates now need to seek all
the way through the disk, on both images (regardless of how people think
things SHOULD work, the obvious is not always the best).

Yours,
   Petr.

PS: What happens when you don't have dmeventd running/monitoring enabled
probably depends on your kernel version. I believe it used to work in a
similar fashion without dmeventd (faulty log would be ignored), but I am
not sure that mode of operation is supported in newer versions. Someone
else might chime in knowing more about the kernel level details.
