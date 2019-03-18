Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013942C8DE
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 12:38:42 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC3E03092643
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 12:38:41 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id x2ICQsD0005002
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 08:26:54 -0400
Date: Mon, 18 Mar 2019 08:38:39 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <69454a32-dee0-d57b-9be6-a4c02028f394@gmail.com>
Message-ID: <alpine.LRH.2.21.1903180805310.17308@fairfax.gathman.org>
References: <69454a32-dee0-d57b-9be6-a4c02028f394@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Power loss consistency for RAID
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 17 Mar 2019, Zheng Lv wrote:

> I'm recently considering using software RAID instead of hardware controllers 
> for my home server.
>
> AFAIK, write operation on a RAID array is not atomic across disks. I'm 
> concerned that what happens to RAID1/5/6/10 LVs after power loss.
>
> Is manual recovery required, or is it automatically checked and repaired on 
> LV activation?
>
> Also I'm curious about how such recovery works internally.

I use md raid1 and raid10.  I recommend that instead of the LVM RAID,
which is newer.  Create your RAID volumes with md, and add them as PVs:

   PV         VG      Fmt  Attr PSize   PFree
   /dev/md1   vg_span lvm2 a--u 214.81g      0
   /dev/md2   vg_span lvm2 a--u 214.81g  26.72g
   /dev/md3   vg_span lvm2 a--u 249.00g 148.00g
   /dev/md4   vg_span lvm2 a--u 252.47g 242.47g

Note that you do not need matching drives as with hardware RAID, you
can add disks and mix and match partitions of the same size on drives
of differing sizes.  LVM does this automatically, you have to manually
assign partitions to block devices with md.  There are very few (large)
partitions to assign, so it is a pleasant human sized exercise.

While striping and mirror schemes like raid0, raid1, raid10 are actually
faster with software RAID, I avoid RAID schemes with RMW cycles like
raid5 - you really need the hardware for those.

I use raid1 when the filesystem needs to be readable without the md 
driver - as with /boot.  Raid10 provides striping as well as mirroring,
with however many drives you have (I usually have 3 or 4).

Here is a brief overview of MD recovery and diagnostics.  Someone else
will have to fill in with the mechanics of LVM raid.

Md keeps a version in the superblock of each device in a logical md
drive - and marks the older leg as failed and replaced (and begins to
sync it).  In newer superblock formats, it also keeps a bit map so that it 
can sync only possibly modified areas.

Once a week (configurable), check_raid compares the legs (on most
distros).  If it encounters a read error on either drive, it immediately
syncs that block from the good drive.  This reassigns the sector on
modern drives.  (On ancient drives, a write error on resync marks the
drive as failed.) If for some reason (there are legitimate ones
involving write optimizations for SWAP volumes and such) the two legs do
not match, it arbitrarily copies one leg to the other, keeping a count.
(IMO it should also log the block offset so that I can occasionally check
that the out of sync occurred in an expected volume.)

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
