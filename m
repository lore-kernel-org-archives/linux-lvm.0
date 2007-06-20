Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5KC7onG017051
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 08:07:50 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5KC7nK3020460
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 08:07:49 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 1DF401822A
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 14:07:46 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id tUrXSb3gqNye for <linux-lvm@redhat.com>;
	Wed, 20 Jun 2007 14:07:19 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 0259B18229
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 14:07:17 +0200 (CEST)
Received: from [10.20.52.90] (a80-127-208-2.adsl.xs4all.nl [80.127.208.2])
	by soetens.vdberg.org (Postfix) with ESMTP id 757CB14C050
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 14:07:16 +0200 (CEST)
Message-ID: <46791878.7080200@vdberg.org>
Date: Wed, 20 Jun 2007 14:07:20 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] /dev/root not found when booting with initrd and lvm2
	root
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

After several lvm2 operations (pvmove, vgextend, vgsplit, etc) my system
suddenly refused to boot. The error I was getting was: "/dev/root no
such file or directory". When inspecting /dev/root it looked fine. I did
update the initrd before rebooting (just in case).

The strange thing is that when I pass "root=/dev/mapper/vg00-root" to
lilo, all works fine. That is the same value root is set to in
lilo.conf. Setting append="root=/dev/mapper/vg00-root" works, but just
defining root=/dev/mapper/vg00-root in lilo.conf does not.

Is it be possible that messing with vg00 would have changed the block
device for vg00-root?

Sincerely,

Richard van den Berg
