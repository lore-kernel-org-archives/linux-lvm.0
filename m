Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A67E5A4854
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 10:27:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F4578001E9
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 10:27:01 +0000 (UTC)
From: Daniel Janzon <daniel.janzon@edgeware.tv>
Date: Mon, 9 Dec 2019 10:26:55 +0000
Message-ID: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE90D8@EX01.edgeware.tv>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


> From: "John Stoffel" <john@stoffel.org>

> Stuart> The mdadm layer already does the striping.  So doing it again
> Stuart> in the LVM layer completely screws it up.  You want plain JBOD
> Stuart> (Just a Bunch Of Disks).

> Umm... not really.  The problem here is more the MD layer not being
> able to run RAID5 across multiple cores at the same time, which is why
> he split things the way he did.

Exactly. The md driver executes on a single core, but with a bunch of RAID5s
I can distribute the load over many cores. That's also why I cannot join the
bunch of RAID5's with a RAID0 (as someone suggested) because then again
all data is pulled through a single core.

> But we don't know the Kernel version, the LVM version, or the OS
> release so as to give better ideas of what to do.

It is Redhat 7, kernel 3.10, scheduler seems to be "[none] mq-deadline kyber"
according to /sys/block/nvme0n1/queue/scheduler. LVM version 2.02.185(2)-RHEL7.

But I wonder if fine-tuning e.g. io scheduler is going to cut it, since I am
looking for something like a 10x improvement.

> The biggest harm to performance here is really the RAID5, and if you
> can instead move to RAID 10 (mirror then stripe across mirrors) then
> you should be a performance boost.

The origin of my problem is indeed the poor performance of RAID5,
which maxes out the single core the driver runs on. But if I accept that
as a given, the next problem is LVM striping. Since I do get 10x better
performance with linear allocation.

> As Daniel says, he's got lots of disk load, but plenty of CPU, so the
> single thread for RAID5 is a big bottleneck.

Yes. That should be fixed since NVMe SSDs now outperform a single
CPU core. But that's a topic for another mailing list I suppose.

> I assume he wants to use LVM so he can create volume(s) larger than
> individual RAID5 volumes, so in that case, I'd probably just build a
> regular non-striped LVM VG holding all your RAID5 disks.  Hopefully
> the Parity disk is spread across all the partitions, though NVMe
> drives should have enough IOPs capacity to mask the RMW cost of RAID5
> to a degree.

The problem is the linear allocation of LVM. It will tend to fill the first
RAID5 first, then the next, etc. The access pattern is such that files
written close in time will be read close in time. We have live video
streams being written and read 24/7. What I want to avoid is that at
some point a majority of all reads end up on a single RAID5 which
will then fail to perform. Bound to happen in an always-on system.

> In any case, I'd just build it like:
>
>  pvcreate /dev/md#     (do for each of 8 RAID5 MD devices)
>  vgcreate datavg /dev/md[#-#]   (give all 8 RAID5 MD devices here.
>  lvcreate -n "name" -L <size> datavg

I think this is basically what I did, what I refer to as a "linearly allocated"
as compared to a striped group. It does indeed perform well most of
the time, but has, I believe, a poor guarantee for the worst case.


> If you can, I'd get more SSDs and move to RAID1+0 (RAID10) instead,
> though you do have the problem where a double disk failure could kill
> your data if it happens to both halves of a mirror.

Yes throwing money on the problem is a good way to solve it. I was 
hoping to avoid that for this application since I thought I just did something
wrong with the stripes.

Kind Regards,
Daniel
