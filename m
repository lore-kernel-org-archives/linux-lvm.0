Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4KLOgKd027972
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 17:24:42 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4KLOPo2014818
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 17:24:27 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o4KLOJFv006672
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 14:24:23 -0700
Message-ID: <4BF5A883.7060503@tlinx.org>
Date: Thu, 20 May 2010 14:24:19 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Volume alignment over RAID
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm a bit unclear as to where some units are applied in my RAID setup, but
was wondering how LVM interacted, could be, or should be setup so that
created volumes would be aligned properly on top of a RAID disk.

I'm using a RAID 'chunk' size of 64k as suggested by the RAID documentation
and am using 6 disks to create a RAID6, giving 4 units of data/stripe.  Does
this mean my logical volume needs to be aligned on a 64K boundary, or a 256k
boundary? I.e. does 64k usually specify chunk/unit, or chunk/stripe?

What do I need to do to make sure my logical volumes always line up on RAID
stripe boundaries?

I've been using default logical volume parameters, which I think use an
allocation size measured in Megabytes, so does that imply I'm automatically
aligned (as 64k and 256k both divide into 1 Meg)?  Or is some offset
involved?

Thanks!  Linda Walsh
