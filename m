Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r6VBVamv020883
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2013 07:31:36 -0400
Received: from arafel.iwakd.de (arafel.iwakd.de [78.46.72.57])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6VBVYGe005191
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2013 07:31:34 -0400
Received: from webmail.iwakd.de (localhost [127.0.0.1])
	by arafel.iwakd.de (Postfix) with ESMTP id 6476340024
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2013 13:31:33 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 31 Jul 2013 12:31:33 +0100
From: Christian Seiler <christian@iwakd.de>
In-Reply-To: <51F8CFDD.5060605@redhat.com>
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
	<51F8CFDD.5060605@redhat.com>
Message-ID: <573874159e2a0196c68f44d6b5dc334a@iwakd.de>
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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
To: linux-lvm@redhat.com

Hi,

>> This commit is a follow-up on the first change. If the last snapshot 
>> of
>> a volume is removed, the -real subvolume is not removed via the
>> codepath that has the retry logic, but by just doing a cleanup of
>> unused volumes. This means that spurious failures may still occur,
>> although not as often.
>
> These subvolumes should already be properly marked with flags
> we attach to them during their creation - these are then sent
> encoded in uevent and udev rules are skipped based on it,
> including skipping the WATCH udev rule.

Then perhaps it's not udev? I stumbled across the problem myself with
an old version of LVM (it failed like 95% of the time if udisks was
installed, without it failed less often but still quite a bit), then
after a lot of research I found out that this was supposedly fixed in
a current version, I upgraded and then it became rarer but still
occured in around 5% of cases (I had run a script that would create
a snapshot, mount it, umount it and remove the snapshot, all done in
a loop that only stopped on failure). After a *lot* of debugging and
applying the patch I sent here, I couldn't reproduce a single failure
anymore with 2000 tries. (I stopped afterwards, that was good enough
for me.)

> ..but yes, we could probably add this patch to make sure something
> like that does not happen at all.

I'd appreciate it, thanks.

> But still it would be better to look why those spurious events
> are triggered for non-top-level volumes (it's possible the
> OPTIONS:="nowatch" in some case, I'll check...).

I can try to see if I can reproduce it later this week with udevd
running with --debug to see what is going on.

Christian
