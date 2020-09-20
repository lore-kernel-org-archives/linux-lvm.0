Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F096E110F74B
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2020 23:49:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 682BA185A78B
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2020 23:49:07 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id m5so12032762lfp.7
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2020 16:49:04 -0700 (PDT)
MIME-Version: 1.0
From: Duncan Townsend <duncancmt@gmail.com>
Date: Sun, 20 Sep 2020 19:48:52 -0400
Message-ID: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
Subject: [linux-lvm] thin: pool target too small
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
To: linux-lvm@redhat.com

Hello!

I think the problem I'm having is a related problem to this thread:
https://www.redhat.com/archives/linux-lvm/2016-May/msg00092.html
continuation https://www.redhat.com/archives/linux-lvm/2016-June/msg00000.html
. In the previous thread, Zdenek Kabelac fixed the problem manually,
but there was no information about exactly what or how the problem was
fixed. I have also posted about this problem on the #lvm on freenode
and on Stack Exchange
(https://superuser.com/questions/1587224/lvm2-thin-pool-pool-target-too-small),
so my apologies to those of you who are seeing this again.

I had a problem with a runit script that caused my dmeventd to be
killed and restarted every 5 seconds. The script has been fixed, but
my lvm thin pool is still un-mountable. The following is an excerpt
from my system logs when the problem first appeared

device-mapper: thin: 253:10: reached low water mark for data device:
sending event.
lvm[1221]: WARNING: Sum of all thin volume sizes (2.81 TiB) exceeds
the size of thin pools and the size of whole volume group (1.86 TiB).
lvm[1221]: Size of logical volume
nellodee-nvme/nellodee-nvme-thin_tdata changed from 212.64 GiB (13609
extents) to <233.91 GiB (14970 extents).
device-mapper: thin: 253:10: growing the data device from 13609 to 14970 blocks
lvm[1221]: Logical volume nellodee-nvme/nellodee-nvme-thin_tdata
successfully resized.
lvm[1221]: dmeventd received break, scheduling exit.
lvm[1221]: dmeventd received break, scheduling exit.
lvm[1221]: WARNING: Thin pool
nellodee--nvme-nellodee--nvme--thin-tpool data is now 81.88% full.
<SNIP> (lots of repeats of "lvm[1221]: dmeventd received break,
scheduling exit.")
lvm[1221]: No longer monitoring thin pool
nellodee--nvme-nellodee--nvme--thin-tpool.
device-mapper: thin: 253:10: pool target (13609 blocks) too small:
expected 14970
device-mapper: table: 253:10: thin-pool: preresume failed, error = -22
lvm[1221]: dmeventd received break, scheduling exit.
(previous message repeats many times)

After this, the system became unresponsive, so I power cycled it. Upon
boot up, the following message was printed and I was dropped into an
emergency shell:

device-mapper: thin: 253:10: pool target (13609 blocks) too small:
expected 14970
device-mapper: table: 253:10: thin-pool: preresume failed, error = -22

I have tried using thin_repair, which reported success and didn't
solve the problem. I tried vgcfgrestore (using metadata backups going
back quite a ways), which also reported success and did not solve the
problem. I tried lvchange --repair. I tried lvextending the thin
volume, which reported "Cannot resize logical volume
nellodee-nvme/nellodee-nvme-thin with active component LV(s)". I tried
lvextending the underlying *_tdata LV, which reported "Can't resize
internal logical volume nellodee-nvme/nellodee-nvme-thin_tdata". I
have the LVM header, if that would be of interest to anyone.

I am at a loss here about how to proceed with fixing this problem. Is
there some flag I've missed or some tool I don't know about that I can
apply to fixing this problem? Thank you very much for your attention,
--Duncan Townsend

P.S. I cannot restore from backup. Ironically/amusingly, this happened
right in the middle of me bringing my new backup system online.
