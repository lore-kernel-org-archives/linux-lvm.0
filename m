Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5II5p3w004480
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 14:05:52 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5II5od8022046
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 14:05:50 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 8B65018228
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 20:05:48 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id TVWLPzDfuzZD for <linux-lvm@redhat.com>;
	Mon, 18 Jun 2007 20:04:57 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 1783C18227
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 20:04:56 +0200 (CEST)
Received: from [192.168.0.34] (h8441201224.dsl.speedlinq.nl [84.41.201.224])
	by soetens.vdberg.org (Postfix) with ESMTP id 880A714C50C
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 20:04:56 +0200 (CEST)
Message-ID: <4676C948.5020602@vdberg.org>
Date: Mon, 18 Jun 2007 20:04:56 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgsplit needs lvs on source vg to be inactive
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
To: linux-lvm@redhat.com

Today I decided to unmirror part of my lvm2 disks. I started off with
vg00 on top of md1 (raid1). I wanted end up with vg00 on top of md2
(raid1) and vg01 on top of sda3 and sdb3 (concatenation). I've come all
the way to have vg00 on top off md2 and sdb3. The last step would be to
split off sda3 into vg01 and add sda3 to it.

The error I am getting is:

# vgsplit -v vg00 vg01 /dev/sdb3
    Checking for volume group "vg00"
    Checking for volume group "vg01"
    Wiping cache of LVM-capable devices
  Logical volumes in "vg00" must be inactive

I did deactivate (lvchange) the lv that is using /dev/sdb3. But that
doesn't seem enough. Does vgsplit actually need ALL lvs to be inactive?
This makes little sense to me since the other lvs are not affected at
all by vgsplit.

I've found
http://www.redhat.com/archives/fedora-list/2007-January/msg03485.html
which suggests that vgsplit can only be done with all lvs inactive. This
would be mean booting from a cdrom for me as my root filesystem is on
vg00. So far I have been doing all this online, and I'd like to keep it
that way.

Is this at all possible? Can someone confirm that vgsplit needs all lvs
on the source vg to be inactive?

Sincerely,

Richard van den Berg
