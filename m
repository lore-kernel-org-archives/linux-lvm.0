Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R1MVEW022776
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 21:22:31 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6R1MEtb031327
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 21:22:14 -0400
Received: from localhost.housecafe.de ([127.0.0.1] helo=localhost)
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1MVEun-0000EK-IU
	for linux-lvm@redhat.com; Mon, 27 Jul 2009 03:22:09 +0200
Date: Sun, 26 Jul 2009 18:22:06 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [linux-lvm] lvm2 confused about double UUID
In-Reply-To: <4A6CF9C0.6020902@cox.net>
Message-ID: <alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
	<4A6CF9C0.6020902@cox.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 26 Jul 2009 at 19:50, Ron Johnson wrote:
> How did you split the mirrorset?

Sorry, I should've been more specific: the two disk mirror was no "LVM 
mirror", it is an external two-disk enclosure where one can toggle a 
little DIP switch to make it "RAID0" or "RAID1", etc. I split the 
mirrorset via this very switch, now the system sees both external disks 
instead of just one. Hence the disks itself haven't been touch during the 
split, that's why they both have the same UUID.

> Did you reformat sdc before reusing it?  (That should give it a new UUID.)

No. That's what I wanted to do (get a new UUID, use sdc for something 
else), but I'm afraid to do so since it's still somehow being used by LVM 
- and I wonder why pvs(8) says "vg02 uses sdb" but it clearly does not.

I've run "pvs"more verbosely and put the output here:
http://nerdbynature.de/bits/lvm/

>> # uname -r
>> 2.6.24-24-xen                      <-- Ubuntu/8.04
> 
> Shouldn't you be asking the Ubuntu forum?

Sure, if it turns out to be a (Ubuntu-)specific kernel/lvm2 issue, I'll do 
so.

Thanks,
Christian.
-- 
BOFH excuse #303:

fractal radiation jamming the backbone
