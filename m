Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5L7htgO023537
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 03:43:56 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5L7hs7M026704
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 03:43:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 670131822A
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 09:43:52 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xiqtSHVvWvyz for <linux-lvm@redhat.com>;
	Thu, 21 Jun 2007 09:43:34 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 8E3B218228
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 09:43:32 +0200 (CEST)
Received: from [192.168.0.33] (82-170-10-11.dsl.ip.tiscali.nl [82.170.10.11])
	by soetens.vdberg.org (Postfix) with ESMTP id 5A26A14C04F
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 09:43:32 +0200 (CEST)
Message-ID: <467A2C22.6030503@vdberg.org>
Date: Thu, 21 Jun 2007 09:43:30 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Does pv failure effect whole vg?
References: <Pine.LNX.4.44.0706201722500.12479-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0706201722500.12479-100000@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote:
> If the system truly won't boot with a failed disk, that kind of adds another
> reason why current LVM mirroring support is useless.
>
> If you build your VG on raid (md devices or hardware), you solve 
> the problem for now.
>   

That is what I am doing. The test I did was:

lv00 and lv01 are part of vg00 which consists of /dev/md2 and /dev/sdb3

When booting from cdrom (systemrescuecd) md2 failed to come up, so vg00
did not come up. I then manually brought up md2 and split the vg, and
added sda3 in the mix:

lv00 is part of vg00 which consists of /dev/md2
lv01 is part of vg01 which consists of /dev/sdb3 and /dev/sda3

At the next reboot from cdrom vg01 came up fine, vg00 did not.

At least after the split if sda or sdb fails, md2 should still come up
and so should vg00, but I will loose vg01.  Keeping all lvs in vg00
would have given me an unbootable system after 1 disk failure.

Sincerely,

Richard van den Berg

PS: I still think it sucks that I could not split the vg online.
